USE [Final_PetPeeves]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [userName], [passwords], [avatarID], [dateOfBirth], [gender], [locations], [isAdmin], [userStatus]) VALUES (1, N'Admin', N'admin', NULL, CAST(N'2002-08-30T00:00:00.000' AS DateTime), N'male', N'Quang Nam', 1, 1)
INSERT [dbo].[Users] ([ID], [userName], [passwords], [avatarID], [dateOfBirth], [gender], [locations], [isAdmin], [userStatus]) VALUES (3, N'Nguyễn Văn Cẩu', N'abcd1234', NULL, CAST(N'2022-06-27T00:00:00.000' AS DateTime), N'male', N'Đà Nẵng', 0, 1)
INSERT [dbo].[Users] ([ID], [userName], [passwords], [avatarID], [dateOfBirth], [gender], [locations], [isAdmin], [userStatus]) VALUES (4, N'Lê Thị Miu', N'abcd1234', NULL, CAST(N'2021-02-02T00:00:00.000' AS DateTime), N'female', N'Quảng Trị', 0, 1)
INSERT [dbo].[Users] ([ID], [userName], [passwords], [avatarID], [dateOfBirth], [gender], [locations], [isAdmin], [userStatus]) VALUES (5, N'Trần Đức Bo', N'abcd1234', NULL, CAST(N'2022-06-27T00:00:00.000' AS DateTime), N'others', N'Sao Hỏa', 0, 1)
INSERT [dbo].[Users] ([ID], [userName], [passwords], [avatarID], [dateOfBirth], [gender], [locations], [isAdmin], [userStatus]) VALUES (6, N'Tiểu Cường', N'abcd1234', NULL, CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'female', N'Ống Cống', 0, 1)
INSERT [dbo].[Users] ([ID], [userName], [passwords], [avatarID], [dateOfBirth], [gender], [locations], [isAdmin], [userStatus]) VALUES (7, N'Bé Na', N'abcd1234', NULL, CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'female', N'Rừng', 0, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [category]) VALUES (1, N'Pet care')
INSERT [dbo].[Category] ([ID], [category]) VALUES (2, N'Pet products')
INSERT [dbo].[Category] ([ID], [category]) VALUES (3, N'Pet stories')
INSERT [dbo].[Category] ([ID], [category]) VALUES (4, N'Admin notification')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[PostInfo] ON 

INSERT [dbo].[PostInfo] ([ID], [postTitle], [postContent], [postTime], [authorID], [categoryID]) VALUES (1, N'First Post', N'Hello everyone this is the fist post', CAST(N'2022-06-27T21:53:31.993' AS DateTime), N'USE00000001', N'CAT00000004')
SET IDENTITY_INSERT [dbo].[PostInfo] OFF
GO
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000001', N'USE00000003')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000001', N'USE00000004')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000001', N'USE00000006')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000003', N'USE00000004')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000003', N'USE00000005')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000003', N'USE00000007')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000004', N'USE00000001')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000004', N'USE00000003')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000004', N'USE00000006')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000005', N'USE00000001')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000005', N'USE00000003')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000005', N'USE00000004')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000006', N'USE00000003')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000006', N'USE00000004')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000006', N'USE00000005')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000007', N'USE00000001')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000007', N'USE00000003')
INSERT [dbo].[Followings] ([userID], [followeeId]) VALUES (N'USE00000007', N'USE00000005')
GO
