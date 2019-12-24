using LibraryBusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibraryCommon;

namespace CSVReader
{
    // this class represents a single line item out of the csv file.
    // it also has several static methods to help load the data from the file
    public class CSVFileReaderItem
    {
        // this method allows you to process a file by name.  it opens the file
        // and calls the other method to do the work
        public static List<CSVFileReaderItem> Process(string filename)
        {
            var reader = System.IO.File.OpenText(filename);
            List<CSVFileReaderItem> rv = Process(reader);
            reader.Close();
            return rv;
        }

        // this method processes an open streamreader to read the items from the
        // file.  Each line is processed individually, and is broken into its
        // parts using the constructor.  It the line is correct, the item is valid
        // otherwise the item just read is placed into an invalid state with info
        // to help you figure out why it is invalid.  All the created objects are 
        // collected into the list that is returned.
        public static List<CSVFileReaderItem> Process(System.IO.StreamReader reader)
        {
            List<CSVFileReaderItem> rv = new List<CSVFileReaderItem>();
            string s;
            while (!reader.EndOfStream)
            {
                s = reader.ReadLine();
                if (string.IsNullOrWhiteSpace(s))
                {
                    continue;
                }
                rv.Add(new CSVFileReaderItem(s));

            }
            return rv;
        }

        // replaces , with | except inside quotes -- this helps the
        // split correctly work when there are records (books) that contain a
        // comma in the book name or the author list.  We will split on '|' instead
        // of comma.   A string builder is used to help performance, but it still 
        // creates some garbage for each record.
        public static string Normalize(string s)
        {
            StringBuilder sb = new StringBuilder(s);
            bool insideQuote = false;
            for (int i = 0; i<sb.Length; i++)
            {
                if( '"'== sb[i])
                {
                    insideQuote = !insideQuote;
                    sb.Remove(i, 1);
                    i--;
                    continue;
                }
                if( ',' == sb[i])
                {
                    if (insideQuote)
                    {
                        sb[i] = '|';
                    }
                }
            }
            return sb.ToString();
        }


        // Tracks if the data passed to the constructor was valid.
        public bool isValid { get; private set; }
        
        
        // provides access to the invalid string passed to the constructor if the
        // item is not valid.  This helps you figure out what was wrong in the csv
        // file for that line.
        public string InvalidConstruction { get; private set; }
        

        // this construct accepts the single line of the csv file
        // and parses it into the fields below, or if invalid, it
        // marks the item as invalid.  This allows the rest of the
        // file to be processed, even if a few records are invalid.
        public CSVFileReaderItem(string s)
        {
             s = Normalize(s);
            var a = s.Split(',');
            if (7!=a.Length )
            {
               
           
                    InvalidConstruction = s;
                    isValid = false;
                    return;
                
            }
            ISBN = a[0];
            JPG = a[1];
            Web = a[2];
            Title = a[3];
            Author = a[4];
            catID = a[5];
            GenreName = a[6];
            isValid = true;

        }
        public string ISBN { get; set; }
        public string JPG { get; set; }
        public string Web { get; set; }
        public string Title {get; set;}
        public string Author { get; set; }
        public string catID { get; set; }
        public string GenreName { get; set; }

    }


    // this class is used to push items to the database using the existing
    // Business Logic Layer's context class.  The database is checked first to 
    // see if the record exists already before adding it again.
    //
    // The usage pattern for this class is to:
    //  1. create an instance using a custom constructor (see 2 below)
    //  2. populate it with data by passing the data as part of construction
    //  3. Once constructed, call the PushData method to move the data to the database
    public class LibraryReaderItemPusherToDatabase
    {
       public List<CSVFileReaderItem> Items {  get; private set; }
       public LibraryReaderItemPusherToDatabase(List<CSVFileReaderItem> data)
       {
            Items = data;
       }
        
       public void PushData()
       {
            using (Context ctx = new Context())
            {
                List<Genre> Genres = ctx.GenreGetAll();
                var GenreDict = Genres.ToDictionary(g => g.GenreName.ToLower());
                List<Author> Authors = ctx.AuthorGetAll();
                var AuthorDict = Authors.ToDictionary(a => a.AuthorName.ToLower());
                List<Book> Books = ctx.BookGetAll();
                var BookDict = Books.ToDictionary(b => b.BookName.ToLower());

                // these three dictionaries are used to check if an item is already in 
                // the database.  
                //   The GenreDict has a dictionary of Existing Genres organized by GenreName
                //   The AuthorDict has a dictionay of existing authors by AuthorName
                //   The BookDict has a dictionary of existing books by BookName
                int count = 0;
                foreach (var item in Items)
                {
                    count++;
                    // check to see if the BookDict contains the book title
                    // and if not, then add it to database and to dictionary
                    if (!BookDict.ContainsKey(item.Title.ToLower()))
                    {
                        // print message every 500 records
                        if (0 == count%500)
                        {
                            Console.WriteLine($"Creating Record {count}:{item.Title}");
                        }
                        // create a new book if it isnt in the dictionary
                        Book b = new Book();
                        b.BookName = item.Title;
                        // do the same thing for the title.
                        if (GenreDict.ContainsKey(item.GenreName.ToLower()))
                        {
                            // load the existing genreID, or
                            b.GenreID = GenreDict[item.GenreName.ToLower()].GenreID;
                        }
                        else
                        {
                            // Create a new Genre if its not in the dictionary
                            Genre g = new Genre();
                            g.GenreName = item.GenreName;
                            g.GenreID = ctx.GenreCreate(item.GenreName);
                            GenreDict.Add(g.GenreName.ToLower(), g);
                            b.GenreID = g.GenreID;
                        }
                        b.ISBN = item.ISBN;
                        // add the newly created book to the database 
                        b.BookID = ctx.BookCreate(b);
                        // and to the dictionary
                        BookDict.Add(b.BookName.ToLower(), b);
                        // check to see if the author exists
                        Author a;
                        if (AuthorDict.ContainsKey(item.Author.ToLower()))
                        {
                            // load if author already exists
                            a = AuthorDict[item.Author.ToLower()];
                        }
                        else
                        {
                            // create author if not in dictionary
                            a = new Author();
                            a.AuthorName = item.Author;
                            // add newly created author to database
                            a.AuthorID = ctx.AuthorCreate(a);
                            // and to dictionary
                            AuthorDict.Add(a.AuthorName.ToLower(), a);
                        }
                        // add a junction entry joining the author and the book
                        // in the many-many table if the book didn't exist
                        ctx.WritingCreate(b.BookID, a.AuthorID);
                    }

                    // do this for all the items in the csv file
 
                }
            }

       }


    }

   
}
