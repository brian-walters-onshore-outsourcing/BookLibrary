--USE [master]
--GO
--/****** Object:  Database [Library]    Script Date: 12/24/2019 8:00:41 AM ******/
--CREATE DATABASE [Library]
-- CONTAINMENT = NONE
-- ON  PRIMARY 
--( NAME = N'booksm2m', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\booksm2m.mdf' , SIZE = 73792KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[authors]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  Table [dbo].[books]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  Table [dbo].[borrowers]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  Table [dbo].[genres]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  Table [dbo].[LogTrace]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  Table [dbo].[roles]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  Table [dbo].[TypeAWritings]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  Table [dbo].[TypeBCommentedWritings]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  Table [dbo].[TypeCBorrowings]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  Table [dbo].[TypeDRatedBorrowings]    Script Date: 12/24/2019 8:00:41 AM ******/
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
SET IDENTITY_INSERT [dbo].[authors] ON 

INSERT [dbo].[authors] ([authorid], [authorname], [authorDOB], [authorlocation]) VALUES (1, N'Mr Odd', CAST(N'1977-01-01T00:00:00.0000000' AS DateTime2), N'Oddsville')
INSERT [dbo].[authors] ([authorid], [authorname], [authorDOB], [authorlocation]) VALUES (2, N'Mrs Even', CAST(N'1888-02-04T00:00:00.0000000' AS DateTime2), N'Evensville')
INSERT [dbo].[authors] ([authorid], [authorname], [authorDOB], [authorlocation]) VALUES (3, N'Dr. Prime', CAST(N'1987-03-13T00:00:00.0000000' AS DateTime2), N'Primesville')
INSERT [dbo].[authors] ([authorid], [authorname], [authorDOB], [authorlocation]) VALUES (4, N'The Square', CAST(N'1936-04-16T00:00:00.0000000' AS DateTime2), N'Squaresville')
SET IDENTITY_INSERT [dbo].[authors] OFF
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([bookid], [ISBN], [bookname], [pages], [price], [genreid]) VALUES (1, NULL, N'One', 11, NULL, 1)
INSERT [dbo].[books] ([bookid], [ISBN], [bookname], [pages], [price], [genreid]) VALUES (2, NULL, N'Two', 22, NULL, 3)
INSERT [dbo].[books] ([bookid], [ISBN], [bookname], [pages], [price], [genreid]) VALUES (3, NULL, N'Three', 33, NULL, 3)
INSERT [dbo].[books] ([bookid], [ISBN], [bookname], [pages], [price], [genreid]) VALUES (4, NULL, N'Four', 44, NULL, 0)
INSERT [dbo].[books] ([bookid], [ISBN], [bookname], [pages], [price], [genreid]) VALUES (5, NULL, N'Five', 55, NULL, 3)
INSERT [dbo].[books] ([bookid], [ISBN], [bookname], [pages], [price], [genreid]) VALUES (6, NULL, N'Six', 66, NULL, 0)
INSERT [dbo].[books] ([bookid], [ISBN], [bookname], [pages], [price], [genreid]) VALUES (7, NULL, N'Seven', 77, NULL, 3)
INSERT [dbo].[books] ([bookid], [ISBN], [bookname], [pages], [price], [genreid]) VALUES (8, NULL, N'Eight', 88, NULL, 0)
INSERT [dbo].[books] ([bookid], [ISBN], [bookname], [pages], [price], [genreid]) VALUES (9, NULL, N'Nine', 99, NULL, 1)
SET IDENTITY_INSERT [dbo].[books] OFF
SET IDENTITY_INSERT [dbo].[borrowers] ON 

INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail], [borrowerDOB], [roleid], [SecuredHash], [SecuredSalt]) VALUES (1, N'Alligator', N'Alligator@Email.com', CAST(N'1960-05-01T00:00:00.0000000' AS DateTime2), 1, N'alligator', N'ClearText')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail], [borrowerDOB], [roleid], [SecuredHash], [SecuredSalt]) VALUES (2, N'Bear', N'Bear@Email.com', CAST(N'1961-06-02T00:00:00.0000000' AS DateTime2), 1, N'alligator', N'ClearText')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail], [borrowerDOB], [roleid], [SecuredHash], [SecuredSalt]) VALUES (3, N'Cat', N'Cat@Email.com', CAST(N'1962-07-04T00:00:00.0000000' AS DateTime2), 1, N'alligator', N'ClearText')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail], [borrowerDOB], [roleid], [SecuredHash], [SecuredSalt]) VALUES (4, N'Dog', N'Dog@Email.com', CAST(N'1963-08-05T00:00:00.0000000' AS DateTime2), 2, N'alligator', N'ClearText')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail], [borrowerDOB], [roleid], [SecuredHash], [SecuredSalt]) VALUES (5, N'Elephant', N'Elephant@Email.com', CAST(N'1964-09-06T00:00:00.0000000' AS DateTime2), 2, N'alligator', N'ClearText')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail], [borrowerDOB], [roleid], [SecuredHash], [SecuredSalt]) VALUES (6, N'Fish', N'Fish@Email.com', CAST(N'1965-10-07T00:00:00.0000000' AS DateTime2), 3, N'alligator', N'ClearText')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail], [borrowerDOB], [roleid], [SecuredHash], [SecuredSalt]) VALUES (7, N'Gecko', N'Gecko@Email.com', CAST(N'1966-11-18T00:00:00.0000000' AS DateTime2), 3, N'alligator', N'ClearText')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail], [borrowerDOB], [roleid], [SecuredHash], [SecuredSalt]) VALUES (8, N'Hampster', N'Hampster@Email.com', CAST(N'1977-12-19T00:00:00.0000000' AS DateTime2), 3, N'alligator', N'ClearText')
INSERT [dbo].[borrowers] ([borrowerid], [borrowername], [borroweremail], [borrowerDOB], [roleid], [SecuredHash], [SecuredSalt]) VALUES (9, N'Iguana', N'Iguana@Email.com', CAST(N'1978-12-25T00:00:00.0000000' AS DateTime2), 3, N'alligator', N'ClearText')
SET IDENTITY_INSERT [dbo].[borrowers] OFF
SET IDENTITY_INSERT [dbo].[genres] ON 

INSERT [dbo].[genres] ([genreid], [genreName]) VALUES (0, N'even')
INSERT [dbo].[genres] ([genreid], [genreName]) VALUES (1, N'odd')
INSERT [dbo].[genres] ([genreid], [genreName]) VALUES (3, N'prime')
SET IDENTITY_INSERT [dbo].[genres] OFF
SET IDENTITY_INSERT [dbo].[LogTrace] ON 

INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (1, N'The controller for path ''/register'' was not found or does not implement IController.', N'Global.asax', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-05T16:59:35.8670000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (2, N'The controller for path ''/Shared/LoginRegisterPartial'' was not found or does not implement IController.', N'Global.asax', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-05T17:06:10.9730000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (3, N'A route named ''Home'' could not be found in the route collection.
Parameter name: name', N'Global.asax', N'   at System.Web.Routing.RouteCollection.GetVirtualPath(RequestContext requestContext, String name, RouteValueDictionary values)
   at System.Web.Mvc.RouteCollectionExtensions.GetVirtualPathForArea(RouteCollection routes, RequestContext requestContext, String name, RouteValueDictionary values, Boolean& usingAreas)
   at System.Web.Mvc.UrlHelper.GenerateUrl(String routeName, String actionName, String controllerName, RouteValueDictionary routeValues, RouteCollection routeCollection, RequestContext requestContext, Boolean includeImplicitMvcValues)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-05T17:07:45.3070000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (4, N'A route named ''Index'' could not be found in the route collection.
Parameter name: name', N'Global.asax', N'   at System.Web.Routing.RouteCollection.GetVirtualPath(RequestContext requestContext, String name, RouteValueDictionary values)
   at System.Web.Mvc.RouteCollectionExtensions.GetVirtualPathForArea(RouteCollection routes, RequestContext requestContext, String name, RouteValueDictionary values, Boolean& usingAreas)
   at System.Web.Mvc.UrlHelper.GenerateUrl(String routeName, String actionName, String controllerName, RouteValueDictionary routeValues, RouteCollection routeCollection, RequestContext requestContext, Boolean includeImplicitMvcValues)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-05T17:11:11.8730000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (5, N'Could not find stored procedure ''BorrowerSecuredUpdateJust''.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.BorrowerSecuredDAL.BorrowerSecuredUpdateJust(Int32 BorrowerID, String Hash, String Salt) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BorrowerDAL.cs:line 1012', CAST(N'2019-12-06T08:17:21.7870000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (6, N'Could not find stored procedure ''BorrowerSecuredUpdateJust''.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.BorrowerSecuredDAL.BorrowerSecuredUpdateJust(Int32 BorrowerID, String Hash, String Salt) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BorrowerDAL.cs:line 1012
   at LibraryBusinessLogicLayer.Context.RegisterUserClearText(String UserName, String EMail, DateTime DOB, String Password) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 451
   at LibraryWebSite.Controllers.HomeController.Register(RegistrationViewModel vm) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\HomeController.cs:line 35', CAST(N'2019-12-06T08:17:21.9300000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (7, N'The model item passed into the dictionary is of type ''LibraryCommon.Borrower'', but this dictionary requires a model item of type ''LibraryWebSite.Models.VMBorrower''.', N'Global.asax', N'   at System.Web.Mvc.ViewDataDictionary`1.SetModel(Object value)
   at System.Web.Mvc.ViewDataDictionary..ctor(ViewDataDictionary dictionary)
   at System.Web.Mvc.WebViewPage`1.SetViewData(ViewDataDictionary viewData)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T09:15:07.3170000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (8, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Edit(Int32)'' in ''LibraryWebSite.Controllers.BorrowerController''. An optional parameter must be a reference ', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T09:31:56.3570000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (9, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Edit(Int32)'' in ''LibraryWebSite.Controllers.BorrowerController''. An optional parameter must be a reference ', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T10:49:42.2300000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (10, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Edit(Int32)'' in ''LibraryWebSite.Controllers.BorrowerController''. An optional parameter must be a reference ', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T10:51:56.3530000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (11, N'A route named ''Index'' could not be found in the route collection.
Parameter name: name', N'Global.asax', N'   at System.Web.Routing.RouteCollection.GetVirtualPath(RequestContext requestContext, String name, RouteValueDictionary values)
   at System.Web.Mvc.RouteCollectionExtensions.GetVirtualPathForArea(RouteCollection routes, RequestContext requestContext, String name, RouteValueDictionary values, Boolean& usingAreas)
   at System.Web.Mvc.UrlHelper.GenerateUrl(String routeName, String actionName, String controllerName, RouteValueDictionary routeValues, RouteCollection routeCollection, RequestContext requestContext, Boolean includeImplicitMvcValues)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T10:52:11.7800000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (12, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Delete(Int32)'' in ''LibraryWebSite.Controllers.BorrowerController''. An optional parameter must be a referenc', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T10:56:08.1330000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (13, N'The controller for path ''/Shared/LoginRegisterPartial'' was not found or does not implement IController.', N'Global.asax', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T12:28:14.3800000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (14, N'C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Views\Home\Login.cshtml(18): error CS1061: ''LoginViewModel'' does not contain a definition for ''Message'' and no extension method ''Message'' accepting a first argument of type ''Logi', N'Global.asax', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T12:28:34.8900000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (15, N'Procedure or function ''borrowerSecuredFindByID'' expects parameter ''@BorrowerID'', which was not supplied.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()
   at LibraryDataAccess.BorrowerSecuredDAL.BorrowerSecuredFindByName(String Name) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BorrowerDAL.cs:line 864', CAST(N'2019-12-06T12:37:26.2400000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (16, N'Procedure or function ''borrowerSecuredFindByID'' expects parameter ''@BorrowerID'', which was not supplied.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()
   at LibraryDataAccess.BorrowerSecuredDAL.BorrowerSecuredFindByName(String Name) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BorrowerDAL.cs:line 864
   at LibraryBusinessLogicLayer.Context.ValidateUserClearText(String UserName, String Password) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 466
   at LibraryWebSite.Controllers.HomeController.Login(LoginViewModel vm) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\HomeController.cs:line 34', CAST(N'2019-12-06T12:37:26.2830000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (17, N'A public action method ''Logout'' was not found on controller ''LibraryWebSite.Controllers.HomeController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T12:38:28.3030000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (18, N'The view ''Index'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Role/Index.aspx
~/Views/Role/Index.ascx
~/Views/Shared/Index.aspx
~/Views/Shared/Index.ascx
~/Views/Ro', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T12:38:40.4570000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (19, N'The controller for path ''/Shared/LoginRegisterPartial'' was not found or does not implement IController.', N'Global.asax', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T12:41:49.7900000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (20, N'The controller for path ''/Shared/LoginRegisterPartial'' was not found or does not implement IController.', N'Global.asax', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T12:43:48.2000000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (21, N'The view ''Index'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Role/Index.aspx
~/Views/Role/Index.ascx
~/Views/Shared/Index.aspx
~/Views/Shared/Index.ascx
~/Views/Ro', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T13:17:10.7800000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (22, N'The view ''ForgotP'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Home/ForgotP.aspx
~/Views/Home/ForgotP.ascx
~/Views/Shared/ForgotP.aspx
~/Views/Shared/ForgotP.ascx
', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T13:31:25.1770000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (23, N'An item with the same key has already been added.', N'Global.asax', N'   at System.ThrowHelper.ThrowArgumentException(ExceptionResource resource)
   at System.Collections.Generic.Dictionary`2.Insert(TKey key, TValue value, Boolean add)
   at System.Web.Mvc.TempDataDictionary.Add(String key, Object value)
   at LibraryWebSite.Models.MustBeInRoleAttribute.OnAuthorization(AuthorizationContext filterContext) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Models\MustBeInRoleAttribute.cs:line 25
   at System.Web.Mvc.ControllerActionInvoker.InvokeAuthorizationFilters(ControllerContext controllerContext, IList`1 filters, ActionDescriptor actionDescriptor)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__0(AsyncCallback asyncCallback, Object asyncState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.BeginInvokeAction(ControllerContext controllerContext, String actionName, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_0(AsyncCallback asyncCallback, Object asyncState, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecuteCore(AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_1(AsyncCallback asyncCallback, Object callbackState, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_0(AsyncCallback asyncCallback, Object asyncState, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T14:32:31.9000000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (24, N'The model item passed into the dictionary is of type ''System.Collections.Generic.List`1[LibraryCommon.Role]'', but this dictionary requires a model item of type ''System.Collections.Generic.IEnumerable`1[LibraryWebSite.Models.VMRole]''.', N'Global.asax', N'   at System.Web.Mvc.ViewDataDictionary`1.SetModel(Object value)
   at System.Web.Mvc.ViewDataDictionary..ctor(ViewDataDictionary dictionary)
   at System.Web.Mvc.WebViewPage`1.SetViewData(ViewDataDictionary viewData)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T15:25:39.7130000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (25, N'An item with the same key has already been added.', N'Global.asax', N'   at System.ThrowHelper.ThrowArgumentException(ExceptionResource resource)
   at System.Collections.Generic.Dictionary`2.Insert(TKey key, TValue value, Boolean add)
   at System.Web.Mvc.TempDataDictionary.Add(String key, Object value)
   at LibraryWebSite.Models.MustBeInRoleAttribute.OnAuthorization(AuthorizationContext filterContext) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Models\MustBeInRoleAttribute.cs:line 25
   at System.Web.Mvc.ControllerActionInvoker.InvokeAuthorizationFilters(ControllerContext controllerContext, IList`1 filters, ActionDescriptor actionDescriptor)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__0(AsyncCallback asyncCallback, Object asyncState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.BeginInvokeAction(ControllerContext controllerContext, String actionName, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_0(AsyncCallback asyncCallback, Object asyncState, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecuteCore(AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_1(AsyncCallback asyncCallback, Object callbackState, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_0(AsyncCallback asyncCallback, Object asyncState, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T15:55:00.5170000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (26, N'An item with the same key has already been added.', N'Global.asax', N'   at System.ThrowHelper.ThrowArgumentException(ExceptionResource resource)
   at System.Collections.Generic.Dictionary`2.Insert(TKey key, TValue value, Boolean add)
   at System.Web.Mvc.TempDataDictionary.Add(String key, Object value)
   at LibraryWebSite.Models.MustBeInRoleAttribute.OnAuthorization(AuthorizationContext filterContext) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Models\MustBeInRoleAttribute.cs:line 25
   at System.Web.Mvc.ControllerActionInvoker.InvokeAuthorizationFilters(ControllerContext controllerContext, IList`1 filters, ActionDescriptor actionDescriptor)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__0(AsyncCallback asyncCallback, Object asyncState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.BeginInvokeAction(ControllerContext controllerContext, String actionName, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_0(AsyncCallback asyncCallback, Object asyncState, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecuteCore(AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_1(AsyncCallback asyncCallback, Object callbackState, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_0(AsyncCallback asyncCallback, Object asyncState, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T15:55:08.3200000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (27, N'An item with the same key has already been added.', N'Global.asax', N'   at System.ThrowHelper.ThrowArgumentException(ExceptionResource resource)
   at System.Collections.Generic.Dictionary`2.Insert(TKey key, TValue value, Boolean add)
   at System.Web.Mvc.TempDataDictionary.Add(String key, Object value)
   at LibraryWebSite.Models.MustBeInRoleAttribute.OnAuthorization(AuthorizationContext filterContext) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Models\MustBeInRoleAttribute.cs:line 25
   at System.Web.Mvc.ControllerActionInvoker.InvokeAuthorizationFilters(ControllerContext controllerContext, IList`1 filters, ActionDescriptor actionDescriptor)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__0(AsyncCallback asyncCallback, Object asyncState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.BeginInvokeAction(ControllerContext controllerContext, String actionName, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_0(AsyncCallback asyncCallback, Object asyncState, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecuteCore(AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_1(AsyncCallback asyncCallback, Object callbackState, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_0(AsyncCallback asyncCallback, Object asyncState, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T15:55:23.5500000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (28, N'An item with the same key has already been added.', N'Global.asax', N'   at System.ThrowHelper.ThrowArgumentException(ExceptionResource resource)
   at System.Collections.Generic.Dictionary`2.Insert(TKey key, TValue value, Boolean add)
   at System.Web.Mvc.TempDataDictionary.Add(String key, Object value)
   at LibraryWebSite.Models.MustBeInRoleAttribute.OnAuthorization(AuthorizationContext filterContext) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Models\MustBeInRoleAttribute.cs:line 25
   at System.Web.Mvc.ControllerActionInvoker.InvokeAuthorizationFilters(ControllerContext controllerContext, IList`1 filters, ActionDescriptor actionDescriptor)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__0(AsyncCallback asyncCallback, Object asyncState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.BeginInvokeAction(ControllerContext controllerContext, String actionName, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_0(AsyncCallback asyncCallback, Object asyncState, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecuteCore(AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_1(AsyncCallback asyncCallback, Object callbackState, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.Controller.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.BeginExecute(RequestContext requestContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_0(AsyncCallback asyncCallback, Object asyncState, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallBeginDelegate(AsyncCallback callback, Object callbackState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.Begin(AsyncCallback callback, Object state, Int32 timeout)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T15:55:45.9300000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (29, N'A route named ''Index'' could not be found in the route collection.
Parameter name: name', N'Global.asax', N'   at System.Web.Routing.RouteCollection.GetVirtualPath(RequestContext requestContext, String name, RouteValueDictionary values)
   at System.Web.Mvc.RouteCollectionExtensions.GetVirtualPathForArea(RouteCollection routes, RequestContext requestContext, String name, RouteValueDictionary values, Boolean& usingAreas)
   at System.Web.Mvc.UrlHelper.GenerateUrl(String routeName, String actionName, String controllerName, RouteValueDictionary routeValues, RouteCollection routeCollection, RequestContext requestContext, Boolean includeImplicitMvcValues)
   at System.Web.Mvc.RedirectToRouteResult.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-06T16:07:03.3200000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (30, N'Procedure or function ''roleUpdateJust'' expects parameter ''@CreateOperation'', which was not supplied.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.RoleDAL.RoleUpdateJust(Int32 RoleID, String RoleName, String createOperation, String updateOperation, String deleteOperation, String listOperation, String viewOperation) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\RoleDAL.cs:line 450', CAST(N'2019-12-06T16:18:46.0400000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (31, N'Procedure or function ''roleUpdateJust'' expects parameter ''@CreateOperation'', which was not supplied.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.RoleDAL.RoleUpdateJust(Int32 RoleID, String RoleName, String createOperation, String updateOperation, String deleteOperation, String listOperation, String viewOperation) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\RoleDAL.cs:line 450
   at LibraryBusinessLogicLayer.Context.RoleUpdateJust(Int32 RoleID, String Name, String CreateOperation, String UpdateOperation, String DeleteOperation, String ListOperation, String ViewOperation) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 400
   at LibraryBusinessLogicLayer.Context.RoleUpdateJust(Int32 id, Role r) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 387
   at LibraryWebSite.Controllers.RoleController.Edit(Int32 id, VMRole data) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\RoleController.cs:line 114', CAST(N'2019-12-06T16:18:46.0600000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (32, N'C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Views\Shared\_Layout.cshtml(27): error CS0117: ''Hide'' does not contain a definition for ''UnlessInRole''', N'Global.asax', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass40_0.<RenderPageCore>b__0(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-09T12:22:50.4400000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (33, N'C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Views\Shared\_Layout.cshtml(27): error CS0117: ''Hide'' does not contain a definition for ''UnlessInRole''', N'Global.asax', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.WebPages.BuildManagerWrapper.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryManager.CreateInstanceOfType[T](String virtualPath)
   at System.Web.WebPages.VirtualPathFactoryExtensions.CreateInstance[T](IVirtualPathFactory factory, String virtualPath)
   at System.Web.WebPages.WebPageBase.CreatePageFromVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, DisplayModeProvider displayModeProvider, IDisplayMode displayMode)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass40_0.<RenderPageCore>b__0(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-09T12:23:36.8530000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (34, N'C:\Users\bwalters\AppData\Local\Temp\Temporary ASP.NET Files\vs\02583840\2fd0b425\App_Web_index.cshtml.f18fa47a.w9maejxh.0.cs(340): error CS1513: } expected', N'Global.asax', N'   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-09T13:00:28.3330000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (35, N'Data is Null. This method or property cannot be called on Null values.', N'DAL', N'   at System.Data.SqlClient.SqlBuffer.get_String()
   at System.Data.SqlClient.SqlDataReader.GetString(Int32 i)
   at LibraryDataAccess.BookMapper.ToBook(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 31
   at LibraryDataAccess.BookDAL.BooksGetAll(Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 198', CAST(N'2019-12-09T13:38:39.3730000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (36, N'The SqlParameter is already contained by another SqlParameterCollection.', N'DAL', N'   at System.Data.SqlClient.SqlParameterCollection.Validate(Int32 index, Object value)
   at System.Data.SqlClient.SqlParameterCollection.Add(Object value)
   at LibraryDataAccess.BookDAL.BookUpdateSafe(Int32 BookID, String oldISBN, String oldBookName, Int32 oldPages, Int32 oldGenreID, String newISBN, String newBookName, Int32 newPages, Int32 newGenreID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 533', CAST(N'2019-12-09T13:45:34.7670000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (37, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Details(Int32)'' in ''LibraryWebSite.Controllers.BookController''. An optional parameter must be a reference t', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-09T14:01:29.7370000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (38, N'Expected "}".
', N'Global.asax', N'   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetCompiledType(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.GetCompiledType(String virtualPath)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-13T08:43:43.7530000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (39, N'A public action method ''Lend'' was not found on controller ''LibraryWebSite.Controllers.BookController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-13T16:46:47.5000000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (40, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Edit(Int32)'' in ''LibraryWebSite.Controllers.RoleController''. An optional parameter must be a reference type', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-13T16:51:11.4830000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (41, N'A public action method ''Lend'' was not found on controller ''LibraryWebSite.Controllers.BookController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-16T12:59:30.9030000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (42, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Edit(Int32)'' in ''LibraryWebSite.Controllers.RoleController''. An optional parameter must be a reference type', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-16T13:54:05.0200000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (43, N'A public action method ''Edit1'' was not found on controller ''LibraryWebSite.Controllers.RoleController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-16T13:54:09.7600000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (44, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Edit(Int32)'' in ''LibraryWebSite.Controllers.RoleController''. An optional parameter must be a reference type', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-16T16:47:42.9300000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (45, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Edit(Int32)'' in ''LibraryWebSite.Controllers.RoleController''. An optional parameter must be a reference type', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-16T17:01:07.3470000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (46, N'A public action method ''Edit1'' was not found on controller ''LibraryWebSite.Controllers.RoleController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-16T17:01:12.4170000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (47, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Edit(Int32)'' in ''LibraryWebSite.Controllers.RoleController''. An optional parameter must be a reference type', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-16T20:46:09.6000000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (48, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Edit(Int32)'' in ''LibraryWebSite.Controllers.RoleController''. An optional parameter must be a reference type', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-16T20:52:33.5070000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (49, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Edit(Int32)'' in ''LibraryWebSite.Controllers.RoleController''. An optional parameter must be a reference type', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-16T20:59:09.3730000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (50, N'A public action method ''CheckOut'' was not found on controller ''LibraryWebSite.Controllers.BookController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-17T08:24:13.3730000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (51, N'The model item passed into the dictionary is of type ''System.Collections.Generic.List`1[LibraryWebSite.Models.VMBase`2[LibraryCommon.Book,LibraryWebSite.Models.VMBook]]'', but this dictionary requires a model item of type ''System.Collections.Generic.I', N'Global.asax', N'   at System.Web.Mvc.ViewDataDictionary`1.SetModel(Object value)
   at System.Web.Mvc.ViewDataDictionary..ctor(ViewDataDictionary dictionary)
   at System.Web.Mvc.WebViewPage`1.SetViewData(ViewDataDictionary viewData)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T09:28:50.8470000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (52, N'The model item passed into the dictionary is of type ''LibraryCommon.TypeDRatedBorrowing'', but this dictionary requires a model item of type ''LibraryWebSite.Models.VMBorrowing''.', N'Global.asax', N'   at System.Web.Mvc.ViewDataDictionary`1.SetModel(Object value)
   at System.Web.Mvc.ViewDataDictionary..ctor(ViewDataDictionary dictionary)
   at System.Web.Mvc.WebViewPage`1.SetViewData(ViewDataDictionary viewData)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T09:32:20.5600000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (53, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult CheckOut(Int32)'' in ''LibraryWebSite.Controllers.BookController''. An optional parameter must be a reference ', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T09:40:47.3800000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (54, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult CheckOut(Int32)'' in ''LibraryWebSite.Controllers.BookController''. An optional parameter must be a reference ', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T09:42:55.9130000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (55, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult CheckOut(Int32)'' in ''LibraryWebSite.Controllers.BookController''. An optional parameter must be a reference ', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T09:53:48.7700000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (56, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult CheckOut(Int32)'' in ''LibraryWebSite.Controllers.BookController''. An optional parameter must be a reference ', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T09:56:19.8330000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (57, N'Procedure or function ''TypeDRatedBorrowingCreate'' expects parameter ''@borrowerid'', which was not supplied.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingCreate(Int32 authorID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 329', CAST(N'2019-12-18T10:01:55.0500000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (58, N'Procedure or function ''TypeDRatedBorrowingCreate'' expects parameter ''@borrowerid'', which was not supplied.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingCreate(Int32 authorID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 329
   at LibraryBusinessLogicLayer.Context.RatedBorrowingCreate(Int32 BookId, Int32 BorrowerID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 582
   at LibraryBusinessLogicLayer.Context.RatedBorrowingCreate(TypeDRatedBorrowing borrowing) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 587
   at LibraryWebSite.Controllers.BookController.CheckOut(VMBorrowing borrowing) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 247', CAST(N'2019-12-18T10:01:55.1100000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (59, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult CheckOut(Int32)'' in ''LibraryWebSite.Controllers.BookController''. An optional parameter must be a reference ', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T10:09:07.4130000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (60, N'Procedure or function ''TypeDRatedBorrowingCreate'' expects parameter ''@borrowerid'', which was not supplied.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingCreate(Int32 authorID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 329', CAST(N'2019-12-18T10:09:15.6070000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (61, N'Procedure or function ''TypeDRatedBorrowingCreate'' expects parameter ''@borrowerid'', which was not supplied.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingCreate(Int32 authorID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 329
   at LibraryBusinessLogicLayer.Context.RatedBorrowingCreate(Int32 BookId, Int32 BorrowerID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 582
   at LibraryBusinessLogicLayer.Context.RatedBorrowingCreate(TypeDRatedBorrowing borrowing) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 587
   at LibraryWebSite.Controllers.BookController.CheckOut(VMBorrowing borrowing) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 247', CAST(N'2019-12-18T10:09:15.6330000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (62, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult CheckOut(Int32)'' in ''LibraryWebSite.Controllers.BookController''. An optional parameter must be a reference ', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T10:10:52.0100000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (63, N'Procedure or function ''TypeDRatedBorrowingCreate'' expects parameter ''@bookid'', which was not supplied.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingCreate(Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 329', CAST(N'2019-12-18T10:16:22.5970000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (64, N'Procedure or function ''TypeDRatedBorrowingCreate'' expects parameter ''@bookid'', which was not supplied.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingCreate(Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 329
   at LibraryBusinessLogicLayer.Context.RatedBorrowingCreate(Int32 BookId, Int32 BorrowerID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 582
   at LibraryBusinessLogicLayer.Context.RatedBorrowingCreate(TypeDRatedBorrowing borrowing) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 587
   at LibraryWebSite.Controllers.BookController.CheckOut(VMBorrowing borrowing) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 247', CAST(N'2019-12-18T10:16:22.6470000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (65, N'Procedure or function ''TypeDRatedBorrowingCreate'' expects parameter ''@bookid'', which was not supplied.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingCreate(Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 329', CAST(N'2019-12-18T10:17:40.4730000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (66, N'Procedure or function ''TypeDRatedBorrowingCreate'' expects parameter ''@bookid'', which was not supplied.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingCreate(Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 329
   at LibraryBusinessLogicLayer.Context.RatedBorrowingCreate(Int32 BookId, Int32 BorrowerID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 582
   at LibraryBusinessLogicLayer.Context.RatedBorrowingCreate(TypeDRatedBorrowing borrowing) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 587
   at LibraryWebSite.Controllers.BookController.CheckOut(VMBorrowing borrowing) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 247', CAST(N'2019-12-18T10:17:40.5330000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (67, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_TypeDRatedBorrowers_books". The conflict occurred in database "Library", table "dbo.books", column ''bookid''.
The statement has been terminated.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingCreate(Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 330', CAST(N'2019-12-18T10:21:51.3700000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (68, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_TypeDRatedBorrowers_books". The conflict occurred in database "Library", table "dbo.books", column ''bookid''.
The statement has been terminated.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingCreate(Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 330
   at LibraryBusinessLogicLayer.Context.RatedBorrowingCreate(Int32 BookId, Int32 BorrowerID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 582
   at LibraryBusinessLogicLayer.Context.RatedBorrowingCreate(TypeDRatedBorrowing borrowing) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 587
   at LibraryWebSite.Controllers.BookController.CheckOut(VMBorrowing borrowing) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 247', CAST(N'2019-12-18T10:21:51.4670000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (69, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_TypeDRatedBorrowers_books". The conflict occurred in database "Library", table "dbo.books", column ''bookid''.
The statement has been terminated.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingCreate(Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 330', CAST(N'2019-12-18T10:23:38.7070000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (70, N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK_TypeDRatedBorrowers_books". The conflict occurred in database "Library", table "dbo.books", column ''bookid''.
The statement has been terminated.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingCreate(Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 330
   at LibraryBusinessLogicLayer.Context.RatedBorrowingCreate(Int32 BookId, Int32 BorrowerID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 582
   at LibraryBusinessLogicLayer.Context.RatedBorrowingCreate(TypeDRatedBorrowing borrowing) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 587
   at LibraryWebSite.Controllers.BookController.CheckOut(VMBorrowing borrowing) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 247', CAST(N'2019-12-18T10:23:38.7130000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (71, N'The controller for path ''/Books/viewbooksby/101'' was not found or does not implement IController.', N'Global.asax', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T11:09:15.1700000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (72, N'The parameters dictionary contains a null entry for parameter ''borrowerID'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult ViewBooksBy(Int32)'' in ''LibraryWebSite.Controllers.BookController''. An optional parameter must be a', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T11:09:24.5530000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (73, N'A public action method ''viewbookby'' was not found on controller ''LibraryWebSite.Controllers.BookController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T11:11:42.2070000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (74, N'''ISBN'' is not offset 1 as expected, ''bookname'' is at that offset instead', N'DAL', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.BookMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBooksRelatedToBorrowerID(Int32 borrowerID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 535', CAST(N'2019-12-18T11:12:05.5130000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (75, N'''ISBN'' is not offset 1 as expected, ''bookname'' is at that offset instead', N'MVC', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.BookMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBooksRelatedToBorrowerID(Int32 borrowerID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 535
   at LibraryBusinessLogicLayer.Context.RatedBorrowingGetBooksRelatedToBorrower(Int32 BorrowerID, Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 629
   at LibraryWebSite.Controllers.BookController.ViewBooksBy(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 309', CAST(N'2019-12-18T11:12:05.5730000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (76, N'cant find borrower with id of 101', N'DAL', N'   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBooksRelatedToBorrowerID(Int32 borrowerID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 558', CAST(N'2019-12-18T11:14:28.0500000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (77, N'cant find borrower with id of 101', N'MVC', N'   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBooksRelatedToBorrowerID(Int32 borrowerID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 558
   at LibraryBusinessLogicLayer.Context.RatedBorrowingGetBooksRelatedToBorrower(Int32 BorrowerID, Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 629
   at LibraryWebSite.Controllers.BookController.ViewBooksBy(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 309', CAST(N'2019-12-18T11:14:28.0530000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (78, N'Borrower Not Found: ''''', N'MVC', N'   at LibraryWebSite.Controllers.BookController.ViewBooksBy(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 286', CAST(N'2019-12-18T11:21:31.3230000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (79, N'A public action method ''BookBorrowings'' was not found on controller ''LibraryWebSite.Controllers.BookController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T11:46:31.9070000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (80, N'Could not find stored procedure ''TypeCBorrowersGetRelatedToBookID''.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 617', CAST(N'2019-12-18T11:52:21.4370000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (81, N'Could not find stored procedure ''TypeCBorrowersGetRelatedToBookID''.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 617
   at LibraryBusinessLogicLayer.Context.RatedBorrowingGetBorrowersRelatedToBook(Int32 BookID, Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 642
   at LibraryWebSite.Controllers.BookController.ViewBorrowingsFor(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 339', CAST(N'2019-12-18T11:52:21.4730000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (82, N'''BorrowerEMail'' is not offset 2 as expected, ''borrowerDOB'' is at that offset instead', N'DAL', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.BorrowerMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BorrowerDAL.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 627', CAST(N'2019-12-18T11:54:35.6330000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (83, N'''BorrowerEMail'' is not offset 2 as expected, ''borrowerDOB'' is at that offset instead', N'MVC', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.BorrowerMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BorrowerDAL.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 627
   at LibraryBusinessLogicLayer.Context.RatedBorrowingGetBorrowersRelatedToBook(Int32 BookID, Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 642
   at LibraryWebSite.Controllers.BookController.ViewBorrowingsFor(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 339', CAST(N'2019-12-18T11:54:35.6600000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (84, N'Data is Null. This method or property cannot be called on Null values.', N'DAL', N'   at System.Data.SqlClient.SqlBuffer.get_Decimal()
   at System.Data.SqlClient.SqlDataReader.GetDecimal(Int32 i)
   at LibraryDataAccess.BookMapper.ToBook(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 39
   at LibraryDataAccess.BookDAL.BooksGetAll(Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 204', CAST(N'2019-12-18T13:40:13.2600000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (85, N'Data is Null. This method or property cannot be called on Null values.', N'MVC', N'   at System.Data.SqlClient.SqlBuffer.get_Decimal()
   at System.Data.SqlClient.SqlDataReader.GetDecimal(Int32 i)
   at LibraryDataAccess.BookMapper.ToBook(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 39
   at LibraryDataAccess.BookDAL.BooksGetAll(Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 204
   at LibraryBusinessLogicLayer.Context.BookGetAll(Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 170
   at LibraryWebSite.Controllers.BookController.Index() in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 22', CAST(N'2019-12-18T13:40:13.3230000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (86, N'A public action method ''Borrow'' was not found on controller ''LibraryWebSite.Controllers.BookController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T13:56:44.5800000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (87, N'A public action method ''History'' was not found on controller ''LibraryWebSite.Controllers.BookController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T13:58:49.5070000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (88, N'A public action method ''Borrow'' was not found on controller ''LibraryWebSite.Controllers.BookController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T14:14:13.8170000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (89, N'The parameters dictionary contains a null entry for parameter ''id'' of non-nullable type ''System.Int32'' for method ''System.Web.Mvc.ActionResult Borrow(Int32)'' in ''LibraryWebSite.Controllers.BookController''. An optional parameter must be a reference ty', N'Global.asax', N'   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c.<BeginInvokeSynchronousActionMethod>b__9_0(IAsyncResult asyncResult, ActionInvocation innerInvokeState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`2.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_0.<InvokeActionMethodFilterAsynchronouslyRecursive>b__0()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.AsyncInvocationWithFilters.<>c__DisplayClass11_2.<InvokeActionMethodFilterAsynchronouslyRecursive>b__2()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass7_0.<BeginInvokeActionMethodWithFilters>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T14:15:14.5970000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (90, N'''BorrowingID'' is not offset 0 as expected, ''ratedborrowingid'' is at that offset instead', N'DAL', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.TypeDRatedBorrowingMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 624', CAST(N'2019-12-18T14:18:26.9170000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (91, N'''BorrowingID'' is not offset 0 as expected, ''ratedborrowingid'' is at that offset instead', N'MVC', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.TypeDRatedBorrowingMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 624
   at LibraryBusinessLogicLayer.Context.RatedBorrowingGetBorrowersRelatedToBook(Int32 BookID, Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 646
   at LibraryWebSite.Controllers.BookController.History(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 339', CAST(N'2019-12-18T14:18:26.9500000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (92, N'''BorrowingID'' is not offset 0 as expected, ''ratedborrowingid'' is at that offset instead', N'DAL', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.TypeDRatedBorrowingMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 624', CAST(N'2019-12-18T14:18:35.1970000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (93, N'''BorrowingID'' is not offset 0 as expected, ''ratedborrowingid'' is at that offset instead', N'MVC', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.TypeDRatedBorrowingMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 624
   at LibraryBusinessLogicLayer.Context.RatedBorrowingGetBorrowersRelatedToBook(Int32 BookID, Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 646
   at LibraryWebSite.Controllers.BookController.History(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 339', CAST(N'2019-12-18T14:18:35.1970000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (94, N'''BorrowingID'' is not offset 0 as expected, ''ratedborrowingid'' is at that offset instead', N'DAL', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.TypeDRatedBorrowingMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 624', CAST(N'2019-12-18T14:18:38.3100000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (95, N'''BorrowingID'' is not offset 0 as expected, ''ratedborrowingid'' is at that offset instead', N'MVC', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.TypeDRatedBorrowingMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 624
   at LibraryBusinessLogicLayer.Context.RatedBorrowingGetBorrowersRelatedToBook(Int32 BookID, Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 646
   at LibraryWebSite.Controllers.BookController.History(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 339', CAST(N'2019-12-18T14:18:38.3330000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (96, N'''BorrowingID'' is not offset 0 as expected, ''ratedborrowingid'' is at that offset instead', N'DAL', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.TypeDRatedBorrowingMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 624', CAST(N'2019-12-18T14:18:43.3070000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (97, N'''BorrowingID'' is not offset 0 as expected, ''ratedborrowingid'' is at that offset instead', N'MVC', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.TypeDRatedBorrowingMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 624
   at LibraryBusinessLogicLayer.Context.RatedBorrowingGetBorrowersRelatedToBook(Int32 BookID, Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 646
   at LibraryWebSite.Controllers.BookController.History(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 339', CAST(N'2019-12-18T14:18:43.3570000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (98, N'''BorrowingID'' is not offset 0 as expected, ''ratedborrowingid'' is at that offset instead', N'DAL', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.TypeDRatedBorrowingMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 624', CAST(N'2019-12-18T14:19:31.9130000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (99, N'''BorrowingID'' is not offset 0 as expected, ''ratedborrowingid'' is at that offset instead', N'MVC', N'   at LibraryDataAccess.MapperBase..ctor(IDataReader reader, String[] columns) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\DALBase.cs:line 57
   at LibraryDataAccess.TypeDRatedBorrowingMapper..ctor(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 19
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 624
   at LibraryBusinessLogicLayer.Context.RatedBorrowingGetBorrowersRelatedToBook(Int32 BookID, Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 646
   at LibraryWebSite.Controllers.BookController.History(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 339', CAST(N'2019-12-18T14:19:31.9530000' AS DateTime2))
GO
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (100, N'The view ''bookborrowings'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Book/bookborrowings.aspx
~/Views/Book/bookborrowings.ascx
~/Views/Shared/bookborrowings.aspx
~', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T14:42:01.6930000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (101, N'The DELETE statement conflicted with the REFERENCE constraint "FK_TypeDRatedBorrowers_books". The conflict occurred in database "Library", table "dbo.TypeDRatedBorrowings", column ''bookid''.
The statement has been terminated.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LibraryDataAccess.BookDAL.BookDelete(Int32 BookID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 379', CAST(N'2019-12-18T15:09:09.9670000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (102, N'The DELETE statement conflicted with the REFERENCE constraint "FK_TypeDRatedBorrowers_books". The conflict occurred in database "Library", table "dbo.TypeDRatedBorrowings", column ''bookid''.
The statement has been terminated.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at LibraryDataAccess.BookDAL.BookDelete(Int32 BookID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 379
   at LibraryBusinessLogicLayer.Context.BookDelete(Int32 BookID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 213
   at LibraryWebSite.Controllers.BookController.Delete(Int32 id, VMBook data) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 177', CAST(N'2019-12-18T15:09:10.0100000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (103, N'Could not find stored procedure ''TypeDRatedBorrowingFindByID''.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingFindByID(Int32 BorrowingID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 202', CAST(N'2019-12-18T15:23:57.8500000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (104, N'Could not find stored procedure ''TypeDRatedBorrowingFindByID''.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingFindByID(Int32 BorrowingID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 202
   at LibraryBusinessLogicLayer.Context.RatedBorrowingFindByID(Int32 BorrowingID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 597
   at LibraryWebSite.Controllers.BookController.DeleteHistory(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 280', CAST(N'2019-12-18T15:23:57.8970000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (105, N'Could not find stored procedure ''TypeDRatedBorrowingFindByID''.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingFindByID(Int32 BorrowingID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 202', CAST(N'2019-12-18T15:24:26.6130000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (106, N'Could not find stored procedure ''TypeDRatedBorrowingFindByID''.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingFindByID(Int32 BorrowingID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 202
   at LibraryBusinessLogicLayer.Context.RatedBorrowingFindByID(Int32 BorrowingID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 597
   at LibraryWebSite.Controllers.BookController.DeleteHistory(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 280', CAST(N'2019-12-18T15:24:26.6130000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (107, N'Procedure or function ''TypeDRatedBorrowingDelete'' expects parameter ''@ratedborrowingid'', which was not supplied.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingDelete(Int32 BorrowingID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 450', CAST(N'2019-12-18T15:27:15.2100000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (108, N'Procedure or function ''TypeDRatedBorrowingDelete'' expects parameter ''@ratedborrowingid'', which was not supplied.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingDelete(Int32 BorrowingID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 450
   at LibraryBusinessLogicLayer.Context.RatedBorrowingDelete(Int32 borrowingID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 616
   at LibraryWebSite.Controllers.BookController.DeleteHistory(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 285', CAST(N'2019-12-18T15:27:15.2130000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (109, N'Invalid object name ''TypeDWritings''.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingDelete(Int32 BorrowingID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 450', CAST(N'2019-12-18T15:29:30.5700000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (110, N'Invalid object name ''TypeDWritings''.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingDelete(Int32 BorrowingID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 450
   at LibraryBusinessLogicLayer.Context.RatedBorrowingDelete(Int32 borrowingID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 616
   at LibraryWebSite.Controllers.BookController.DeleteHistory(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 285', CAST(N'2019-12-18T15:29:30.5900000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (111, N'A public action method ''books'' was not found on controller ''LibraryWebSite.Controllers.HomeController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T15:50:51.8230000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (112, N'A public action method ''book'' was not found on controller ''LibraryWebSite.Controllers.HomeController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T15:50:58.3300000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (113, N'A public action method ''BookBorrowing'' was not found on controller ''LibraryWebSite.Controllers.BookController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T15:52:22.8230000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (114, N'The model item passed into the dictionary is of type ''LibraryCommon.TypeDRatedBorrowing'', but this dictionary requires a model item of type ''LibraryWebSite.Models.VMBorrowing''.', N'Global.asax', N'   at System.Web.Mvc.ViewDataDictionary`1.SetModel(Object value)
   at System.Web.Mvc.ViewDataDictionary..ctor(ViewDataDictionary dictionary)
   at System.Web.Mvc.WebViewPage`1.SetViewData(ViewDataDictionary viewData)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T15:56:07.9370000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (115, N'Procedure or function TypeDRatedBorrowingUpdateJust has too many arguments specified.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingUpdateJust(Int32 BorrowingID, Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 558', CAST(N'2019-12-18T15:57:59.7230000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (116, N'Procedure or function TypeDRatedBorrowingUpdateJust has too many arguments specified.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingUpdateJust(Int32 BorrowingID, Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 558
   at LibraryBusinessLogicLayer.Context.RatedBorrowingUpdateJust(Int32 BorrowingID, Int32 BookId, Int32 BorrowerID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 627
   at LibraryBusinessLogicLayer.Context.RatedBorrowingUpdateJust(TypeDRatedBorrowing item) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 621
   at LibraryWebSite.Controllers.BookController.ForceReturn(TypeDRatedBorrowing item) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 324', CAST(N'2019-12-18T15:57:59.7570000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (117, N'Procedure or function TypeDRatedBorrowingUpdateJust has too many arguments specified.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingUpdateJust(Int32 BorrowingID, Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 558', CAST(N'2019-12-18T16:33:59.7100000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (118, N'Procedure or function TypeDRatedBorrowingUpdateJust has too many arguments specified.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingUpdateJust(Int32 BorrowingID, Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 558
   at LibraryBusinessLogicLayer.Context.RatedBorrowingUpdateJust(Int32 BorrowingID, Int32 BookId, Int32 BorrowerID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 627
   at LibraryBusinessLogicLayer.Context.RatedBorrowingUpdateJust(TypeDRatedBorrowing item) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 621
   at LibraryWebSite.Controllers.BookController.ForceReturn(TypeDRatedBorrowing item) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 324', CAST(N'2019-12-18T16:33:59.7300000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (119, N'Procedure or function ''TypeDRatedBorrowingUpdateJust'' expects parameter ''@ratedborrowingid'', which was not supplied.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingUpdateJust(Int32 BorrowingID, Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 563', CAST(N'2019-12-18T16:39:24.8070000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (120, N'Procedure or function ''TypeDRatedBorrowingUpdateJust'' expects parameter ''@ratedborrowingid'', which was not supplied.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingUpdateJust(Int32 BorrowingID, Int32 BorrowerID, Int32 bookID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 563
   at LibraryBusinessLogicLayer.Context.RatedBorrowingUpdateJust(Int32 BorrowingID, Int32 BookId, Int32 BorrowerID, Nullable`1 DueDate, Nullable`1 ReturnedDate, Nullable`1 Rating) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 627
   at LibraryBusinessLogicLayer.Context.RatedBorrowingUpdateJust(TypeDRatedBorrowing item) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 621
   at LibraryWebSite.Controllers.BookController.ForceReturn(TypeDRatedBorrowing item) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 324', CAST(N'2019-12-18T16:39:24.8700000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (121, N'Specified cast is not valid.', N'DAL', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at LibraryDataAccess.TypeDRatedBorrowingMapper.ToBorrowing(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 58
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 718', CAST(N'2019-12-18T16:41:15.1330000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (122, N'Specified cast is not valid.', N'MVC', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at LibraryDataAccess.TypeDRatedBorrowingMapper.ToBorrowing(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 58
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 718
   at LibraryBusinessLogicLayer.Context.RatedBorrowingGetBorrowersRelatedToBook(Int32 BookID, Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 651
   at LibraryWebSite.Controllers.BookController.History(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 404', CAST(N'2019-12-18T16:41:15.2500000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (123, N'Specified cast is not valid.', N'DAL', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at LibraryDataAccess.TypeDRatedBorrowingMapper.ToBorrowing(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 58
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 718', CAST(N'2019-12-18T16:41:23.5330000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (124, N'Specified cast is not valid.', N'MVC', N'   at System.Data.SqlClient.SqlBuffer.get_Int32()
   at System.Data.SqlClient.SqlDataReader.GetInt32(Int32 i)
   at LibraryDataAccess.TypeDRatedBorrowingMapper.ToBorrowing(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 58
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingGetBorrowersRelatedToBookID(Int32 bookID, Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 718
   at LibraryBusinessLogicLayer.Context.RatedBorrowingGetBorrowersRelatedToBook(Int32 BookID, Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 651
   at LibraryWebSite.Controllers.BookController.History(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 404', CAST(N'2019-12-18T16:41:23.5600000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (125, N'The view ''CheckedOut'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Book/CheckedOut.aspx
~/Views/Book/CheckedOut.ascx
~/Views/Shared/CheckedOut.aspx
~/Views/Shared/Ch', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-18T16:55:23.3070000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (126, N'Multiple reccords found with id: {BookID}', N'DAL', N'   at LibraryDataAccess.BookDAL.BookFindByID(Int32 BookID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 185', CAST(N'2019-12-19T09:56:22.0030000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (127, N'Multiple reccords found with id: {BookID}', N'MVC', N'   at LibraryDataAccess.BookDAL.BookFindByID(Int32 BookID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 185
   at LibraryBusinessLogicLayer.Context.BookFindByID(Int32 BookID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 165
   at LibraryWebSite.Controllers.BookController.Borrow(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 209', CAST(N'2019-12-19T09:56:22.1800000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (128, N'Multiple reccords found with id: {BookID}', N'DAL', N'   at LibraryDataAccess.BookDAL.BookFindByID(Int32 BookID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 185', CAST(N'2019-12-19T10:01:31.8700000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (129, N'Multiple reccords found with id: {BookID}', N'MVC', N'   at LibraryDataAccess.BookDAL.BookFindByID(Int32 BookID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 185
   at LibraryBusinessLogicLayer.Context.BookFindByID(Int32 BookID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 165
   at LibraryWebSite.Controllers.BookController.Edit(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 106', CAST(N'2019-12-19T10:01:31.8730000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (130, N'Multiple reccords found with id: {BookID}', N'DAL', N'   at LibraryDataAccess.BookDAL.BookFindByID(Int32 BookID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 185', CAST(N'2019-12-19T10:01:35.6800000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (131, N'Multiple reccords found with id: {BookID}', N'MVC', N'   at LibraryDataAccess.BookDAL.BookFindByID(Int32 BookID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BookDAL.cs:line 185
   at LibraryBusinessLogicLayer.Context.BookFindByID(Int32 BookID) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 165
   at LibraryWebSite.Controllers.BookController.Details(Int32 id) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 40', CAST(N'2019-12-19T10:01:35.6830000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (132, N'The view ''Edit'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Book/Edit.aspx
~/Views/Book/Edit.ascx
~/Views/Shared/Edit.aspx
~/Views/Shared/Edit.ascx
~/Views/Book/Ed', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T10:03:11.5930000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (133, N'The view ''Edit'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Book/Edit.aspx
~/Views/Book/Edit.ascx
~/Views/Shared/Edit.aspx
~/Views/Shared/Edit.ascx
~/Views/Book/Ed', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T10:03:20.3670000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (134, N'A public action method ''BookBorrowing'' was not found on controller ''LibraryWebSite.Controllers.BookController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T10:12:43.3870000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (135, N'The controller for path ''/Books/MyBorrowedBooks'' was not found or does not implement IController.', N'Global.asax', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T12:31:00.2970000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (136, N'The controller for path ''/Books/MyBorrowedBooks'' was not found or does not implement IController.', N'Global.asax', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T12:31:03.6500000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (137, N'The controller for path ''/Books/MyBorrowedBooks'' was not found or does not implement IController.', N'Global.asax', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:01:35.4970000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (138, N'The controller for path ''/Shared/Exception'' was not found or does not implement IController.', N'Global.asax', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:14:23.7670000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (139, N'The view ''MyBorrowedBooks'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Book/MyBorrowedBooks.aspx
~/Views/Book/MyBorrowedBooks.ascx
~/Views/Shared/MyBorrowedBooks.asp', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:15:11.8570000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (140, N'The view ''MyBorrowedBooks'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Book/MyBorrowedBooks.aspx
~/Views/Book/MyBorrowedBooks.ascx
~/Views/Shared/MyBorrowedBooks.asp', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:15:18.5400000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (141, N'The view ''MyBorrowedBooks'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Book/MyBorrowedBooks.aspx
~/Views/Book/MyBorrowedBooks.ascx
~/Views/Shared/MyBorrowedBooks.asp', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:15:24.9530000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (142, N'The view ''MyBorrowedBooks'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Book/MyBorrowedBooks.aspx
~/Views/Book/MyBorrowedBooks.ascx
~/Views/Shared/MyBorrowedBooks.asp', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:15:28.5700000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (143, N'The view ''MyBorrowedBooks'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Book/MyBorrowedBooks.aspx
~/Views/Book/MyBorrowedBooks.ascx
~/Views/Shared/MyBorrowedBooks.asp', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:15:31.9930000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (144, N'A public action method ''AllBorrowedBooks'' was not found on controller ''LibraryWebSite.Controllers.BookController''.', N'Global.asax', N'   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:16:30.9600000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (145, N'The view ''MyBorrowedBooks'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Book/MyBorrowedBooks.aspx
~/Views/Book/MyBorrowedBooks.ascx
~/Views/Shared/MyBorrowedBooks.asp', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:16:34.9830000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (146, N'The view ''MyBorrowedBooks'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Book/MyBorrowedBooks.aspx
~/Views/Book/MyBorrowedBooks.ascx
~/Views/Shared/MyBorrowedBooks.asp', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:34:27.6570000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (147, N'Could not find stored procedure ''TypeDRatedBorrowingsGetAll''.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingsGetAll(Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 259', CAST(N'2019-12-19T13:34:31.0030000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (148, N'Could not find stored procedure ''TypeDRatedBorrowingsGetAll''.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingsGetAll(Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 259
   at LibraryBusinessLogicLayer.Context.RatedBorrowingsGetAllCheckedOut(Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 609
   at LibraryWebSite.Controllers.BookController.AllBorrowedBooks() in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 468', CAST(N'2019-12-19T13:34:31.0600000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (149, N'Could not find stored procedure ''TypeDRatedBorrowingsGetAll''.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingsGetAll(Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 259', CAST(N'2019-12-19T13:35:42.8730000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (150, N'Could not find stored procedure ''TypeDRatedBorrowingsGetAll''.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader()
   at LibraryDataAccess.TypeDRatedBorrowingDAL.TypeDRatedBorrowingsGetAll(Int32 Skip, Int32 Take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\TypeDRatedBorrowing.cs:line 259
   at LibraryBusinessLogicLayer.Context.RatedBorrowingsGetAllCheckedOut(Int32 skip, Int32 take) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 609
   at LibraryWebSite.Controllers.BookController.AllBorrowedBooks() in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\BookController.cs:line 468', CAST(N'2019-12-19T13:35:42.8830000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (151, N'The controller for path ''/Shared/Exception'' was not found or does not implement IController.', N'Global.asax', N'   at System.Web.Mvc.DefaultControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType)
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:37:42.3270000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (152, N'The view ''AllBorrowedBooks'' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Book/AllBorrowedBooks.aspx
~/Views/Book/AllBorrowedBooks.ascx
~/Views/Shared/AllBorrowedBooks', N'Global.asax', N'   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:37:51.0570000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (153, N'The model item passed into the dictionary is of type ''System.Collections.Generic.List`1[LibraryCommon.TypeDRatedBorrowing]'', but this dictionary requires a model item of type ''System.Collections.Generic.IEnumerable`1[LibraryWebSite.Models.VMBorrowing', N'Global.asax', N'   at System.Web.Mvc.ViewDataDictionary`1.SetModel(Object value)
   at System.Web.Mvc.ViewDataDictionary..ctor(ViewDataDictionary dictionary)
   at System.Web.Mvc.WebViewPage`1.SetViewData(ViewDataDictionary viewData)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilterRecursive(IList`1 filters, Int32 filterIndex, ResultExecutingContext preContext, ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_6.<BeginInvokeAction>b__4()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass3_1.<BeginInvokeAction>b__1(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecuteCore>b__152_1(IAsyncResult asyncResult, ExecuteCoreState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c.<BeginExecute>b__151_2(IAsyncResult asyncResult, Controller controller)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c.<BeginProcessRequest>b__20_1(IAsyncResult asyncResult, ProcessRequestState innerState)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncVoid`1.CallEndDelegate(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResultBase`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', CAST(N'2019-12-19T13:40:14.3800000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (154, N'Data is Null. This method or property cannot be called on Null values.', N'DAL', N'   at System.Data.SqlClient.SqlBuffer.get_String()
   at System.Data.SqlClient.SqlDataReader.GetString(Int32 i)
   at LibraryDataAccess.BorrowerSecuredMapper.ToBorrowerSecured(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BorrowerDAL.cs:line 759
   at LibraryDataAccess.BorrowerSecuredDAL.BorrowerSecuredFindByName(String Name) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BorrowerDAL.cs:line 878', CAST(N'2019-12-19T13:43:21.1670000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (155, N'Data is Null. This method or property cannot be called on Null values.', N'MVC', N'   at System.Data.SqlClient.SqlBuffer.get_String()
   at System.Data.SqlClient.SqlDataReader.GetString(Int32 i)
   at LibraryDataAccess.BorrowerSecuredMapper.ToBorrowerSecured(IDataReader reader) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BorrowerDAL.cs:line 759
   at LibraryDataAccess.BorrowerSecuredDAL.BorrowerSecuredFindByName(String Name) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\BorrowerDAL.cs:line 878
   at LibraryBusinessLogicLayer.Context.ValidateUserClearText(String UserName, String Password) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 491
   at LibraryWebSite.Controllers.HomeController.Login(LoginViewModel vm) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\HomeController.cs:line 113', CAST(N'2019-12-19T13:43:21.1800000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (156, N'Procedure or function ''roleUpdateJust'' expects parameter ''@CreateOperation'', which was not supplied.', N'DAL', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.RoleDAL.RoleUpdateJust(Int32 RoleID, String RoleName, String createOperation, String updateOperation, String deleteOperation, String listOperation, String viewOperation) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\RoleDAL.cs:line 450', CAST(N'2019-12-19T14:05:12.0100000' AS DateTime2))
INSERT [dbo].[LogTrace] ([LogID], [Message], [Layer], [Trace], [Time]) VALUES (157, N'Procedure or function ''roleUpdateJust'' expects parameter ''@CreateOperation'', which was not supplied.', N'MVC', N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString, Boolean isInternal, Boolean forDescribeParameterEncryption, Boolean shouldCacheForAlwaysEncrypted)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, Boolean inRetry, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean& usedCache, Boolean asyncWrite, Boolean inRetry)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteScalar()
   at LibraryDataAccess.RoleDAL.RoleUpdateJust(Int32 RoleID, String RoleName, String createOperation, String updateOperation, String deleteOperation, String listOperation, String viewOperation) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryDataAccess\RoleDAL.cs:line 450
   at LibraryBusinessLogicLayer.Context.RoleUpdateJust(Int32 RoleID, String Name, String CreateOperation, String UpdateOperation, String DeleteOperation, String ListOperation, String ViewOperation) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 410
   at LibraryBusinessLogicLayer.Context.RoleUpdateJust(Int32 id, Role r) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryBusinessLogicLayer\Context.cs:line 397
   at LibraryWebSite.Controllers.RoleController.Edit(Int32 id, VMRole data) in C:\Users\bwalters\source\repos\Library\LibraryDataAccess\LibraryWebSite\Controllers\RoleController.cs:line 114', CAST(N'2019-12-19T14:05:12.0330000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[LogTrace] OFF
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([roleid], [RoleName], [CreateOperation], [UpdateOperation], [DeleteOperation], [ListOperation], [ViewOperation]) VALUES (1, N'Administrator', N'Authors, Books, Borrowers, Genres, Roles, AllUserBorrowing, ThisUserBorrowing', N'Authors, Books, Borrowers, Genres, Roles,  AllUserBorrowing, ThisUserBorrowing', N'Authors, Books, Borrowers, Genres, Roles, AllUserBorrowing', N'Authors, Books, Borrowers, Genres, Roles, ThisUserBorrowing, AllUserBorrowing', N'Authors, Books, Borrowers, Genres, Roles, AllUserBorrowings, ThisUserBorrowings, Exception, Reporting')
INSERT [dbo].[roles] ([roleid], [RoleName], [CreateOperation], [UpdateOperation], [DeleteOperation], [ListOperation], [ViewOperation]) VALUES (2, N'Librarian', N'Authors,Books,Genres, AnyUserBorrowing, ThisUserBorrowing', N'Authors,Books,Genres, AnyUserBorrowing, ThisUserBorrowing', N'Authors,Books,Genres', N'Authors,Books,Borrowers,Genres', N'Authors,Books,Borrowers,Genres, AllUserBorrowings, ThisUserBorrowings')
INSERT [dbo].[roles] ([roleid], [RoleName], [CreateOperation], [UpdateOperation], [DeleteOperation], [ListOperation], [ViewOperation]) VALUES (3, N'Borrower', N'ThisUserBorrowing', N'ThisUserBorrowing', N'None', N'Authors,Books,Genres', N'Authors,Books,Genres, ThisUserBorrowings')
INSERT [dbo].[roles] ([roleid], [RoleName], [CreateOperation], [UpdateOperation], [DeleteOperation], [ListOperation], [ViewOperation]) VALUES (4, N'Viewer', N'', N'', N'', N'books', N'books,genres,authors,AllUserBorrowings')
INSERT [dbo].[roles] ([roleid], [RoleName], [CreateOperation], [UpdateOperation], [DeleteOperation], [ListOperation], [ViewOperation]) VALUES (5, N'Unverified', N'', N'', N'', N'Books,Genres', N'Books,Genres')
SET IDENTITY_INSERT [dbo].[roles] OFF
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (1, 1)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (2, 2)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (2, 3)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (3, 1)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (3, 3)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (4, 2)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (4, 4)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (5, 1)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (5, 3)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (6, 2)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (7, 1)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (7, 3)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (8, 2)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (9, 1)
INSERT [dbo].[TypeAWritings] ([bookid], [authorid]) VALUES (9, 4)
SET IDENTITY_INSERT [dbo].[TypeDRatedBorrowings] ON 

INSERT [dbo].[TypeDRatedBorrowings] ([ratedborrowingid], [bookid], [borrowerid], [DueDate], [ReturnedDate], [rating]) VALUES (1, 1, 1, CAST(N'2019-11-14T07:59:34.1770000' AS DateTime2), CAST(N'2019-11-09T07:59:34.1770000' AS DateTime2), CAST(3.70 AS Decimal(3, 2)))
INSERT [dbo].[TypeDRatedBorrowings] ([ratedborrowingid], [bookid], [borrowerid], [DueDate], [ReturnedDate], [rating]) VALUES (2, 1, 2, CAST(N'2019-11-25T07:59:34.1770000' AS DateTime2), CAST(N'2019-12-04T07:59:34.1770000' AS DateTime2), CAST(3.60 AS Decimal(3, 2)))
INSERT [dbo].[TypeDRatedBorrowings] ([ratedborrowingid], [bookid], [borrowerid], [DueDate], [ReturnedDate], [rating]) VALUES (3, 1, 1, CAST(N'2019-12-05T07:59:34.1800000' AS DateTime2), CAST(N'2019-12-09T07:59:34.1800000' AS DateTime2), CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[TypeDRatedBorrowings] ([ratedborrowingid], [bookid], [borrowerid], [DueDate], [ReturnedDate], [rating]) VALUES (4, 1, 3, CAST(N'2019-12-20T07:59:34.1800000' AS DateTime2), NULL, NULL)
INSERT [dbo].[TypeDRatedBorrowings] ([ratedborrowingid], [bookid], [borrowerid], [DueDate], [ReturnedDate], [rating]) VALUES (5, 2, 1, CAST(N'2019-11-14T07:59:34.1800000' AS DateTime2), NULL, NULL)
INSERT [dbo].[TypeDRatedBorrowings] ([ratedborrowingid], [bookid], [borrowerid], [DueDate], [ReturnedDate], [rating]) VALUES (6, 3, 2, CAST(N'2020-01-03T07:59:34.1800000' AS DateTime2), NULL, NULL)
INSERT [dbo].[TypeDRatedBorrowings] ([ratedborrowingid], [bookid], [borrowerid], [DueDate], [ReturnedDate], [rating]) VALUES (7, 4, 1, CAST(N'2019-12-04T07:59:34.1800000' AS DateTime2), CAST(N'2019-12-09T07:59:34.1800000' AS DateTime2), CAST(2.00 AS Decimal(3, 2)))
INSERT [dbo].[TypeDRatedBorrowings] ([ratedborrowingid], [bookid], [borrowerid], [DueDate], [ReturnedDate], [rating]) VALUES (8, 4, 2, CAST(N'2019-10-25T07:59:34.1800000' AS DateTime2), CAST(N'2019-11-09T07:59:34.1800000' AS DateTime2), CAST(3.70 AS Decimal(3, 2)))
INSERT [dbo].[TypeDRatedBorrowings] ([ratedborrowingid], [bookid], [borrowerid], [DueDate], [ReturnedDate], [rating]) VALUES (9, 4, 3, CAST(N'2019-10-05T07:59:34.1830000' AS DateTime2), CAST(N'2019-10-15T07:59:34.1830000' AS DateTime2), CAST(3.80 AS Decimal(3, 2)))
INSERT [dbo].[TypeDRatedBorrowings] ([ratedborrowingid], [bookid], [borrowerid], [DueDate], [ReturnedDate], [rating]) VALUES (10, 5, 1, CAST(N'2019-10-05T07:59:34.1830000' AS DateTime2), NULL, NULL)
INSERT [dbo].[TypeDRatedBorrowings] ([ratedborrowingid], [bookid], [borrowerid], [DueDate], [ReturnedDate], [rating]) VALUES (11, 6, 1, CAST(N'2019-12-18T07:59:34.1830000' AS DateTime2), NULL, NULL)
INSERT [dbo].[TypeDRatedBorrowings] ([ratedborrowingid], [bookid], [borrowerid], [DueDate], [ReturnedDate], [rating]) VALUES (12, 7, 1, CAST(N'2020-01-03T07:59:34.1830000' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[TypeDRatedBorrowings] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-BookName]    Script Date: 12/24/2019 8:00:41 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-BookName] ON [dbo].[books]
(
	[bookname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-GenreID]    Script Date: 12/24/2019 8:00:41 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-GenreID] ON [dbo].[books]
(
	[genreid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-ISBN]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[authorCreate]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[authorDelete]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[authorFindByID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[authorsGetAll]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[authorUpdateJust]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[authorUpdateSafe]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[bookCreate]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[bookDelete]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[bookFindByID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[booksGetAll]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[bookUpdateJust]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[bookUpdateSafe]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[borrowerCreate]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[borrowerDelete]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[borrowerFindByEmail]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[borrowerFindByID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[borrowerFindByName]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[borrowerSecuredFindByemail]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[borrowerSecuredFindByID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[borrowerSecuredFindByName]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[borrowerSecuredUpdateJust]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[borrowersGetAll]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[borrowerUpdateJust]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[borrowerUpdateSafe]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[genreCreate]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[genreDelete]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GenreFindByID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[genresGetAll]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[genreUpdateJust]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[genreUpdateSafe]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LogItemCreate]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LogItemFindByID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LogItemsGetAll]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[obtainAuthorsCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[obtainBooksCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[obtainBorrowersCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[obtainGenresCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[obtainRolesCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtainTypeAauthorsRelatedToBookCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtainTypeAbooksRelatedToAuthorCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtainTypeAWritingsCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtainTypeBauthorsRelatedToBookCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtainTypeBbooksRelatedToAuthorCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtainTypeBCommentedWritingsCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtainTypeCbooksRelatedToBorrowerCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtainTypeCborrowersRelatedToBookCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtainTypeCBorrowingsCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtainTypeDbooksRelatedToBorrowerCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtainTypeDborrowersRelatedToBookCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtainTypeDRatedBorrowingsCount]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[repopulate]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[resetdatabase]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[roleCreate]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[roleDelete]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RoleFindByID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[rolesGetAll]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[roleUpdateJust]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[roleUpdateSafe]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeAauthorsGetRelatedToBookID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeAbooksGetRelatedToAuthorID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeAWritingCreate]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeAWritingDelete]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeAWritingsGetAll]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeAWritingUpdateJust]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeBcommentedAuthorsGetRelatedToBookID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeBcommentedBooksGetRelatedToAuthorID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeBCommentedWritingCreate]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeBCommentedWritingUpdateJust]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeBWritingDelete]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeCbooksGetRelatedToBorrowerID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeCBorrowingCreate]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeCBorrowingDelete]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeCborrowingsGetRelatedToBookID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeCBorrowingUpdateJust]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeDbooksGetRelatedToBorrowerID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeDRatedBorrowingCreate]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeDRatedBorrowingDelete]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeDRatedborrowingFindByID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeDRatedborrowingsGetAll]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeDRatedborrowingsGetRelatedToBookID]    Script Date: 12/24/2019 8:00:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[TypeDRatedBorrowingUpdateJust]    Script Date: 12/24/2019 8:00:41 AM ******/
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
