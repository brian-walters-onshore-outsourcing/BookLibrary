using CSVReader;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
// this program is used to read the (books) data collected from the internet and enter
// it into the database.  The data is located in Data.csv, and was collected from 
// https://github.com/uchidalab/book-dataset   task2 has a file with about 207000 books
// and task1 has a file with about 50000.  I used task2 for this example
// i downloaded the file and then read it into Excell to validate it and then wrote
// it to a csv file.  I copied the file to the bin directory.  The csv file is also a
// solution item for archiving.  book32-listing.csv contains the 207000 records
//
// after processing the file, I create two lists.  valid contains only valid entries
// and invalid is the bad records.  I only sent the valid data to the database
// this project is the console application which hosts the actual library
//
// The actual library is CSVReader
//
namespace CSVConsoleReader
{
    class Program
    {
        static void Main(string[] args)
        {
           var data =  CSVReader.CSVFileReaderItem.Process("Data.csv");
            var valid = data.Where(x => x.isValid).ToList();
            var invalid = data.Where(x => !x.isValid).ToList();
            LibraryReaderItemPusherToDatabase dbpusher = new LibraryReaderItemPusherToDatabase(valid);
            dbpusher.PushData();
        }
    }
}
