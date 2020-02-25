USE [master]
GO
/****** Object:  Database [InstagramDb]    Script Date: 25-02-2020 15:09:19 ******/
CREATE DATABASE [InstagramDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InstagramDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\Instagram1Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InstagramDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\Instagram1Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [InstagramDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InstagramDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InstagramDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InstagramDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InstagramDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InstagramDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InstagramDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [InstagramDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InstagramDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InstagramDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InstagramDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InstagramDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InstagramDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InstagramDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InstagramDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InstagramDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InstagramDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InstagramDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InstagramDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InstagramDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InstagramDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InstagramDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InstagramDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InstagramDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InstagramDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InstagramDb] SET  MULTI_USER 
GO
ALTER DATABASE [InstagramDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InstagramDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InstagramDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InstagramDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InstagramDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Instagram1Db] SET QUERY_STORE = OFF
GO
USE [InstagramDb]
GO
/****** Object:  Table [dbo].[InstaUsers]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstaUsers](
	[InstaUserId] [int] IDENTITY(1,1) NOT NULL,
	[InstaUserName] [varchar](50) NOT NULL,
	[InstaUserFullName] [varchar](50) NULL,
	[InstaUserEmail] [varchar](50) NULL,
	[InstaUserMobileNumber] [varchar](50) NULL,
	[InstaUserPassword] [varchar](50) NOT NULL,
	[InstaUserCountry] [varchar](50) NOT NULL,
	[UserPrivacyId] [int] NOT NULL,
 CONSTRAINT [PK_InstaUsers] PRIMARY KEY CLUSTERED 
(
	[InstaUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserDetailId] [int] IDENTITY(1,1) NOT NULL,
	[UserWebsite] [varchar](50) NULL,
	[UserBio] [varchar](max) NULL,
	[UserGender] [varchar](10) NULL,
	[UserImage] [varchar](max) NULL,
	[InstaUserId] [int] NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vEditProfile]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEditProfile]
AS
SELECT        dbo.UserDetails.UserImage, dbo.InstaUsers.InstaUserFullName, dbo.InstaUsers.InstaUserName, dbo.UserDetails.UserWebsite, dbo.UserDetails.UserBio, dbo.UserDetails.UserGender, dbo.InstaUsers.InstaUserMobileNumber, 
                         dbo.InstaUsers.InstaUserEmail, dbo.InstaUsers.InstaUserCountry
FROM            dbo.InstaUsers INNER JOIN
                         dbo.UserDetails ON dbo.InstaUsers.InstaUserId = dbo.UserDetails.InstaUserId
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[InstaUserId] [int] NOT NULL,
	[PostType] [varchar](max) NOT NULL,
	[PostContent] [varchar](max) NOT NULL,
	[PostCaption] [varchar](max) NULL,
	[PostDateTime] [datetimeoffset](7) NOT NULL,
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTags](
	[PostTagId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[TaggedUserId] [int] NOT NULL,
	[TagStatus] [bit] NOT NULL,
	[TagDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_PostTags] PRIMARY KEY CLUSTERED 
(
	[PostTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vUserPosts]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUserPosts]
AS
SELECT        dbo.Posts.PostId, dbo.Posts.PostContent, dbo.Posts.PostCaption, dbo.PostTags.TaggedUserId, dbo.Posts.Status, dbo.PostTags.TagStatus
FROM            dbo.Posts INNER JOIN
                         dbo.PostTags ON dbo.Posts.PostId = dbo.PostTags.PostId
GO
/****** Object:  View [dbo].[vUserProfile]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUserProfile]
AS
SELECT        dbo.InstaUsers.InstaUserId, dbo.InstaUsers.InstaUserName, dbo.InstaUsers.InstaUserFullName, dbo.UserDetails.UserBio, dbo.UserDetails.UserWebsite, dbo.UserDetails.UserImage
FROM            dbo.InstaUsers INNER JOIN
                         dbo.UserDetails ON dbo.InstaUsers.InstaUserId = dbo.UserDetails.InstaUserId
GO
/****** Object:  Table [dbo].[ChatDetails]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatDetails](
	[ChatDetailId] [int] IDENTITY(1,1) NOT NULL,
	[MessageContent] [varchar](max) NOT NULL,
	[ChatDateTime] [datetimeoffset](7) NOT NULL,
	[Status] [bit] NOT NULL,
	[ChatId] [int] NOT NULL,
	[StoryCommentId] [int] NULL,
 CONSTRAINT [PK_ChatDetails] PRIMARY KEY CLUSTERED 
(
	[ChatDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chats](
	[ChatId] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NOT NULL,
	[RecieverId] [int] NOT NULL,
 CONSTRAINT [PK_Chats] PRIMARY KEY CLUSTERED 
(
	[ChatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Followers]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Followers](
	[FollowerId] [int] IDENTITY(1,1) NOT NULL,
	[FollowBy] [int] NOT NULL,
	[FollowTo] [int] NOT NULL,
	[FollowDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Followers] PRIMARY KEY CLUSTERED 
(
	[FollowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostComments]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostComments](
	[PostCommentId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[Comment] [varchar](max) NOT NULL,
	[CommentUserId] [int] NOT NULL,
	[CommentDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_PostComments] PRIMARY KEY CLUSTERED 
(
	[PostCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostLikes]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostLikes](
	[PostLikeId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[LikedById] [int] NOT NULL,
	[LikeDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_PostLikes] PRIMARY KEY CLUSTERED 
(
	[PostLikeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostShares]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostShares](
	[PostShareId] [int] IDENTITY(1,1) NOT NULL,
	[ShareBy] [int] NOT NULL,
	[ShareTo] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[ShareDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_PostShares] PRIMARY KEY CLUSTERED 
(
	[PostShareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stories]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stories](
	[StoryId] [int] IDENTITY(1,1) NOT NULL,
	[InstaUserId] [int] NOT NULL,
	[StoryType] [varchar](20) NOT NULL,
	[StoryContent] [varchar](max) NOT NULL,
	[StoryDateTime] [datetimeoffset](7) NOT NULL,
	[StoryStatus] [bit] NOT NULL,
 CONSTRAINT [PK_stories] PRIMARY KEY CLUSTERED 
(
	[StoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoryComments]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoryComments](
	[StoryCommentId] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [varchar](50) NOT NULL,
	[CommentUserId] [int] NOT NULL,
	[CommentDateTime] [datetimeoffset](7) NOT NULL,
	[StoryId] [int] NOT NULL,
 CONSTRAINT [PK_StoryComments] PRIMARY KEY CLUSTERED 
(
	[StoryCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoryShares]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoryShares](
	[StoryShareId] [int] IDENTITY(1,1) NOT NULL,
	[ShareBy] [int] NOT NULL,
	[ShareTo] [int] NOT NULL,
	[StoryId] [int] NOT NULL,
	[ShareDateTime] [datetimeoffset](7) NOT NULL,
	[UserPrivacyId] [int] NOT NULL,
 CONSTRAINT [PK_Storyshares] PRIMARY KEY CLUSTERED 
(
	[StoryShareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoryTags]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoryTags](
	[StoryTagId] [int] IDENTITY(1,1) NOT NULL,
	[StoryId] [int] NOT NULL,
	[TaggedUserId] [int] NOT NULL,
	[TagDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_StoryTags] PRIMARY KEY CLUSTERED 
(
	[StoryTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPrivacys]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPrivacys](
	[UserPrivacyId] [int] IDENTITY(1,1) NOT NULL,
	[AccountPrivacyType] [varchar](20) NOT NULL,
 CONSTRAINT [PK_UserPrivacys] PRIMARY KEY CLUSTERED 
(
	[UserPrivacyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViewStorys]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViewStorys](
	[ViewStoryId] [int] IDENTITY(1,1) NOT NULL,
	[StoryId] [int] NOT NULL,
	[ViewBy] [int] NOT NULL,
 CONSTRAINT [PK_ViewStorys] PRIMARY KEY CLUSTERED 
(
	[ViewStoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Email_Unique_Table_1]    Script Date: 25-02-2020 15:09:19 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Email_Unique_Table_1] ON [dbo].[InstaUsers]
(
	[InstaUserEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Unique_Username_Users]    Script Date: 25-02-2020 15:09:19 ******/
CREATE NONCLUSTERED INDEX [IX_Unique_Username_Users] ON [dbo].[InstaUsers]
(
	[InstaUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [MobileNumberUnique_Table_1]    Script Date: 25-02-2020 15:09:19 ******/
CREATE UNIQUE NONCLUSTERED INDEX [MobileNumberUnique_Table_1] ON [dbo].[InstaUsers]
(
	[InstaUserMobileNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChatDetails] ADD  CONSTRAINT [DF_ChatDetails_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[InstaUsers] ADD  CONSTRAINT [DF_Users_UserPrivacyId]  DEFAULT ((1)) FOR [UserPrivacyId]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_Status]  DEFAULT ('Activated') FOR [Status]
GO
ALTER TABLE [dbo].[StoryShares] ADD  CONSTRAINT [DF_StoryShares_UserPrivacyId]  DEFAULT ((3)) FOR [UserPrivacyId]
GO
ALTER TABLE [dbo].[ChatDetails]  WITH CHECK ADD  CONSTRAINT [FK_ChatDetails_Chats] FOREIGN KEY([ChatId])
REFERENCES [dbo].[Chats] ([ChatId])
GO
ALTER TABLE [dbo].[ChatDetails] CHECK CONSTRAINT [FK_ChatDetails_Chats]
GO
ALTER TABLE [dbo].[ChatDetails]  WITH CHECK ADD  CONSTRAINT [FK_ChatDetails_StoryComments] FOREIGN KEY([StoryCommentId])
REFERENCES [dbo].[StoryComments] ([StoryCommentId])
GO
ALTER TABLE [dbo].[ChatDetails] CHECK CONSTRAINT [FK_ChatDetails_StoryComments]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_Users] FOREIGN KEY([SenderId])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_Users]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_Users1] FOREIGN KEY([RecieverId])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_Users1]
GO
ALTER TABLE [dbo].[Followers]  WITH CHECK ADD  CONSTRAINT [FK_Followers_followby_Users] FOREIGN KEY([FollowBy])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[Followers] CHECK CONSTRAINT [FK_Followers_followby_Users]
GO
ALTER TABLE [dbo].[Followers]  WITH CHECK ADD  CONSTRAINT [FK_Followers_followto_Users] FOREIGN KEY([FollowTo])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[Followers] CHECK CONSTRAINT [FK_Followers_followto_Users]
GO
ALTER TABLE [dbo].[InstaUsers]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserPrivacys] FOREIGN KEY([UserPrivacyId])
REFERENCES [dbo].[UserPrivacys] ([UserPrivacyId])
GO
ALTER TABLE [dbo].[InstaUsers] CHECK CONSTRAINT [FK_Users_UserPrivacys]
GO
ALTER TABLE [dbo].[PostComments]  WITH CHECK ADD  CONSTRAINT [FK_PostComments_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostComments] CHECK CONSTRAINT [FK_PostComments_Posts]
GO
ALTER TABLE [dbo].[PostComments]  WITH CHECK ADD  CONSTRAINT [FK_PostComments_Users] FOREIGN KEY([CommentUserId])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[PostComments] CHECK CONSTRAINT [FK_PostComments_Users]
GO
ALTER TABLE [dbo].[PostLikes]  WITH CHECK ADD  CONSTRAINT [FK_PostLikes_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostLikes] CHECK CONSTRAINT [FK_PostLikes_Posts]
GO
ALTER TABLE [dbo].[PostLikes]  WITH CHECK ADD  CONSTRAINT [FK_PostLikes_Users] FOREIGN KEY([LikedById])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[PostLikes] CHECK CONSTRAINT [FK_PostLikes_Users]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([InstaUserId])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
ALTER TABLE [dbo].[PostShares]  WITH CHECK ADD  CONSTRAINT [FK_PostShares_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostShares] CHECK CONSTRAINT [FK_PostShares_Posts]
GO
ALTER TABLE [dbo].[PostShares]  WITH CHECK ADD  CONSTRAINT [FK_PostShares_Users_shareby] FOREIGN KEY([ShareBy])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[PostShares] CHECK CONSTRAINT [FK_PostShares_Users_shareby]
GO
ALTER TABLE [dbo].[PostShares]  WITH CHECK ADD  CONSTRAINT [FK_PostShares_Users_shareto] FOREIGN KEY([ShareTo])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[PostShares] CHECK CONSTRAINT [FK_PostShares_Users_shareto]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Posts1] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Posts1]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_PostTags_Users] FOREIGN KEY([TaggedUserId])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_PostTags_Users]
GO
ALTER TABLE [dbo].[Stories]  WITH CHECK ADD  CONSTRAINT [FK_Stories_Users] FOREIGN KEY([InstaUserId])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[Stories] CHECK CONSTRAINT [FK_Stories_Users]
GO
ALTER TABLE [dbo].[StoryComments]  WITH CHECK ADD  CONSTRAINT [FK_StoryComments_Stories] FOREIGN KEY([StoryId])
REFERENCES [dbo].[Stories] ([StoryId])
GO
ALTER TABLE [dbo].[StoryComments] CHECK CONSTRAINT [FK_StoryComments_Stories]
GO
ALTER TABLE [dbo].[StoryComments]  WITH CHECK ADD  CONSTRAINT [FK_StoryComments_Users] FOREIGN KEY([CommentUserId])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[StoryComments] CHECK CONSTRAINT [FK_StoryComments_Users]
GO
ALTER TABLE [dbo].[StoryShares]  WITH CHECK ADD  CONSTRAINT [FK_StoryShares_Stories] FOREIGN KEY([StoryId])
REFERENCES [dbo].[Stories] ([StoryId])
GO
ALTER TABLE [dbo].[StoryShares] CHECK CONSTRAINT [FK_StoryShares_Stories]
GO
ALTER TABLE [dbo].[StoryShares]  WITH CHECK ADD  CONSTRAINT [FK_StoryShares_UserPrivacys] FOREIGN KEY([UserPrivacyId])
REFERENCES [dbo].[UserPrivacys] ([UserPrivacyId])
GO
ALTER TABLE [dbo].[StoryShares] CHECK CONSTRAINT [FK_StoryShares_UserPrivacys]
GO
ALTER TABLE [dbo].[StoryShares]  WITH CHECK ADD  CONSTRAINT [FK_StoryShares_Users_shareby] FOREIGN KEY([ShareBy])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[StoryShares] CHECK CONSTRAINT [FK_StoryShares_Users_shareby]
GO
ALTER TABLE [dbo].[StoryShares]  WITH CHECK ADD  CONSTRAINT [FK_StoryShares_Users_shareto] FOREIGN KEY([ShareTo])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[StoryShares] CHECK CONSTRAINT [FK_StoryShares_Users_shareto]
GO
ALTER TABLE [dbo].[StoryTags]  WITH CHECK ADD  CONSTRAINT [FK_StoryTags_Stories] FOREIGN KEY([StoryId])
REFERENCES [dbo].[Stories] ([StoryId])
GO
ALTER TABLE [dbo].[StoryTags] CHECK CONSTRAINT [FK_StoryTags_Stories]
GO
ALTER TABLE [dbo].[StoryTags]  WITH CHECK ADD  CONSTRAINT [FK_StoryTags_Users] FOREIGN KEY([TaggedUserId])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[StoryTags] CHECK CONSTRAINT [FK_StoryTags_Users]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_Users] FOREIGN KEY([InstaUserId])
REFERENCES [dbo].[InstaUsers] ([InstaUserId])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_Users]
GO
ALTER TABLE [dbo].[ViewStorys]  WITH CHECK ADD  CONSTRAINT [FK_ViewStorys_Followers] FOREIGN KEY([ViewBy])
REFERENCES [dbo].[Followers] ([FollowerId])
GO
ALTER TABLE [dbo].[ViewStorys] CHECK CONSTRAINT [FK_ViewStorys_Followers]
GO
ALTER TABLE [dbo].[ViewStorys]  WITH CHECK ADD  CONSTRAINT [FK_ViewStorys_Stories] FOREIGN KEY([StoryId])
REFERENCES [dbo].[Stories] ([StoryId])
GO
ALTER TABLE [dbo].[ViewStorys] CHECK CONSTRAINT [FK_ViewStorys_Stories]
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchUsername]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[sp_SearchUsername] 
@username varchar(max)
as
BEGIN
select *  from InstaUsers where InstaUsers.InstaUserName like '%'+@username +'%' ;
End
GO
/****** Object:  StoredProcedure [dbo].[vChats]    Script Date: 25-02-2020 15:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[vChats]
@senderid int ,@recieverid int
AS

BEGIN
   
SELECT InstaUsers.InstaUserName,Chats.senderId,u.InstaUsername,Chats.RecieverId,ChatDetails.MessageContent from Chats inner join InstaUsers on senderId=InstaUserId inner join InstaUsers u on RecieverId=u.InstaUserId inner join ChatDetails on Chats.ChatId=ChatdetailId where (senderId=@senderid or RecieverId=@senderId) and (senderId=@recieverid or RecieverId=@recieverid)
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "InstaUsers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 246
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserDetails"
            Begin Extent = 
               Top = 6
               Left = 294
               Bottom = 302
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEditProfile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEditProfile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Posts"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 262
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PostTags"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 221
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUserPosts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUserPosts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "InstaUsers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 237
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserDetails"
            Begin Extent = 
               Top = 6
               Left = 294
               Bottom = 233
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUserProfile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUserProfile'
GO
USE [master]
GO
ALTER DATABASE [InstagramDb] SET  READ_WRITE 
GO
