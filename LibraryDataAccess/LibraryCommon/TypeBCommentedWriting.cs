using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryCommon
{
   public class TypeBCommentedWriting
    {
        public int BookID { get; set; }
        public int AuthorID { get; set; }
        // the above two items are the key to the record
        // no duplication of the (pair of) key information is allowed
        // the below item is what makes this a type B, extra data to maintain
        public string Comments { get; set; }


        // the logic below insures that theBook and theAuthor
        // can only be set one time.  all other attempts to
        // set will throw an exception
        Book _thebook;
        public Book theBook
        {
            get { return _thebook; }
            set
            {
                if (_thebook == null)
                {
                    _thebook = value;
                }
                else
                {
                    throw new Exception($"the book portion of the TypeBCommentedWriting object can only be set one time.  It was attempting to be set with the book '{value}' but it already contained the book '{_thebook}'");
                }
            }

        }
        Author _theauthor;
        public Author theAuthor
        {
            get { return _theauthor; }
            set
            {
                if (_theauthor == null)
                {
                    _theauthor = value;
                }
                else
                {
                    throw new Exception($"the author portion of the TypeBCommentedWriting object can only be set one time.  It was attempting to be set with the author '{value}' but it already contained the author '{_theauthor}'");
                }
            }
        }

        public override string ToString()
        {
            string author = theAuthor?.ToString() ?? "NULL";
            string book = theBook?.ToString() ?? "NULL";
            return $"writing: authorid:{AuthorID,5} bookid:{BookID,5} Comments:{Comments}\nauthor: {author}\nbook: {book}";
        }


    }
}
