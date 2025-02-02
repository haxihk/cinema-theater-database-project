USE [sample1]
GO
/****** Object:  UserDefinedFunction [dbo].[DecryptPassword]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DecryptPassword] (@encryptedPassword VARCHAR(MAX))
		RETURNS VARCHAR(256)
		AS
		BEGIN
			DECLARE @decryptedPassword VARCHAR(256);
    
			-- Dummy decryption logic for demonstration
			DECLARE @varbinaryPassword VARBINARY(256);
			SET @varbinaryPassword = CONVERT(VARBINARY(256), @encryptedPassword);
			SET @decryptedPassword = CONVERT(VARCHAR(256), @varbinaryPassword);

			RETURN @decryptedPassword;
		END;
GO
/****** Object:  Table [dbo].[Task52User]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task52User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](256) NULL,
	[password] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewtask52]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

        CREATE VIEW [dbo].[viewtask52] AS
        SELECT 
            ID,
            username,
            dbo.DecryptPassword(password) AS decrypted_password
        FROM 
            Task52User;
    
GO
/****** Object:  Table [dbo].[ACTOR]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTOR](
	[PersonID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AWARD]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AWARD](
	[AwardID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AwardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPANY]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPANY](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[PersonID] [int] NOT NULL,
	[MembershipStatus] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPARTMENT]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTMENT](
	[DepartmentID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[PersonID] [int] NOT NULL,
	[Salary] [decimal](10, 2) NULL,
	[Position] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FILMOGRAPHY]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FILMOGRAPHY](
	[ActorID] [int] NULL,
	[MovieID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOVIE]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIE](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[ReleaseDate] [date] NULL,
	[Duration] [int] NULL,
	[Genre] [varchar](255) NULL,
	[Location] [varchar](255) NULL,
	[Country] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAYMENT]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENT](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[TicketID] [int] NULL,
	[Amount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Gender] [varchar](10) NULL,
	[DateOfBirth] [date] NULL,
	[ContactInfo] [varchar](255) NULL,
	[Nationality] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCER]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCER](
	[PersonID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCES]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCES](
	[ProducerID] [int] NULL,
	[MovieID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVE_SEAT]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESERVE_SEAT](
	[CustomerID] [int] NOT NULL,
	[ShowID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[ShowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REWARD]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REWARD](
	[MovieID] [int] NULL,
	[AwardID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHOW]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHOW](
	[ShowID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NULL,
	[TheaterNumber] [int] NOT NULL,
	[ShowTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TASK51Logs]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TASK51Logs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[logdate] [datetime2](7) NULL,
	[content] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TASK61Logs]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TASK61Logs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[LogDate] [datetime2](7) NULL,
	[Content] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task61OrderDetails]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task61OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task61Orders]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task61Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[Date] [datetime2](7) NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TASK71_MontlySalesReport]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TASK71_MontlySalesReport](
	[ReportMonth] [datetime2](7) NULL,
	[ProductID] [int] NULL,
	[TotalAmount] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task71_StoreSales_1]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task71_StoreSales_1](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[SalesDate] [datetime2](7) NULL,
	[Amount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task71_StoreSales_2]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task71_StoreSales_2](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[SalesDate] [datetime2](7) NULL,
	[Amount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TICKET]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TICKET](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[ShowID] [int] NULL,
	[CustomerID] [int] NULL,
	[TicketType] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WORKS_FOR]    Script Date: 7/15/2024 11:47:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORKS_FOR](
	[PersonID] [int] NULL,
	[DepartmentID] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ACTOR] ([PersonID]) VALUES (7)
INSERT [dbo].[ACTOR] ([PersonID]) VALUES (8)
GO
SET IDENTITY_INSERT [dbo].[AWARD] ON 

INSERT [dbo].[AWARD] ([AwardID], [Name], [CompanyID]) VALUES (1, N'Best Picture', 1)
INSERT [dbo].[AWARD] ([AwardID], [Name], [CompanyID]) VALUES (2, N'Best Director', 2)
INSERT [dbo].[AWARD] ([AwardID], [Name], [CompanyID]) VALUES (3, N'Best Picture', 1)
INSERT [dbo].[AWARD] ([AwardID], [Name], [CompanyID]) VALUES (4, N'Best Director', 2)
SET IDENTITY_INSERT [dbo].[AWARD] OFF
GO
SET IDENTITY_INSERT [dbo].[COMPANY] ON 

INSERT [dbo].[COMPANY] ([CompanyID], [Name]) VALUES (1, N'Warner Bros.')
INSERT [dbo].[COMPANY] ([CompanyID], [Name]) VALUES (2, N'Paramount Pictures')
INSERT [dbo].[COMPANY] ([CompanyID], [Name]) VALUES (3, N'Warner Bros.')
INSERT [dbo].[COMPANY] ([CompanyID], [Name]) VALUES (4, N'Paramount Pictures')
SET IDENTITY_INSERT [dbo].[COMPANY] OFF
GO
INSERT [dbo].[CUSTOMER] ([PersonID], [MembershipStatus]) VALUES (7, N'Gold')
INSERT [dbo].[CUSTOMER] ([PersonID], [MembershipStatus]) VALUES (8, N'Silver')
GO
INSERT [dbo].[DEPARTMENT] ([DepartmentID], [Name]) VALUES (1, N'Sales')
INSERT [dbo].[DEPARTMENT] ([DepartmentID], [Name]) VALUES (2, N'HR')
GO
INSERT [dbo].[EMPLOYEE] ([PersonID], [Salary], [Position]) VALUES (7, CAST(70000.00 AS Decimal(10, 2)), N'Manager')
INSERT [dbo].[EMPLOYEE] ([PersonID], [Salary], [Position]) VALUES (8, CAST(55000.00 AS Decimal(10, 2)), N'Assistant Manager')
GO
INSERT [dbo].[FILMOGRAPHY] ([ActorID], [MovieID]) VALUES (7, 1)
INSERT [dbo].[FILMOGRAPHY] ([ActorID], [MovieID]) VALUES (8, 2)
GO
SET IDENTITY_INSERT [dbo].[MOVIE] ON 

INSERT [dbo].[MOVIE] ([MovieID], [Title], [ReleaseDate], [Duration], [Genre], [Location], [Country]) VALUES (1, N'Inception', CAST(N'2010-07-16' AS Date), 148, N'Sci-Fi', N'Los Angeles', N'USA')
INSERT [dbo].[MOVIE] ([MovieID], [Title], [ReleaseDate], [Duration], [Genre], [Location], [Country]) VALUES (2, N'Interstellar', CAST(N'2014-11-07' AS Date), 169, N'Sci-Fi', N'Iceland', N'USA')
INSERT [dbo].[MOVIE] ([MovieID], [Title], [ReleaseDate], [Duration], [Genre], [Location], [Country]) VALUES (3, N'Inception', CAST(N'2010-07-16' AS Date), 148, N'Sci-Fi', N'Los Angeles', N'USA')
INSERT [dbo].[MOVIE] ([MovieID], [Title], [ReleaseDate], [Duration], [Genre], [Location], [Country]) VALUES (4, N'Interstellar', CAST(N'2014-11-07' AS Date), 169, N'Sci-Fi', N'Iceland', N'USA')
SET IDENTITY_INSERT [dbo].[MOVIE] OFF
GO
SET IDENTITY_INSERT [dbo].[PAYMENT] ON 

INSERT [dbo].[PAYMENT] ([PaymentID], [CustomerID], [TicketID], [Amount]) VALUES (4, 7, 3, CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[PAYMENT] ([PaymentID], [CustomerID], [TicketID], [Amount]) VALUES (5, 8, 4, CAST(50.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[PAYMENT] OFF
GO
SET IDENTITY_INSERT [dbo].[PERSON] ON 

INSERT [dbo].[PERSON] ([PersonID], [Name], [Gender], [DateOfBirth], [ContactInfo], [Nationality]) VALUES (7, N'had updatedi karami', N'Male', CAST(N'2002-02-27' AS Date), N'hadikarami.tech@gmail.com', N'persian')
INSERT [dbo].[PERSON] ([PersonID], [Name], [Gender], [DateOfBirth], [ContactInfo], [Nationality]) VALUES (8, N'ami updatedrali amini', N'male', CAST(N'2003-08-22' AS Date), N'amiramini@example.com', N'persian')
SET IDENTITY_INSERT [dbo].[PERSON] OFF
GO
INSERT [dbo].[PRODUCER] ([PersonID]) VALUES (7)
INSERT [dbo].[PRODUCER] ([PersonID]) VALUES (8)
GO
INSERT [dbo].[PRODUCES] ([ProducerID], [MovieID]) VALUES (7, 1)
INSERT [dbo].[PRODUCES] ([ProducerID], [MovieID]) VALUES (8, 2)
GO
INSERT [dbo].[RESERVE_SEAT] ([CustomerID], [ShowID]) VALUES (7, 1)
INSERT [dbo].[RESERVE_SEAT] ([CustomerID], [ShowID]) VALUES (8, 2)
GO
INSERT [dbo].[REWARD] ([MovieID], [AwardID]) VALUES (1, 1)
INSERT [dbo].[REWARD] ([MovieID], [AwardID]) VALUES (2, 2)
GO
SET IDENTITY_INSERT [dbo].[SHOW] ON 

INSERT [dbo].[SHOW] ([ShowID], [MovieID], [TheaterNumber], [ShowTime]) VALUES (1, 1, 1, CAST(N'18:00:00' AS Time))
INSERT [dbo].[SHOW] ([ShowID], [MovieID], [TheaterNumber], [ShowTime]) VALUES (2, 2, 2, CAST(N'20:00:00' AS Time))
INSERT [dbo].[SHOW] ([ShowID], [MovieID], [TheaterNumber], [ShowTime]) VALUES (3, 1, 1, CAST(N'18:00:00' AS Time))
INSERT [dbo].[SHOW] ([ShowID], [MovieID], [TheaterNumber], [ShowTime]) VALUES (4, 2, 2, CAST(N'20:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[SHOW] OFF
GO
SET IDENTITY_INSERT [dbo].[TASK51Logs] ON 

INSERT [dbo].[TASK51Logs] ([id], [logdate], [content]) VALUES (1, CAST(N'2024-05-17T11:23:06.8866667' AS DateTime2), N'Rows with "updated" in Name column updated and deleted by user: username')
SET IDENTITY_INSERT [dbo].[TASK51Logs] OFF
GO
SET IDENTITY_INSERT [dbo].[Task52User] ON 

INSERT [dbo].[Task52User] ([ID], [username], [password]) VALUES (1, N'user1', N'ص¥”D*ئ…•A¼³èM=2“{…5D/iصةN')
INSERT [dbo].[Task52User] ([ID], [username], [password]) VALUES (2, N'user2', N'lِص¼ھاx5*ڈ3`ز?َNء‚âY‰ضخH]xpش')
INSERT [dbo].[Task52User] ([ID], [username], [password]) VALUES (3, N'user3', N'Y¬6~-(deحeˆëµ¬?ZéU  ¼AW|=ud')
SET IDENTITY_INSERT [dbo].[Task52User] OFF
GO
SET IDENTITY_INSERT [dbo].[TASK61Logs] ON 

INSERT [dbo].[TASK61Logs] ([LogID], [LogDate], [Content]) VALUES (1, CAST(N'2024-05-01T10:00:00.0000000' AS DateTime2), N'Log entry 1')
INSERT [dbo].[TASK61Logs] ([LogID], [LogDate], [Content]) VALUES (2, CAST(N'2024-05-02T11:00:00.0000000' AS DateTime2), N'Log entry 2')
INSERT [dbo].[TASK61Logs] ([LogID], [LogDate], [Content]) VALUES (3, CAST(N'2024-05-03T12:00:00.0000000' AS DateTime2), N'Log entry 3')
INSERT [dbo].[TASK61Logs] ([LogID], [LogDate], [Content]) VALUES (4, CAST(N'2024-05-04T13:00:00.0000000' AS DateTime2), N'Log entry 4')
INSERT [dbo].[TASK61Logs] ([LogID], [LogDate], [Content]) VALUES (5, CAST(N'2024-05-05T14:00:00.0000000' AS DateTime2), N'Log entry 5')
INSERT [dbo].[TASK61Logs] ([LogID], [LogDate], [Content]) VALUES (6, CAST(N'2024-05-23T09:47:42.8966667' AS DateTime2), N'Attempting to update Task61Orders statuses based on Task61OrderDetails quantity.')
SET IDENTITY_INSERT [dbo].[TASK61Logs] OFF
GO
SET IDENTITY_INSERT [dbo].[Task61OrderDetails] ON 

INSERT [dbo].[Task61OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 101, 50)
INSERT [dbo].[Task61OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity]) VALUES (2, 2, 102, 150)
INSERT [dbo].[Task61OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity]) VALUES (3, 3, 103, 200)
INSERT [dbo].[Task61OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity]) VALUES (4, 4, 104, 250)
INSERT [dbo].[Task61OrderDetails] ([OrderDetailId], [OrderId], [ProductId], [Quantity]) VALUES (5, 5, 105, 100)
SET IDENTITY_INSERT [dbo].[Task61OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Task61Orders] ON 

INSERT [dbo].[Task61Orders] ([OrderId], [CustomerID], [Date], [Status]) VALUES (1, 1, CAST(N'2024-05-01T00:00:00.0000000' AS DateTime2), N'High')
INSERT [dbo].[Task61Orders] ([OrderId], [CustomerID], [Date], [Status]) VALUES (2, 2, CAST(N'2024-05-02T00:00:00.0000000' AS DateTime2), N'High')
INSERT [dbo].[Task61Orders] ([OrderId], [CustomerID], [Date], [Status]) VALUES (3, 3, CAST(N'2024-05-03T00:00:00.0000000' AS DateTime2), N'High')
INSERT [dbo].[Task61Orders] ([OrderId], [CustomerID], [Date], [Status]) VALUES (4, 4, CAST(N'2024-05-04T00:00:00.0000000' AS DateTime2), N'High')
INSERT [dbo].[Task61Orders] ([OrderId], [CustomerID], [Date], [Status]) VALUES (5, 5, CAST(N'2024-05-05T00:00:00.0000000' AS DateTime2), N'Low')
SET IDENTITY_INSERT [dbo].[Task61Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Task71_StoreSales_1] ON 

INSERT [dbo].[Task71_StoreSales_1] ([ProductID], [SalesDate], [Amount]) VALUES (1, CAST(N'2023-05-01T00:00:00.0000000' AS DateTime2), CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[Task71_StoreSales_1] ([ProductID], [SalesDate], [Amount]) VALUES (2, CAST(N'2023-05-15T00:00:00.0000000' AS DateTime2), CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Task71_StoreSales_1] ([ProductID], [SalesDate], [Amount]) VALUES (3, CAST(N'2023-05-20T00:00:00.0000000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Task71_StoreSales_1] OFF
GO
SET IDENTITY_INSERT [dbo].[Task71_StoreSales_2] ON 

INSERT [dbo].[Task71_StoreSales_2] ([ProductID], [SalesDate], [Amount]) VALUES (1, CAST(N'2023-05-05T00:00:00.0000000' AS DateTime2), CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Task71_StoreSales_2] ([ProductID], [SalesDate], [Amount]) VALUES (2, CAST(N'2023-05-10T00:00:00.0000000' AS DateTime2), CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Task71_StoreSales_2] ([ProductID], [SalesDate], [Amount]) VALUES (3, CAST(N'2023-05-25T00:00:00.0000000' AS DateTime2), CAST(250.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Task71_StoreSales_2] OFF
GO
SET IDENTITY_INSERT [dbo].[TICKET] ON 

INSERT [dbo].[TICKET] ([TicketID], [ShowID], [CustomerID], [TicketType]) VALUES (3, 1, 7, N'VIP')
INSERT [dbo].[TICKET] ([TicketID], [ShowID], [CustomerID], [TicketType]) VALUES (4, 2, 8, N'Regular')
SET IDENTITY_INSERT [dbo].[TICKET] OFF
GO
INSERT [dbo].[WORKS_FOR] ([PersonID], [DepartmentID]) VALUES (7, 1)
INSERT [dbo].[WORKS_FOR] ([PersonID], [DepartmentID]) VALUES (8, 2)
GO
/****** Object:  Index [UQ__TASK71_M__B40CC6EC9A7D58C9]    Script Date: 7/15/2024 11:47:09 AM ******/
ALTER TABLE [dbo].[TASK71_MontlySalesReport] ADD UNIQUE NONCLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__TASK71_M__B40CC6ECBEE3F343]    Script Date: 7/15/2024 11:47:09 AM ******/
ALTER TABLE [dbo].[TASK71_MontlySalesReport] ADD UNIQUE NONCLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ACTOR]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[PERSON] ([PersonID])
GO
ALTER TABLE [dbo].[ACTOR]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[PERSON] ([PersonID])
GO
ALTER TABLE [dbo].[AWARD]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [dbo].[COMPANY] ([CompanyID])
GO
ALTER TABLE [dbo].[AWARD]  WITH CHECK ADD FOREIGN KEY([CompanyID])
REFERENCES [dbo].[COMPANY] ([CompanyID])
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[PERSON] ([PersonID])
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[PERSON] ([PersonID])
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[PERSON] ([PersonID])
GO
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[PERSON] ([PersonID])
GO
ALTER TABLE [dbo].[FILMOGRAPHY]  WITH CHECK ADD FOREIGN KEY([ActorID])
REFERENCES [dbo].[ACTOR] ([PersonID])
GO
ALTER TABLE [dbo].[FILMOGRAPHY]  WITH CHECK ADD FOREIGN KEY([ActorID])
REFERENCES [dbo].[ACTOR] ([PersonID])
GO
ALTER TABLE [dbo].[FILMOGRAPHY]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[MOVIE] ([MovieID])
GO
ALTER TABLE [dbo].[FILMOGRAPHY]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[MOVIE] ([MovieID])
GO
ALTER TABLE [dbo].[PAYMENT]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([PersonID])
GO
ALTER TABLE [dbo].[PAYMENT]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([PersonID])
GO
ALTER TABLE [dbo].[PAYMENT]  WITH CHECK ADD FOREIGN KEY([TicketID])
REFERENCES [dbo].[TICKET] ([TicketID])
GO
ALTER TABLE [dbo].[PAYMENT]  WITH CHECK ADD FOREIGN KEY([TicketID])
REFERENCES [dbo].[TICKET] ([TicketID])
GO
ALTER TABLE [dbo].[PRODUCER]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[PERSON] ([PersonID])
GO
ALTER TABLE [dbo].[PRODUCER]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[PERSON] ([PersonID])
GO
ALTER TABLE [dbo].[PRODUCES]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[MOVIE] ([MovieID])
GO
ALTER TABLE [dbo].[PRODUCES]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[MOVIE] ([MovieID])
GO
ALTER TABLE [dbo].[PRODUCES]  WITH CHECK ADD FOREIGN KEY([ProducerID])
REFERENCES [dbo].[PRODUCER] ([PersonID])
GO
ALTER TABLE [dbo].[PRODUCES]  WITH CHECK ADD FOREIGN KEY([ProducerID])
REFERENCES [dbo].[PRODUCER] ([PersonID])
GO
ALTER TABLE [dbo].[RESERVE_SEAT]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([PersonID])
GO
ALTER TABLE [dbo].[RESERVE_SEAT]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([PersonID])
GO
ALTER TABLE [dbo].[RESERVE_SEAT]  WITH CHECK ADD FOREIGN KEY([ShowID])
REFERENCES [dbo].[SHOW] ([ShowID])
GO
ALTER TABLE [dbo].[RESERVE_SEAT]  WITH CHECK ADD FOREIGN KEY([ShowID])
REFERENCES [dbo].[SHOW] ([ShowID])
GO
ALTER TABLE [dbo].[REWARD]  WITH CHECK ADD FOREIGN KEY([AwardID])
REFERENCES [dbo].[AWARD] ([AwardID])
GO
ALTER TABLE [dbo].[REWARD]  WITH CHECK ADD FOREIGN KEY([AwardID])
REFERENCES [dbo].[AWARD] ([AwardID])
GO
ALTER TABLE [dbo].[REWARD]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[MOVIE] ([MovieID])
GO
ALTER TABLE [dbo].[REWARD]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[MOVIE] ([MovieID])
GO
ALTER TABLE [dbo].[SHOW]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[MOVIE] ([MovieID])
GO
ALTER TABLE [dbo].[SHOW]  WITH CHECK ADD FOREIGN KEY([MovieID])
REFERENCES [dbo].[MOVIE] ([MovieID])
GO
ALTER TABLE [dbo].[Task61OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Task61Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Task61OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Task61Orders] ([OrderId])
GO
ALTER TABLE [dbo].[TICKET]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([PersonID])
GO
ALTER TABLE [dbo].[TICKET]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CUSTOMER] ([PersonID])
GO
ALTER TABLE [dbo].[TICKET]  WITH CHECK ADD FOREIGN KEY([ShowID])
REFERENCES [dbo].[SHOW] ([ShowID])
GO
ALTER TABLE [dbo].[TICKET]  WITH CHECK ADD FOREIGN KEY([ShowID])
REFERENCES [dbo].[SHOW] ([ShowID])
GO
ALTER TABLE [dbo].[WORKS_FOR]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[DEPARTMENT] ([DepartmentID])
GO
ALTER TABLE [dbo].[WORKS_FOR]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[DEPARTMENT] ([DepartmentID])
GO
ALTER TABLE [dbo].[WORKS_FOR]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[PERSON] ([PersonID])
GO
ALTER TABLE [dbo].[WORKS_FOR]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[PERSON] ([PersonID])
GO
/****** Object:  StoredProcedure [dbo].[TASK51]    Script Date: 7/15/2024 11:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TASK51]
AS
BEGIN
-- Insert into PERSON table
INSERT INTO PERSON (Name, Gender, DateOfBirth, ContactInfo, Nationality) VALUES
('hadi karami', 'Male', '2002-02-27', 'hadikarami.tech@gmail.com', 'persian'),
('amirali amini', 'male', '2003-08-22', 'amiramini@example.com', 'persian'),
('anthony edwards', 'Male', '2002-06-15', 'antedwards@example.com', 'american'),
('ali mehmet', 'male', '1983-03-05', 'mehmet@example.com', 'turkey'),
('Sara Connor', 'Female', '1995-09-12', 'sara.connor@example.com', 'Canadian'),
('luka doncic', 'male', '1995-09-12', 'luka@example.com', 'serbian');

-- Insert into EMPLOYEE table
INSERT INTO EMPLOYEE (PersonID, Salary, Position) VALUES
(1, 70000.00, 'Manager'),
(3, 55000.00, 'Assistant Manager');


-- Insert into CUSTOMER table
INSERT INTO CUSTOMER (PersonID, MembershipStatus) VALUES
(2, 'Gold'),
(5, 'Silver');

-- Insert into PRODUCER table
INSERT INTO PRODUCER (PersonID) VALUES
(4);


-- Insert into ACTOR table
INSERT INTO ACTOR (PersonID) VALUES
(2),
(5);


-- Insert into WORKS_FOR table
INSERT INTO WORKS_FOR (PersonID, DepartmentID) VALUES
(1, 1),
(3, 2);



UPDATE PERSON
SET Name = 
    SUBSTRING(Name, 1, 3) + ' updated' + SUBSTRING(Name, 4, LEN(Name) - 3);


CREATE TABLE TASK51Logs (
    id INT PRIMARY KEY IDENTITY,
    logdate DATETIME2,
    content VARCHAR(256)
);

-- Step 1: Update rows in the PERSON table where the Name column contains the word "updated".
UPDATE PERSON
SET Name = REPLACE(Name, ' updated', '')
WHERE Name LIKE '% updated%';

-- Step 2: Delete rows in the PERSON table where the Name column contains the word "updated".
DELETE FROM PERSON
WHERE Name LIKE '% updated%';

-- Step 3: Log the execution of these queries in the Logs51TASK table.
DECLARE @Username VARCHAR(50) = 'username'; -- Replace 'username' with the actual username executing the query

INSERT INTO TASK51Logs (logdate, content)
VALUES (GETDATE(), CONCAT('Rows with "updated" in Name column updated and deleted by user: ', @Username));


END
GO
/****** Object:  StoredProcedure [dbo].[TASK52]    Script Date: 7/15/2024 11:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




	CREATE PROCEDURE [dbo].[TASK52]
AS
BEGIN
    -- Create the view inside the procedure
    EXEC('
        CREATE VIEW viewtask52 WITH ENCRYPTION AS
        SELECT 
            ID,
            username,
            dbo.DecryptPassword(password) AS decrypted_password
        FROM 
            Task52User;
    ');
END;
GO
/****** Object:  StoredProcedure [dbo].[TASK61]    Script Date: 7/15/2024 11:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TASK61]
AS
BEGIN
	-- Create Task61Orders table
    CREATE TABLE Task61Orders (
        OrderId INT PRIMARY KEY IDENTITY,
        CustomerID INT,
        Date DATETIME2,
        Status NVARCHAR(50)
    );

    -- Create Task61OrderDetails table
    CREATE TABLE Task61OrderDetails (
        OrderDetailId INT PRIMARY KEY IDENTITY,
        OrderId INT FOREIGN KEY REFERENCES Task61Orders(OrderId),
        ProductId INT,
        Quantity INT
    );

    -- Create TASK61Logs table
    CREATE TABLE TASK61Logs (
        LogID INT PRIMARY KEY IDENTITY,
        LogDate DATETIME2,
        Content VARCHAR(256)
    );

    -- Insert sample data into Task61Orders
    INSERT INTO Task61Orders (CustomerID, Date, Status)
    VALUES
    (1, '2024-05-01', 'High'),
    (2, '2024-05-02', 'Low'),
    (3, '2024-05-03', 'Medium'),
    (4, '2024-05-04', 'High'),
    (5, '2024-05-05', 'Low');

    -- Insert sample data into Task61OrderDetails
    INSERT INTO Task61OrderDetails (OrderId, ProductId, Quantity)
    VALUES
    (1, 101, 50),
    (2, 102, 150),
    (3, 103, 200),
    (4, 104, 250),
    (5, 105, 100);

    -- Insert sample data into TASK61Logs
    INSERT INTO TASK61Logs (LogDate, Content)
    VALUES
    ('2024-05-01 10:00:00', 'Log entry 1'),
    ('2024-05-02 11:00:00', 'Log entry 2'),
    ('2024-05-03 12:00:00', 'Log entry 3'),
    ('2024-05-04 13:00:00', 'Log entry 4'),
    ('2024-05-05 14:00:00', 'Log entry 5');

    BEGIN TRY
        -- Log the attempt to update statuses before beginning the transaction
        DECLARE @LogMessage NVARCHAR(256) = 'Attempting to update Task61Orders statuses based on Task61OrderDetails quantity.';
        INSERT INTO TASK61Logs (LogDate, Content) VALUES (GETDATE(), @LogMessage);

        BEGIN TRANSACTION;

        -- Update the Status to 'High' if sum of Quantity is greater than 100
        UPDATE o
        SET o.Status = 'High'
        FROM Task61Orders o
        INNER JOIN (
            SELECT OrderId, SUM(Quantity) AS TotalQuantity
            FROM Task61OrderDetails
            GROUP BY OrderId
        ) d ON o.OrderId = d.OrderId
        WHERE d.TotalQuantity > 100;

        -- Commit the transaction if no errors
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback transaction in case of an error
        ROLLBACK TRANSACTION;

        -- Log error details
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        INSERT INTO TASK61Logs (LogDate, Content)
        VALUES (GETDATE(), 'Task 61 errors: ' + @ErrorMessage);

        -- Raise the error again to be caught by the application
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[TASK71]    Script Date: 7/15/2024 11:47:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TASK71]
AS
BEGIN
	DECLARE @TableName NVARCHAR(128);

BEGIN TRY
    -- Check if tables exist and create them if necessary
    IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Task71_StoreSales_1') AND type in (N'U'))
        BEGIN
            -- Create Task71_StoreSales_1 table
            CREATE TABLE Task71_StoreSales_1 (
                ProductID INT IDENTITY(1,1) PRIMARY KEY,
                SalesDate DATETIME2,
                Amount DECIMAL(10,2)
            );
        END;

    IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Task71_StoreSales_2') AND type in (N'U'))
        BEGIN
            -- Create Task71_StoreSales_2 table
            CREATE TABLE Task71_StoreSales_2 (
                ProductID INT IDENTITY(1,1) PRIMARY KEY,
                SalesDate DATETIME2,
                Amount DECIMAL(10,2)
            );
        END;

    IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TASK71_MontlySalesReport]') AND type in (N'U'))
        BEGIN
            -- Create TASK71_MontlySalesReport table
            CREATE TABLE TASK71_MontlySalesReport (
                ReportMonth DATETIME2,
                ProductID INT UNIQUE,
                TotalAmount DECIMAL(10,2)
            );
        END;
END TRY
BEGIN CATCH
    -- Handle any errors silently (no action needed)
END CATCH;

-- Continue with the rest of the procedure

			-- Enable IDENTITY_INSERT for Task71_StoreSales_1
		SET IDENTITY_INSERT [dbo].[Task71_StoreSales_1] ON;

		-- Insert data with explicit ProductID values into Task71_StoreSales_1
		INSERT INTO [dbo].[Task71_StoreSales_1] (ProductID, SalesDate, Amount)
		VALUES 
		(1, '2023-05-01', 100.00),
		(2, '2023-05-15', 200.00),
		(3, '2023-05-20', 50.00);

		-- Disable IDENTITY_INSERT for Task71_StoreSales_1
		SET IDENTITY_INSERT [dbo].[Task71_StoreSales_1] OFF;

		-- Enable IDENTITY_INSERT for Task71_StoreSales_2
		SET IDENTITY_INSERT [dbo].[Task71_StoreSales_2] ON;

		-- Insert data with explicit ProductID values into Task71_StoreSales_2
		INSERT INTO [dbo].[Task71_StoreSales_2] (ProductID, SalesDate, Amount)
		VALUES 
		(1, '2023-05-05', 150.00),
		(2, '2023-05-10', 300.00),
		(3, '2023-05-25', 250.00);

		-- Disable IDENTITY_INSERT for Task71_StoreSales_2
		SET IDENTITY_INSERT [dbo].[Task71_StoreSales_2] OFF;

		SET NOCOUNT ON;
		DECLARE @ReportMonth DATE
		DECLARE @UserName NVARCHAR(128);
		DECLARE @StartDate DATE;
		DECLARE @EndDate DATE;
		
		DECLARE @SQL NVARCHAR(MAX);

		-- Calculate start and end dates of the month
		SET @StartDate = DATEADD(MONTH, DATEDIFF(MONTH, 0, @ReportMonth), 0);
		SET @EndDate = DATEADD(DAY, -1, DATEADD(MONTH, DATEDIFF(MONTH, 0, @ReportMonth) + 1, 0));

		-- Authorization check
		SELECT @UserName = SUSER_NAME();
		IF @UserName <> 'YourGroupName'
		BEGIN
			RETURN;
		END;

		BEGIN TRY
			BEGIN TRANSACTION;

			-- Temporary table to store aggregated results
			IF OBJECT_ID('tempdb..#TempResults') IS NOT NULL DROP TABLE #TempResults;
			CREATE TABLE #TempResults (
				ProductID INT,
				TotalAmount DECIMAL(10,2)
			);

			-- Cursor to dynamically fetch table names
			DECLARE TableCursor CURSOR FOR
			SELECT TABLE_NAME
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_NAME LIKE 'Task71_StoreSales%';

			OPEN TableCursor;
			FETCH NEXT FROM TableCursor INTO @TableName;

			WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Dynamic SQL to insert data into temporary table
				SET @SQL = '
					INSERT INTO #TempResults (ProductID, TotalAmount)
					SELECT ProductID, SUM(Amount)
					FROM ' + QUOTENAME(@TableName) + '
					WHERE SalesDate BETWEEN @StartDate AND @EndDate
					GROUP BY ProductID;
				';

				EXEC sp_executesql @SQL, 
					N'@StartDate DATE, @EndDate DATE', 
					@StartDate, @EndDate;

				FETCH NEXT FROM TableCursor INTO @TableName;
			END;

			CLOSE TableCursor;
			DEALLOCATE TableCursor;

			-- Insert aggregated results into TASK71_MontlySalesReport table
			SET @SQL = '
				INSERT INTO TASK71_MontlySalesReport (ReportMonth, ProductID, TotalAmount)
				SELECT @ReportMonth, ProductID, SUM(TotalAmount)
				FROM #TempResults
				GROUP BY ProductID;
			';

			EXEC sp_executesql @SQL, 
				N'@ReportMonth DATE', 
				@ReportMonth;

			-- Clean up temporary table
			DROP TABLE #TempResults;

			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH
			-- Handle errors without exposing them
			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;

			-- Ensure cursors and temporary tables are cleaned up
			IF CURSOR_STATUS('global', 'TableCursor') >= 0
			BEGIN
				CLOSE TableCursor;
				DEALLOCATE TableCursor;
			END;

			IF OBJECT_ID('tempdb..#TempResults') IS NOT NULL
			BEGIN
				DROP TABLE #TempResults;
			END;

			-- Re-throw the error
			THROW;
		END CATCH;
END
GO
