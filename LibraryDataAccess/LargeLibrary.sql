--USE [master]
--GO
--/****** Object:  Database [Library]    Script Date: 12/24/2019 8:16:00 AM ******/
--CREATE DATABASE [Library]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'booksm2m', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\booksm2m.mdf' , SIZE = 86080KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
-- LOG ON 
--( NAME = N'booksm2m_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\booksm2m_log.ldf' , SIZE = 526336KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
--GO
--ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 110
--GO
--IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
--begin
--EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
--end
--GO
--ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
--GO
--ALTER DATABASE [Library] SET ANSI_NULLS OFF 
--GO
--ALTER DATABASE [Library] SET ANSI_PADDING OFF 
--GO
--ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
--GO
--ALTER DATABASE [Library] SET ARITHABORT OFF 
--GO
--ALTER DATABASE [Library] SET AUTO_CLOSE ON 
--GO
--ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
--GO
--ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
--GO
--ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
--GO
--ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
--GO
--ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
--GO
--ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
--GO
--ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
--GO
--ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
--GO
--ALTER DATABASE [Library] SET  ENABLE_BROKER 
--GO
--ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
--GO
--ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
--GO
--ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
--GO
--ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
--GO
--ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
--GO
--ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
--GO
--ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
--GO
--ALTER DATABASE [Library] SET RECOVERY SIMPLE 
--GO
--ALTER DATABASE [Library] SET  MULTI_USER 
--GO
--ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
--GO
--ALTER DATABASE [Library] SET DB_CHAINING OFF 
--GO
--ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
--GO
--ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 0 SECONDS 
--GO
USE [Library]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[authorid] [int] IDENTITY(100,1) NOT NULL,
	[authorname] [nvarchar](50) NULL,
	[authorDOB] [datetime2](7) NULL,
	[authorlocation] [nvarchar](50) NULL,
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED 
(
	[authorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[bookid] [int] IDENTITY(100,1) NOT NULL,
	[ISBN] [nvarchar](50) NULL,
	[bookname] [nvarchar](50) NULL,
	[pages] [int] NULL,
	[price] [decimal](18, 2) NULL,
	[genreid] [int] NULL,
 CONSTRAINT [pk_books] PRIMARY KEY CLUSTERED 
(
	[bookid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[borrowers]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[borrowers](
	[borrowerid] [int] IDENTITY(100,1) NOT NULL,
	[borrowername] [nvarchar](50) NOT NULL,
	[borroweremail] [nvarchar](200) NOT NULL,
	[borrowerDOB] [datetime2](7) NULL,
	[roleid] [int] NOT NULL,
	[SecuredHash] [nvarchar](200) NULL,
	[SecuredSalt] [nvarchar](200) NULL,
 CONSTRAINT [PK_borrowers] PRIMARY KEY CLUSTERED 
(
	[borrowerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genres]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genres](
	[genreid] [int] IDENTITY(100,1) NOT NULL,
	[genreName] [nvarchar](50) NULL,
 CONSTRAINT [pk_genres] PRIMARY KEY CLUSTERED 
(
	[genreid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTrace]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTrace](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](250) NULL,
	[Layer] [nvarchar](50) NULL,
	[Trace] [nvarchar](max) NULL,
	[Time] [datetime2](7) NULL,
 CONSTRAINT [PK_LogTrace] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[roleid] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[CreateOperation] [nvarchar](500) NOT NULL,
	[UpdateOperation] [nvarchar](500) NOT NULL,
	[DeleteOperation] [nvarchar](500) NOT NULL,
	[ListOperation] [nvarchar](500) NOT NULL,
	[ViewOperation] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeAWritings]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeAWritings](
	[bookid] [int] NOT NULL,
	[authorid] [int] NOT NULL,
 CONSTRAINT [PK_TypeAAuthorBooks] PRIMARY KEY CLUSTERED 
(
	[bookid] ASC,
	[authorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeBCommentedWritings]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeBCommentedWritings](
	[authorid] [int] NOT NULL,
	[bookid] [int] NOT NULL,
	[comments] [nvarchar](300) NULL,
 CONSTRAINT [PK_TypeBCommentedAuthorBooks] PRIMARY KEY CLUSTERED 
(
	[authorid] ASC,
	[bookid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeCBorrowings]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeCBorrowings](
	[borrowingid] [int] IDENTITY(1,1) NOT NULL,
	[bookid] [int] NOT NULL,
	[borrowerid] [int] NOT NULL,
 CONSTRAINT [PK_TypeCBookBorrowers] PRIMARY KEY CLUSTERED 
(
	[borrowingid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeDRatedBorrowings]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeDRatedBorrowings](
	[ratedborrowingid] [int] IDENTITY(1,1) NOT NULL,
	[bookid] [int] NOT NULL,
	[borrowerid] [int] NOT NULL,
	[DueDate] [datetime2](7) NULL,
	[ReturnedDate] [datetime2](7) NULL,
	[rating] [decimal](3, 2) NULL,
 CONSTRAINT [PK_TypeDRatedBookBorrowers] PRIMARY KEY CLUSTERED 
(
	[ratedborrowingid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-BookName]    Script Date: 12/24/2019 8:16:01 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-BookName] ON [dbo].[books]
(
	[bookname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-GenreID]    Script Date: 12/24/2019 8:16:01 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-GenreID] ON [dbo].[books]
(
	[genreid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-ISBN]    Script Date: 12/24/2019 8:16:01 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-ISBN] ON [dbo].[books]
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_CreateOperation]  DEFAULT ((0)) FOR [CreateOperation]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_UpdateOperation]  DEFAULT ((0)) FOR [UpdateOperation]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_DeleteOperation]  DEFAULT ((0)) FOR [DeleteOperation]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_ListOperation]  DEFAULT ((0)) FOR [ListOperation]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_ViewOperation]  DEFAULT ((0)) FOR [ViewOperation]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD  CONSTRAINT [fk_books_genres] FOREIGN KEY([genreid])
REFERENCES [dbo].[genres] ([genreid])
GO
ALTER TABLE [dbo].[books] CHECK CONSTRAINT [fk_books_genres]
GO
ALTER TABLE [dbo].[borrowers]  WITH CHECK ADD  CONSTRAINT [FK_borrowers_roles] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([roleid])
GO
ALTER TABLE [dbo].[borrowers] CHECK CONSTRAINT [FK_borrowers_roles]
GO
ALTER TABLE [dbo].[TypeAWritings]  WITH CHECK ADD  CONSTRAINT [FK_TypeAAuthor_books] FOREIGN KEY([bookid])
REFERENCES [dbo].[books] ([bookid])
GO
ALTER TABLE [dbo].[TypeAWritings] CHECK CONSTRAINT [FK_TypeAAuthor_books]
GO
ALTER TABLE [dbo].[TypeAWritings]  WITH CHECK ADD  CONSTRAINT [FK_TypeABooks_authors] FOREIGN KEY([authorid])
REFERENCES [dbo].[authors] ([authorid])
GO
ALTER TABLE [dbo].[TypeAWritings] CHECK CONSTRAINT [FK_TypeABooks_authors]
GO
ALTER TABLE [dbo].[TypeBCommentedWritings]  WITH CHECK ADD  CONSTRAINT [FK_TypeBCommentedAuthor_books] FOREIGN KEY([bookid])
REFERENCES [dbo].[books] ([bookid])
GO
ALTER TABLE [dbo].[TypeBCommentedWritings] CHECK CONSTRAINT [FK_TypeBCommentedAuthor_books]
GO
ALTER TABLE [dbo].[TypeBCommentedWritings]  WITH CHECK ADD  CONSTRAINT [FK_TypeBCommentedBooks_authors] FOREIGN KEY([authorid])
REFERENCES [dbo].[authors] ([authorid])
GO
ALTER TABLE [dbo].[TypeBCommentedWritings] CHECK CONSTRAINT [FK_TypeBCommentedBooks_authors]
GO
ALTER TABLE [dbo].[TypeCBorrowings]  WITH CHECK ADD  CONSTRAINT [FK_TypeCBook_borrowers] FOREIGN KEY([borrowerid])
REFERENCES [dbo].[borrowers] ([borrowerid])
GO
ALTER TABLE [dbo].[TypeCBorrowings] CHECK CONSTRAINT [FK_TypeCBook_borrowers]
GO
ALTER TABLE [dbo].[TypeCBorrowings]  WITH CHECK ADD  CONSTRAINT [FK_TypeCBorrowers_books] FOREIGN KEY([bookid])
REFERENCES [dbo].[books] ([bookid])
GO
ALTER TABLE [dbo].[TypeCBorrowings] CHECK CONSTRAINT [FK_TypeCBorrowers_books]
GO
ALTER TABLE [dbo].[TypeDRatedBorrowings]  WITH CHECK ADD  CONSTRAINT [FK_TypeDRatedBook_borrowers] FOREIGN KEY([borrowerid])
REFERENCES [dbo].[borrowers] ([borrowerid])
GO
ALTER TABLE [dbo].[TypeDRatedBorrowings] CHECK CONSTRAINT [FK_TypeDRatedBook_borrowers]
GO
ALTER TABLE [dbo].[TypeDRatedBorrowings]  WITH CHECK ADD  CONSTRAINT [FK_TypeDRatedBorrowers_books] FOREIGN KEY([bookid])
REFERENCES [dbo].[books] ([bookid])
GO
ALTER TABLE [dbo].[TypeDRatedBorrowings] CHECK CONSTRAINT [FK_TypeDRatedBorrowers_books]
GO
/****** Object:  StoredProcedure [dbo].[authorCreate]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[authorCreate](
   -- Comment by Brian Walters
   -- authorid is identity, so it is computed automatically and does not
   -- have to be provided as input
   @authorname nvarchar(50),
   @authorDOB  datetime2(7),
   @authorlocation nvarchar(50)
   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	insert into authors 
	(authorname, authorDOB, authorlocation)
	values
	(@authorname, @authorDOB, @authorlocation)
	-- Comment by Brian Walters
	-- scope_identity used to return the newly created id
	-- can be accessed from c# using ExecuteScalar
	select 'authorid' = scope_Identity()
END
GO
/****** Object:  StoredProcedure [dbo].[authorDelete]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[authorDelete]
-- Comment by Brian Walters
-- authorid is the unique identifer for records in the authors table
-- delete only needs the key information
@authorid int
as
begin
   -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
delete from authors 
  where authorid = @authorid
-- comment by Brian Walters
-- forgetting the where clause in a delete procedure is disastrous
-- because it will delete all records instead of just the one you want to delete

-- comment by brian walters
-- delete operations do not typically have anything to return
end
GO
/****** Object:  StoredProcedure [dbo].[authorFindByID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[authorFindByID](
@authorID int
)
as
begin
select authorid, authorname, authorDOB, authorlocation from authors
where authorid = @authorID
end
GO
/****** Object:  StoredProcedure [dbo].[authorsGetAll]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[authorsGetAll](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from authors
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select authorid, authorname, authorDOB, authorlocation from authors
 order by authorid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[authorUpdateJust]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[authorUpdateJust](
   -- Comment by Brian Walters
   -- this procedure is pessimistic.  no checking for record concurrency protection
   -- The last user to invoke this procedure will overwrite any earlier invocations
   -- record locking is minimal

   -- authorid is primary key, so it must be supplied to identify the record to be updated
   -- you cannot update the primary key using this procedure
   -- 
   @authorid int,
   @authorname nvarchar(50),
   @authorDOB  datetime2(7),
   @authorlocation nvarchar(50)
   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	update authors 
	set authorname = @authorname, authorDOB = @authorDOB, 
	    authorlocation = @authorlocation
    where authorid = @authorid
	-- Comment by Brian Walters
	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 if there is no matching record or
	-- 1 if there was a matching record that was updated
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.
END
GO
/****** Object:  StoredProcedure [dbo].[authorUpdateSafe]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[authorUpdateSafe](
   -- Comment by Brian Walters
   -- this procedure is optimistic.  checking for record concurrency protection is performed
   -- The last user to invoke this procedure will not overwrite any earlier invocations
   -- if the record has been modified since the user had the data out for midification
   -- this is accomplished by checking for the old values before updating the new values

   -- record locking is minimal

   -- authorid is primary key, so it must be supplied to identify the record to be updated
   -- you cannot update the primary key using this procedure
   -- 
   @authorid int,					-- id to uniquly identofy record to update
   @oldauthorname nvarchar(50),		-- old data to check for concurrency issues
   @oldauthorDOB  datetime2(7),		-- old data to check for concurrency issues
   @oldauthorlocation nvarchar(50),	-- old data to check for concurrency issues
   @newauthorname nvarchar(50),		-- new value after the update
   @newauthorDOB  datetime2(7),		-- new value after the update
   @newauthorlocation nvarchar(50)	-- new value after the update

   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	update authors 
	set authorname = @newauthorname, authorDOB = @newauthorDOB, 
	    authorlocation = @newauthorlocation
    where authorid = @authorid
	and authorname = @oldauthorname
	and authorDOB  = @oldauthorDOB
	and authorlocation = @oldauthorlocation
	
	-- Comment by Brian Walters
	-- if some other user has modified the record after this user read the record
	-- for editing purposes, the old values will not match and the 
	-- update will fail.  The caller can check the return value to discover this situation

	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 when there was a concurrency conflict, and the record was not updated
	-- this return value is 1 when there was not a conflict, and the update succeeded
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.
END
GO
/****** Object:  StoredProcedure [dbo].[bookCreate]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[bookCreate](
   -- Comment by Brian Walters
   -- bookid is identity, so it is computed automatically and does not
   -- have to be provided as input
   @ISBN nvarchar(50),
   @bookname nvarchar(50),
   @pages int,
   @price decimal(18,2),
   @genreid int
   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	insert into books 
	(isbn,bookname, pages, price, genreid)
	values
	(@isbn,@bookname, @pages,@price, @genreid)
	-- Comment by Brian Walters
	-- scope_identity used to return the newly created id
	-- can be accessed from c# using ExecuteScalar
	select 'bookid' = scope_Identity()
END
GO
/****** Object:  StoredProcedure [dbo].[bookDelete]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[bookDelete]
-- Comment by Brian Walters
-- bookid is the unique identifer for records in the table
-- delete only needs the key information
@bookid int
as
begin
   -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
delete from books 
  where bookid = @bookid
-- comment by Brian Walters
-- forgetting the where clause in a delete procedure is disastrous
-- because it will delete all records instead of just the one you want to delete

-- comment by brian walters
-- delete operations do not typically have anything to return
end
GO
/****** Object:  StoredProcedure [dbo].[bookFindByID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[bookFindByID](
@bookID int
)
as
begin
select bookid, isbn,bookname,pages,price,books.genreid -- from books
,genrename											   -- from genres
,checkouts,daysoverdue,avgrating from books			   -- from inner query
-- first left outer join bringing over the genrename or NULL if no match
left outer join genres 
on books.genreid = genres.genreid
-- second left outer join bringing over the checkout data etc.
-- the inner query makes a 'fake' table containing
-- bookid,														  : bkid
--     count of the number of 'OPEN' borrowings                   : Checkouts
--     calculated number of days the book is overdue 
--     sum of (by counting days from duedate to today)            : Daysoverdue
--     calculated average of the Rating							  : AvgRating
--    notice that the as clause is optional as can be seen in AvgRating
--  the where clause gets rid of all borrowings that are closed 
--    i.e. (the returned Date is not null)
--  the data comes from the TypeDBorrowings table
--  and it is being grouped by bookid.  That is why the 
--  count, sum, and avg are aggregates to count sum and average the multiple
--  borrowings that are OPEN per bookid
left outer join										   
-- inner query follows
(select bookid as bkid ,
      count(*) as checkouts,
      sum( DATEDIFF(day,DueDate,GetDate()))	as daysoverdue , 
	  avg(Rating) AvgRating 
	  from TypeDRatedBorrowings
where ReturnedDate is null
group by bookid) as x
-- end of inner query  (still need the on clause for the previous left outer join)
on bkid = bookid
-- the first two joins are now joined to the third one also on the bookid
where books.bookid = @bookid
end
GO
/****** Object:  StoredProcedure [dbo].[booksGetAll]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[booksGetAll](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from books
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select bookid, isbn,bookname,pages,price,books.genreid -- from books
,genrename											   -- from genres
,checkouts,daysoverdue,avgrating from books			   -- from inner query
-- first left outer join bringing over the genrename or NULL if no match
left outer join genres 
on books.genreid = genres.genreid
-- second left outer join bringing over the checkout data etc.
-- the inner query makes a 'fake' table containing
-- bookid,														  : bkid
--     count of the number of 'OPEN' borrowings                   : Checkouts
--     calculated number of days the book is overdue 
--     sum of (by counting days from duedate to today)            : Daysoverdue
--     calculated average of the Rating							  : AvgRating
--    notice that the as clause is optional as can be seen in AvgRating
--  the where clause gets rid of all borrowings that are closed 
--    i.e. (the returned Date is not null)
--  the data comes from the TypeDBorrowings table
--  and it is being grouped by bookid.  That is why the 
--  count, sum, and avg are aggregates to count sum and average the multiple
--  borrowings that are OPEN per bookid
left outer join										   
-- inner query follows
(select bookid as bkid ,
      count(*) as checkouts,
      sum( DATEDIFF(day,DueDate,GetDate()))	as daysoverdue , 
	  avg(Rating) AvgRating 
	  from TypeDRatedBorrowings
where ReturnedDate is null
group by bookid) as x
-- end of inner query  (still need the on clause for the previous left outer join)
on bkid = bookid
-- the first two joins are now joined to the third one also on the bookid

order by bookid
 offset @skip rows fetch next @take rows only

 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[bookUpdateJust]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[bookUpdateJust](
   -- Comment by Brian Walters
   -- this procedure is pessimistic.  no checking for record concurrency protection
   -- The last user to invoke this procedure will overwrite any earlier invocations
   -- record locking is minimal

   -- bookid is primary key, so it must be supplied to identify the record to be updated
   -- you cannot update the primary key using this procedure
   -- 

   @bookid int,
   @isbn nvarchar(50),
   @bookname nvarchar(50),
   @pages  int,
   @price decimal(18,2),
   @genreid int
   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	update books 
	set bookname = @bookname, pages = @pages, 
	    genreid = @genreid, price = @price, isbn = @isbn
    where bookid = @bookid
	-- Comment by Brian Walters
	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 if there is no matching record or
	-- 1 if there was a matching record that was updated
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.
END
GO
/****** Object:  StoredProcedure [dbo].[bookUpdateSafe]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[bookUpdateSafe](
   -- Comment by Brian Walters
   -- this procedure is optimistic.  checking for record concurrency protection is performed
   -- The last user to invoke this procedure will not overwrite any earlier invocations
   -- if the record has been modified since the user had the data out for midification
   -- this is accomplished by checking for the old values before updating the new values

   -- record locking is minimal

   -- bookid is primary key, so it must be supplied to identify the record to be updated
   -- you cannot update the primary key using this procedure
   -- 
   @bookid int,						-- id to uniquly identofy record to update
   @oldisbn nvarchar(50),
   @oldbookname nvarchar(50),		-- old data to check for concurrency issues
   @oldpages int,					-- old data to check for concurrency issues
   @oldprice decimal(18,2),
   @oldgenreid		int,			-- old data to check for concurrency issues
   @newisbn nvarchar(50),
   @newbookname nvarchar(50),		-- new value after the update
   @newpages int,					-- new value after the update
   @newprice decimal(18,2),
   @newgenreid		int				-- new value after the update

   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	update books 
	set bookname = @newbookname, pages = @newpages, price = @newprice,
	    genreid = @newgenreid, isbn = @newisbn
    where bookid = @bookid
	and bookname = @oldbookname
	and pages  = @oldpages
	and price = @oldprice
	and genreid = @oldgenreid
	and isbn = @oldisbn
	
	-- Comment by Brian Walters
	-- if some other user has modified the record after this user read the record
	-- for editing purposes, the old values will not match and the 
	-- update will fail.  The caller can check the return value to discover this situation

	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 when there was a concurrency conflict, and the record was not updated
	-- this return value is 1 when there was not a conflict, and the update succeeded
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.
END
GO
/****** Object:  StoredProcedure [dbo].[borrowerCreate]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[borrowerCreate](
   -- Comment by Brian Walters
   -- borrowerid is identity, so it is computed automatically and does not
   -- have to be provided as input
   @borrowername nvarchar(50),
   @borroweremail nvarchar(200),
   @borrowerDOB datetime2(7),
   @roleid int
   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	insert into borrowers 
	(borrowername, borroweremail,borrowerDOB, roleid)
	values
	(@borrowername, @borroweremail,@borrowerDOB, @roleid)
	-- Comment by Brian Walters
	-- scope_identity used to return the newly created id
	-- can be accessed from c# using ExecuteScalar
	select 'borrowerid' = scope_Identity()
END
GO
/****** Object:  StoredProcedure [dbo].[borrowerDelete]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[borrowerDelete]
-- Comment by Brian Walters
-- borrowerid is the unique identifer for records in the table
-- delete only needs the key information
@borrowerid int
as
begin
   -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
delete from borrowers 
  where borrowerid = @borrowerid
-- comment by Brian Walters
-- forgetting the where clause in a delete procedure is disastrous
-- because it will delete all records instead of just the one you want to delete

-- comment by brian walters
-- delete operations do not typically have anything to return
end
GO
/****** Object:  StoredProcedure [dbo].[borrowerFindByEmail]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[borrowerFindByEmail](
@Borroweremail nvarchar(200)
)
as
begin
select borrowerid, borrowername, borroweremail, borrowerDOB, borrowers.roleid, rolename from borrowers
 -- roleid is a foreign key, so we are bringing over the rolename too
 -- by joining the borrowers table to the roles table over the roleid key
 -- the inner join is used because the foreign key CANNOT be null
 -- so there must be a matching record in the roles table
 inner join roles on roles.roleid = borrowers.roleid
where borroweremail = @borroweremail
end
GO
/****** Object:  StoredProcedure [dbo].[borrowerFindByID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[borrowerFindByID](
@BorrowerID int
)
as
begin
select borrowerid, borrowername, borroweremail, borrowerDOB, borrowers.roleid, rolename from borrowers
 -- roleid is a foreign key, so we are bringing over the rolename too
 -- by joining the borrowers table to the roles table over the roleid key
 -- the inner join is used because the foreign key CANNOT be null
 -- so there must be a matching record in the roles table
 inner join roles on roles.roleid = borrowers.roleid
where borrowerid = @borrowerID
end
GO
/****** Object:  StoredProcedure [dbo].[borrowerFindByName]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[borrowerFindByName](
@Borrowername nvarchar(50)
)
as
begin
select borrowerid, borrowername, borroweremail, borrowerDOB, borrowers.roleid, rolename from borrowers
 -- roleid is a foreign key, so we are bringing over the rolename too
 -- by joining the borrowers table to the roles table over the roleid key
 -- the inner join is used because the foreign key CANNOT be null
 -- so there must be a matching record in the roles table
 inner join roles on roles.roleid = borrowers.roleid
where borrowername = @borrowername
end
GO
/****** Object:  StoredProcedure [dbo].[borrowerSecuredFindByemail]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[borrowerSecuredFindByemail](
@Borroweremail nvarchar(200)
)
as
begin
select borrowerid, borrowername, borroweremail, borrowerDOB, borrowers.roleid, rolename, SecuredHash, SecuredSalt from borrowers
 -- roleid is a foreign key, so we are bringing over the rolename too
 -- by joining the borrowers table to the roles table over the roleid key
 -- the inner join is used because the foreign key CANNOT be null
 -- so there must be a matching record in the roles table
 inner join roles on roles.roleid = borrowers.roleid
where borroweremail = @borroweremail
end
GO
/****** Object:  StoredProcedure [dbo].[borrowerSecuredFindByID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[borrowerSecuredFindByID](
@BorrowerID int
)
as
begin
select borrowerid, borrowername, borroweremail, borrowerDOB, borrowers.roleid, rolename, SecuredHash, SecuredSalt from borrowers
 -- roleid is a foreign key, so we are bringing over the rolename too
 -- by joining the borrowers table to the roles table over the roleid key
 -- the inner join is used because the foreign key CANNOT be null
 -- so there must be a matching record in the roles table
 inner join roles on roles.roleid = borrowers.roleid
where borrowerid = @borrowerID
end
GO
/****** Object:  StoredProcedure [dbo].[borrowerSecuredFindByName]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[borrowerSecuredFindByName](
@BorrowerName nvarchar(50)
)
as
begin
select borrowerid, borrowername, borroweremail, borrowerDOB, borrowers.roleid, rolename, SecuredHash, SecuredSalt from borrowers
 -- roleid is a foreign key, so we are bringing over the rolename too
 -- by joining the borrowers table to the roles table over the roleid key
 -- the inner join is used because the foreign key CANNOT be null
 -- so there must be a matching record in the roles table
 inner join roles on roles.roleid = borrowers.roleid
where borrowername = @borrowerName
end
GO
/****** Object:  StoredProcedure [dbo].[borrowerSecuredUpdateJust]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[borrowerSecuredUpdateJust](
   -- Comment by Brian Walters

   -- this procedure is pessimistic.  no checking for record concurrency protection
   -- The last user to invoke this procedure will overwrite any earlier invocations
   -- record locking is minimal

   -- borrowerid is primary key, so it must be supplied to identify the record to be updated
   -- you cannot update the primary key using this procedure
   -- 
   -- this procedure is intended to allow access to change the more secure part of the borrower
   @borrowerid int,
   @Hash nvarchar(200),
   @Salt nvarchar(200)
   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	update borrowers 
	set SecuredHash = @Hash, SecuredSalt= @Salt
    where borrowerid = @borrowerid
	-- Comment by Brian Walters
	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 if there is no matching record or
	-- 1 if there was a matching record that was updated
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.
END
GO
/****** Object:  StoredProcedure [dbo].[borrowersGetAll]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[borrowersGetAll](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from borrowers
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select borrowerid, borrowername, borroweremail, borrowerDOB, borrowers.roleid, rolename from borrowers
 -- roleid is a foreign key, so we are bringing over the rolename too
 -- by joining the borrowers table to the roles table over the roleid key
 -- the inner join is used because the foreign key CANNOT be null
 -- so there must be a matching record in the roles table
 inner join roles on roles.roleid = borrowers.roleid
 order by borrowerid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[borrowerUpdateJust]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[borrowerUpdateJust](
   -- Comment by Brian Walters

   -- this procedure is pessimistic.  no checking for record concurrency protection
   -- The last user to invoke this procedure will overwrite any earlier invocations
   -- record locking is minimal

   -- borrowerid is primary key, so it must be supplied to identify the record to be updated
   -- you cannot update the primary key using this procedure
   -- 
   @borrowerid int,
   @borrowername nvarchar(50),
   @borroweremail nvarchar(200),
   @borrowerDOB datetime2(7),
   @roleid int
   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	update borrowers 
	set borrowername = @borrowername, borroweremail = @borroweremail,borrowerDOB = @borrowerDOB, 
	    roleid = @roleid
    where borrowerid = @borrowerid
	-- Comment by Brian Walters
	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 if there is no matching record or
	-- 1 if there was a matching record that was updated
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.
END
GO
/****** Object:  StoredProcedure [dbo].[borrowerUpdateSafe]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[borrowerUpdateSafe](
   -- Comment by Brian Walters
   -- this procedure is optimistic.  checking for record concurrency protection is performed
   -- The last user to invoke this procedure will not overwrite any earlier invocations
   -- if the record has been modified since the user had the data out for midification
   -- this is accomplished by checking for the old values before updating the new values

   -- record locking is minimal

   -- borrowerid is primary key, so it must be supplied to identify the record to be updated
   -- you cannot update the primary key using this procedure
   -- 
   @borrowerid int,						-- id to uniquly identofy record to update
   @oldborrowername nvarchar(50),		-- old data to check for concurrency issues
   @oldborroweremail nvarchar(200),
   @oldborrowerDOB  datetime2(7),		-- old data to check for concurrency issues
   @oldroleid		int,				-- old data to check for concurrency issues
   @newborrowername nvarchar(50),		-- new value after the update
   @newborroweremail nvarchar(200),
   @newborrowerDOB  datetime2(7),		-- new value after the update
   @newroleid		int					-- new value after the update

   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	update borrowers 
	set borrowername = @newborrowername, borroweremail = @newborroweremail, borrowerDOB = @newborrowerDOB, 
	    roleid = @newroleid
    where borrowerid = @borrowerid
	and borrowername = @oldborrowername
	and borroweremail = @oldborroweremail
	and borrowerDOB  = @oldborrowerDOB
	and roleid = @oldroleid
	
	-- Comment by Brian Walters
	-- if some other user has modified the record after this user read the record
	-- for editing purposes, the old values will not match and the 
	-- update will fail.  The caller can check the return value to discover this situation

	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 when there was a concurrency conflict, and the record was not updated
	-- this return value is 1 when there was not a conflict, and the update succeeded
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.
END
GO
/****** Object:  StoredProcedure [dbo].[genreCreate]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[genreCreate](
   -- Comment by Brian Walters
   -- genreid is identity, so it is computed automatically and does not
   -- have to be provided as input
   @genrename nvarchar(50)
   
   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	insert into genres 
	(genrename)
	values
	(@genrename)
	-- Comment by Brian Walters
	-- scope_identity used to return the newly created id
	-- can be accessed from c# using ExecuteScalar
	select 'genreid' = scope_Identity()
END
GO
/****** Object:  StoredProcedure [dbo].[genreDelete]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[genreDelete]
-- Comment by Brian Walters
-- genreid is the unique identifer for records in the table
-- delete only needs the key information
@genreid int
as
begin
   -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
delete from genres 
  where genreid = @genreid
-- comment by Brian Walters
-- forgetting the where clause in a delete procedure is disastrous
-- because it will delete all records instead of just the one you want to delete

-- comment by brian walters
-- delete operations do not typically have anything to return
end
GO
/****** Object:  StoredProcedure [dbo].[GenreFindByID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GenreFindByID](
@GenreID int
)
as
begin
select genreid, genreName from genres
where genreid = @genreID
end
GO
/****** Object:  StoredProcedure [dbo].[genresGetAll]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[genresGetAll](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from genres
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select genreid, genreName from genres
 
 order by genreid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[genreUpdateJust]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[genreUpdateJust](
   -- Comment by Brian Walters
   -- this procedure is pessimistic.  no checking for record concurrency protection
   -- The last user to invoke this procedure will overwrite any earlier invocations
   -- record locking is minimal


   -- genreid is primary key, so it must be supplied to identify the record to be updated
   -- you cannot update the primary key using this procedure
   -- 
   @genreid int,
   @genrename nvarchar(50)
   
   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	update genres 
	set genrename = @genrename
    where genreid = @genreid
	-- Comment by Brian Walters
	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 if there is no matching record or
	-- 1 if there was a matching record that was updated
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.
END
GO
/****** Object:  StoredProcedure [dbo].[genreUpdateSafe]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[genreUpdateSafe](
   -- Comment by Brian Walters
   -- this procedure is optimistic.  checking for record concurrency protection is performed
   -- The last user to invoke this procedure will not overwrite any earlier invocations
   -- if the record has been modified since the user had the data out for modification
   -- this is accomplished by checking for the old values before updating the new values

   -- record locking is minimal

   -- Genreid is primary key, so it must be supplied to identify the record to be updated
   -- you cannot update the primary key using this procedure
   -- 
   @Genreid int,						-- id to uniquly identofy record to update
   @oldGenrename nvarchar(50),		-- old data to check for concurrency issues
   @newGenrename nvarchar(50)		-- new value after the update
   

   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	update Genres 
	set Genrename = @newGenrename
    where Genreid = @Genreid
	and Genrename = @oldGenrename
	
	
	-- Comment by Brian Walters
	-- if some other user has modified the record after this user read the record
	-- for editing purposes, the old values will not match and the 
	-- update will fail.  The caller can check the return value to discover this situation

	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 when there was a concurrency conflict, and the record was not updated
	-- this return value is 1 when there was not a conflict, and the update succeeded
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.
END
GO
/****** Object:  StoredProcedure [dbo].[LogItemCreate]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LogItemCreate]
@message nvarchar(250),
@trace   nvarchar(max),
@layer   nvarchar(50)
as
begin
insert into LogTrace(Message,Trace,Time,Layer)
values (@message,@trace,GetDate(),@layer)
select 'errorid' = scope_Identity()
end
GO
/****** Object:  StoredProcedure [dbo].[LogItemFindByID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LogItemFindByID](
 @logid int
)
as
begin
 
 select LogId, Message,Layer, Trace, Time from LogTrace
where Logid = @logid
 
end
GO
/****** Object:  StoredProcedure [dbo].[LogItemsGetAll]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[LogItemsGetAll](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from LogTrace
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select LogId, Message,Layer, Trace, Time from LogTrace
order by LogId
 offset @skip rows fetch next @take rows only

 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[obtainAuthorsCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtainAuthorsCount]
as
begin
  select count(*) from authors
end
GO
/****** Object:  StoredProcedure [dbo].[obtainBooksCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtainBooksCount]
as
begin
  select count(*) from books
end
GO
/****** Object:  StoredProcedure [dbo].[obtainBorrowersCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtainBorrowersCount]
as
begin
  select count(*) from borrowers
end
GO
/****** Object:  StoredProcedure [dbo].[obtainGenresCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtainGenresCount]
as
begin
  select count(*) from Genres
end
GO
/****** Object:  StoredProcedure [dbo].[obtainRolesCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[obtainRolesCount]
as
begin
  select count(*) from Roles
end
GO
/****** Object:  StoredProcedure [dbo].[ObtainTypeAauthorsRelatedToBookCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainTypeAauthorsRelatedToBookCount]
@bookid int
as
begin
     select count(*) from TypeAWritings where bookid = @bookid

end
GO
/****** Object:  StoredProcedure [dbo].[ObtainTypeAbooksRelatedToAuthorCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainTypeAbooksRelatedToAuthorCount]
@authorid int
as
begin
     select count(*) from TypeAWritings where authorid = @authorid

end
GO
/****** Object:  StoredProcedure [dbo].[ObtainTypeAWritingsCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ObtainTypeAWritingsCount]

as
begin
     select count(*) from TypeAWritings 

end
GO
/****** Object:  StoredProcedure [dbo].[ObtainTypeBauthorsRelatedToBookCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainTypeBauthorsRelatedToBookCount]
@bookid int
as
begin
     select count(*) from TypeBcommentedWritings where bookid = @bookid

end
GO
/****** Object:  StoredProcedure [dbo].[ObtainTypeBbooksRelatedToAuthorCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainTypeBbooksRelatedToAuthorCount]
@authorid int
as
begin
     select count(*) from TypeBcommentedWritings where authorid = @authorid

end
GO
/****** Object:  StoredProcedure [dbo].[ObtainTypeBCommentedWritingsCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ObtainTypeBCommentedWritingsCount]

as
begin
     select count(*) from TypeBCommentedWritings

end
GO
/****** Object:  StoredProcedure [dbo].[ObtainTypeCbooksRelatedToBorrowerCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainTypeCbooksRelatedToBorrowerCount]
@borrowerid int
as
begin
     select count(*) from TypeCborrowings where borrowerid = @borrowerid

end
GO
/****** Object:  StoredProcedure [dbo].[ObtainTypeCborrowersRelatedToBookCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainTypeCborrowersRelatedToBookCount]
@bookid int
as
begin
     select count(*) from TypeCborrowings where bookid = @bookid

end
GO
/****** Object:  StoredProcedure [dbo].[ObtainTypeCBorrowingsCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ObtainTypeCBorrowingsCount]

as
begin
     select count(*) from TypeCBorrowings

end
GO
/****** Object:  StoredProcedure [dbo].[ObtainTypeDbooksRelatedToBorrowerCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainTypeDbooksRelatedToBorrowerCount]
@borrowerid int
as
begin
     select count(*) from TypeDratedborrowings where borrowerid = @borrowerid

end
GO
/****** Object:  StoredProcedure [dbo].[ObtainTypeDborrowersRelatedToBookCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ObtainTypeDborrowersRelatedToBookCount]
@bookid int
as
begin
     select count(*) from TypeDratedborrowings where bookid = @bookid

end
GO
/****** Object:  StoredProcedure [dbo].[ObtainTypeDRatedBorrowingsCount]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ObtainTypeDRatedBorrowingsCount]

as
begin
     select count(*) from TypeDRatedBorrowings

end
GO
/****** Object:  StoredProcedure [dbo].[repopulate]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[repopulate]
as
begin

SET IDENTITY_INSERT [dbo].[genres] ON 

INSERT [dbo].[genres] ([genreid], [genreName]) VALUES (0, N'even')
INSERT [dbo].[genres] ([genreid], [genreName]) VALUES (1, N'odd')
INSERT [dbo].[genres] ([genreid], [genreName]) VALUES (3, N'prime')
SET IDENTITY_INSERT [dbo].[genres] OFF

SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([roleid], [RoleName], [CreateOperation], [UpdateOperation], [DeleteOperation], [ListOperation], [ViewOperation]) VALUES (1, N'Administrator', N'Authors, Books, Borrowers, Genres, Roles, AllUserBorrowing, ThisUserBorrowing', N'Authors, Books, Borrowers, Genres, Roles,  AllUserBorrowing, ThisUserBorrowing', N'Authors, Books, Borrowers, Genres, Roles, AllUserBorrowing', N'Authors, Books, Borrowers, Genres, Roles, ThisUserBorrowing, AllUserBorrowing', N'Authors, Books, Borrowers, Genres, Roles, AllUserBorrowings, ThisUserBorrowings, Exception, Reporting')
INSERT [dbo].[roles] ([roleid], [RoleName], [CreateOperation], [UpdateOperation], [DeleteOperation], [ListOperation], [ViewOperation]) VALUES (2, N'Librarian', N'Authors,Books,Genres, AnyUserBorrowing, ThisUserBorrowing', N'Authors,Books,Genres, AnyUserBorrowing, ThisUserBorrowing', N'Authors,Books,Genres', N'Authors,Books,Borrowers,Genres', N'Authors,Books,Borrowers,Genres, AllUserBorrowings, ThisUserBorrowings')
INSERT [dbo].[roles] ([roleid], [RoleName], [CreateOperation], [UpdateOperation], [DeleteOperation], [ListOperation], [ViewOperation]) VALUES (3, N'Borrower', N'ThisUserBorrowing', N'ThisUserBorrowing', N'None', N'Authors,Books,Genres', N'Authors,Books,Genres, ThisUserBorrowings')
INSERT [dbo].[roles] ([roleid], [RoleName], [CreateOperation], [UpdateOperation], [DeleteOperation], [ListOperation], [ViewOperation]) VALUES (4, N'Viewer', N'', N'', N'', N'books', N'books,genres,authors,AllUserBorrowings')
INSERT [dbo].[roles] ([roleid], [RoleName], [CreateOperation], [UpdateOperation], [DeleteOperation], [ListOperation], [ViewOperation]) VALUES (5, N'Unverified', N'', N'', N'', N'Books,Genres', N'Books,Genres')
SET IDENTITY_INSERT [dbo].[roles] OFF


SET IDENTITY_INSERT [dbo].[authors] ON 

INSERT [dbo].[authors] ([authorid], [authorname], [authorDOB], [authorlocation]) VALUES (1, N'Mr Odd', CAST(N'1977-01-01T00:00:00.0000000' AS DateTime2), N'Oddsville')
INSERT [dbo].[authors] ([authorid], [authorname], [authorDOB], [authorlocation]) VALUES (2, N'Mrs Even', CAST(N'1888-02-04T00:00:00.0000000' AS DateTime2), N'Evensville')
INSERT [dbo].[authors] ([authorid], [authorname], [authorDOB], [authorlocation]) VALUES (3, N'Dr. Prime', CAST(N'1987-03-13T00:00:00.0000000' AS DateTime2), N'Primesville')
INSERT [dbo].[authors] ([authorid], [authorname], [authorDOB], [authorlocation]) VALUES (4, N'The Square', CAST(N'1936-04-16T00:00:00.0000000' AS DateTime2), N'Squaresville')
SET IDENTITY_INSERT [dbo].[authors] OFF
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([bookid], [bookname], [pages], [genreid]) VALUES (1, N'One', 11, 1)
INSERT [dbo].[books] ([bookid], [bookname], [pages], [genreid]) VALUES (2, N'Two', 22, 3)
INSERT [dbo].[books] ([bookid], [bookname], [pages], [genreid]) VALUES (3, N'Three', 33, 3)
INSERT [dbo].[books] ([bookid], [bookname], [pages], [genreid]) VALUES (4, N'Four', 44, 0)
INSERT [dbo].[books] ([bookid], [bookname], [pages], [genreid]) VALUES (5, N'Five', 55, 3)
INSERT [dbo].[books] ([bookid], [bookname], [pages], [genreid]) VALUES (6, N'Six', 66, 0)
INSERT [dbo].[books] ([bookid], [bookname], [pages], [genreid]) VALUES (7, N'Seven', 77, 3)
INSERT [dbo].[books] ([bookid], [bookname], [pages], [genreid]) VALUES (8, N'Eight', 88, 0)
INSERT [dbo].[books] ([bookid], [bookname], [pages], [genreid]) VALUES (9, N'Nine', 99, 1)
SET IDENTITY_INSERT [dbo].[books] OFF
SET IDENTITY_INSERT [dbo].[borrowers] ON 

INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail],[borrowerDOB], [roleid],[SecuredSalt],[SecuredHash]) VALUES (1, N'Alligator', N'Alligator@Email.com',CAST(N'1960-05-01T00:00:00.0000000' AS DateTime2), 1,'ClearText','alligator')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername],[borroweremail],[borrowerDOB], [roleid],[SecuredSalt],[SecuredHash]) VALUES (2, N'Bear', N'Bear@Email.com',CAST(N'1961-06-02T00:00:00.0000000' AS DateTime2), 1,'ClearText','alligator')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail],[borrowerDOB], [roleid],[SecuredSalt],[SecuredHash]) VALUES (3, N'Cat', N'Cat@Email.com',CAST(N'1962-07-04T00:00:00.0000000' AS DateTime2), 1,'ClearText','alligator')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail],[borrowerDOB], [roleid],[SecuredSalt],[SecuredHash]) VALUES (4, N'Dog', N'Dog@Email.com',CAST(N'1963-08-05T00:00:00.0000000' AS DateTime2), 2,'ClearText','alligator')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail],[borrowerDOB], [roleid],[SecuredSalt],[SecuredHash]) VALUES (5, N'Elephant', N'Elephant@Email.com',CAST(N'1964-09-06T00:00:00.0000000' AS DateTime2), 2,'ClearText','alligator')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail],[borrowerDOB], [roleid],[SecuredSalt],[SecuredHash]) VALUES (6, N'Fish', N'Fish@Email.com',CAST(N'1965-10-07T00:00:00.0000000' AS DateTime2), 3,'ClearText','alligator')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail],[borrowerDOB], [roleid],[SecuredSalt],[SecuredHash]) VALUES (7, N'Gecko',N'Gecko@Email.com', CAST(N'1966-11-18T00:00:00.0000000' AS DateTime2), 3,'ClearText','alligator')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail],[borrowerDOB], [roleid],[SecuredSalt],[SecuredHash]) VALUES (8, N'Hampster',N'Hampster@Email.com', CAST(N'1977-12-19T00:00:00.0000000' AS DateTime2), 3,'ClearText','alligator')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail],[borrowerDOB], [roleid],[SecuredSalt],[SecuredHash]) VALUES (9, N'Iguana', N'Iguana@Email.com',CAST(N'1978-12-25T00:00:00.0000000' AS DateTime2), 3,'ClearText','alligator')
SET IDENTITY_INSERT [dbo].[borrowers] OFF

insert TypeAWritings ([authorid],[bookid]) values(1,1)
insert TypeAWritings ([authorid],[bookid]) values(2,2)
insert TypeAWritings ([authorid],[bookid]) values(3,2)
insert TypeAWritings ([authorid],[bookid]) values(1,3)
insert TypeAWritings ([authorid],[bookid]) values(3,3)
insert TypeAWritings ([authorid],[bookid]) values(2,4)
insert TypeAWritings ([authorid],[bookid]) values(4,4)
insert TypeAWritings ([authorid],[bookid]) values(1,5)
insert TypeAWritings ([authorid],[bookid]) values(3,5)
insert TypeAWritings ([authorid],[bookid]) values(2,6)
insert TypeAWritings ([authorid],[bookid]) values(1,7)
insert TypeAWritings ([authorid],[bookid]) values(3,7)
insert TypeAWritings ([authorid],[bookid]) values(2,8)
insert TypeAWritings ([authorid],[bookid]) values(1,9)
insert TypeAWritings ([authorid],[bookid]) values(4,9)
insert TypeAWritings ([authorid],[bookid]) values(1,1)
insert TypeAWritings ([authorid],[bookid]) values(1,3)

set identity_insert TypeDratedBorrowings on
insert TypeDRatedBorrowings (ratedborrowingid,bookid,borrowerid,duedate,returneddate,rating)
         values  (1,1,1,DateAdd(day,-40,getdate()),DateAdd(day,-45,getdate()),3.7)
insert TypeDRatedBorrowings (ratedborrowingid,bookid,borrowerid,duedate,returneddate,rating)
         values  (2,1,2,DateAdd(day,-29,getdate()),DateAdd(day,-20,getdate()),3.6)
insert TypeDRatedBorrowings (ratedborrowingid,bookid,borrowerid,duedate,returneddate,rating)
         values  (3,1,1,DateAdd(day,-19,getdate()),DateAdd(day,-15,getdate()),3.5)
insert TypeDRatedBorrowings (ratedborrowingid,bookid,borrowerid,duedate,returneddate,rating)
         values  (4,1,3,DateAdd(day,-4,getdate()),null,null)
insert TypeDRatedBorrowings (ratedborrowingid,bookid,borrowerid,duedate,returneddate,rating)
         values  (5,2,1,DateAdd(day,-40,getdate()),null,null)
insert TypeDRatedBorrowings (ratedborrowingid,bookid,borrowerid,duedate,returneddate,rating)
         values  (6,3,2,DateAdd(day,+10,getdate()),null,null)
insert TypeDRatedBorrowings (ratedborrowingid,bookid,borrowerid,duedate,returneddate,rating)
         values  (7,4,1,DateAdd(day,-20,getdate()),DateAdd(day,-15,getdate()),2.0)
insert TypeDRatedBorrowings (ratedborrowingid,bookid,borrowerid,duedate,returneddate,rating)
         values  (8,4,2,DateAdd(day,-60,getdate()),DateAdd(day,-45,getdate()),3.7)
insert TypeDRatedBorrowings (ratedborrowingid,bookid,borrowerid,duedate,returneddate,rating)
         values  (9,4,3,DateAdd(day,-80,getdate()),DateAdd(day,-70,getdate()),3.8)
insert TypeDRatedBorrowings (ratedborrowingid,bookid,borrowerid,duedate,returneddate,rating)
         values  (10,5,1,DateAdd(day,-80,getdate()),null,null)
insert TypeDRatedBorrowings (ratedborrowingid,bookid,borrowerid,duedate,returneddate,rating)
         values  (11,6,1,DateAdd(day,-6,getdate()),null,null)
insert TypeDRatedBorrowings (ratedborrowingid,bookid,borrowerid,duedate,returneddate,rating)
         values  (12,7,1,DateAdd(day,10,getdate()),null,null)



set identity_insert TypeDratedBorrowings off

end
GO
/****** Object:  StoredProcedure [dbo].[resetdatabase]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[resetdatabase]
as
begin
delete from TypeAWritings
delete from TypeBCommentedWritings
delete from TypeCBorrowings
delete from TypeDRatedBorrowings
delete from authors
delete from books
delete from borrowers
delete from genres
delete from roles

end
GO
/****** Object:  StoredProcedure [dbo].[roleCreate]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[roleCreate](
   -- Comment by Brian Walters
   -- genreid is identity, so it is computed automatically and does not
   -- have to be provided as input
   @RoleName nvarchar(50),
   @CreateOperation nvarchar(500),
   @UpdateOperation nvarchar(500),
   @DeleteOperation nvarchar(500),
   @ListOperation nvarchar(500),
   @ViewOperation nvarchar(500)
   
   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	insert into roles 
	(RoleName,CreateOperation,UpdateOperation,DeleteOperation,ListOperation,ViewOperation)
	values
	(@RoleName,@CreateOperation,@UpdateOperation,@DeleteOperation,@ListOperation,@ViewOperation)
	-- Comment by Brian Walters
	-- scope_identity used to return the newly created id
	-- can be accessed from c# using ExecuteScalar
	select 'roleid' = scope_Identity()
END
GO
/****** Object:  StoredProcedure [dbo].[roleDelete]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[roleDelete]
-- Comment by Brian Walters
-- roleid is the unique identifer for records in the table
-- delete only needs the key information
@roleid int
as
begin
delete from roles 
  where roleid = @roleid
-- comment by Brian Walters
-- forgetting the where clause in a delete procedure is disastrous
-- because it will delete all records instead of just the one you want to delete

-- comment by brian walters
-- delete operations do not typically have anything to return
end
GO
/****** Object:  StoredProcedure [dbo].[RoleFindByID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[RoleFindByID](
@RoleID int
)
as
begin
select roleid, rolename, createoperation, updateoperation,
        deleteoperation, listoperation, viewoperation from roles
where roleid = @roleID
end
GO
/****** Object:  StoredProcedure [dbo].[rolesGetAll]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[rolesGetAll](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from roles
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select roleid, rolename, createoperation, updateoperation,
        deleteoperation, listoperation, viewoperation from roles
 
 order by roleid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[roleUpdateJust]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[roleUpdateJust](
   -- Comment by Brian Walters

   -- this procedure is pessimistic.  no checking for record concurrency protection
   -- The last user to invoke this procedure will overwrite any earlier invocations
   -- record locking is minimal

   -- roleid is primary key, so it must be supplied to identify the record to be updated
   -- you cannot update the primary key using this procedure
   -- 
   @roleid int,
   @rolename nvarchar(50),
   @CreateOperation nvarchar(500),
   @UpdateOperation nvarchar(500),
   @DeleteOperation nvarchar(500),
   @ListOperation nvarchar(500),
   @ViewOperation nvarchar(500)
   
   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	update roles 
	set rolename = @rolename, CreateOperation = @CreateOperation,
	    UpdateOperation = @UpdateOperation, DeleteOperation = @DeleteOperation,
		ListOperation = @ListOperation, ViewOperation = @ViewOperation
    where roleid = @roleid
	-- Comment by Brian Walters
	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 if there is no matching record or
	-- 1 if there was a matching record that was updated
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.
END
GO
/****** Object:  StoredProcedure [dbo].[roleUpdateSafe]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[roleUpdateSafe](
   -- Comment by Brian Walters
   -- this procedure is optimistic.  checking for record concurrency protection is performed
   -- The last user to invoke this procedure will not overwrite any earlier invocations
   -- if the record has been modified since the user had the data out for modification
   -- this is accomplished by checking for the old values before updating the new values

   -- record locking is minimal

   -- Roleid is primary key, so it must be supplied to identify the record to be updated
   -- you cannot update the primary key using this procedure
   -- 
   @Roleid int,						-- id to uniquly identofy record to update
   @oldRolename nvarchar(50),		-- old data to check for concurrency issues
   @OldCreateOperation nvarchar(500),
   @OldUpdateOperation nvarchar(500),
   @OldDeleteOperation nvarchar(500),
   @OldListOperation nvarchar(500),
   @oldViewOperation nvarchar(500),
   @newRolename nvarchar(50),		-- new value after the update
   @newCreateOperation nvarchar(500),
   @newUpdateOperation nvarchar(500),
   @newDeleteOperation nvarchar(500),
   @newListOperation nvarchar(500),
   @newViewOperation nvarchar(500)

   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	update Roles 
	set Rolename = @newRolename, CreateOperation = @newCreateOperation,
	    UpdateOperation=@newUpdateOperation, DeleteOperation = @newDeleteOperation,
		ListOperation = @newListOperation, ViewOperation = @newViewOperation
    where Roleid = @Roleid 
	and Rolename = @oldRolename 
	and CreateOperation = @OldCreateOperation
	and UpdateOperation = @OldUpdateOperation
	and DeleteOperation = @OldDeleteOperation
	and ListOperation = @OldListOperation
	and ViewOperation = @oldViewOperation
	
	
	-- Comment by Brian Walters
	-- if some other user has modified the record after this user read the record
	-- for editing purposes, the old values will not match and the 
	-- update will fail.  The caller can check the return value to discover this situation

	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 when there was a concurrency conflict, and the record was not updated
	-- this return value is 1 when there was not a conflict, and the update succeeded
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.
END
GO
/****** Object:  StoredProcedure [dbo].[TypeAauthorsGetRelatedToBookID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TypeAauthorsGetRelatedToBookID](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@bookid int, 
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from TypeAWritings where bookid = @bookid
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select  authors.authorid, authorname, authorDOB, authorlocation from authors 
 
 inner join TypeAWritings on authors.authorid = TypeAWritings.authorid
 -- this inner join is to connect the authors to the books through the
 -- junctiontable (many-to-many type A-Non duplication, no extra data)
 where bookid = @bookid
 -- the where clause makes sure only the authos who wrote this particular
 -- book are brought back
 order by authorid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[TypeAbooksGetRelatedToAuthorID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TypeAbooksGetRelatedToAuthorID](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@authorid int, 
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from TypeAWritings where authorid= @authorid
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
       set @take = 1  
   end
   
 end
 select books.bookid, bookname, pages, books.genreid, genrename from books
 left outer join genres on books.genreid = genres.genreid
 -- the left out join is to bring over the genres even when there is not
 -- a genreid in the books record
 inner join TypeAWritings on books.bookid = TypeAWritings.bookid
 -- this inner join is to connect the books to the authors through the
 -- junctiontable (many-to-many type A-Non duplication, no extra data)
 where authorid = @authorid
 -- the where clause makes sure only the books written by this particular
 -- author are brought back
 order by books.bookid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[TypeAWritingCreate]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TypeAWritingCreate](
   -- Comment by Brian Walters
   -- This junction table is Type A.	It does not support duplication
   --									it does not have any extra data to maintain
   -- it only needs the two keys
   --   authorid identifies the author who has written a book
   --   bookid identifies the book written by this author
   --   the same author cannot write the same book twice
   --   so no duplication
   --   it might be appropriate to call this junction table  WRITINGS
   --   but to clarify this example I will follow the extended naming convention
   --   no duplication is enforced by the database through a primary key
   --   the primary key to this record is a composite key (more than one column)
   --   each of the portions of the primary key is a foreign key to the other table
   @authorid int,
   @bookid int

   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	insert into TypeAWritings
	(authorid, bookid)
	values
	(@authorid, @bookid)
	-- Comment by Brian Walters
	-- since this table does not have any identity columns, there is nothing to return
	
END
GO
/****** Object:  StoredProcedure [dbo].[TypeAWritingDelete]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TypeAWritingDelete]
-- Comment by Brian Walters
-- a TypeA junction table does not duplicate
-- delete only needs the key information which is located in two keys
    @bookid int,
	@authorid int
	as
	begin
	   -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	delete from TypeAWritings
	where bookid = @bookid 
	and
	      authorid = @authorid
-- comment by Brian Walters
-- forgetting the where clause in a delete procedure is disastrous
-- because it will delete all records instead of just the one you want to delete

-- comment by Brian Walters
-- This procedure does not have a return value

	end
GO
/****** Object:  StoredProcedure [dbo].[TypeAWritingsGetAll]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TypeAWritingsGetAll](
@skip int,
@take int)
as
begin
if 0 = @take 
 begin
   select @take = count(*) from TypeAWritings
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
   select bookid, authorid from TypeAWritings
   order by bookid
   offset @skip rows fetch next @take rows only
end
GO
/****** Object:  StoredProcedure [dbo].[TypeAWritingUpdateJust]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TypeAWritingUpdateJust]
   -- Comment by Brian Walters
   -- this procedure is pessimistic.  no checking for record concurrency protection
   -- The last user to invoke this procedure will overwrite any earlier invocations
   -- record locking is minimal


   -- for a type A junction table, there is no need for the update
   -- function.   to update, simply delete the original junction entry
   -- and create a new one using the following procedures
   --     TypeAWritingDelete
   --     TypeAWritingCreate
   
   
as
BEGIN
	select "This_procedure_is_not_implemented" = 0
END
GO
/****** Object:  StoredProcedure [dbo].[TypeBcommentedAuthorsGetRelatedToBookID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TypeBcommentedAuthorsGetRelatedToBookID](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@bookid int, 
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from TypeBCommentedWritings where bookid = @bookid
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select  authors.authorid, authorname, authorDOB, authorlocation,comments  from authors 
 
 inner join TypeBCommentedWritings on authors.authorid = TypeBCommentedWritings.authorid
 -- this inner join is to connect the authors to the books through the
 -- junctiontable (many-to-many type B-Non duplication, with extra data)
 -- the extra data is provided in the the select statement (comments in this case)
 where bookid = @bookid
 -- the where clause makes sure only the authos who wrote this particular
 -- book are brought back
 order by authorid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[TypeBcommentedBooksGetRelatedToAuthorID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TypeBcommentedBooksGetRelatedToAuthorID](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@authorid int, 
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from TypeBCommentedWritings where authorid= @authorid
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
       set @take = 1  
   end
   
 end
 select books.bookid, bookname, pages, books.genreid, genrename, 
 -- previous line is books data
 comments from books
 -- previous line is extra data from junction table
 left outer join genres on books.genreid = genres.genreid
 -- the left out join is to bring over the genres even when there is not
 -- a genreid in the books record
 inner join TypeBCommentedWritings on books.bookid = TypeBCommentedWritings.bookid
 -- this inner join is to connect the books to the authors through the
 -- junctiontable (many-to-many type B-Non duplication, extra data)
 -- the extra data is included in the select statement (in this case comments)
 where authorid = @authorid
 -- the where clause makes sure only the books written by this particular
 -- author are brought back
 order by books.bookid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[TypeBCommentedWritingCreate]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TypeBCommentedWritingCreate](
   -- Comment by Brian Walters
   -- This junction table is Type B.	It does not support duplication
   --									it does indeed have extra data to maintain
   -- it needs the two keys, plus the extra data
   --   authorid identifies the author who has written a book
   --   bookid identifies the book written by this author
   --   the same author cannot write the same book twice
   --   so no duplication
   --   Extra data in the form of comments can be associated with each writing
   --   it might be appropriate to call this junction table  COMMENTEDWRITINGS
   --   but to clarify this example I will follow the extended naming convention
   --   no duplication is enforced by the database through a primary key
   --   the primary key to this record is a composite key (more than one column)
   --   each of the portions of the primary key is a foreign key to the other table
   @authorid int,
   @bookid int,
   @comments nvarchar(300)

   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	insert into TypeBCommentedWritings
	(authorid, bookid,comments)
	values
	(@authorid, @bookid,@comments)
	-- Comment by Brian Walters
	-- since this table does not have any identity columns, there is nothing to return
	
END
GO
/****** Object:  StoredProcedure [dbo].[TypeBCommentedWritingUpdateJust]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TypeBCommentedWritingUpdateJust]
   -- Comment by Brian Walters
   -- this procedure is pessimistic.  no checking for record concurrency protection
   -- The last user to invoke this procedure will overwrite any earlier invocations
   -- record locking is minimal


   -- for a type B junction table, there may no need for the update
   -- function.   to update, simply delete the original junction entry
   -- and create a new one using the following procedures
   --     TypeBWritingDelete
   --     TypeBWritingCreate
   -- depending on the amount of extra data maintained
   -- it might be appropriate to make an update procedure
   -- it will require the two keys as input as well the extra data
   -- this is a sample of this type of procedure
   @authorid int,					-- key 1
   @bookid int,						-- key 2
   @comments nvarchar(300)			-- extra data maintained
   
as
BEGIN
   -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer

	update TypeBCommentedWritings
	set comments = @comments
	where authorid = @authorid
	and
	bookid = @bookid
    -- Comment by Brian Walters
	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 if there is no matching record or
	-- 1 if there was a matching record that was updated
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.

	
END
GO
/****** Object:  StoredProcedure [dbo].[TypeBWritingDelete]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TypeBWritingDelete]
-- Comment by Brian Walters
-- a TypeB junction table does not duplicate
-- it does not matter that there is extra data in the record
-- delete only needs the key information which is located in two keys
    @bookid int,
	@authorid int
	as
	begin
	   -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer

	delete from TypeBWritings
	where bookid = @bookid 
	and
	      authorid = @authorid
-- comment by Brian Walters
-- forgetting the where clause in a delete procedure is disastrous
-- because it will delete all records instead of just the one you want to delete

-- comment by Brian Walters
-- This procedure does not have a return value

	end
GO
/****** Object:  StoredProcedure [dbo].[TypeCbooksGetRelatedToBorrowerID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TypeCbooksGetRelatedToBorrowerID](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@borrowerid int, 
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from TypeCBorrowings where borrowerid = @borrowerid
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select  books.bookid, isbn, bookname, pages, books.genreid, genrename, borrowingid from books
 
 inner join TypeCborrowings on books.bookid = TypeCborrowings.bookid
 -- this inner join is to connect the borrowers to the books through the
 -- junctiontable (many-to-many type C- duplication, with no extra data other than the borrowingid)
 -- the extra data is provided in the the select statement (borrowingid in this case)
 
 left outer join genres on books.genreid = genres.genreid 
 -- genreid is a foreign key, so we are bringing over the genrename too
 -- by joining the books table to the genres table over the genreid key
 -- the left outer join is used to insure ALL books are included
 -- even if they do not have a genre in the genres table
 -- in that case, the genrename will be null too
 
 where borrowerid = @borrowerid
 -- the where clause makes sure only the authos who wrote this particular
 -- book are brought back
 order by bookid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[TypeCBorrowingCreate]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TypeCBorrowingCreate](
   -- Comment by Brian Walters
   -- This junction table is Type C.	It does support duplication
   --									it does not have extra data to maintain
   --									other than the unique identifier
   -- it needs the two keys, and the unique is automatically generated
   --   borrowerid identifies the borrower who has borrowed a book
   --   bookid identifies the book written by this author
   --   the same borrower can indeed borrow the same book multiple times
   --   so duplication is allowed
   --   Extra data is not associated with this junction.  so we can not track when the book is due. 
   --   If this association exists, then the book has been borrowed.  since each borrowing
   --   has its own record, we can track how many times a book has been borrowed by a given user.
   --   it might be appropriate to call this junction table  BORROWINGS
   --   but to clarify this example I will follow the extended naming convention
   --   duplication is allowed by the database because a seperate auto calculated primary key has been established
   --   this procedure does not need anything but the two foreign keys to be supplied
   @borrowerid int,
   @bookid int
 

   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	insert into TypeCBorrowings
	(borrowerid, bookid)
	values
	(@borrowerid, @bookid)
	-- Comment by Brian Walters
	-- scope_identity used to return the newly created id
	-- can be accessed from c# using ExecuteScalar
	select 'borrowingid' = scope_Identity()
END
GO
/****** Object:  StoredProcedure [dbo].[TypeCBorrowingDelete]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TypeCBorrowingDelete]
-- Comment by Brian Walters
-- a TypeC junction table does indeed duplicate
-- it does not matter that there is extra data in the record (the two foreign keys)
-- delete only needs the key information which is located in the primary key
    @borrowingid int
	
	as
	begin
	   -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	delete from TypeCWritings
	where borrowingid = @borrowingid 
	
-- comment by Brian Walters
-- forgetting the where clause in a delete procedure is disastrous
-- because it will delete all records instead of just the one you want to delete

-- comment by Brian Walters
-- This procedure does not have a return value

	end
GO
/****** Object:  StoredProcedure [dbo].[TypeCborrowingsGetRelatedToBookID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TypeCborrowingsGetRelatedToBookID](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@bookid int, 
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from TypeCBorrowings where bookid = @bookid
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select  borrowers.borrowerid, borrowername, borrowerDOB, borrowers.roleid, rolename, borrowingid from borrowers
 
 inner join TypeCborrowings on borrowers.borrowerid = TypeCborrowings.borrowerid
 -- this inner join is to connect the borrowers to the books through the
 -- junctiontable (many-to-many type C- duplication, with no extra data other than the borrowingid)
 -- the extra data is provided in the the select statement (borrowingid in this case)
  
 inner join roles on roles.roleid = borrowers.roleid
 -- roleid is a foreign key, so we are bringing over the rolename too
 -- by joining the borrowers table to the roles table over the roleid key
 -- the inner join is used because the foreign key CANNOT be null
 -- so there must be a matching record in the roles table
 where bookid = @bookid
 -- the where clause makes sure only the authos who wrote this particular
 -- book are brought back
 order by borrowerid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[TypeCBorrowingUpdateJust]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TypeCBorrowingUpdateJust]
   -- Comment by Brian Walters
   -- this procedure is pessimistic.  no checking for record concurrency protection
   -- The last user to invoke this procedure will overwrite any earlier invocations
   -- record locking is minimal


   -- for a type C junction table, there is no need for the update
   -- function.   to update, simply delete the original junction entry
   -- and create a new one using the following procedures
   --     TypeCBorrowingDelete
   --     TypeCBorrowingCreate
   
   
as
BEGIN
	select "This_procedure_is_not_implemented" = 0
END
 
GO
/****** Object:  StoredProcedure [dbo].[TypeDbooksGetRelatedToBorrowerID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TypeDbooksGetRelatedToBorrowerID](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@borrowerid int, 
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from TypeDRatedBorrowings where borrowerid = @borrowerid
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select  ratedborrowingid, books.bookid, borrowers.borrowerid, DueDate, ReturnedDate, Rating,
 -- previous data is from TypeDRatedBorrowings table in type D junction
  isbn, bookname, pages, price, books.genreid, genrename,
 -- previous data is from books table
 borrowername, borroweremail, borrowerDOB, borrowers.roleid, rolename
 -- previous data is from Borrowers table
 from TypeDRatedBorrowings
 inner join books on books.bookid = TypeDratedborrowings.bookid
 -- this inner join is to connect the borrowers to the books through the
 -- junctiontable (many-to-many type D- duplication, with  extra data other than the borrowingid)
 -- the extra data is provided in the the select statement (borrowingid DueData ReturnedDate and rating in this case)
 
 left outer join genres on books.genreid = genres.genreid 
 -- genreid is a foreign key, so we are bringing over the genrename too
 -- by joining the books table to the genres table over the genreid key
 -- the left outer join is used to insure ALL books are included
 -- even if they do not have a genre in the genres table
 -- in that case, the genrename will be null too
 
 inner join borrowers on borrowers.borrowerid = TypeDRatedBorrowings.borrowerid
 -- this inner join is to connect books to the borrowers through the junctiontable
 inner join roles on roles.roleid = borrowers.roleid
 -- roleid is a foreign key, so we are bringing over the rolename too
 -- by joining the borrowers table to the roles table over the roleid key
 -- the inner join is used because the foreign key CANNOT be null
 -- so there must be a matching record in the roles table
 
 where borrowers.borrowerid = @borrowerid
 -- the where clause makes sure only the authos who wrote this particular
 -- book are brought back
 order by bookid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[TypeDRatedBorrowingCreate]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TypeDRatedBorrowingCreate](
   -- Comment by Brian Walters
   -- This junction table is Type D.	It does support duplication
   --									it does indeed have extra data to maintain
   --									in addition to the unique identifier
   -- it needs the two keys, and the unique id is automatically generated
   --   borrowerid identifies the borrower who has borrowed a book
   --   bookid identifies the book written by this author
   --   the same borrower can indeed borrow the same book multiple times
   --   so duplication is allowed
   --   Extra data is indeed associated with this junction.  
   --   we can track when the book is due, when it was returned, and what the rating from the use is
   --   
   --   it might be appropriate to call this junction table  RATEDBORROWINGS
   --   but to clarify this example I will follow the extended naming convention
   --   duplication is allowed by the database because a seperate auto calculated primary key has been established
   --   this procedure  the two foreign keys to be supplied in addition to the extra data
   @borrowerid int,
   @bookid int,
   @duedate datetime2(7),
   @returneddate datetime2(7),
   @rating  decimal(3,2)
 

   )
as
BEGIN
    -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	insert into TypeDRatedBorrowings
	(borrowerid, bookid, DueDate, ReturnedDate,rating)
	values
	(@borrowerid, @bookid,@DueDate,@ReturnedDate,@rating)
	-- Comment by Brian Walters
	-- scope_identity used to return the newly created id
	-- can be accessed from c# using ExecuteScalar
	select 'ratedborrowingid' = scope_Identity()
END
GO
/****** Object:  StoredProcedure [dbo].[TypeDRatedBorrowingDelete]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TypeDRatedBorrowingDelete]
-- Comment by Brian Walters
-- a TypeD junction table does indeed duplicate
-- it does not matter that there is extra data in the record (the two foreign keys plus additonal)
-- delete only needs the key information which is located in the primary key
    @ratedborrowingid int
	
	as
	begin
	   -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	delete from TypeDRatedBorrowings
	where ratedborrowingid = @ratedborrowingid 
	
-- comment by Brian Walters
-- forgetting the where clause in a delete procedure is disastrous
-- because it will delete all records instead of just the one you want to delete

-- comment by Brian Walters
-- This procedure does not have a return value

	end
GO
/****** Object:  StoredProcedure [dbo].[TypeDRatedborrowingFindByID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[TypeDRatedborrowingFindByID](

@borrowingid int

)
as
begin
 
 select  ratedborrowingid, books.bookid, borrowers.borrowerid, DueDate, ReturnedDate, Rating,
 -- previous data is from TypeDRatedBorrowings table in type D junction
  isbn, bookname, pages, price, books.genreid, genrename,
 -- previous data is from books table
 borrowername, borroweremail, borrowerDOB, borrowers.roleid, rolename
 -- previous data is from Borrowers table
 from TypeDRatedBorrowings
 inner join books on books.bookid = TypeDratedborrowings.bookid
 -- this inner join is to connect the borrowers to the books through the
 -- junctiontable (many-to-many type D- duplication, with  extra data other than the borrowingid)
 -- the extra data is provided in the the select statement (borrowingid DueData ReturnedDate and rating in this case)
 
 left outer join genres on books.genreid = genres.genreid 
 -- genreid is a foreign key, so we are bringing over the genrename too
 -- by joining the books table to the genres table over the genreid key
 -- the left outer join is used to insure ALL books are included
 -- even if they do not have a genre in the genres table
 -- in that case, the genrename will be null too
 
 inner join borrowers on borrowers.borrowerid = TypeDRatedBorrowings.borrowerid
 -- this inner join is to connect books to the borrowers through the junctiontable
 inner join roles on roles.roleid = borrowers.roleid
 -- roleid is a foreign key, so we are bringing over the rolename too
 -- by joining the borrowers table to the roles table over the roleid key
 -- the inner join is used because the foreign key CANNOT be null
 -- so there must be a matching record in the roles table
 where ratedborrowingid = @borrowingid
 
end
GO
/****** Object:  StoredProcedure [dbo].[TypeDRatedborrowingsGetAll]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[TypeDRatedborrowingsGetAll](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation

@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from TypeDratedBorrowings 
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select  ratedborrowingid, books.bookid, borrowers.borrowerid, DueDate, ReturnedDate, Rating,
 -- previous data is from TypeDRatedBorrowings table in type D junction
  isbn, bookname, pages, price, books.genreid, genrename,
 -- previous data is from books table
 borrowername, borroweremail, borrowerDOB, borrowers.roleid, rolename
 -- previous data is from Borrowers table
 from TypeDRatedBorrowings
 inner join books on books.bookid = TypeDratedborrowings.bookid
 -- this inner join is to connect the borrowers to the books through the
 -- junctiontable (many-to-many type D- duplication, with  extra data other than the borrowingid)
 -- the extra data is provided in the the select statement (borrowingid DueData ReturnedDate and rating in this case)
 
 left outer join genres on books.genreid = genres.genreid 
 -- genreid is a foreign key, so we are bringing over the genrename too
 -- by joining the books table to the genres table over the genreid key
 -- the left outer join is used to insure ALL books are included
 -- even if they do not have a genre in the genres table
 -- in that case, the genrename will be null too
 
 inner join borrowers on borrowers.borrowerid = TypeDRatedBorrowings.borrowerid
 -- this inner join is to connect books to the borrowers through the junctiontable
 inner join roles on roles.roleid = borrowers.roleid
 -- roleid is a foreign key, so we are bringing over the rolename too
 -- by joining the borrowers table to the roles table over the roleid key
 -- the inner join is used because the foreign key CANNOT be null
 -- so there must be a matching record in the roles table

 order by borrowerid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[TypeDRatedborrowingsGetRelatedToBookID]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TypeDRatedborrowingsGetRelatedToBookID](
   -- Comment by Brian Walters
   -- @skip represents the number of records to skip, the default value of 0 
   --       indicates that the list should start from the beginning
   --       non default values allows for paging of the data
   -- @take represents the number of records to bring back, the default value of 0
   --       indicates that ALL the records should be brought back
   --       the if statement sets @take to the appropriate count in that situation
@bookid int, 
@skip int = 0,
@take int = 0
)
as
begin
 if 0 = @take 
 begin
   select @take = count(*) from TypeDratedBorrowings where bookid = @bookid
   -- fetch clause will throw excepion if @take is 0 so set it to 1
   -- to avoid exception when no records match
   if @take = 0 
   begin
   set @take = 1  
   end
 end
 select  ratedborrowingid, books.bookid, borrowers.borrowerid, DueDate, ReturnedDate, Rating,
 -- previous data is from TypeDRatedBorrowings table in type D junction
  isbn, bookname, pages, price, books.genreid, genrename,
 -- previous data is from books table
 borrowername, borroweremail, borrowerDOB, borrowers.roleid, rolename
 -- previous data is from Borrowers table
 from TypeDRatedBorrowings
 inner join books on books.bookid = TypeDratedborrowings.bookid
 -- this inner join is to connect the borrowers to the books through the
 -- junctiontable (many-to-many type D- duplication, with  extra data other than the borrowingid)
 -- the extra data is provided in the the select statement (borrowingid DueData ReturnedDate and rating in this case)
 
 left outer join genres on books.genreid = genres.genreid 
 -- genreid is a foreign key, so we are bringing over the genrename too
 -- by joining the books table to the genres table over the genreid key
 -- the left outer join is used to insure ALL books are included
 -- even if they do not have a genre in the genres table
 -- in that case, the genrename will be null too
 
 inner join borrowers on borrowers.borrowerid = TypeDRatedBorrowings.borrowerid
 -- this inner join is to connect books to the borrowers through the junctiontable
 inner join roles on roles.roleid = borrowers.roleid
 -- roleid is a foreign key, so we are bringing over the rolename too
 -- by joining the borrowers table to the roles table over the roleid key
 -- the inner join is used because the foreign key CANNOT be null
 -- so there must be a matching record in the roles table
 where books.bookid = @bookid
 -- the where clause makes sure only the authos who wrote this particular
 -- book are brought back
 order by borrowerid
 offset @skip rows fetch next @take rows only
 -- Comment by Brian Walters
 -- note:  the records must be sorted in some order if you wish to skip and take
 -- offset is the t-sql command to skip records
 -- fetch is the t-sql command to take records
end
GO
/****** Object:  StoredProcedure [dbo].[TypeDRatedBorrowingUpdateJust]    Script Date: 12/24/2019 8:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TypeDRatedBorrowingUpdateJust]
   -- Comment by Brian Walters
   -- this procedure is pessimistic.  no checking for record concurrency protection
   -- The last user to invoke this procedure will overwrite any earlier invocations
   -- record locking is minimal

   -- for a type D junction table, the record to be updated must be identified 
   -- using a primary key identifier
   -- it might be appropriate to make an update procedure
   -- it will require the two keys as input as well as the extra data
   -- this is a sample of this type of procedure
   @ratedborrowingid int,			-- primary key - used to identify record
   @DueDate datetime2(7),			-- extra data maintained
   @ReturnedDate datetime2(7),		-- extra data maintained
   @rating decimal(3,2)						-- extra data maintained
 
   -- the two foreign keys are not modifiable through this procedure
   -- this is in order to be consistent with the other updates which
   -- do not allow you to change key information
  as
BEGIN
   -- Comment by Brian Walters
	-- decision is to allow exceptions to be sent to Data Access Layer.
	-- no exception processing in this procedure
	-- no logging at the SQL layer
	update TypeDRatedBorrowings
	set DueDate = @DueDate, ReturnedDate = @ReturnedDate,
	rating = @rating
	where ratedborrowingid = @ratedborrowingid
    -- Comment by Brian Walters
	-- if you forget the where clause it is disastrous because all records
	-- will be update to the same values
	select 'NumberRecordsAffected' = @@ROWCOUNT
	-- Comment by Brian Walters
	-- this return value is 0 if there is no matching record or
	-- 1 if there was a matching record that was updated
	-- It should never return more than 1, because there should only be one matching record
	-- if the return value is more than one, you neeed to figure out why.

	
END
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
