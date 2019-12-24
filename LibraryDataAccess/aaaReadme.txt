These are the files for recreating the library database.

The Database should be called:  Library
the default Connection string (in the Library Business Logic library line 35) is 

Data Source=.\sqlexpress;Initial Catalog=Library;Integrated Security=True

There are two creation scripts:   SmallLibrary.sql creates a small library with 9 books
                                  LargeLibrary.sql creates library with 203,152 books

Both scripts assume you have already created an empty database called Library
the database creation logic has been commented out.

								  You can also create the small library, work with the
								  9 books, and later run the CSVConsole Reader project
								  to insert the 203,143 extra books from the csv file.





