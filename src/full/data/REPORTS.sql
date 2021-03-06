USE [AIDE]
GO
DELETE FROM [dbo].[REPORTS]
GO
SET IDENTITY_INSERT [dbo].[REPORTS] ON 

INSERT [dbo].[REPORTS] ([REPORT_ID], [OPT_ID], [MODULE ID], [DESCRIPTION], [VALUE]) VALUES (1, 1001, 1000, N'Contact List', N'\ReportsCommands\generatecontactlistreport.bat')
INSERT [dbo].[REPORTS] ([REPORT_ID], [OPT_ID], [MODULE ID], [DESCRIPTION], [VALUE]) VALUES (2, 1002, 1000, N'Outstanding task', N'\ReportsCommands\generateoutstandingtaskreport.bat')
INSERT [dbo].[REPORTS] ([REPORT_ID], [OPT_ID], [MODULE ID], [DESCRIPTION], [VALUE]) VALUES (3, 1003, 1000, N'Asset Inventory', N'\ReportsCommands\generateassetinventoryreport.bat')
INSERT [dbo].[REPORTS] ([REPORT_ID], [OPT_ID], [MODULE ID], [DESCRIPTION], [VALUE]) VALUES (4, 1003, 1000, N'Project Billability', N'\ReportsCommands\generateprojectbillabilityreport.bat')
INSERT [dbo].[REPORTS] ([REPORT_ID], [OPT_ID], [MODULE ID], [DESCRIPTION], [VALUE]) VALUES (5, 1004, 1000, N'Employee Billability', N'\ReportsCommands\generateemployeebillabilityreport.bat')
INSERT [dbo].[REPORTS] ([REPORT_ID], [OPT_ID], [MODULE ID], [DESCRIPTION], [VALUE]) VALUES (6, 1005, 1000, N'Skills Matrix', N'\ReportsCommands\generateskillsmatrix.bat')
INSERT [dbo].[REPORTS] ([REPORT_ID], [OPT_ID], [MODULE ID], [DESCRIPTION], [VALUE]) VALUES (7, 1006, 1000, N'Status Reports', N'\ReportsCommands\generatestatusreport.bat')
INSERT [dbo].[REPORTS] ([REPORT_ID], [OPT_ID], [MODULE ID], [DESCRIPTION], [VALUE]) VALUES (8, 1007, 1000, N'Resource Planner', N'\ReportsCommands\generateresourceplanner.bat')
SET IDENTITY_INSERT [dbo].[REPORTS] OFF
