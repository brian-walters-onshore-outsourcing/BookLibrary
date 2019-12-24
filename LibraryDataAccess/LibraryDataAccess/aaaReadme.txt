This assembly contains classes whos purpose is to provide access to the data in the SQL
layer.  This is accomplished using the ADO.NET technology in System.Data.

This layer is designed to be agnostic to the actual SQL implementation in the SQL Layer.
It uses the following interfaces to decouple the operations from the implementation.

IDbConnection
IDbCommand
IDbDataParameter
IDataReader

Using these interfaces allows the Business Logic Layer to select the SQL implementation
details without makeing changes to the Data Access Layer.  The actual implementation of
the Connection object is decided at the Business Logic layer, and it is then 
injected into the DAL layer using construction.

In addition, if Multiple calls to the DAL are required, the same connection can be used at
the Business Layer, avoiding opening and closing the connection multiple times.

Each class follows the same basic pattern:
a DAL class contains the embedded connection, injected at construction, and the DAL class
also exposes various CRUD and Domain methods to access the data.  For those operations
returning records, they data is mapped into the associated Common Library Data class by a 
seperate Mapper class (in the Data access layer), and is returned as a List or a single
object depending upon the specific operation requested.

The associated Mapper class is invoked in two phases, during construction, the Mapper
validates that it is correctly connected to an IDataReader with the correct shape, 
throwing an exception if the shape is not what is expected (this is typically due to
programmer errors, or due to unplanned changes in the SQL schema).  During usage (typically in a loop) the Mapper moves the data from the Reader into a Common Library Class.

The mapper is typically constructed outside a loop, and then the ToXXX method 
(which does the data copy) is done inside the loop.  In addition, the ToXXX method
uses the reader.GetInt32, reader.GetDateTime, reader.GetDecimal and reader.GetDouble
methods to avoid boxing and unboxing that occurs if you use the reader["column"] or 
reader[index] versions.

The File ReaderHelpers.cs contains extention methods that 'appear' in the IDataReader
class to help control some of the nullable issues