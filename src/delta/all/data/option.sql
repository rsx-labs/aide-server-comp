USE [AIDE]
GO

--Option Modules

--Option Function

Delete From OPTION_FUNCTION
Where FunctionID in (17, 18)

INSERT INTO [dbo].[OPTION_FUNCTION]([FunctionID],[Description])
VALUES(17,'Update feed url')

INSERT INTO [dbo].[OPTION_FUNCTION]([FunctionID],[Description])
VALUES(18,'Minimum version')

--Option
Delete From [Option]
Where OptionID in (14, 47, 48)

INSERT INTO [dbo].[OPTION]([OptionID],[ModuleID],[FunctionID],[Description],[Value])
VALUES (14, 4 ,16,'App Config - Event Startup ID from Event Viewer','4624')

INSERT INTO [dbo].[OPTION]([OptionID],[ModuleID],[FunctionID],[Description],[Value])
VALUES (47,4 ,17,'Update feed url','http://10.158.47.100:8010/Installers/')


INSERT INTO [dbo].[OPTION]([OptionID],[ModuleID],[FunctionID],[Description],[Value])
VALUES (48,4 ,18,'Minimum version','3.3.9.0')
GO


