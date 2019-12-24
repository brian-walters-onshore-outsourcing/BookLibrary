This assembly contains the library of data records used at all levels in the application
stack.   Each data record is a single class containing properties associated with the
SQL data, the c# Data Access Layer, The Business Access Layer, The Console Layer (for importing csv files), and the MVC layer.

an author can write multiple books
a book can have multiple authors
an author can not write the same book more than once
a book cannot be written by the same author more than once
there is a non duplicating many-many relationship between books and authors
this is reflected in TypeAWritings which connects authors and books
it will have the BookID and the AuthorID which together make the primary key for the
junction table

a book can have a single genre
a genre can have multiple books
There is a one-many relationship, and the book will have a genreID

a borrower can borrow multiple books
a book can be borrowed by multiple borrowers 
a book can be borrowed by the same borrower multiple times (this is duplication)
there is a duplicating many-many relationship between books and borrowers
when borrowing we also need to track the due date, the returned date 
and the rating that the borrower gives to the book.
This duplicating many-many relationship also contains additional information which is
tracked in the TypeDRatedBorrowing table which connects books to borrowers and tracks the
additional information.
since this relationship duplicates, it requires its own primary key, as well as the
two foreign keys: the BookID and the BorrowerID

LogItem is used to track and display Exceptions 

a Borrower has a single Role
a Single Role can be associated with multiple borrowers
this is a one-many relationship, and the borrower will have a roleID

--- this implementation of Roles is Dynamic--- this means that existing roles can
be edited and new roles can be created, and the effects of the role will not require
coding, the effects will take place immediatly.

--- Roles have Defined Operations on Resources.  The list of Operations is:
     Create, Update, Delete, List, View
--- Adding a new Operation would require changes to several classes in the project,
    and is a non trivial procedure
--- Adding new Resources is easy, but does require adding [MustBeInRole] attributes
    to your code, or adding code to Hide/Display items when in a role

--- The The following Role syntax is implemented by CustomPrinciple class in the MVC layer
    Operation:Resource   i.e.  
	                      Create:Book   allows you to create a book
	                        List:Book   allows you to list all the books
							List:MyBook allows you to list books owned by the current user






