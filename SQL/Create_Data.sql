SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM sysobjects WHERE id=OBJECT_ID('#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO
PRINT N'Creating schemata'
GO
PRINT N'Creating [dbo].[gemini_install]'
GO
CREATE TABLE [dbo].[gemini_install]
(
[attributeid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[attribute_key] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[attribute_value] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_install_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_install_attributeid_pk] on [dbo].[gemini_install]'
GO
ALTER TABLE [dbo].[gemini_install] ADD CONSTRAINT [gemini_install_attributeid_pk] PRIMARY KEY CLUSTERED  ([attributeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_install_attribute_key] on [dbo].[gemini_install]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_install_attribute_key] ON [dbo].[gemini_install] ([attribute_key])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_projectlabels]'
GO
CREATE TABLE [dbo].[gemini_projectlabels]
(
[labelid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[labelname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_projectlabels_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_projectlabels_appointment_pk] on [dbo].[gemini_projectlabels]'
GO
ALTER TABLE [dbo].[gemini_projectlabels] ADD CONSTRAINT [gemini_projectlabels_appointment_pk] PRIMARY KEY CLUSTERED  ([labelid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_case_issues]'
GO
CREATE TABLE [dbo].[gemini_testing_case_issues]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[testcaseid] [int] NOT NULL,
[issueid] [numeric] (10, 0) NOT NULL,
[createdby] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_testing_case_issues_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_case_issues_id_pk] on [dbo].[gemini_testing_case_issues]'
GO
ALTER TABLE [dbo].[gemini_testing_case_issues] ADD CONSTRAINT [gemini_testing_case_issues_id_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_case_issues_testcaseid] on [dbo].[gemini_testing_case_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_case_issues_testcaseid] ON [dbo].[gemini_testing_case_issues] ([testcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [uind_gemini_testing_case_issues_testcaseid_issueid] on [dbo].[gemini_testing_case_issues]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [uind_gemini_testing_case_issues_testcaseid_issueid] ON [dbo].[gemini_testing_case_issues] ([testcaseid], [issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_case_issues_issueid] on [dbo].[gemini_testing_case_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_case_issues_issueid] ON [dbo].[gemini_testing_case_issues] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_types]'
GO
CREATE TABLE [dbo].[gemini_testing_types]
(
[typeid] [int] NOT NULL IDENTITY(1, 1),
[seq] [int] NOT NULL CONSTRAINT [gemini_testing_types_seq_def] DEFAULT ((0)),
[typedesc] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[imagepath] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_types_typeid_pk] on [dbo].[gemini_testing_types]'
GO
ALTER TABLE [dbo].[gemini_testing_types] ADD CONSTRAINT [gemini_testing_types_typeid_pk] PRIMARY KEY CLUSTERED  ([typeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_types_typeid] on [dbo].[gemini_testing_types]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [ind_gemini_testing_types_typeid] ON [dbo].[gemini_testing_types] ([typeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_types_desc] on [dbo].[gemini_testing_types]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_types_desc] ON [dbo].[gemini_testing_types] ([typedesc])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_sourcecontrolissuefiles]'
GO
CREATE TABLE [dbo].[gemini_sourcecontrolissuefiles]
(
[fileid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[issueid] [numeric] (10, 0) NOT NULL,
[filename] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[filepath] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[sourcecontrolrepository] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_sourcecontrolissuefiles_sourcecontrolrepository_def] DEFAULT (''),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_sourcecontrolissuefiles_fileid_pk] on [dbo].[gemini_sourcecontrolissuefiles]'
GO
ALTER TABLE [dbo].[gemini_sourcecontrolissuefiles] ADD CONSTRAINT [gemini_sourcecontrolissuefiles_fileid_pk] PRIMARY KEY CLUSTERED  ([fileid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_sourcecontrolissuefiles_issueid] on [dbo].[gemini_sourcecontrolissuefiles]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_sourcecontrolissuefiles_issueid] ON [dbo].[gemini_sourcecontrolissuefiles] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_adgroups]'
GO
CREATE TABLE [dbo].[gemini_adgroups]
(
[adgroupid] [int] NOT NULL IDENTITY(1, 1),
[adgroupname] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_adgroups_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_adgroups_adgroupid_pk] on [dbo].[gemini_adgroups]'
GO
ALTER TABLE [dbo].[gemini_adgroups] ADD CONSTRAINT [gemini_adgroups_adgroupid_pk] PRIMARY KEY CLUSTERED  ([adgroupid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_globalsecurityschemeroles]'
GO
CREATE TABLE [dbo].[gemini_globalsecurityschemeroles]
(
[schemeroleid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[schemeid] [numeric] (10, 0) NOT NULL,
[schemerole] [numeric] (10, 0) NOT NULL,
[memberid] [numeric] (10, 0) NOT NULL,
[membertype] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_globalsecurityschemeroles_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_globalsecurityschemeroles_schemeroleid_pk] on [dbo].[gemini_globalsecurityschemeroles]'
GO
ALTER TABLE [dbo].[gemini_globalsecurityschemeroles] ADD CONSTRAINT [gemini_globalsecurityschemeroles_schemeroleid_pk] PRIMARY KEY CLUSTERED  ([schemeroleid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_globalsecurityschemeroles_schemeid] on [dbo].[gemini_globalsecurityschemeroles]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_globalsecurityschemeroles_schemeid] ON [dbo].[gemini_globalsecurityschemeroles] ([schemeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_globalsecurityschemeroles_schemerole] on [dbo].[gemini_globalsecurityschemeroles]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_globalsecurityschemeroles_schemerole] ON [dbo].[gemini_globalsecurityschemeroles] ([schemeid], [schemerole])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_globalsecurityschemeroles_membertype] on [dbo].[gemini_globalsecurityschemeroles]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_globalsecurityschemeroles_membertype] ON [dbo].[gemini_globalsecurityschemeroles] ([membertype])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_admappings]'
GO
CREATE TABLE [dbo].[gemini_admappings]
(
[mappingid] [int] NOT NULL IDENTITY(1, 1),
[adgroupid] [int] NOT NULL,
[lastsyncdate] [datetime] NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_admappings_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[projectgroupid] [numeric] (10, 0) NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_admappings_mappingid_pk] on [dbo].[gemini_admappings]'
GO
ALTER TABLE [dbo].[gemini_admappings] ADD CONSTRAINT [gemini_admappings_mappingid_pk] PRIMARY KEY CLUSTERED  ([mappingid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_admappings_projectgroupid] on [dbo].[gemini_admappings]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_admappings_projectgroupid] ON [dbo].[gemini_admappings] ([projectgroupid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_appointments]'
GO
CREATE TABLE [dbo].[gemini_appointments]
(
[appointmentid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NOT NULL,
[subject] [nvarchar] (2000) COLLATE Latin1_General_CI_AS NOT NULL,
[startdate] [datetime] NULL,
[enddate] [datetime] NULL,
[recurrencerule] [nvarchar] (500) COLLATE Latin1_General_CI_AS NULL,
[recurrencestate] [int] NULL,
[userid] [numeric] (10, 0) NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_appointments_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_appointments_appointment_pk] on [dbo].[gemini_appointments]'
GO
ALTER TABLE [dbo].[gemini_appointments] ADD CONSTRAINT [gemini_appointments_appointment_pk] PRIMARY KEY CLUSTERED  ([appointmentid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_appointments_projectid] on [dbo].[gemini_appointments]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_appointments_projectid] ON [dbo].[gemini_appointments] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_affectedversions]'
GO
CREATE TABLE [dbo].[gemini_affectedversions]
(
[affectedversionid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[issueid] [numeric] (10, 0) NOT NULL,
[versionid] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_affectedversions_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_affectedversions_affectedversionid_pk] on [dbo].[gemini_affectedversions]'
GO
ALTER TABLE [dbo].[gemini_affectedversions] ADD CONSTRAINT [gemini_affectedversions_affectedversionid_pk] PRIMARY KEY CLUSTERED  ([affectedversionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_affectedversions_issueid] on [dbo].[gemini_affectedversions]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_affectedversions_issueid] ON [dbo].[gemini_affectedversions] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_affectedversions_issueverid] on [dbo].[gemini_affectedversions]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [ind_gemini_affectedversions_issueverid] ON [dbo].[gemini_affectedversions] ([issueid], [versionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_watchissues]'
GO
CREATE TABLE [dbo].[gemini_watchissues]
(
[watchid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NOT NULL,
[issueid] [numeric] (10, 0) NOT NULL,
[userid] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_watchissues_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_watchissues_watchid_pk] on [dbo].[gemini_watchissues]'
GO
ALTER TABLE [dbo].[gemini_watchissues] ADD CONSTRAINT [gemini_watchissues_watchid_pk] PRIMARY KEY CLUSTERED  ([watchid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_watchissues_issueid] on [dbo].[gemini_watchissues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_watchissues_issueid] ON [dbo].[gemini_watchissues] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [uind_gemini_watchissues_id] on [dbo].[gemini_watchissues]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [uind_gemini_watchissues_id] ON [dbo].[gemini_watchissues] ([issueid], [userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_watchissues_userid] on [dbo].[gemini_watchissues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_watchissues_userid] ON [dbo].[gemini_watchissues] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_projectversionattributevalues]'
GO
CREATE TABLE [dbo].[gemini_projectversionattributevalues]
(
[attributevalueid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[attributeid] [numeric] (10, 0) NOT NULL,
[projectid] [numeric] (10, 0) NOT NULL,
[versionid] [numeric] (10, 0) NOT NULL,
[attributevalue] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projectversionattributesvalues_attributvalue_def] DEFAULT (N''),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_projectversionattributevalues_attributevalueid_pk] on [dbo].[gemini_projectversionattributevalues]'
GO
ALTER TABLE [dbo].[gemini_projectversionattributevalues] ADD CONSTRAINT [gemini_projectversionattributevalues_attributevalueid_pk] PRIMARY KEY CLUSTERED  ([attributevalueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectversionattributevalues_attributeid] on [dbo].[gemini_projectversionattributevalues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectversionattributevalues_attributeid] ON [dbo].[gemini_projectversionattributevalues] ([attributeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectversionattributevalues_projectid] on [dbo].[gemini_projectversionattributevalues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectversionattributevalues_projectid] ON [dbo].[gemini_projectversionattributevalues] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectversionattributevalues_versionid] on [dbo].[gemini_projectversionattributevalues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectversionattributevalues_versionid] ON [dbo].[gemini_projectversionattributevalues] ([versionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_projectversionattributes]'
GO
CREATE TABLE [dbo].[gemini_projectversionattributes]
(
[attributeid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NOT NULL,
[attributename] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[attributeorder] [int] NOT NULL CONSTRAINT [gemini_projectversionattributes_attributeorder_def] DEFAULT ((0)),
[defaultvalue] [nvarchar] (2000) COLLATE Latin1_General_CI_AS NOT NULL,
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_projectversionattributes_attributeid_pk] on [dbo].[gemini_projectversionattributes]'
GO
ALTER TABLE [dbo].[gemini_projectversionattributes] ADD CONSTRAINT [gemini_projectversionattributes_attributeid_pk] PRIMARY KEY CLUSTERED  ([attributeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectversionattributes_projecctid] on [dbo].[gemini_projectversionattributes]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectversionattributes_projecctid] ON [dbo].[gemini_projectversionattributes] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issuewidgetdata]'
GO
CREATE TABLE [dbo].[gemini_issuewidgetdata]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[issueid] [numeric] (10, 0) NOT NULL,
[appid] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[controlid] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[value] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_issuewidgetdata_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issuewidgetdata_id_pk] on [dbo].[gemini_issuewidgetdata]'
GO
ALTER TABLE [dbo].[gemini_issuewidgetdata] ADD CONSTRAINT [gemini_issuewidgetdata_id_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuewidgetdata_issueid] on [dbo].[gemini_issuewidgetdata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issuewidgetdata_issueid] ON [dbo].[gemini_issuewidgetdata] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuewidgetdata_ids] on [dbo].[gemini_issuewidgetdata]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [ind_gemini_issuewidgetdata_ids] ON [dbo].[gemini_issuewidgetdata] ([issueid], [appid], [controlid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_globalconfigurationwidgetdata]'
GO
CREATE TABLE [dbo].[gemini_globalconfigurationwidgetdata]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[appid] [varchar] (38) COLLATE Latin1_General_CI_AS NOT NULL,
[value] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_globalconfigurationwidgetdata_created_def] DEFAULT (getutcdate()),
[projectid] [numeric] (10, 0) NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_globalconfigurationwidgetdata_watchid_pk] on [dbo].[gemini_globalconfigurationwidgetdata]'
GO
ALTER TABLE [dbo].[gemini_globalconfigurationwidgetdata] ADD CONSTRAINT [gemini_globalconfigurationwidgetdata_watchid_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_globalconfigurationwidgetdata_id] on [dbo].[gemini_globalconfigurationwidgetdata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_globalconfigurationwidgetdata_id] ON [dbo].[gemini_globalconfigurationwidgetdata] ([appid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_userwidgetdata]'
GO
CREATE TABLE [dbo].[gemini_userwidgetdata]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[userid] [numeric] (10, 0) NOT NULL,
[appid] [varchar] (38) COLLATE Latin1_General_CI_AS NOT NULL,
[controlid] [varchar] (38) COLLATE Latin1_General_CI_AS NOT NULL,
[value] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_userwidgetdata_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_userwidgetdata_watchid_pk] on [dbo].[gemini_userwidgetdata]'
GO
ALTER TABLE [dbo].[gemini_userwidgetdata] ADD CONSTRAINT [gemini_userwidgetdata_watchid_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_userwidgetdata_userid] on [dbo].[gemini_userwidgetdata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_userwidgetdata_userid] ON [dbo].[gemini_userwidgetdata] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [uind_gemini_userwidgetdata_id] on [dbo].[gemini_userwidgetdata]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [uind_gemini_userwidgetdata_id] ON [dbo].[gemini_userwidgetdata] ([userid], [appid], [controlid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_codecommits]'
GO
CREATE TABLE [dbo].[gemini_codecommits]
(
[commitid] [int] NOT NULL IDENTITY(1, 1),
[issueid] [numeric] (10, 0) NOT NULL,
[provider] [int] NOT NULL,
[comment] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[data] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[fullname] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_codecommits_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_codecommits_commitid_pk] on [dbo].[gemini_codecommits]'
GO
ALTER TABLE [dbo].[gemini_codecommits] ADD CONSTRAINT [gemini_codecommits_commitid_pk] PRIMARY KEY CLUSTERED  ([commitid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_codecommits_issueid] on [dbo].[gemini_codecommits]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_codecommits_issueid] ON [dbo].[gemini_codecommits] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_timerapps]'
GO
CREATE TABLE [dbo].[gemini_timerapps]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[appid] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[nodeid] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[runstatus] [int] NOT NULL,
[lastruntime] [datetime] NULL,
[nextruntime] [datetime] NULL,
[lasterrormessage] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[lastdebugmessage] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_timerapps_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_timerapps_id_pk] on [dbo].[gemini_timerapps]'
GO
ALTER TABLE [dbo].[gemini_timerapps] ADD CONSTRAINT [gemini_timerapps_id_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_timerapps_appid] on [dbo].[gemini_timerapps]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [ind_gemini_timerapps_appid] ON [dbo].[gemini_timerapps] ([appid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issuevotes]'
GO
CREATE TABLE [dbo].[gemini_issuevotes]
(
[voteid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[issueid] [numeric] (10, 0) NOT NULL,
[userid] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_issuevotes_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issuevotes_voteid_pk] on [dbo].[gemini_issuevotes]'
GO
ALTER TABLE [dbo].[gemini_issuevotes] ADD CONSTRAINT [gemini_issuevotes_voteid_pk] PRIMARY KEY CLUSTERED  ([voteid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuevotes_issueuser] on [dbo].[gemini_issuevotes]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [ind_gemini_issuevotes_issueuser] ON [dbo].[gemini_issuevotes] ([issueid], [userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_userissuesviews]'
GO
CREATE TABLE [dbo].[gemini_userissuesviews]
(
[itemid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[userid] [numeric] (10, 0) NOT NULL,
[projectid] [numeric] (10, 0) NULL,
[issueattribute] [int] NULL,
[customfieldid] [varchar] (100) COLLATE Latin1_General_CI_AS NULL,
[displayorder] [numeric] (10, 0) NOT NULL,
[viewtype] [numeric] (10, 0) NOT NULL CONSTRAINT [DF__gemini_us__viewt__6F0B5556] DEFAULT ((0)),
[tstamp] [timestamp] NOT NULL,
[appid] [varchar] (38) COLLATE Latin1_General_CI_AS NULL,
[controlid] [varchar] (38) COLLATE Latin1_General_CI_AS NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_userissuesviews_itemid_pk] on [dbo].[gemini_userissuesviews]'
GO
ALTER TABLE [dbo].[gemini_userissuesviews] ADD CONSTRAINT [gemini_userissuesviews_itemid_pk] PRIMARY KEY CLUSTERED  ([itemid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_userissuesview_userid] on [dbo].[gemini_userissuesviews]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_userissuesview_userid] ON [dbo].[gemini_userissuesviews] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_userissuesview_userid_project] on [dbo].[gemini_userissuesviews]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_userissuesview_userid_project] ON [dbo].[gemini_userissuesviews] ([userid], [projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_run_steps]'
GO
CREATE TABLE [dbo].[gemini_testing_run_steps]
(
[testrunstepid] [int] NOT NULL IDENTITY(1, 1),
[testrunid] [int] NOT NULL,
[testcaseid] [int] NOT NULL,
[stepid] [int] NOT NULL,
[steporder] [int] NOT NULL,
[stepdescription] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[expectedresult] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[actualresult] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[data] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[haspassed] [bit] NULL,
[createdby] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_testing_run_steps_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_run_steps_testrunstepid_pk] on [dbo].[gemini_testing_run_steps]'
GO
ALTER TABLE [dbo].[gemini_testing_run_steps] ADD CONSTRAINT [gemini_testing_run_steps_testrunstepid_pk] PRIMARY KEY CLUSTERED  ([testrunstepid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_run_steps_testrunid] on [dbo].[gemini_testing_run_steps]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_run_steps_testrunid] ON [dbo].[gemini_testing_run_steps] ([testrunid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [und_gemini_testing_run_steps_testrunid_stepid] on [dbo].[gemini_testing_run_steps]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [und_gemini_testing_run_steps_testrunid_stepid] ON [dbo].[gemini_testing_run_steps] ([testrunid], [stepid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_run_steps_testcaseid] on [dbo].[gemini_testing_run_steps]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_run_steps_testcaseid] ON [dbo].[gemini_testing_run_steps] ([testcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_run_steps_stepid] on [dbo].[gemini_testing_run_steps]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_run_steps_stepid] ON [dbo].[gemini_testing_run_steps] ([stepid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_run_steps_createdby] on [dbo].[gemini_testing_run_steps]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_run_steps_createdby] ON [dbo].[gemini_testing_run_steps] ([createdby])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_run_cases]'
GO
CREATE TABLE [dbo].[gemini_testing_run_cases]
(
[testruncaseid] [int] NOT NULL IDENTITY(1, 1),
[testrunid] [int] NOT NULL,
[testplanid] [int] NULL,
[testcaseid] [int] NOT NULL,
[projectid] [numeric] (10, 0) NOT NULL,
[haspassed] [bit] NULL,
[isclosed] [bit] NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_testing_run_cases_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[caseorder] [int] NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_run_cases_testruncaseid_pk] on [dbo].[gemini_testing_run_cases]'
GO
ALTER TABLE [dbo].[gemini_testing_run_cases] ADD CONSTRAINT [gemini_testing_run_cases_testruncaseid_pk] PRIMARY KEY CLUSTERED  ([testruncaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_run_cases_testrunid] on [dbo].[gemini_testing_run_cases]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_run_cases_testrunid] ON [dbo].[gemini_testing_run_cases] ([testrunid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_run_cases_testplanid] on [dbo].[gemini_testing_run_cases]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_run_cases_testplanid] ON [dbo].[gemini_testing_run_cases] ([testplanid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_run_cases_testcaseid] on [dbo].[gemini_testing_run_cases]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_run_cases_testcaseid] ON [dbo].[gemini_testing_run_cases] ([testcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_run_cases_projectid] on [dbo].[gemini_testing_run_cases]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_run_cases_projectid] ON [dbo].[gemini_testing_run_cases] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_plannerviews]'
GO
CREATE TABLE [dbo].[gemini_plannerviews]
(
[plannerviewid] [int] NOT NULL IDENTITY(1, 1),
[userid] [numeric] (10, 0) NULL,
[issuessequence] [varchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[axis1property] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[axis1sortdirection] [varchar] (5) COLLATE Latin1_General_CI_AS NOT NULL,
[axis2property] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[axis2sortdirection] [varchar] (5) COLLATE Latin1_General_CI_AS NOT NULL,
[orderbyproperty] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[orderbysortdirection] [varchar] (5) COLLATE Latin1_General_CI_AS NOT NULL,
[thenbyproperty] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[thenbysortdirection] [varchar] (5) COLLATE Latin1_General_CI_AS NOT NULL,
[colorbyproperty] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[swimlanelimit] [int] NOT NULL,
[laneslimit] [int] NOT NULL,
[zoomlevel] [int] NOT NULL,
[tottingmodeproperty] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[autolimit] [int] NOT NULL,
[daterangeproperty] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[paginginfo] [varchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_plannerviews_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_plannerviews_plannerviewid_pk] on [dbo].[gemini_plannerviews]'
GO
ALTER TABLE [dbo].[gemini_plannerviews] ADD CONSTRAINT [gemini_plannerviews_plannerviewid_pk] PRIMARY KEY CLUSTERED  ([plannerviewid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_plannerviews_userid] on [dbo].[gemini_plannerviews]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_plannerviews_userid] ON [dbo].[gemini_plannerviews] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_projectissuesequence]'
GO
CREATE TABLE [dbo].[gemini_projectissuesequence]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NULL,
[sequence] [varchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_projectissuesequence_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_projectissuesequence_id_pk] on [dbo].[gemini_projectissuesequence]'
GO
ALTER TABLE [dbo].[gemini_projectissuesequence] ADD CONSTRAINT [gemini_projectissuesequence_id_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectissuesequence_projectid] on [dbo].[gemini_projectissuesequence]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectissuesequence_projectid] ON [dbo].[gemini_projectissuesequence] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_cardissuesequence]'
GO
CREATE TABLE [dbo].[gemini_cardissuesequence]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[cardid] [int] NOT NULL,
[sequence] [varchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_cardissuesequence_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_cardissuesequence_projectid] on [dbo].[gemini_cardissuesequence]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_cardissuesequence_projectid] ON [dbo].[gemini_cardissuesequence] ([cardid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_history]'
GO
CREATE TABLE [dbo].[gemini_testing_history]
(
[historyid] [int] NOT NULL IDENTITY(1, 1),
[testplanid] [int] NULL,
[testcaseid] [int] NULL,
[testrunid] [int] NULL,
[stepid] [int] NULL,
[projectid] [numeric] (10, 0) NOT NULL,
[history] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[fullname] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_testing_history_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_history_historyid_pk] on [dbo].[gemini_testing_history]'
GO
ALTER TABLE [dbo].[gemini_testing_history] ADD CONSTRAINT [gemini_testing_history_historyid_pk] PRIMARY KEY CLUSTERED  ([historyid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_history_testplanid] on [dbo].[gemini_testing_history]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_history_testplanid] ON [dbo].[gemini_testing_history] ([testplanid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_history_testcaseid] on [dbo].[gemini_testing_history]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_history_testcaseid] ON [dbo].[gemini_testing_history] ([testcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_history_testrunid] on [dbo].[gemini_testing_history]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_history_testrunid] ON [dbo].[gemini_testing_history] ([testrunid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_history_stepid] on [dbo].[gemini_testing_history]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_history_stepid] ON [dbo].[gemini_testing_history] ([stepid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_history_projectid] on [dbo].[gemini_testing_history]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_history_projectid] ON [dbo].[gemini_testing_history] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_projectgroupmembership]'
GO
CREATE TABLE [dbo].[gemini_projectgroupmembership]
(
[projectgroupmembershipid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NULL,
[projectgroupid] [numeric] (10, 0) NOT NULL,
[userid] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_projectgroupmembership_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_projectgroupmembership_projectgroupmembershipid_pk] on [dbo].[gemini_projectgroupmembership]'
GO
ALTER TABLE [dbo].[gemini_projectgroupmembership] ADD CONSTRAINT [gemini_projectgroupmembership_projectgroupmembershipid_pk] PRIMARY KEY CLUSTERED  ([projectgroupmembershipid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectgroupmembership_projectid] on [dbo].[gemini_projectgroupmembership]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectgroupmembership_projectid] ON [dbo].[gemini_projectgroupmembership] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectgroupmembership_projectgroupid] on [dbo].[gemini_projectgroupmembership]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectgroupmembership_projectgroupid] ON [dbo].[gemini_projectgroupmembership] ([projectgroupid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectgroupmembership_userid] on [dbo].[gemini_projectgroupmembership]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectgroupmembership_userid] ON [dbo].[gemini_projectgroupmembership] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issueresources]'
GO
CREATE TABLE [dbo].[gemini_issueresources]
(
[issueresourceid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[issueid] [numeric] (10, 0) NOT NULL,
[userid] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_issueresources_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issueresources_issueresourceid_pk] on [dbo].[gemini_issueresources]'
GO
ALTER TABLE [dbo].[gemini_issueresources] ADD CONSTRAINT [gemini_issueresources_issueresourceid_pk] PRIMARY KEY CLUSTERED  ([issueresourceid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issueresources_id] on [dbo].[gemini_issueresources]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issueresources_id] ON [dbo].[gemini_issueresources] ([issueresourceid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issueresources_issueid] on [dbo].[gemini_issueresources]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issueresources_issueid] ON [dbo].[gemini_issueresources] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issueresources_issueuserid] on [dbo].[gemini_issueresources]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [ind_gemini_issueresources_issueuserid] ON [dbo].[gemini_issueresources] ([issueid], [userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issueresources_userid] on [dbo].[gemini_issueresources]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issueresources_userid] ON [dbo].[gemini_issueresources] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_apppermissions]'
GO
CREATE TABLE [dbo].[gemini_apppermissions]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[appguid] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[apppermissions] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_apppermissions_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_apppermissions_id_pk] on [dbo].[gemini_apppermissions]'
GO
ALTER TABLE [dbo].[gemini_apppermissions] ADD CONSTRAINT [gemini_apppermissions_id_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [gemini_apppermissions_appguid] on [dbo].[gemini_apppermissions]'
GO
CREATE NONCLUSTERED INDEX [gemini_apppermissions_appguid] ON [dbo].[gemini_apppermissions] ([appguid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_webnode]'
GO
CREATE TABLE [dbo].[gemini_webnode]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[nodeguid] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_webnode_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_webnode_id_pk] on [dbo].[gemini_webnode]'
GO
ALTER TABLE [dbo].[gemini_webnode] ADD CONSTRAINT [gemini_webnode_id_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_webnode_appguid] on [dbo].[gemini_webnode]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_webnode_appguid] ON [dbo].[gemini_webnode] ([nodeguid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_webnodedata]'
GO
CREATE TABLE [dbo].[gemini_webnodedata]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[nodeguid] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[datakey] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL,
[datavalue] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_webnodedata_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_webnodedata_id_pk] on [dbo].[gemini_webnodedata]'
GO
ALTER TABLE [dbo].[gemini_webnodedata] ADD CONSTRAINT [gemini_webnodedata_id_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_webnodedata_appguid] on [dbo].[gemini_webnodedata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_webnodedata_appguid] ON [dbo].[gemini_webnodedata] ([nodeguid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_sla]'
GO
CREATE TABLE [dbo].[gemini_sla]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[sequence] [int] NOT NULL,
[name] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[sladesc] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL,
[startrules] [int] NULL,
[pauserules] [int] NULL,
[resumerules] [int] NULL,
[stoprules] [int] NULL,
[interval] [int] NOT NULL,
[is24x7] [bit] NOT NULL,
[startdayhour] [int] NOT NULL,
[startdayminute] [int] NOT NULL,
[enddayhour] [int] NOT NULL,
[enddayminute] [int] NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_sla_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_sla_id_pk] on [dbo].[gemini_sla]'
GO
ALTER TABLE [dbo].[gemini_sla] ADD CONSTRAINT [gemini_sla_id_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issuecomponents]'
GO
CREATE TABLE [dbo].[gemini_issuecomponents]
(
[issuecomponentid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[issueid] [numeric] (10, 0) NOT NULL,
[componentid] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_issuecomponents_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issuecomponents_issuecomponentid_pk] on [dbo].[gemini_issuecomponents]'
GO
ALTER TABLE [dbo].[gemini_issuecomponents] ADD CONSTRAINT [gemini_issuecomponents_issuecomponentid_pk] PRIMARY KEY CLUSTERED  ([issuecomponentid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuecomponents_issueuserid] on [dbo].[gemini_issuecomponents]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [ind_gemini_issuecomponents_issueuserid] ON [dbo].[gemini_issuecomponents] ([issueid], [componentid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuecomponents_issueid] on [dbo].[gemini_issuecomponents]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issuecomponents_issueid] ON [dbo].[gemini_issuecomponents] ([componentid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_optoutemails]'
GO
CREATE TABLE [dbo].[gemini_optoutemails]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[userid] [numeric] (10, 0) NOT NULL,
[cardid] [int] NOT NULL,
[optouttype] [tinyint] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_optoutemails_id_pk] on [dbo].[gemini_optoutemails]'
GO
ALTER TABLE [dbo].[gemini_optoutemails] ADD CONSTRAINT [gemini_optoutemails_id_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [gemini_optoutemails_userid] on [dbo].[gemini_optoutemails]'
GO
CREATE NONCLUSTERED INDEX [gemini_optoutemails_userid] ON [dbo].[gemini_optoutemails] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [gemini_optoutemails_cardid] on [dbo].[gemini_optoutemails]'
GO
CREATE NONCLUSTERED INDEX [gemini_optoutemails_cardid] ON [dbo].[gemini_optoutemails] ([cardid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_versions]'
GO
CREATE TABLE [dbo].[gemini_versions]
(
[versionid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NOT NULL,
[versionnumber] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_versions_versionnumber_def] DEFAULT (''),
[versionname] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_versions_versionname_def] DEFAULT (''),
[versiondesc] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_versions_versiondesc_def] DEFAULT (''),
[versionorder] [int] NOT NULL CONSTRAINT [gemini_versions_versionorder_def] DEFAULT ((0)),
[versionarchived] [bit] NOT NULL CONSTRAINT [gemini_versions_versionarchived_def] DEFAULT ((0)),
[startdate] [datetime] NULL CONSTRAINT [gemini_versions_startdate_def] DEFAULT (getutcdate()),
[releasedate] [datetime] NULL CONSTRAINT [gemini_versions_releasedate_def] DEFAULT (getutcdate()),
[created] [datetime] NOT NULL CONSTRAINT [gemini_versions_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[parentversionid] [numeric] (10, 0) NULL,
[versionreleased] [bit] NOT NULL CONSTRAINT [gemini_versions_versionreleased_def] DEFAULT ((0))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_versions_versionid_pk] on [dbo].[gemini_versions]'
GO
ALTER TABLE [dbo].[gemini_versions] ADD CONSTRAINT [gemini_versions_versionid_pk] PRIMARY KEY CLUSTERED  ([versionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_versions_versionprojectid] on [dbo].[gemini_versions]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_versions_versionprojectid] ON [dbo].[gemini_versions] ([versionid], [projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_versions_projectid] on [dbo].[gemini_versions]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_versions_projectid] ON [dbo].[gemini_versions] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_versions_versionnumber] on [dbo].[gemini_versions]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_versions_versionnumber] ON [dbo].[gemini_versions] ([versionnumber])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_versionmilestone]'
GO
CREATE TABLE [dbo].[gemini_versionmilestone]
(
[milestoneid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[versionid] [numeric] (10, 0) NOT NULL,
[milestonename] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [gemini_versionmilestone_milestonename_def] DEFAULT (''),
[milestonedesc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [gemini_versionmilestone_milestonedesc_def] DEFAULT (''),
[milestonedate] [datetime] NOT NULL CONSTRAINT [gemini_versionmilestone_milestonedate_def] DEFAULT (getutcdate()),
[created] [datetime] NOT NULL CONSTRAINT [gemini_versionmilestone_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_versionmilestone_milestoneid_pk] on [dbo].[gemini_versionmilestone]'
GO
ALTER TABLE [dbo].[gemini_versionmilestone] ADD CONSTRAINT [gemini_versionmilestone_milestoneid_pk] PRIMARY KEY CLUSTERED  ([milestoneid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issues]'
GO
CREATE TABLE [dbo].[gemini_issues]
(
[issueid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NOT NULL,
[fixedinversionid] [numeric] (10, 0) NULL,
[reportedby] [numeric] (10, 0) NOT NULL,
[summary] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issues_summary_def] DEFAULT (''),
[longdesc] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[issuetypeid] [numeric] (10, 0) NOT NULL,
[issuepriorityid] [numeric] (10, 0) NOT NULL,
[issueseverityid] [numeric] (10, 0) NOT NULL CONSTRAINT [DF__gemini_is__issue__3528CC84] DEFAULT ((1)),
[issuestatusid] [numeric] (10, 0) NOT NULL,
[issueresolutionid] [numeric] (10, 0) NOT NULL,
[userdata1] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issues_userdata1_def] DEFAULT (''),
[userdata2] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issues_userdata2_def] DEFAULT (''),
[userdata3] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issues_userdata3_def] DEFAULT (''),
[percentcomplete] [int] NOT NULL CONSTRAINT [gemini_issues_percentcomplete_def] DEFAULT ((0)),
[estimatehours] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_issues_estimatedhours_def] DEFAULT ((0)),
[estimateminutes] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_issues_estimatedminutes_def] DEFAULT ((0)),
[startdate] [datetime] NULL,
[duedate] [datetime] NULL,
[visibility] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_issues_visibility_def] DEFAULT ((1)),
[parentissueid] [numeric] (10, 0) NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_issues_created_def] DEFAULT (getutcdate()),
[revised] [datetime] NOT NULL CONSTRAINT [gemini_issues_revised_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[resolveddate] [datetime] NULL,
[closeddate] [datetime] NULL,
[originatortype] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_issues_originatortype_def] DEFAULT ((0)),
[originatorreply] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_issues_originatorreply_def] DEFAULT ((0)),
[originatordata] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[originatorprocessed] [datetime] NULL,
[isparent] [bit] NOT NULL CONSTRAINT [gemini_issues_isparent_def] DEFAULT ((0)),
[hierarchykey] [varchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issues_hierarchykey_def] DEFAULT (''),
[repeated] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issues_repeated_def] DEFAULT (''),
[loggedhours] [int] NOT NULL CONSTRAINT [gemini_issues_loggedhours_def] DEFAULT ((0)),
[loggedminutes] [int] NOT NULL CONSTRAINT [gemini_issues_loggedminutes_def] DEFAULT ((0)),
[affectedversions] [varchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issues_affectedversions_def] DEFAULT (''),
[resources] [varchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issues_resources_def] DEFAULT (''),
[components] [varchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issues_components_def] DEFAULT (''),
[votes] [int] NOT NULL CONSTRAINT [gemini_issues_votes_def] DEFAULT ((0)),
[mailboxid] [numeric] (10, 0) NULL,
[watchers] [varchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issues_watchers_def] DEFAULT (''),
[points] [int] NOT NULL CONSTRAINT [gemini_issues_points_def] DEFAULT ((0)),
[creator] [numeric] (10, 0) NOT NULL,
[slaid] [int] NULL,
[slastatus] [int] NULL,
[slaresolution] [int] NULL,
[slaresolutiondate] [datetime] NULL,
[slastatusdate] [datetime] NULL,
[slastatustimepassed] [int] NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issues_issueid_pk] on [dbo].[gemini_issues]'
GO
ALTER TABLE [dbo].[gemini_issues] ADD CONSTRAINT [gemini_issues_issueid_pk] PRIMARY KEY CLUSTERED  ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_projectid] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_projectid] ON [dbo].[gemini_issues] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_fixedinversionid] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_fixedinversionid] ON [dbo].[gemini_issues] ([fixedinversionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_reportedby] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_reportedby] ON [dbo].[gemini_issues] ([reportedby])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_issuetypeid] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_issuetypeid] ON [dbo].[gemini_issues] ([issuetypeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_issuepriorityid] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_issuepriorityid] ON [dbo].[gemini_issues] ([issuepriorityid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_issueseverityid] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_issueseverityid] ON [dbo].[gemini_issues] ([issueseverityid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_issuestatusid] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_issuestatusid] ON [dbo].[gemini_issues] ([issuestatusid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_issueresolutionid] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_issueresolutionid] ON [dbo].[gemini_issues] ([issueresolutionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_estimatehours] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_estimatehours] ON [dbo].[gemini_issues] ([estimatehours])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_estimateminutes] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_estimateminutes] ON [dbo].[gemini_issues] ([estimateminutes])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_startdate] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_startdate] ON [dbo].[gemini_issues] ([startdate])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_duedate] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_duedate] ON [dbo].[gemini_issues] ([duedate])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_visibility] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_visibility] ON [dbo].[gemini_issues] ([visibility])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_parentissueid] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_parentissueid] ON [dbo].[gemini_issues] ([parentissueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_created] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_created] ON [dbo].[gemini_issues] ([created])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_revised] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_revised] ON [dbo].[gemini_issues] ([revised])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_closeddate] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_closeddate] ON [dbo].[gemini_issues] ([closeddate])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_repeated] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_repeated] ON [dbo].[gemini_issues] ([repeated])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_slaid] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_slaid] ON [dbo].[gemini_issues] ([slaid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_slastatus] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_slastatus] ON [dbo].[gemini_issues] ([slastatus])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issues_slaresolution] on [dbo].[gemini_issues]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issues_slaresolution] ON [dbo].[gemini_issues] ([slaresolution])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issuetimetype]'
GO
CREATE TABLE [dbo].[gemini_issuetimetype]
(
[timetypeid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[timetypename] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [gemini_issuetimetype_timetypename_def] DEFAULT (''),
[timetypedesc] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [gemini_issuetimetype_timetypedesc_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [gemini_issuetimetype_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[templateid] [int] NOT NULL CONSTRAINT [gemini_issuetimetype_templateid_def] DEFAULT ((1)),
[seq] [int] NOT NULL CONSTRAINT [gemini_issuetimetype_seq_def] DEFAULT ((0))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issuetimetype_timetypeID_pk] on [dbo].[gemini_issuetimetype]'
GO
ALTER TABLE [dbo].[gemini_issuetimetype] ADD CONSTRAINT [gemini_issuetimetype_timetypeID_pk] PRIMARY KEY CLUSTERED  ([timetypeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[breeze_queue]'
GO
CREATE TABLE [dbo].[breeze_queue]
(
[queueid] [int] NOT NULL IDENTITY(1, 1),
[name] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_queue_name_def] DEFAULT (''),
[queuedescription] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_queue_queuedescription_def] DEFAULT (''),
[userid] [int] NOT NULL CONSTRAINT [breeze_queue_userid_def] DEFAULT ((0)),
[visibility] [varchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_queue_visibility_def] DEFAULT (''),
[colour] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_queue_color_def] DEFAULT ('white'),
[sequence] [int] NOT NULL CONSTRAINT [breeze_queue_sequence_def] DEFAULT ((0)),
[projectid] [int] NOT NULL CONSTRAINT [breeze_queue_projectid_def] DEFAULT ((0)),
[active] [bit] NOT NULL CONSTRAINT [breeze_queue_active_def] DEFAULT ((0)),
[created] [datetime] NOT NULL CONSTRAINT [breeze_queue_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [breeze_queue_queueid_pk] on [dbo].[breeze_queue]'
GO
ALTER TABLE [dbo].[breeze_queue] ADD CONSTRAINT [breeze_queue_queueid_pk] PRIMARY KEY CLUSTERED  ([queueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issueresolutions]'
GO
CREATE TABLE [dbo].[gemini_issueresolutions]
(
[resolutionid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[seq] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_issueresolutions_seq_def] DEFAULT ((0)),
[isfinal] [bit] NOT NULL CONSTRAINT [gemini_issueresolutions_isfinal_def] DEFAULT ((0)),
[resdesc] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[tstamp] [timestamp] NOT NULL,
[templateid] [int] NOT NULL CONSTRAINT [gemini_issuereolutions_templateid_def] DEFAULT ((1))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issueresolutions_resolutionid_pk] on [dbo].[gemini_issueresolutions]'
GO
ALTER TABLE [dbo].[gemini_issueresolutions] ADD CONSTRAINT [gemini_issueresolutions_resolutionid_pk] PRIMARY KEY CLUSTERED  ([resolutionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issueresolutions_seq] on [dbo].[gemini_issueresolutions]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issueresolutions_seq] ON [dbo].[gemini_issueresolutions] ([seq])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[breeze_matchexpression]'
GO
CREATE TABLE [dbo].[breeze_matchexpression]
(
[expressionid] [bigint] NOT NULL IDENTITY(1, 1),
[name] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_matchexpression_name_def] DEFAULT (''),
[expression] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_matchexpression_expression_def] DEFAULT (''),
[replacevalue] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_matchexpression_replacevalue_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [breeze_matchexpression_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [breeze_matchexpression_expressionid_pk] on [dbo].[breeze_matchexpression]'
GO
ALTER TABLE [dbo].[breeze_matchexpression] ADD CONSTRAINT [breeze_matchexpression_expressionid_pk] PRIMARY KEY CLUSTERED  ([expressionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_plan_cases]'
GO
CREATE TABLE [dbo].[gemini_testing_plan_cases]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[testplanid] [int] NOT NULL,
[testcaseid] [int] NOT NULL,
[testcaseorder] [int] NOT NULL,
[createdby] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_testing_plan_cases_created_def] DEFAULT (getutcdate()),
[revised] [datetime] NOT NULL CONSTRAINT [gemini_testing_plan_cases_revised_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_plan_cases_id_pk] on [dbo].[gemini_testing_plan_cases]'
GO
ALTER TABLE [dbo].[gemini_testing_plan_cases] ADD CONSTRAINT [gemini_testing_plan_cases_id_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_plan_cases_testplanid] on [dbo].[gemini_testing_plan_cases]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_plan_cases_testplanid] ON [dbo].[gemini_testing_plan_cases] ([testplanid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_plan_cases_testcaseid] on [dbo].[gemini_testing_plan_cases]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_plan_cases_testcaseid] ON [dbo].[gemini_testing_plan_cases] ([testcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_components]'
GO
CREATE TABLE [dbo].[gemini_components]
(
[componentid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NOT NULL,
[componentname] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_components_componentname_def] DEFAULT (''),
[componentdesc] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_components_componentdesc_def] DEFAULT (''),
[userid] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_components_userid_def] DEFAULT ((-1)),
[parentcomponentid] [numeric] (10, 0) NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_components_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[componentorder] [int] NOT NULL CONSTRAINT [gemini_components_componentorder_def] DEFAULT ((0)),
[componentreadonly] [bit] NOT NULL CONSTRAINT [gemini_components_componentreadonly_def] DEFAULT ((0))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_components_componentid_pk] on [dbo].[gemini_components]'
GO
ALTER TABLE [dbo].[gemini_components] ADD CONSTRAINT [gemini_components_componentid_pk] PRIMARY KEY CLUSTERED  ([componentid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_components_projectid] on [dbo].[gemini_components]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_components_projectid] ON [dbo].[gemini_components] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_alerttemplates]'
GO
CREATE TABLE [dbo].[gemini_alerttemplates]
(
[alerttemplateid] [int] NOT NULL IDENTITY(1, 1),
[alerttype] [int] NULL CONSTRAINT [gemini_alerttemplates_alerttype_def] DEFAULT ((0)),
[label] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_alerttemplates_alertlabel_def] DEFAULT (''),
[alertcontent] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_alerttemplates_alertcontent_def] DEFAULT (''),
[projects] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_alerttemplates_projects_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [ggemini_alerttemplates_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[templatedata] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_alerttemplates_templatedata_def] DEFAULT ('')
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_alerttemplates_alerttemplateid_pk] on [dbo].[gemini_alerttemplates]'
GO
ALTER TABLE [dbo].[gemini_alerttemplates] ADD CONSTRAINT [gemini_alerttemplates_alerttemplateid_pk] PRIMARY KEY CLUSTERED  ([alerttemplateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issueaudit]'
GO
CREATE TABLE [dbo].[gemini_issueaudit]
(
[historyid] [int] NOT NULL IDENTITY(1, 1),
[issueid] [numeric] (10, 0) NOT NULL,
[projectid] [numeric] (10, 0) NOT NULL,
[userid] [numeric] (10, 0) NULL,
[username] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[attributechanged] [int] NOT NULL,
[fieldchanged] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[iscustom] [bit] NOT NULL,
[valuebefore] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issueaudit_valuebefore_def] DEFAULT (''),
[valueafter] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issueaudit_valueafter_def] DEFAULT (''),
[idbefore] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issueaudit_idbeforedef] DEFAULT (''),
[idafter] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issueaudit_idafter_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [gemini_issueaudit_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issueaudit_historyid_pk] on [dbo].[gemini_issueaudit]'
GO
ALTER TABLE [dbo].[gemini_issueaudit] ADD CONSTRAINT [gemini_issueaudit_historyid_pk] PRIMARY KEY CLUSTERED  ([historyid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issueaudit_issueid] on [dbo].[gemini_issueaudit]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issueaudit_issueid] ON [dbo].[gemini_issueaudit] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issueaudit_projectid] on [dbo].[gemini_issueaudit]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issueaudit_projectid] ON [dbo].[gemini_issueaudit] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issueattachments]'
GO
CREATE TABLE [dbo].[gemini_issueattachments]
(
[fileid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NOT NULL,
[issueid] [numeric] (10, 0) NOT NULL,
[commentid] [numeric] (10, 0) NULL,
[contenttype] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issueattachments_contenttype_def] DEFAULT (''),
[contentlength] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_issueattachments_contentlength_def] DEFAULT ((0)),
[thefilename] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issueattachments_thefilename_def] DEFAULT (''),
[filecontent] [varbinary] (max) NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_issueattachments_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issueattachments_fileid_pk] on [dbo].[gemini_issueattachments]'
GO
ALTER TABLE [dbo].[gemini_issueattachments] ADD CONSTRAINT [gemini_issueattachments_fileid_pk] PRIMARY KEY CLUSTERED  ([fileid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issueattachments_issueid] on [dbo].[gemini_issueattachments]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issueattachments_issueid] ON [dbo].[gemini_issueattachments] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_projectattributes]'
GO
CREATE TABLE [dbo].[gemini_projectattributes]
(
[attributeid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NOT NULL,
[attributename] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[attributevalue] [nvarchar] (2000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projectattributes_attributevalue_def] DEFAULT (N''),
[attributeorder] [int] NOT NULL CONSTRAINT [gemini_projectattributes_attributeorder_def] DEFAULT ((0)),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_projectattributes_attributeid_pk] on [dbo].[gemini_projectattributes]'
GO
ALTER TABLE [dbo].[gemini_projectattributes] ADD CONSTRAINT [gemini_projectattributes_attributeid_pk] PRIMARY KEY CLUSTERED  ([attributeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectattributes_projectid] on [dbo].[gemini_projectattributes]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectattributes_projectid] ON [dbo].[gemini_projectattributes] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issuepriorities]'
GO
CREATE TABLE [dbo].[gemini_issuepriorities]
(
[priorityid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[seq] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_issuepriorities_seq_def] DEFAULT ((0)),
[prioritydesc] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[imagepath] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[tstamp] [timestamp] NOT NULL,
[color] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issuepriorities_color_def] DEFAULT ('#A9A9A9'),
[templateid] [int] NOT NULL CONSTRAINT [gemini_issuepriorities_templateid_def] DEFAULT ((1))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issuepriorities_priorityid_pk] on [dbo].[gemini_issuepriorities]'
GO
ALTER TABLE [dbo].[gemini_issuepriorities] ADD CONSTRAINT [gemini_issuepriorities_priorityid_pk] PRIMARY KEY CLUSTERED  ([priorityid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuepriorities_id] on [dbo].[gemini_issuepriorities]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [ind_gemini_issuepriorities_id] ON [dbo].[gemini_issuepriorities] ([priorityid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuepriorities_desc] on [dbo].[gemini_issuepriorities]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issuepriorities_desc] ON [dbo].[gemini_issuepriorities] ([prioritydesc])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_projectaudit]'
GO
CREATE TABLE [dbo].[gemini_projectaudit]
(
[historyid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NOT NULL,
[userid] [numeric] (10, 0) NULL,
[username] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[projectarea] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[useraction] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projectaudit_useraction_def] DEFAULT (''),
[touched] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projectaudit_touched_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [gemini_projectaudit_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_projectaudit_historyid_pk] on [dbo].[gemini_projectaudit]'
GO
ALTER TABLE [dbo].[gemini_projectaudit] ADD CONSTRAINT [gemini_projectaudit_historyid_pk] PRIMARY KEY CLUSTERED  ([historyid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectaudit_projectid] on [dbo].[gemini_projectaudit]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectaudit_projectid] ON [dbo].[gemini_projectaudit] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectaudit_userid] on [dbo].[gemini_projectaudit]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectaudit_userid] ON [dbo].[gemini_projectaudit] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_attachments]'
GO
CREATE TABLE [dbo].[gemini_testing_attachments]
(
[attachmentid] [int] NOT NULL IDENTITY(1, 1),
[testplanid] [int] NULL,
[testcaseid] [int] NULL,
[testrunid] [int] NULL,
[stepid] [int] NULL,
[projectid] [numeric] (10, 0) NOT NULL,
[contenttype] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_testing_attachments_contenttype_def] DEFAULT (''),
[contentlength] [int] NOT NULL CONSTRAINT [gemini_testing_attachments_contentlength_def] DEFAULT ((0)),
[thefilename] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_testing_attachments_thefilename_def] DEFAULT (''),
[filecontent] [varbinary] (max) NULL,
[createdby] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_testing_attachments_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_attachments_attachmentid_pk] on [dbo].[gemini_testing_attachments]'
GO
ALTER TABLE [dbo].[gemini_testing_attachments] ADD CONSTRAINT [gemini_testing_attachments_attachmentid_pk] PRIMARY KEY CLUSTERED  ([attachmentid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_attachments_testplanid] on [dbo].[gemini_testing_attachments]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_attachments_testplanid] ON [dbo].[gemini_testing_attachments] ([testplanid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_attachments_testcaseid] on [dbo].[gemini_testing_attachments]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_attachments_testcaseid] ON [dbo].[gemini_testing_attachments] ([testcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_attachments_testrunid] on [dbo].[gemini_testing_attachments]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_attachments_testrunid] ON [dbo].[gemini_testing_attachments] ([testrunid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_attachments_stepid] on [dbo].[gemini_testing_attachments]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_attachments_stepid] ON [dbo].[gemini_testing_attachments] ([stepid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_attachments_createdby] on [dbo].[gemini_testing_attachments]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_attachments_createdby] ON [dbo].[gemini_testing_attachments] ([createdby])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issuelinks]'
GO
CREATE TABLE [dbo].[gemini_issuelinks]
(
[issuelinkid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[linktypeid] [numeric] (10, 0) NOT NULL,
[issueid] [numeric] (10, 0) NOT NULL,
[otherissueid] [numeric] (10, 0) NOT NULL,
[linkdirection] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issuelinks_linkdirection_def] DEFAULT (N'O'),
[created] [datetime] NOT NULL CONSTRAINT [gemini_issuelinks_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issuelinks_issuelinkid_pk] on [dbo].[gemini_issuelinks]'
GO
ALTER TABLE [dbo].[gemini_issuelinks] ADD CONSTRAINT [gemini_issuelinks_issuelinkid_pk] PRIMARY KEY CLUSTERED  ([issuelinkid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuelinks_linktypeid] on [dbo].[gemini_issuelinks]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issuelinks_linktypeid] ON [dbo].[gemini_issuelinks] ([linktypeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuelinks_issueid] on [dbo].[gemini_issuelinks]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issuelinks_issueid] ON [dbo].[gemini_issuelinks] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuelinks_issueids] on [dbo].[gemini_issuelinks]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issuelinks_issueids] ON [dbo].[gemini_issuelinks] ([issueid], [otherissueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuelinks_otherissueid] on [dbo].[gemini_issuelinks]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issuelinks_otherissueid] ON [dbo].[gemini_issuelinks] ([otherissueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issuetypes]'
GO
CREATE TABLE [dbo].[gemini_issuetypes]
(
[typeid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[seq] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_issuetypes_seq_def] DEFAULT ((0)),
[typedesc] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[imagepath] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[tstamp] [timestamp] NOT NULL,
[color] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issuetypes_color_def] DEFAULT ('#A9A9A9'),
[screen] [varchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issuetypes_screen_def] DEFAULT (''),
[workflow] [varchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issuetypes_workflow_def] DEFAULT (''),
[tag] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issuetypes_tag_def] DEFAULT (''),
[templateid] [int] NOT NULL CONSTRAINT [gemini_issuetypes_templateid_def] DEFAULT ((1))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issuetypes_typeid_pk] on [dbo].[gemini_issuetypes]'
GO
ALTER TABLE [dbo].[gemini_issuetypes] ADD CONSTRAINT [gemini_issuetypes_typeid_pk] PRIMARY KEY CLUSTERED  ([typeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuetypes_typeid] on [dbo].[gemini_issuetypes]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [ind_gemini_issuetypes_typeid] ON [dbo].[gemini_issuetypes] ([typeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuetypes_desc] on [dbo].[gemini_issuetypes]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issuetypes_desc] ON [dbo].[gemini_issuetypes] ([typedesc])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_customdata]'
GO
CREATE TABLE [dbo].[gemini_testing_customdata]
(
[testcustomfielddataid] [int] NOT NULL IDENTITY(1, 1),
[customfieldid] [numeric] (10, 0) NOT NULL,
[userid] [numeric] (10, 0) NOT NULL,
[projectid] [numeric] (10, 0) NOT NULL,
[testplanid] [int] NULL,
[testcaseid] [int] NULL,
[testrunid] [int] NULL,
[stepid] [int] NULL,
[fielddata] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_testing_customdata_fielddata_def] DEFAULT (''),
[filedata] [varbinary] (max) NULL,
[numericdata] [numeric] (15, 5) NULL,
[datedata] [datetime] NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_testing_customdata_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_customdata_testcustomfielddataid_pk] on [dbo].[gemini_testing_customdata]'
GO
ALTER TABLE [dbo].[gemini_testing_customdata] ADD CONSTRAINT [gemini_testing_customdata_testcustomfielddataid_pk] PRIMARY KEY CLUSTERED  ([testcustomfielddataid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_customdata_customfieldid] on [dbo].[gemini_testing_customdata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_customdata_customfieldid] ON [dbo].[gemini_testing_customdata] ([customfieldid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_customdata_userid] on [dbo].[gemini_testing_customdata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_customdata_userid] ON [dbo].[gemini_testing_customdata] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_customdata_projectid] on [dbo].[gemini_testing_customdata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_customdata_projectid] ON [dbo].[gemini_testing_customdata] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_customdata_testplanid] on [dbo].[gemini_testing_customdata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_customdata_testplanid] ON [dbo].[gemini_testing_customdata] ([testplanid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_customdata_testcaseid] on [dbo].[gemini_testing_customdata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_customdata_testcaseid] ON [dbo].[gemini_testing_customdata] ([testcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_customdata_testrunid] on [dbo].[gemini_testing_customdata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_customdata_testrunid] ON [dbo].[gemini_testing_customdata] ([testrunid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_customdata_stepid] on [dbo].[gemini_testing_customdata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_customdata_stepid] ON [dbo].[gemini_testing_customdata] ([stepid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[breeze_mailbox]'
GO
CREATE TABLE [dbo].[breeze_mailbox]
(
[mailboxid] [int] NOT NULL IDENTITY(1, 1),
[queueid] [int] NOT NULL,
[mailboxname] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_mailboxname_def] DEFAULT (''),
[server] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_server_def] DEFAULT (''),
[serverport] [int] NOT NULL CONSTRAINT [breeze_mailbox_serverport_def] DEFAULT ((0)),
[emailaddress] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_emailaddress_def] DEFAULT (''),
[username] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_username_def] DEFAULT (''),
[password] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_password_def] DEFAULT (''),
[authenticationmode] [int] NOT NULL CONSTRAINT [breeze_mailbox_authenticationmode_def] DEFAULT ((0)),
[usessl] [bit] NOT NULL CONSTRAINT [breeze_mailbox_usessl_def] DEFAULT ((0)),
[deletemessages] [bit] NOT NULL CONSTRAINT [breeze_mailbox_deletemessages_def] DEFAULT ((0)),
[debugmode] [bit] NOT NULL CONSTRAINT [breeze_mailbox_incomingdebugmode_def] DEFAULT ((0)),
[userid] [int] NOT NULL CONSTRAINT [breeze_mailbox_userid_def] DEFAULT ((0)),
[usesenderassubmitter] [bit] NOT NULL CONSTRAINT [breeze_mailbox_usesenderassubmitter_def] DEFAULT ((0)),
[mode] [int] NOT NULL CONSTRAINT [breeze_mailbox_mode_def] DEFAULT ((0)),
[imapfolder] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_imapfolder_def] DEFAULT (''),
[blacklist] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_blacklist_def] DEFAULT (''),
[noreplylist] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_noreplylist_def] DEFAULT (''),
[lastmessageid] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[lastmessagedate] [datetime] NULL,
[alerttemplateid] [int] NULL,
[smtpserverid] [int] NULL,
[stripsignature] [bit] NOT NULL CONSTRAINT [breeze_mailbox_stripsignature_def] DEFAULT ((0)),
[ignoreattachments] [bit] NOT NULL CONSTRAINT [breeze_mailbox_ignoreattachments_def] DEFAULT ((0)),
[subjectlikeexp] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_subjectlikeexp_def] DEFAULT (''),
[subjectnotlikeexp] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_subjectnotlikeexp_def] DEFAULT (''),
[replaceexp] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_replaceexp_def] DEFAULT (''),
[truncateexp] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_truncateexp_def] DEFAULT (''),
[projectid] [int] NULL,
[created] [datetime] NOT NULL CONSTRAINT [breeze_mailbox_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[issuetypeid] [int] NULL,
[options] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_options_def] DEFAULT (''),
[domain] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL,
[exchangeversion] [int] NULL,
[whitelist] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailbox_whitelist_def] DEFAULT ('')
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [breeze_mailbox_mailboxid_pk] on [dbo].[breeze_mailbox]'
GO
ALTER TABLE [dbo].[breeze_mailbox] ADD CONSTRAINT [breeze_mailbox_mailboxid_pk] PRIMARY KEY CLUSTERED  ([mailboxid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[breeze_smtpserver]'
GO
CREATE TABLE [dbo].[breeze_smtpserver]
(
[smtpserverid] [int] NOT NULL IDENTITY(1, 1),
[smtpservername] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_smtpserver_smtpservername_def] DEFAULT (''),
[server] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_smtpserver_server_def] DEFAULT (''),
[serverport] [int] NOT NULL CONSTRAINT [breeze_smtpserver_serverport_def] DEFAULT ((0)),
[username] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_smtpserver_username_def] DEFAULT (''),
[password] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_smtpserver_password_def] DEFAULT (''),
[encodingtype] [int] NOT NULL CONSTRAINT [breeze_smtpserver_encodingtype_def] DEFAULT ((0)),
[usessl] [bit] NOT NULL CONSTRAINT [breeze_smtpserver_usessl_def] DEFAULT ((0)),
[sslmode] [int] NOT NULL CONSTRAINT [breeze_smtpserver_sslmode_def] DEFAULT ((0)),
[authmode] [int] NOT NULL CONSTRAINT [breeze_smtpserver_authmode_def] DEFAULT ((0)),
[popbeforesmtp] [bit] NOT NULL CONSTRAINT [breeze_smtpserver_popbeforesmtp_def] DEFAULT ((0)),
[created] [datetime] NOT NULL CONSTRAINT [breeze_smtpserver_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [breeze_smtpserver_smtpserverid_pk] on [dbo].[breeze_smtpserver]'
GO
ALTER TABLE [dbo].[breeze_smtpserver] ADD CONSTRAINT [breeze_smtpserver_smtpserverid_pk] PRIMARY KEY CLUSTERED  ([smtpserverid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_projecttemplate]'
GO
CREATE TABLE [dbo].[gemini_projecttemplate]
(
[templateid] [int] NOT NULL IDENTITY(1, 1),
[templatekey] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[title] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projecttemplate_title_def] DEFAULT (''),
[descrip] [nvarchar] (2000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projecttemplate_descrip_def] DEFAULT (''),
[author] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projecttemplate_author_def] DEFAULT (''),
[published] [datetime] NOT NULL CONSTRAINT [gemini_projecttemplate_published_def] DEFAULT (getutcdate()),
[versionnumber] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projecttemplate_versionnumber_def] DEFAULT (''),
[template] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projecttemplate_template_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [gemini_projecttemplate_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_projecttemplate_templateid_pk] on [dbo].[gemini_projecttemplate]'
GO
ALTER TABLE [dbo].[gemini_projecttemplate] ADD CONSTRAINT [gemini_projecttemplate_templateid_pk] PRIMARY KEY CLUSTERED  ([templateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projecttemplate_templateid] on [dbo].[gemini_projecttemplate]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projecttemplate_templateid] ON [dbo].[gemini_projecttemplate] ([templateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projecttemplate_templatekey] on [dbo].[gemini_projecttemplate]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projecttemplate_templatekey] ON [dbo].[gemini_projecttemplate] ([templatekey])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_projectgroups]'
GO
CREATE TABLE [dbo].[gemini_projectgroups]
(
[projectgroupid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectgroupname] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projectgroups_projectgroupname_def] DEFAULT (''),
[projectgroupdesc] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projectgroups_projectgroupdesc_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [gemini_projectgroups_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[interactiongroups] [varchar] (max) COLLATE Latin1_General_CI_AS NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_projectgroups_projectgroupid_pk] on [dbo].[gemini_projectgroups]'
GO
ALTER TABLE [dbo].[gemini_projectgroups] ADD CONSTRAINT [gemini_projectgroups_projectgroupid_pk] PRIMARY KEY CLUSTERED  ([projectgroupid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_cases]'
GO
CREATE TABLE [dbo].[gemini_testing_cases]
(
[testcaseid] [int] NOT NULL IDENTITY(1, 1),
[summary] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_testing_cases_summary_def] DEFAULT (''),
[testcasedescription] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_testing_cases_description_def] DEFAULT (''),
[typeid] [int] NOT NULL,
[assignedto] [numeric] (10, 0) NULL,
[preconditions] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_testing_cases_preconditions_def] DEFAULT (''),
[expectedresult] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_testing_cases_expectedresult_def] DEFAULT (''),
[originaltestcaseid] [int] NULL,
[projectid] [numeric] (10, 0) NOT NULL,
[parenttestcaseid] [int] NULL,
[isautomated] [bit] NOT NULL,
[isparent] [bit] NOT NULL,
[isfolder] [bit] NOT NULL,
[isclosed] [bit] NOT NULL,
[haspassed] [bit] NULL,
[createdby] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_testing_cases_created_def] DEFAULT (getutcdate()),
[revised] [datetime] NOT NULL CONSTRAINT [gemini_testing_cases_revised_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_cases_testcaseid_pk] on [dbo].[gemini_testing_cases]'
GO
ALTER TABLE [dbo].[gemini_testing_cases] ADD CONSTRAINT [gemini_testing_cases_testcaseid_pk] PRIMARY KEY CLUSTERED  ([testcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_cases_typeid] on [dbo].[gemini_testing_cases]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_cases_typeid] ON [dbo].[gemini_testing_cases] ([typeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_cases_assignedto] on [dbo].[gemini_testing_cases]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_cases_assignedto] ON [dbo].[gemini_testing_cases] ([assignedto])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_cases_originaltestcaseid] on [dbo].[gemini_testing_cases]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_cases_originaltestcaseid] ON [dbo].[gemini_testing_cases] ([originaltestcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_cases_projectid] on [dbo].[gemini_testing_cases]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_cases_projectid] ON [dbo].[gemini_testing_cases] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_cases_createdby] on [dbo].[gemini_testing_cases]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_cases_createdby] ON [dbo].[gemini_testing_cases] ([createdby])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issuestatus]'
GO
CREATE TABLE [dbo].[gemini_issuestatus]
(
[statusid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[isfinal] [bit] NOT NULL CONSTRAINT [gemini_issuestatus_isfinal_def] DEFAULT ((0)),
[statusdesc] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL,
[statustype] [int] NOT NULL CONSTRAINT [gemini_issuestatus_statustype_def] DEFAULT ((0)),
[imagepath] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL,
[comment] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL,
[tstamp] [timestamp] NOT NULL,
[color] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issuestatus_color_def] DEFAULT ('#A9A9A9'),
[seq] [int] NOT NULL CONSTRAINT [gemini_issuestatus_seq_def] DEFAULT ((0)),
[templateid] [int] NOT NULL CONSTRAINT [gemini_issuestatus_templateid_def] DEFAULT ((1))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issuestatus_statusid_pk] on [dbo].[gemini_issuestatus]'
GO
ALTER TABLE [dbo].[gemini_issuestatus] ADD CONSTRAINT [gemini_issuestatus_statusid_pk] PRIMARY KEY CLUSTERED  ([statusid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuestatus_id] on [dbo].[gemini_issuestatus]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [ind_gemini_issuestatus_id] ON [dbo].[gemini_issuestatus] ([statusid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuestatus_desc] on [dbo].[gemini_issuestatus]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issuestatus_desc] ON [dbo].[gemini_issuestatus] ([statusdesc])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_customfielddata]'
GO
CREATE TABLE [dbo].[gemini_customfielddata]
(
[customfielddataid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[customfieldid] [numeric] (10, 0) NOT NULL,
[userid] [numeric] (10, 0) NOT NULL,
[projectid] [numeric] (10, 0) NOT NULL,
[issueid] [numeric] (10, 0) NOT NULL,
[fielddata] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_customfielddata_fielddata_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [gemini_customfielddata_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[filedata] [varbinary] (max) NULL,
[numericdata] [numeric] (15, 5) NULL,
[datedata] [datetime] NULL,
[revised] [datetime] NOT NULL CONSTRAINT [gemini_customfielddata_revised_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_customfielddata_customfielddataid_pk] on [dbo].[gemini_customfielddata]'
GO
ALTER TABLE [dbo].[gemini_customfielddata] ADD CONSTRAINT [gemini_customfielddata_customfielddataid_pk] PRIMARY KEY CLUSTERED  ([customfielddataid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_customfielddata_customfieldid] on [dbo].[gemini_customfielddata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_customfielddata_customfieldid] ON [dbo].[gemini_customfielddata] ([customfieldid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_customfielddata_issueidcfid] on [dbo].[gemini_customfielddata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_customfielddata_issueidcfid] ON [dbo].[gemini_customfielddata] ([issueid], [customfieldid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_customfielddata_userid] on [dbo].[gemini_customfielddata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_customfielddata_userid] ON [dbo].[gemini_customfielddata] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_customfielddata_projectid] on [dbo].[gemini_customfielddata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_customfielddata_projectid] ON [dbo].[gemini_customfielddata] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_customfielddata_issueid] on [dbo].[gemini_customfielddata]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_customfielddata_issueid] ON [dbo].[gemini_customfielddata] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_navigationcard]'
GO
CREATE TABLE [dbo].[gemini_navigationcard]
(
[cardid] [int] NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NULL,
[issueid] [numeric] (10, 0) NULL,
[userid] [numeric] (10, 0) NULL,
[cardtype] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_navigationcard_cardtype_def] DEFAULT ('1'),
[cardkey] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_navigationcard_cardkey_def] DEFAULT (''),
[cardtitle] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_navigationcard_cardtitle_def] DEFAULT (''),
[carddata] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_navigationcard_carddata_def] DEFAULT (''),
[cardoptions] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_navigationcard_cardoptions_def] DEFAULT (''),
[cardurl] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_navigationcard_cardurl_def] DEFAULT (''),
[originatorid] [int] NULL,
[lastseen] [datetime] NULL,
[badgecount] [int] NOT NULL CONSTRAINT [gemini_navigationcard_badgecount_def] DEFAULT ((0)),
[sharedgroups] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_navigationcard_sharedgroups_def] DEFAULT (''),
[color] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_navigationcard_color_def] DEFAULT (''),
[visibletoanonuser] [bit] NOT NULL CONSTRAINT [gemini_navigationcard_visibletoanonuser_def] DEFAULT ((0)),
[visibletoauthuser] [bit] NOT NULL CONSTRAINT [gemini_navigationcard_visibletoauthuser_def] DEFAULT ((0)),
[generated] [bit] NOT NULL CONSTRAINT [gemini_navigationcard_generated_def] DEFAULT ((0)),
[sequence] [int] NOT NULL CONSTRAINT [gemini_navigationcard_sequence_def] DEFAULT ((1)),
[created] [datetime] NOT NULL CONSTRAINT [gemini_navigationcard_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[filterdata] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_navigationcard_templateid_pk] on [dbo].[gemini_navigationcard]'
GO
ALTER TABLE [dbo].[gemini_navigationcard] ADD CONSTRAINT [gemini_navigationcard_templateid_pk] PRIMARY KEY CLUSTERED  ([cardid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_navigationcards_cardid] on [dbo].[gemini_navigationcard]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_navigationcards_cardid] ON [dbo].[gemini_navigationcard] ([cardid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_navigationcards_projectid] on [dbo].[gemini_navigationcard]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_navigationcards_projectid] ON [dbo].[gemini_navigationcard] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_navigationcards_issueid] on [dbo].[gemini_navigationcard]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_navigationcards_issueid] ON [dbo].[gemini_navigationcard] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_navigationcards_userid] on [dbo].[gemini_navigationcard]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_navigationcards_userid] ON [dbo].[gemini_navigationcard] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_navigationcards_cardtype] on [dbo].[gemini_navigationcard]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_navigationcards_cardtype] ON [dbo].[gemini_navigationcard] ([cardtype])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_navigationcards_originatorid] on [dbo].[gemini_navigationcard]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_navigationcards_originatorid] ON [dbo].[gemini_navigationcard] ([originatorid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_systemlog]'
GO
CREATE TABLE [dbo].[gemini_systemlog]
(
[srn] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[messagetype] [varchar] (30) COLLATE Latin1_General_CI_AS NOT NULL,
[messagesource] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[logmessage] [varchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[username] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_systemlog_username_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [gemini_systemlog_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_systemlog_srn_pk] on [dbo].[gemini_systemlog]'
GO
ALTER TABLE [dbo].[gemini_systemlog] ADD CONSTRAINT [gemini_systemlog_srn_pk] PRIMARY KEY CLUSTERED  ([srn])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_chat]'
GO
CREATE TABLE [dbo].[gemini_chat]
(
[chatid] [int] NOT NULL IDENTITY(1, 1),
[cardid] [int] NOT NULL,
[userid] [numeric] (10, 0) NULL,
[otheruserids] [varchar] (4000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_chat_otheruserids_def] DEFAULT (''),
[chattext] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_chat_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_chat_cardid] on [dbo].[gemini_chat]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_chat_cardid] ON [dbo].[gemini_chat] ([cardid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_chat_userid] on [dbo].[gemini_chat]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_chat_userid] ON [dbo].[gemini_chat] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_chat_created] on [dbo].[gemini_chat]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_chat_created] ON [dbo].[gemini_chat] ([created])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_users]'
GO
CREATE TABLE [dbo].[gemini_users]
(
[userid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[username] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_username_def] DEFAULT (''),
[firstname] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_firstname_def] DEFAULT (''),
[surname] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_surname_def] DEFAULT (''),
[pwd] [binary] (16) NULL,
[emailaddress] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_emailaddress_def] DEFAULT (''),
[roles] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_roles_def] DEFAULT (''),
[resetpwd] [varbinary] (16) NULL,
[comment] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_comment_def] DEFAULT (''),
[apikey] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [gemini_users_apikey_def] DEFAULT (''),
[active] [bit] NOT NULL CONSTRAINT [gemini_users_active_def] DEFAULT ((1)),
[created] [datetime] NOT NULL CONSTRAINT [gemini_users_created_def] DEFAULT (getutcdate()),
[lastupdated] [datetime] NOT NULL CONSTRAINT [gemini_users_lastupdated_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[logindate] [datetime] NOT NULL CONSTRAINT [gemini_users_logindate_def] DEFAULT (getutcdate()),
[previouslogindate] [datetime] NOT NULL CONSTRAINT [gemini_users_previouslogindate_def] DEFAULT (getutcdate()),
[openid] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_openid_def] DEFAULT (''),
[timezoneid] [varchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_timezoneid_def] DEFAULT (''),
[culture] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_culture_def] DEFAULT (''),
[languageid] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_languageid_def] DEFAULT ('en-US'),
[theme] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_theme_def] DEFAULT (''),
[emailme] [bit] NOT NULL CONSTRAINT [gemini_users_emailme_def] DEFAULT ((1)),
[emailmemychanges] [bit] NOT NULL CONSTRAINT [gemini_users_emailmemychanges_def] DEFAULT ((1)),
[settings] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_settings_def] DEFAULT (''),
[userexperience] [int] NULL CONSTRAINT [gemini_users_userexperience_def] DEFAULT ((0)),
[previouspasswords] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_users_previouspasswords_def] DEFAULT (''),
[locked] [bit] NULL CONSTRAINT [gemini_users_locked_def] DEFAULT ((0))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_userid_userid_pk] on [dbo].[gemini_users]'
GO
ALTER TABLE [dbo].[gemini_users] ADD CONSTRAINT [gemini_userid_userid_pk] PRIMARY KEY CLUSTERED  ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [uind_gemini_users_username] on [dbo].[gemini_users]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [uind_gemini_users_username] ON [dbo].[gemini_users] ([username])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_timetracking]'
GO
CREATE TABLE [dbo].[gemini_timetracking]
(
[entryid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NOT NULL,
[issueid] [numeric] (10, 0) NOT NULL,
[userid] [numeric] (10, 0) NOT NULL,
[hours] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_timetracking_hours_def] DEFAULT ((0)),
[minutes] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_timetracking_minutes_def] DEFAULT ((0)),
[comment] [nvarchar] (2000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_timetracking_comment_def] DEFAULT (''),
[timeentrydate] [datetime] NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_timetracking_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[timetypeid] [numeric] (10, 0) NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_timetracking_entryid_pk] on [dbo].[gemini_timetracking]'
GO
ALTER TABLE [dbo].[gemini_timetracking] ADD CONSTRAINT [gemini_timetracking_entryid_pk] PRIMARY KEY CLUSTERED  ([entryid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_timetracking_projectid] on [dbo].[gemini_timetracking]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_timetracking_projectid] ON [dbo].[gemini_timetracking] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_timetracking_issueid] on [dbo].[gemini_timetracking]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_timetracking_issueid] ON [dbo].[gemini_timetracking] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issueseverity]'
GO
CREATE TABLE [dbo].[gemini_issueseverity]
(
[severityid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[seq] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_issueseverity_seq_def] DEFAULT ((0)),
[severitydesc] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[imagepath] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[tstamp] [timestamp] NOT NULL,
[color] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issueseverity_color_def] DEFAULT ('#A9A9A9'),
[templateid] [int] NOT NULL CONSTRAINT [gemini_issueseverity_templateid_def] DEFAULT ((1))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issueseverity_severityid_pk] on [dbo].[gemini_issueseverity]'
GO
ALTER TABLE [dbo].[gemini_issueseverity] ADD CONSTRAINT [gemini_issueseverity_severityid_pk] PRIMARY KEY CLUSTERED  ([severityid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issueseverity_id] on [dbo].[gemini_issueseverity]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [ind_gemini_issueseverity_id] ON [dbo].[gemini_issueseverity] ([severityid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issueseverity_desc] on [dbo].[gemini_issueseverity]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issueseverity_desc] ON [dbo].[gemini_issueseverity] ([severitydesc])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_runs]'
GO
CREATE TABLE [dbo].[gemini_testing_runs]
(
[testrunid] [int] NOT NULL IDENTITY(1, 1),
[testplanid] [int] NULL,
[testcaseid] [int] NULL,
[projectid] [numeric] (10, 0) NOT NULL,
[summary] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_testing_runs_summary_def] DEFAULT (''),
[rundescription] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_testing_runs_rundescription_def] DEFAULT (''),
[duration] [int] NOT NULL CONSTRAINT [gemini_testing_runs_duration_def] DEFAULT ((0)),
[isautomated] [bit] NOT NULL,
[haspassed] [bit] NULL,
[isclosed] [bit] NOT NULL,
[createdby] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_testing_runs_created_def] DEFAULT (getutcdate()),
[revised] [datetime] NOT NULL CONSTRAINT [gemini_testing_runs_revised_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_runs_testrunid_pk] on [dbo].[gemini_testing_runs]'
GO
ALTER TABLE [dbo].[gemini_testing_runs] ADD CONSTRAINT [gemini_testing_runs_testrunid_pk] PRIMARY KEY CLUSTERED  ([testrunid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_runs_testplanid] on [dbo].[gemini_testing_runs]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_runs_testplanid] ON [dbo].[gemini_testing_runs] ([testplanid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_runs_testcaseid] on [dbo].[gemini_testing_runs]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_runs_testcaseid] ON [dbo].[gemini_testing_runs] ([testcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_runs_projectid] on [dbo].[gemini_testing_runs]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_runs_projectid] ON [dbo].[gemini_testing_runs] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_runs_createdby] on [dbo].[gemini_testing_runs]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_runs_createdby] ON [dbo].[gemini_testing_runs] ([createdby])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_projectdocuments]'
GO
CREATE TABLE [dbo].[gemini_projectdocuments]
(
[documentid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[parentdocumentid] [numeric] (10, 0) NULL,
[projectid] [numeric] (10, 0) NOT NULL,
[documentname] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[documentdesc] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projectdocuments_documentdesc_def] DEFAULT (N''),
[isfolder] [bit] NOT NULL CONSTRAINT [gemini_projectdocuments_isfolder_def] DEFAULT ((0)),
[contenttype] [nvarchar] (100) COLLATE Latin1_General_CI_AS NULL,
[contentlength] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_projectdocuments_contentlength_def] DEFAULT ((0)),
[documentdata] [varbinary] (max) NULL,
[created] [datetime] NOT NULL CONSTRAINT [ggemini_projectdocuments_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_projectdocuments_documentid_pk] on [dbo].[gemini_projectdocuments]'
GO
ALTER TABLE [dbo].[gemini_projectdocuments] ADD CONSTRAINT [gemini_projectdocuments_documentid_pk] PRIMARY KEY CLUSTERED  ([documentid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectdocuments_parnetnodeid] on [dbo].[gemini_projectdocuments]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectdocuments_parnetnodeid] ON [dbo].[gemini_projectdocuments] ([parentdocumentid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectdocuments_projectid] on [dbo].[gemini_projectdocuments]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_projectdocuments_projectid] ON [dbo].[gemini_projectdocuments] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_globalsecurityschemes]'
GO
CREATE TABLE [dbo].[gemini_globalsecurityschemes]
(
[schemeid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[schemename] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_globalsecurityschemes_schemename_def] DEFAULT (''),
[schemedesc] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_globalsecurityschemes_schemedesc_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [gemini_globalsecurityschemes_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_globalsecurityschemes_schemeid_pk] on [dbo].[gemini_globalsecurityschemes]'
GO
ALTER TABLE [dbo].[gemini_globalsecurityschemes] ADD CONSTRAINT [gemini_globalsecurityschemes_schemeid_pk] PRIMARY KEY CLUSTERED  ([schemeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[breeze_enquiry]'
GO
CREATE TABLE [dbo].[breeze_enquiry]
(
[enquiryid] [bigint] NOT NULL IDENTITY(1, 1),
[queueid] [int] NULL,
[issueid] [numeric] (10, 0) NULL,
[projectid] [int] NULL,
[issuekey] [nvarchar] (100) COLLATE Latin1_General_CI_AS NULL,
[issuecommentid] [numeric] (10, 0) NULL,
[alerttemplateid] [int] NULL,
[enquirysource] [int] NOT NULL CONSTRAINT [breeze_enquiry_source_def] DEFAULT ((0)),
[enquirydata] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_enquiry_enquirydata_def] DEFAULT (''),
[rawenquiry] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_enquiry_rawenquiry_def] DEFAULT (''),
[rawid] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_enquiry_rawid_def] DEFAULT (''),
[cancontact] [bit] NOT NULL CONSTRAINT [breeze_qnquiry_cancontact_def] DEFAULT ((0)),
[acknowledged] [datetime] NULL CONSTRAINT [breeze_qnquiry_acknowledged_def] DEFAULT (getutcdate()),
[received] [datetime] NOT NULL CONSTRAINT [breeze_enquiry_received_def] DEFAULT (getutcdate()),
[created] [datetime] NOT NULL CONSTRAINT [breeze_enquiry_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [breeze_enquiry_enquiryid_pk] on [dbo].[breeze_enquiry]'
GO
ALTER TABLE [dbo].[breeze_enquiry] ADD CONSTRAINT [breeze_enquiry_enquiryid_pk] PRIMARY KEY CLUSTERED  ([enquiryid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_breeze_enquiry_rawid] on [dbo].[breeze_enquiry]'
GO
CREATE NONCLUSTERED INDEX [ind_breeze_enquiry_rawid] ON [dbo].[breeze_enquiry] ([rawid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_rulesactions]'
GO
CREATE TABLE [dbo].[gemini_rulesactions]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[slaid] [int] NULL,
[sequence] [int] NOT NULL,
[name] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[longdesc] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL,
[stopprocessing] [bit] NOT NULL,
[onbeforecreate] [bit] NOT NULL,
[onbeforeupdate] [bit] NOT NULL,
[onaftercreate] [bit] NOT NULL,
[onafterupdate] [bit] NOT NULL,
[ontimer] [bit] NOT NULL,
[onetimeaction] [bit] NOT NULL,
[rules] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[actions] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[revised] [datetime] NOT NULL CONSTRAINT [gemini_rulesactions_revised_def] DEFAULT (getutcdate()),
[created] [datetime] NOT NULL CONSTRAINT [gemini_rulesactions_created_def] DEFAULT (getutcdate())
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_rulesactions_id_pk] on [dbo].[gemini_rulesactions]'
GO
ALTER TABLE [dbo].[gemini_rulesactions] ADD CONSTRAINT [gemini_rulesactions_id_pk] PRIMARY KEY CLUSTERED  ([id])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_rulesactions_slaid] on [dbo].[gemini_rulesactions]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_rulesactions_slaid] ON [dbo].[gemini_rulesactions] ([slaid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_run_times]'
GO
CREATE TABLE [dbo].[gemini_testing_run_times]
(
[timelogid] [int] NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NOT NULL,
[testrunid] [int] NOT NULL,
[userid] [numeric] (10, 0) NOT NULL,
[hours] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_testing_run_times_hours_def] DEFAULT ((0)),
[minutes] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_testing_run_times_minutes_def] DEFAULT ((0)),
[comment] [nvarchar] (2000) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_testing_run_times_comment_def] DEFAULT (''),
[entrydate] [datetime] NOT NULL,
[timetypeid] [numeric] (10, 0) NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_testing_run_times_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_run_times_timelogid_pk] on [dbo].[gemini_testing_run_times]'
GO
ALTER TABLE [dbo].[gemini_testing_run_times] ADD CONSTRAINT [gemini_testing_run_times_timelogid_pk] PRIMARY KEY CLUSTERED  ([timelogid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_run_times_projectid] on [dbo].[gemini_testing_run_times]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_run_times_projectid] ON [dbo].[gemini_testing_run_times] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_run_times_testrunid] on [dbo].[gemini_testing_run_times]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_run_times_testrunid] ON [dbo].[gemini_testing_run_times] ([testrunid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_run_times_userid] on [dbo].[gemini_testing_run_times]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_run_times_userid] ON [dbo].[gemini_testing_run_times] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_run_times_timetypeid] on [dbo].[gemini_testing_run_times]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_run_times_timetypeid] ON [dbo].[gemini_testing_run_times] ([timetypeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_sharedviews]'
GO
CREATE TABLE [dbo].[gemini_sharedviews]
(
[sharedviewid] [int] NOT NULL IDENTITY(1, 1),
[userid] [numeric] (10, 0) NULL,
[projectid] [numeric] (10, 0) NULL,
[pagetype] [int] NOT NULL,
[pageid] [nvarchar] (50) COLLATE Latin1_General_CI_AS NULL,
[name] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL,
[visibility] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL,
[value] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_sharedviews_value_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [gemini_sharedviews_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_sharedviews_sharedviewid_pk] on [dbo].[gemini_sharedviews]'
GO
ALTER TABLE [dbo].[gemini_sharedviews] ADD CONSTRAINT [gemini_sharedviews_sharedviewid_pk] PRIMARY KEY CLUSTERED  ([sharedviewid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_sharedviews_userid] on [dbo].[gemini_sharedviews]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_sharedviews_userid] ON [dbo].[gemini_sharedviews] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_sharedviews_projectid] on [dbo].[gemini_sharedviews]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_sharedviews_projectid] ON [dbo].[gemini_sharedviews] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issuelinktypes]'
GO
CREATE TABLE [dbo].[gemini_issuelinktypes]
(
[linktypeid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[linkname] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issuelinktypes_linkname_def] DEFAULT (''),
[linkdesc] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issuelinktypes_linkdesc_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [gemini_issuelinktypes_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[templateid] [int] NOT NULL CONSTRAINT [gemini_issuelinktypes_templateid_def] DEFAULT ((1))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issuelinktypes_linktypeid_pk] on [dbo].[gemini_issuelinktypes]'
GO
ALTER TABLE [dbo].[gemini_issuelinktypes] ADD CONSTRAINT [gemini_issuelinktypes_linktypeid_pk] PRIMARY KEY CLUSTERED  ([linktypeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_customfielddefinitions]'
GO
CREATE TABLE [dbo].[gemini_customfielddefinitions]
(
[customfieldid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[customfieldname] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[screenorder] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_customfielddefinitions_screenorder_def] DEFAULT ((0)),
[screenlabel] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_customfielddefinitions_screenlabel_def] DEFAULT (''),
[screendescription] [nvarchar] (1910) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_customfielddefinitions_screendescription_def] DEFAULT (''),
[screentooltip] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_customfielddefinitions_screentooltip_def] DEFAULT (''),
[maxlen] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_customfielddefinitions_maxlen_def] DEFAULT ((0)),
[canmultiselect] [bit] NOT NULL CONSTRAINT [gemini_customfielddefinitions_canmultiselect_def] DEFAULT ((1)),
[regularexp] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_customfielddefinitions_regularexp_def] DEFAULT (''),
[customfieldtype] [nvarchar] (1) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_customfielddefinitions_customfieldtype_def] DEFAULT (N'T'),
[lookupname] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_customfielddefinitions_lookupname_def] DEFAULT (''),
[lookupvaluefield] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_customfielddefinitions_lookupvaluefield_def] DEFAULT (''),
[lookuptextfield] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_customfielddefinitions_lookuptexfield_def] DEFAULT (''),
[lookupsortfield] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_customfielddefinitions_lookupsortfield_def] DEFAULT (''),
[projectidfilter] [bit] NOT NULL CONSTRAINT [gemini_customfielddefinitions_projectidfilter_def] DEFAULT ((0)),
[created] [datetime] NOT NULL CONSTRAINT [gemini_customfielddefinitions_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[showinline] [bit] NOT NULL CONSTRAINT [gemini_customfielddefinitions_showinline_def] DEFAULT ((0)),
[lookupdata] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_customfielddefinitions_lookupdata_def] DEFAULT (''),
[maxvalue] [numeric] (15, 5) NULL,
[minvalue] [numeric] (15, 5) NULL,
[listlimiter] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_customfielddefinitions_listlimiter_def] DEFAULT (''),
[usedin] [int] NOT NULL CONSTRAINT [gemini_customfielddefinitions_usedin_def] DEFAULT ((1)),
[templateid] [int] NOT NULL CONSTRAINT [gemini_customfielddefinitions_templateid_def] DEFAULT ((1)),
[usestaticdata] [bit] NOT NULL CONSTRAINT [gemini_customfielddefinitions_usestaticdata_def] DEFAULT ((0)),
[canfilter] [bit] NOT NULL CONSTRAINT [gemini_customfielddefinitions_canfilter_def] DEFAULT ((0)),
[cascadinglookupvaluefield] [nvarchar] (100) COLLATE Latin1_General_CI_AS NULL,
[cascadingparentfield] [int] NULL,
[allownoselection] [bit] NOT NULL CONSTRAINT [gemini_customfielddefinitions_allownoselection_def] DEFAULT ((0)),
[autocomplete] [bit] NOT NULL CONSTRAINT [gemini_customfielddefinitions_autocomplete_def] DEFAULT ((0))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_customfielddefinitions_customfieldid_pk] on [dbo].[gemini_customfielddefinitions]'
GO
ALTER TABLE [dbo].[gemini_customfielddefinitions] ADD CONSTRAINT [gemini_customfielddefinitions_customfieldid_pk] PRIMARY KEY CLUSTERED  ([customfieldid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[breeze_mailboxmessage]'
GO
CREATE TABLE [dbo].[breeze_mailboxmessage]
(
[messageid] [int] NOT NULL IDENTITY(1, 1),
[mailboxid] [int] NOT NULL CONSTRAINT [breeze_mailboxmessage_mailboxid_def] DEFAULT ((0)),
[uid] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [breeze_mailboxmesssage_uid_def] DEFAULT (''),
[created] [datetime] NOT NULL CONSTRAINT [breeze_mailboxmessage_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [breeze_mailboxmessage_messageid_pk] on [dbo].[breeze_mailboxmessage]'
GO
ALTER TABLE [dbo].[breeze_mailboxmessage] ADD CONSTRAINT [breeze_mailboxmessage_messageid_pk] PRIMARY KEY CLUSTERED  ([messageid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_projectdefaultvalues]'
GO
CREATE TABLE [dbo].[gemini_projectdefaultvalues]
(
[defaultvalueitemid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_projectdefaultvalues_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[typeid] [numeric] (10, 0) NULL,
[defaultvalues] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projectdefaultvalues_defaultvalues_def] DEFAULT ('')
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_projectdefaultvalues_defaultvalueitemid_pk] on [dbo].[gemini_projectdefaultvalues]'
GO
ALTER TABLE [dbo].[gemini_projectdefaultvalues] ADD CONSTRAINT [gemini_projectdefaultvalues_defaultvalueitemid_pk] PRIMARY KEY CLUSTERED  ([defaultvalueitemid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_projectdefaultvalues_defaultvalueitemid] on [dbo].[gemini_projectdefaultvalues]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [ind_gemini_projectdefaultvalues_defaultvalueitemid] ON [dbo].[gemini_projectdefaultvalues] ([defaultvalueitemid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_projects]'
GO
CREATE TABLE [dbo].[gemini_projects]
(
[projectid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[projectcode] [nvarchar] (10) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projects_projectcode_def] DEFAULT (''),
[projectname] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projects_projectname_def] DEFAULT (''),
[projectleader] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projects_projectleader_def] DEFAULT (''),
[projectdesc] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projects_projectdesc_def] DEFAULT (''),
[projectlabelid] [numeric] (10, 0) NULL,
[resourcemode] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_projects_resourcemode_def] DEFAULT ((0)),
[componentmode] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_projects_componentmode_def] DEFAULT ((0)),
[globalschemeid] [numeric] (10, 0) NULL,
[userid] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_projects_userid_def] DEFAULT ((-1)),
[created] [datetime] NOT NULL CONSTRAINT [gemini_projects_creared_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[projectreadonly] [bit] NOT NULL CONSTRAINT [gemini_projects_projectreadonly_def] DEFAULT ((0)),
[projectarchived] [bit] NOT NULL CONSTRAINT [gemini_projects_projectarchived_def] DEFAULT ((0)),
[color] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projects_color_def] DEFAULT ('#A9A9A9'),
[options] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_projects_options_def] DEFAULT (''),
[templateid] [int] NOT NULL CONSTRAINT [gemini_projects_templateid_def] DEFAULT ((1))
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_projects_projectid_pk] on [dbo].[gemini_projects]'
GO
ALTER TABLE [dbo].[gemini_projects] ADD CONSTRAINT [gemini_projects_projectid_pk] PRIMARY KEY CLUSTERED  ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_issuecomments]'
GO
CREATE TABLE [dbo].[gemini_issuecomments]
(
[commentid] [numeric] (10, 0) NOT NULL IDENTITY(1, 1),
[userid] [numeric] (10, 0) NOT NULL,
[issueid] [numeric] (10, 0) NOT NULL,
[projectid] [numeric] (10, 0) NOT NULL,
[comment] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[username] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_issuecomments_username_def] DEFAULT (''),
[isclosing] [bit] NOT NULL CONSTRAINT [gemini_issuecomments_isclosing_def] DEFAULT ((0)),
[visibility] [numeric] (10, 0) NOT NULL CONSTRAINT [gemini_issuecomments_visibility_def] DEFAULT ((1)),
[created] [datetime] NOT NULL CONSTRAINT [gemini_issuecomments_created_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL,
[originatortype] [int] NOT NULL CONSTRAINT [gemini_issuecomments_originatortype_def] DEFAULT ((0)),
[originatordata] [nvarchar] (255) COLLATE Latin1_General_CI_AS NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_issuecomments_commentid_pk] on [dbo].[gemini_issuecomments]'
GO
ALTER TABLE [dbo].[gemini_issuecomments] ADD CONSTRAINT [gemini_issuecomments_commentid_pk] PRIMARY KEY CLUSTERED  ([commentid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuecomments_issueid] on [dbo].[gemini_issuecomments]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issuecomments_issueid] ON [dbo].[gemini_issuecomments] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_issuecomments_visibility] on [dbo].[gemini_issuecomments]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_issuecomments_visibility] ON [dbo].[gemini_issuecomments] ([visibility])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_case_steps]'
GO
CREATE TABLE [dbo].[gemini_testing_case_steps]
(
[stepid] [int] NOT NULL IDENTITY(1, 1),
[testcaseid] [int] NOT NULL,
[steptestcaseid] [int] NULL,
[steporder] [int] NOT NULL,
[stepdescription] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[expectedresult] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[data] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[createdby] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_testing_case_steps_created_def] DEFAULT (getutcdate()),
[revised] [datetime] NOT NULL CONSTRAINT [gemini_testing_case_steps_revised_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_case_steps_stepid_pk] on [dbo].[gemini_testing_case_steps]'
GO
ALTER TABLE [dbo].[gemini_testing_case_steps] ADD CONSTRAINT [gemini_testing_case_steps_stepid_pk] PRIMARY KEY CLUSTERED  ([stepid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_case_steps_testcaseid] on [dbo].[gemini_testing_case_steps]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_case_steps_testcaseid] ON [dbo].[gemini_testing_case_steps] ([testcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_case_steps_steptestcaseid] on [dbo].[gemini_testing_case_steps]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_case_steps_steptestcaseid] ON [dbo].[gemini_testing_case_steps] ([steptestcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_case_steps_createdby] on [dbo].[gemini_testing_case_steps]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_case_steps_createdby] ON [dbo].[gemini_testing_case_steps] ([createdby])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_testing_plans]'
GO
CREATE TABLE [dbo].[gemini_testing_plans]
(
[testplanid] [int] NOT NULL IDENTITY(1, 1),
[summary] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_testing_plans_summary_def] DEFAULT (''),
[plandescription] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [gemini_testing_plans_plandescription_def] DEFAULT (''),
[parenttestplanid] [int] NULL,
[projectid] [numeric] (10, 0) NOT NULL,
[isparent] [bit] NOT NULL,
[isfolder] [bit] NOT NULL,
[isclosed] [bit] NOT NULL,
[createdby] [numeric] (10, 0) NOT NULL,
[created] [datetime] NOT NULL CONSTRAINT [gemini_testing_plans_created_def] DEFAULT (getutcdate()),
[revised] [datetime] NOT NULL CONSTRAINT [gemini_testing_plans_revised_def] DEFAULT (getutcdate()),
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_testing_plans_testplanid_pk] on [dbo].[gemini_testing_plans]'
GO
ALTER TABLE [dbo].[gemini_testing_plans] ADD CONSTRAINT [gemini_testing_plans_testplanid_pk] PRIMARY KEY CLUSTERED  ([testplanid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_plans_parenttestplanid] on [dbo].[gemini_testing_plans]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_plans_parenttestplanid] ON [dbo].[gemini_testing_plans] ([parenttestplanid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_plans_projectid] on [dbo].[gemini_testing_plans]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_plans_projectid] ON [dbo].[gemini_testing_plans] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating index [ind_gemini_testing_plans_createdby] on [dbo].[gemini_testing_plans]'
GO
CREATE NONCLUSTERED INDEX [ind_gemini_testing_plans_createdby] ON [dbo].[gemini_testing_plans] ([createdby])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_build_scrum_sample]'
GO
create PROCEDURE [dbo].[gemini_build_scrum_sample]
AS
BEGIN

set nocount on

declare @startdate datetime 
declare @milestonedate datetime
declare @projectid int

set DATEFIRST 1
set @startdate = DATEADD(dd, 1 - DATEPART(dw, getdate()-21), getdate()-21)
set @projectid = 19

-- set sprint 1 dates
update gemini_versions set startdate = @startdate, releasedate = DATEADD(dd, 11, @startdate)
where projectid=@projectid and versionid = 33

-- set sprint 2 dates
update gemini_versions set startdate = DATEADD(dd, 14, @startdate), releasedate = DATEADD(dd, 14+11, @startdate)
where projectid=@projectid and versionid = 34

-- set sprint 3 dates
update gemini_versions set startdate = DATEADD(dd, 28, @startdate), releasedate = DATEADD(dd, 28+11, @startdate)
where projectid=@projectid and versionid = 35

-- set sprint 4 dates
update gemini_versions set startdate = DATEADD(dd, 42, @startdate), releasedate = DATEADD(dd, 42+11, @startdate)
where projectid=@projectid and versionid = 36

-- set sprint 0 dates
update gemini_versions set startdate = @startdate, releasedate = DATEADD(dd, 42+11, @startdate)
where projectid=@projectid and versionid = 32

-- change dates for closed/open issues for sprint 1
declare @issuestartdate datetime

set  @issuestartdate = @startdate 
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (93, 53, 57)

set  @issuestartdate = DATEADD(dd, 1, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (60, 64, 65, 66)

set  @issuestartdate = DATEADD(dd, 1, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (67, 68)

set  @issuestartdate = DATEADD(dd, 1, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate+4, closeddate = @issuestartdate where issueid in (74, 75)

set  @issuestartdate = DATEADD(dd, 1, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate+5, closeddate = @issuestartdate where issueid in (84, 85, 87)


-- change dates for closed/open issues for sprint 2
set  @issuestartdate = DATEADD(dd, 14, @startdate) 
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (77, 79)

set  @issuestartdate = DATEADD(dd, 1, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (83, 86)

set  @issuestartdate = DATEADD(dd, 1, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (76, 94, 91)

set  @issuestartdate = DATEADD(dd, 1, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (59, 62, 69)

set  @issuestartdate = DATEADD(dd, 1, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (82, 54, 55)

set  @issuestartdate = DATEADD(dd, 3, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (91, 78, 70)

set  @issuestartdate = DATEADD(dd, 1, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (61, 90)

set  @issuestartdate = DATEADD(dd, 1, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (92, 80)

set  @issuestartdate = DATEADD(dd, 1, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (63)

set  @issuestartdate = DATEADD(dd, 1, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate, closeddate = @issuestartdate where issueid in (58)

-- Milestones for sprint 2
set  @milestonedate = DATEADD(dd, 4, @startdate) 
update gemini_versionmilestone set milestonedate = @milestonedate where milestoneid = 1
set  @milestonedate = DATEADD(dd, 3, @milestonedate) 
update gemini_versionmilestone set milestonedate = @milestonedate where milestoneid = 2


set  @issuestartdate = DATEADD(dd, -3, @issuestartdate)
update gemini_issues set created = @issuestartdate where issueid in (70, 63, 61)

-- change dates for closed/open issues for sprint 3
set  @issuestartdate = DATEADD(dd, 28, @startdate) 
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate+1 where issueid in (103,104)

set  @issuestartdate = DATEADD(dd, 2, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate+1 where issueid in (105,106)

set  @issuestartdate = DATEADD(dd, 2, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate where issueid in (107)

set  @issuestartdate = DATEADD(dd, 3, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate+1 where issueid in (108,109,110)

set  @issuestartdate = DATEADD(dd, 2, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate+1 where issueid in (111,112)

-- change dates for closed/open issues for sprint 4
set  @issuestartdate = DATEADD(dd, 42, @startdate) 
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate+1 where issueid in (88, 89)

set  @issuestartdate = DATEADD(dd, 2, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate+1 where issueid in (113)

set  @issuestartdate = DATEADD(dd, 2, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate where issueid in (114)

set  @issuestartdate = DATEADD(dd, 3, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate+1 where issueid in (115, 116, 117)

set  @issuestartdate = DATEADD(dd, 2, @issuestartdate)
update gemini_issues set startdate = @issuestartdate, duedate = @issuestartdate+1 where issueid in (118, 56)


END
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[bkup_gemini_navigationcard]'
GO
CREATE TABLE [dbo].[bkup_gemini_navigationcard]
(
[cardid] [int] NOT NULL IDENTITY(1, 1),
[projectid] [numeric] (10, 0) NULL,
[issueid] [numeric] (10, 0) NULL,
[userid] [numeric] (10, 0) NULL,
[cardtype] [nvarchar] (255) COLLATE Latin1_General_CI_AS NOT NULL,
[cardkey] [nvarchar] (100) COLLATE Latin1_General_CI_AS NOT NULL,
[cardtitle] [nvarchar] (500) COLLATE Latin1_General_CI_AS NOT NULL,
[carddata] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[cardoptions] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[cardurl] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL,
[originatorid] [int] NULL,
[lastseen] [datetime] NULL,
[badgecount] [int] NOT NULL,
[sharedgroups] [nvarchar] (1000) COLLATE Latin1_General_CI_AS NOT NULL,
[color] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL,
[visibletoanonuser] [bit] NOT NULL,
[visibletoauthuser] [bit] NOT NULL,
[generated] [bit] NOT NULL,
[sequence] [int] NOT NULL,
[created] [datetime] NOT NULL,
[tstamp] [timestamp] NOT NULL,
[filterdata] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[gemini_applicationsettings]'
GO
CREATE TABLE [dbo].[gemini_applicationsettings]
(
[settingid] [int] NOT NULL IDENTITY(1, 1),
[settingname] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL,
[settingvalue] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL,
[tstamp] [timestamp] NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [gemini_applicationsettings_settingid_pk] on [dbo].[gemini_applicationsettings]'
GO
ALTER TABLE [dbo].[gemini_applicationsettings] ADD CONSTRAINT [gemini_applicationsettings_settingid_pk] PRIMARY KEY CLUSTERED  ([settingid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[SAMPLE_CUSTOMFIELD_EDITION]'
GO
CREATE TABLE [dbo].[SAMPLE_CUSTOMFIELD_EDITION]
(
[editionid] [int] NOT NULL,
[editionname] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__SAMPLE_C__1B4445E539E294A9] on [dbo].[SAMPLE_CUSTOMFIELD_EDITION]'
GO
ALTER TABLE [dbo].[SAMPLE_CUSTOMFIELD_EDITION] ADD CONSTRAINT [PK__SAMPLE_C__1B4445E539E294A9] PRIMARY KEY CLUSTERED  ([editionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[SAMPLE_CUSTOMFIELD_PLATFORM]'
GO
CREATE TABLE [dbo].[SAMPLE_CUSTOMFIELD_PLATFORM]
(
[platformid] [int] NOT NULL,
[platformname] [nvarchar] (50) COLLATE Latin1_General_CI_AS NOT NULL
)
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating primary key [PK__SAMPLE_C__C55702533DB3258D] on [dbo].[SAMPLE_CUSTOMFIELD_PLATFORM]'
GO
ALTER TABLE [dbo].[SAMPLE_CUSTOMFIELD_PLATFORM] ADD CONSTRAINT [PK__SAMPLE_C__C55702533DB3258D] PRIMARY KEY CLUSTERED  ([platformid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Creating [dbo].[InsertGeneratorTemplates]'
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROC [dbo].[InsertGeneratorTemplates]
(@tableName varchar(100)) as

--Declare a cursor to retrieve column specific information for the specified table
DECLARE cursCol CURSOR FAST_FORWARD FOR 
SELECT column_name,data_type FROM information_schema.columns WHERE table_name = @tableName and DATA_TYPE != 'timestamp' AND column_name != 'created'
OPEN cursCol
DECLARE @string nvarchar(MAX) --for storing the first half of INSERT statement
DECLARE @stringData nvarchar(MAX) --for storing the data (VALUES) related statement
DECLARE @dataType nvarchar(MAX) --data types returned for respective columns
SET @string='INSERT '+@tableName+'('
SET @stringData=''

DECLARE @colName nvarchar(50)

FETCH NEXT FROM cursCol INTO @colName,@dataType

IF @@fetch_status<>0
	begin
	print 'Table '+@tableName+' not found, processing skipped.'
	close curscol
	deallocate curscol
	return
END

WHILE @@FETCH_STATUS=0
BEGIN
IF @dataType in ('varchar','char','nchar','nvarchar')
BEGIN
	--SET @stringData=@stringData+'''''''''+isnull('+@colName+','''')+'''''',''+'
	SET @stringData=@stringData+''''+'''+isnull('''''+'''''+'+@colName+'+'''''+''''',''NULL'')+'',''+'
END
ELSE
if @dataType in ('text','ntext') --if the datatype is text or something else 
BEGIN
	SET @stringData=@stringData+'''''''''+isnull(cast('+@colName+' as varchar(2000)),'''')+'''''',''+'
END
ELSE
IF @dataType = 'money' --because money doesn't get converted from varchar implicitly
BEGIN
	SET @stringData=@stringData+'''convert(money,''''''+isnull(cast('+@colName+' as varchar(200)),''0.0000'')+''''''),''+'
END
ELSE 
IF @dataType='datetime'
BEGIN
	--SET @stringData=@stringData+'''convert(datetime,''''''+isnull(cast('+@colName+' as varchar(200)),''0'')+''''''),''+'
	--SELECT 'INSERT Authorizations(StatusDate) VALUES('+'convert(datetime,'+isnull(''''+convert(varchar(200),StatusDate,121)+'''','NULL')+',121),)' FROM Authorizations
	--SET @stringData=@stringData+'''convert(money,''''''+isnull(cast('+@colName+' as varchar(200)),''0.0000'')+''''''),''+'
	SET @stringData=@stringData+'''convert(datetime,'+'''+isnull('''''+'''''+convert(varchar(200),'+@colName+',121)+'''''+''''',''NULL'')+'',121),''+'
  --                             'convert(datetime,'+isnull(''''+convert(varchar(200),StatusDate,121)+'''','NULL')+',121),)' FROM Authorizations
END
ELSE 
IF @dataType='image' 
BEGIN
	SET @stringData=@stringData+'''''''''+isnull(cast(convert(varbinary,'+@colName+') as varchar(6)),''0'')+'''''',''+'
END
ELSE --presuming the data type is int,bit,numeric,decimal 
BEGIN
	--SET @stringData=@stringData+'''''''''+isnull(cast('+@colName+' as varchar(200)),''0'')+'''''',''+'
	--SET @stringData=@stringData+'''convert(datetime,'+'''+isnull('''''+'''''+convert(varchar(200),'+@colName+',121)+'''''+''''',''NULL'')+'',121),''+'
	SET @stringData=@stringData+''''+'''+isnull('''''+'''''+convert(varchar(200),'+@colName+')+'''''+''''',''NULL'')+'',''+'
END

SET @string=@string+@colName+','

FETCH NEXT FROM cursCol INTO @colName,@dataType
END
DECLARE @Query nvarchar(MAX)

SET @query ='SELECT '''+substring(@string,0,len(@string)) + ') VALUES(''+ ' + substring(@stringData,0,len(@stringData)-2)+'''+'')'' FROM '+@tableName + ' where templateid >= 10'

exec sp_executesql @query
--select @query

CLOSE cursCol
DEALLOCATE cursCol

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
SET QUOTED_IDENTIFIER ON
GO
PRINT N'Adding foreign keys to [dbo].[breeze_enquiry]'
GO
ALTER TABLE [dbo].[breeze_enquiry] WITH NOCHECK ADD
CONSTRAINT [breeze_enquiry_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [breeze_enquiry_issuecommentid_fk] FOREIGN KEY ([issuecommentid]) REFERENCES [dbo].[gemini_issuecomments] ([commentid]),
CONSTRAINT [breeze_enquiry_alerttemplateid_fk] FOREIGN KEY ([alerttemplateid]) REFERENCES [dbo].[gemini_alerttemplates] ([alerttemplateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[breeze_mailbox]'
GO
ALTER TABLE [dbo].[breeze_mailbox] WITH NOCHECK ADD
CONSTRAINT [breeze_mailbox_alerttemplateid_fk] FOREIGN KEY ([alerttemplateid]) REFERENCES [dbo].[gemini_alerttemplates] ([alerttemplateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_admappings]'
GO
ALTER TABLE [dbo].[gemini_admappings] WITH NOCHECK ADD
CONSTRAINT [gemini_admappings_projectgroups_fk] FOREIGN KEY ([projectgroupid]) REFERENCES [dbo].[gemini_projectgroups] ([projectgroupid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_codecommits]'
GO
ALTER TABLE [dbo].[gemini_codecommits] WITH NOCHECK ADD
CONSTRAINT [gemini_codecommits_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_customdata]'
GO
ALTER TABLE [dbo].[gemini_testing_customdata] WITH NOCHECK ADD
CONSTRAINT [gemini_testing_customdata_customfieldid_fk] FOREIGN KEY ([customfieldid]) REFERENCES [dbo].[gemini_customfielddefinitions] ([customfieldid]),
CONSTRAINT [gemini_testing_customdata_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_testing_customdata_stepid_fk] FOREIGN KEY ([stepid]) REFERENCES [dbo].[gemini_testing_case_steps] ([stepid]),
CONSTRAINT [gemini_testing_customdata_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid]),
CONSTRAINT [gemini_testing_customdata_testrunid_fk] FOREIGN KEY ([testrunid]) REFERENCES [dbo].[gemini_testing_runs] ([testrunid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issuelinks]'
GO
ALTER TABLE [dbo].[gemini_issuelinks] WITH NOCHECK ADD
CONSTRAINT [gemini_issuelinks_linktypeid_fk] FOREIGN KEY ([linktypeid]) REFERENCES [dbo].[gemini_issuelinktypes] ([linktypeid]),
CONSTRAINT [gemini_issuelinks_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [gemini_issuelinks_otherissueid_fk] FOREIGN KEY ([otherissueid]) REFERENCES [dbo].[gemini_issues] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issuevotes]'
GO
ALTER TABLE [dbo].[gemini_issuevotes] WITH NOCHECK ADD
CONSTRAINT [gemini_issuevotes_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [gemini_issuevotes_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issuewidgetdata]'
GO
ALTER TABLE [dbo].[gemini_issuewidgetdata] WITH NOCHECK ADD
CONSTRAINT [gemini_issuewidgetdata_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_sourcecontrolissuefiles]'
GO
ALTER TABLE [dbo].[gemini_sourcecontrolissuefiles] WITH NOCHECK ADD
CONSTRAINT [gemini_sourcecontrolissuefiles_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_run_times]'
GO
ALTER TABLE [dbo].[gemini_testing_run_times] WITH NOCHECK ADD
CONSTRAINT [gemini_testing_run_times_timetypeid_fk] FOREIGN KEY ([timetypeid]) REFERENCES [dbo].[gemini_issuetimetype] ([timetypeid]),
CONSTRAINT [gemini_testing_run_times_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_testing_run_times_issueid_fk] FOREIGN KEY ([testrunid]) REFERENCES [dbo].[gemini_testing_runs] ([testrunid]),
CONSTRAINT [gemini_testing_run_times_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_projectversionattributes]'
GO
ALTER TABLE [dbo].[gemini_projectversionattributes] WITH NOCHECK ADD
CONSTRAINT [gemini_projectversionattributes_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_projectversionattributevalues]'
GO
ALTER TABLE [dbo].[gemini_projectversionattributevalues] WITH NOCHECK ADD
CONSTRAINT [gemini_projectversionattributesvalues_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_projectversionattributesvalues_versionid_fk] FOREIGN KEY ([versionid]) REFERENCES [dbo].[gemini_versions] ([versionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_attachments]'
GO
ALTER TABLE [dbo].[gemini_testing_attachments] WITH NOCHECK ADD
CONSTRAINT [gemini_testing_attachments_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_testing_attachments_testrunid_fk] FOREIGN KEY ([testrunid]) REFERENCES [dbo].[gemini_testing_runs] ([testrunid]),
CONSTRAINT [gemini_testing_attachments_stepid_fk] FOREIGN KEY ([stepid]) REFERENCES [dbo].[gemini_testing_case_steps] ([stepid]),
CONSTRAINT [gemini_testing_attachments_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_cases]'
GO
ALTER TABLE [dbo].[gemini_testing_cases] WITH NOCHECK ADD
CONSTRAINT [gemini_testing_cases_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_testing_cases_typeid_fk] FOREIGN KEY ([typeid]) REFERENCES [dbo].[gemini_testing_types] ([typeid]),
CONSTRAINT [gemini_testing_cases_assignedto_fk] FOREIGN KEY ([assignedto]) REFERENCES [dbo].[gemini_users] ([userid]),
CONSTRAINT [gemini_testing_cases_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_history]'
GO
ALTER TABLE [dbo].[gemini_testing_history] WITH NOCHECK ADD
CONSTRAINT [gemini_testing_history_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_testing_history_stepid_fk] FOREIGN KEY ([stepid]) REFERENCES [dbo].[gemini_testing_case_steps] ([stepid]),
CONSTRAINT [gemini_testing_history_testrunid_fk] FOREIGN KEY ([testrunid]) REFERENCES [dbo].[gemini_testing_runs] ([testrunid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_plans]'
GO
ALTER TABLE [dbo].[gemini_testing_plans] WITH NOCHECK ADD
CONSTRAINT [gemini_testing_plans_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_testing_plans_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_userwidgetdata]'
GO
ALTER TABLE [dbo].[gemini_userwidgetdata] WITH NOCHECK ADD
CONSTRAINT [gemini_userwidgetdata_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_versionmilestone]'
GO
ALTER TABLE [dbo].[gemini_versionmilestone] WITH NOCHECK ADD
CONSTRAINT [gemini_versionmilestone_projectid_fk] FOREIGN KEY ([versionid]) REFERENCES [dbo].[gemini_versions] ([versionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[breeze_enquiry]'
GO
ALTER TABLE [dbo].[breeze_enquiry] ADD
CONSTRAINT [breeze_enquiry_queueid_fk] FOREIGN KEY ([queueid]) REFERENCES [dbo].[breeze_queue] ([queueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[breeze_mailbox]'
GO
ALTER TABLE [dbo].[breeze_mailbox] ADD
CONSTRAINT [breeze_mailbox_queueid_fk] FOREIGN KEY ([queueid]) REFERENCES [dbo].[breeze_queue] ([queueid]),
CONSTRAINT [breeze_mailbox_smtpserverid_fk] FOREIGN KEY ([smtpserverid]) REFERENCES [dbo].[breeze_smtpserver] ([smtpserverid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_admappings]'
GO
ALTER TABLE [dbo].[gemini_admappings] ADD
CONSTRAINT [gemini_admappings_adgroups_fk] FOREIGN KEY ([adgroupid]) REFERENCES [dbo].[gemini_adgroups] ([adgroupid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_affectedversions]'
GO
ALTER TABLE [dbo].[gemini_affectedversions] ADD
CONSTRAINT [gemini_affectedversions_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [gemini_affectedversions_versionid_fk] FOREIGN KEY ([versionid]) REFERENCES [dbo].[gemini_versions] ([versionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_appointments]'
GO
ALTER TABLE [dbo].[gemini_appointments] ADD
CONSTRAINT [gemini_appointments_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_appointments_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_cardissuesequence]'
GO
ALTER TABLE [dbo].[gemini_cardissuesequence] ADD
CONSTRAINT [gemini_cardissuesequence_cardid_fk] FOREIGN KEY ([cardid]) REFERENCES [dbo].[gemini_navigationcard] ([cardid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_chat]'
GO
ALTER TABLE [dbo].[gemini_chat] ADD
CONSTRAINT [gemini_chat_cardid_fk] FOREIGN KEY ([cardid]) REFERENCES [dbo].[gemini_navigationcard] ([cardid]),
CONSTRAINT [gemini_chat_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_components]'
GO
ALTER TABLE [dbo].[gemini_components] ADD
CONSTRAINT [gemini_components_componentid_fk] FOREIGN KEY ([parentcomponentid]) REFERENCES [dbo].[gemini_components] ([componentid]),
CONSTRAINT [gemini_components_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_components_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issuecomponents]'
GO
ALTER TABLE [dbo].[gemini_issuecomponents] ADD
CONSTRAINT [gemini_issuecomponents_componentid_fk] FOREIGN KEY ([componentid]) REFERENCES [dbo].[gemini_components] ([componentid]),
CONSTRAINT [gemini_issuecomponents_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_customfielddata]'
GO
ALTER TABLE [dbo].[gemini_customfielddata] ADD
CONSTRAINT [gemini_customfielddata_customfieldid_fk] FOREIGN KEY ([customfieldid]) REFERENCES [dbo].[gemini_customfielddefinitions] ([customfieldid]),
CONSTRAINT [gemini_customfielddata_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid]),
CONSTRAINT [gemini_customfielddata_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_customfielddata_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_customfielddefinitions]'
GO
ALTER TABLE [dbo].[gemini_customfielddefinitions] ADD
CONSTRAINT [gemini_customfielddefinitions_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_globalconfigurationwidgetdata]'
GO
ALTER TABLE [dbo].[gemini_globalconfigurationwidgetdata] ADD
CONSTRAINT [gemini_globalconfigurationwidgetdata_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_globalsecurityschemeroles]'
GO
ALTER TABLE [dbo].[gemini_globalsecurityschemeroles] ADD
CONSTRAINT [gemini_globalsecurityschemeroles_schemeid_fk] FOREIGN KEY ([schemeid]) REFERENCES [dbo].[gemini_globalsecurityschemes] ([schemeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_projects]'
GO
ALTER TABLE [dbo].[gemini_projects] ADD
CONSTRAINT [gemini_projects_globalschemeid_fk] FOREIGN KEY ([globalschemeid]) REFERENCES [dbo].[gemini_globalsecurityschemes] ([schemeid]),
CONSTRAINT [gemini_projects_labelid_fk] FOREIGN KEY ([projectlabelid]) REFERENCES [dbo].[gemini_projectlabels] ([labelid]),
CONSTRAINT [gemini_projects_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid]),
CONSTRAINT [gemini_projects_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issueattachments]'
GO
ALTER TABLE [dbo].[gemini_issueattachments] ADD
CONSTRAINT [gemini_issueattachments_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_issueattachments_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [gemini_issueattachments_commentid_fk] FOREIGN KEY ([commentid]) REFERENCES [dbo].[gemini_issuecomments] ([commentid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issueaudit]'
GO
ALTER TABLE [dbo].[gemini_issueaudit] ADD
CONSTRAINT [gemini_issueaudit_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [gemini_issueaudit_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_issueaudit_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issuecomments]'
GO
ALTER TABLE [dbo].[gemini_issuecomments] ADD
CONSTRAINT [gemini_issuecomments_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid]),
CONSTRAINT [gemini_issuecomments_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [gemini_issuecomments_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issuelinktypes]'
GO
ALTER TABLE [dbo].[gemini_issuelinktypes] ADD
CONSTRAINT [gemini_issuelinktypes_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issues]'
GO
ALTER TABLE [dbo].[gemini_issues] ADD
CONSTRAINT [gemini_issues_issuepriorityid_fk] FOREIGN KEY ([issuepriorityid]) REFERENCES [dbo].[gemini_issuepriorities] ([priorityid]),
CONSTRAINT [gemini_issues_issueresolutionid_fk] FOREIGN KEY ([issueresolutionid]) REFERENCES [dbo].[gemini_issueresolutions] ([resolutionid]),
CONSTRAINT [gemini_issues_parentissueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [gemini_issues_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_issues_versionid_fk] FOREIGN KEY ([fixedinversionid]) REFERENCES [dbo].[gemini_versions] ([versionid]),
CONSTRAINT [gemini_issues_reportedby_fk] FOREIGN KEY ([reportedby]) REFERENCES [dbo].[gemini_users] ([userid]),
CONSTRAINT [gemini_issues_issuetypeid_fk] FOREIGN KEY ([issuetypeid]) REFERENCES [dbo].[gemini_issuetypes] ([typeid]),
CONSTRAINT [gemini_issues_issueseverityid_fk] FOREIGN KEY ([issueseverityid]) REFERENCES [dbo].[gemini_issueseverity] ([severityid]),
CONSTRAINT [gemini_issues_issuestatusid_fk] FOREIGN KEY ([issuestatusid]) REFERENCES [dbo].[gemini_issuestatus] ([statusid]),
CONSTRAINT [gemini_issues_creator_fk] FOREIGN KEY ([creator]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issuepriorities]'
GO
ALTER TABLE [dbo].[gemini_issuepriorities] ADD
CONSTRAINT [gemini_issuepriorities_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issueresolutions]'
GO
ALTER TABLE [dbo].[gemini_issueresolutions] ADD
CONSTRAINT [gemini_issueresolutions_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issueresources]'
GO
ALTER TABLE [dbo].[gemini_issueresources] ADD
CONSTRAINT [gemini_issueresources_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [gemini_issueresources_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_navigationcard]'
GO
ALTER TABLE [dbo].[gemini_navigationcard] ADD
CONSTRAINT [gemini_navigationcard_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [gemini_navigationcard_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_navigationcard_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_case_issues]'
GO
ALTER TABLE [dbo].[gemini_testing_case_issues] ADD
CONSTRAINT [gemini_testing_case_issues_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [gemini_testing_case_issues_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_timetracking]'
GO
ALTER TABLE [dbo].[gemini_timetracking] ADD
CONSTRAINT [gemini_timetracking_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [gemini_timetracking_timetypeid_fk] FOREIGN KEY ([timetypeid]) REFERENCES [dbo].[gemini_issuetimetype] ([timetypeid]),
CONSTRAINT [gemini_timetracking_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_timetracking_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_watchissues]'
GO
ALTER TABLE [dbo].[gemini_watchissues] ADD
CONSTRAINT [gemini_watchissues_issueid_fk] FOREIGN KEY ([issueid]) REFERENCES [dbo].[gemini_issues] ([issueid]),
CONSTRAINT [gemini_watchissues_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_watchissues_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issueseverity]'
GO
ALTER TABLE [dbo].[gemini_issueseverity] ADD
CONSTRAINT [gemini_issueseverity_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issuestatus]'
GO
ALTER TABLE [dbo].[gemini_issuestatus] ADD
CONSTRAINT [gemini_issuestatus_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issuetimetype]'
GO
ALTER TABLE [dbo].[gemini_issuetimetype] ADD
CONSTRAINT [gemini_issuetimetype_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_issuetypes]'
GO
ALTER TABLE [dbo].[gemini_issuetypes] ADD
CONSTRAINT [gemini_issuetypes_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_optoutemails]'
GO
ALTER TABLE [dbo].[gemini_optoutemails] ADD
CONSTRAINT [gemini_optoutemails_cardid_fk] FOREIGN KEY ([cardid]) REFERENCES [dbo].[gemini_navigationcard] ([cardid]),
CONSTRAINT [gemini_optoutemails_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_plannerviews]'
GO
ALTER TABLE [dbo].[gemini_plannerviews] ADD
CONSTRAINT [gemini_plannerviews_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_projectattributes]'
GO
ALTER TABLE [dbo].[gemini_projectattributes] ADD
CONSTRAINT [gemini_projectattributes_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_projectaudit]'
GO
ALTER TABLE [dbo].[gemini_projectaudit] ADD
CONSTRAINT [gemini_projectaudit_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_projectaudit_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_projectdefaultvalues]'
GO
ALTER TABLE [dbo].[gemini_projectdefaultvalues] ADD
CONSTRAINT [gemini_projectdefaultvalues_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_projectdocuments]'
GO
ALTER TABLE [dbo].[gemini_projectdocuments] ADD
CONSTRAINT [gemini_projectdocuments_parentdocumentid_fk] FOREIGN KEY ([parentdocumentid]) REFERENCES [dbo].[gemini_projectdocuments] ([documentid]),
CONSTRAINT [gemini_projectdocuments_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_projectgroupmembership]'
GO
ALTER TABLE [dbo].[gemini_projectgroupmembership] ADD
CONSTRAINT [gemini_projectgroupmembership_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_projectgroupmembership_projectgroupid] FOREIGN KEY ([projectgroupid]) REFERENCES [dbo].[gemini_projectgroups] ([projectgroupid]),
CONSTRAINT [gemini_projectgroupmembership_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_projectissuesequence]'
GO
ALTER TABLE [dbo].[gemini_projectissuesequence] ADD
CONSTRAINT [gemini_projectissuesequence_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_sharedviews]'
GO
ALTER TABLE [dbo].[gemini_sharedviews] ADD
CONSTRAINT [gemini_sharedviews_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_sharedviews_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_run_cases]'
GO
ALTER TABLE [dbo].[gemini_testing_run_cases] ADD
CONSTRAINT [gemini_testing_run_cases_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_testing_run_cases_testrunid_fk] FOREIGN KEY ([testrunid]) REFERENCES [dbo].[gemini_testing_runs] ([testrunid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_runs]'
GO
ALTER TABLE [dbo].[gemini_testing_runs] ADD
CONSTRAINT [gemini_testing_runs_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_testing_runs_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_userissuesviews]'
GO
ALTER TABLE [dbo].[gemini_userissuesviews] ADD
CONSTRAINT [gemini_userissuesviews_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_userissuesviews_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_versions]'
GO
ALTER TABLE [dbo].[gemini_versions] ADD
CONSTRAINT [gemini_versions_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid]),
CONSTRAINT [gemini_versions_versionid_fk] FOREIGN KEY ([parentversionid]) REFERENCES [dbo].[gemini_versions] ([versionid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_projectversionattributevalues]'
GO
ALTER TABLE [dbo].[gemini_projectversionattributevalues] ADD
CONSTRAINT [gemini_projectversionattributevalues_attributeid_fk] FOREIGN KEY ([attributeid]) REFERENCES [dbo].[gemini_projectversionattributes] ([attributeid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_attachments]'
GO
ALTER TABLE [dbo].[gemini_testing_attachments] ADD
CONSTRAINT [gemini_testing_attachments_testplanid_fk] FOREIGN KEY ([testplanid]) REFERENCES [dbo].[gemini_testing_plans] ([testplanid]),
CONSTRAINT [gemini_testing_attachments_testcaseid_fk] FOREIGN KEY ([testcaseid]) REFERENCES [dbo].[gemini_testing_cases] ([testcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_case_steps]'
GO
ALTER TABLE [dbo].[gemini_testing_case_steps] ADD
CONSTRAINT [gemini_testing_case_steps_steptestcaseid_fk] FOREIGN KEY ([steptestcaseid]) REFERENCES [dbo].[gemini_testing_cases] ([testcaseid]),
CONSTRAINT [gemini_testing_case_steps_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_cases]'
GO
ALTER TABLE [dbo].[gemini_testing_cases] ADD
CONSTRAINT [gemini_testcase_originaltestcaseid_fk] FOREIGN KEY ([originaltestcaseid]) REFERENCES [dbo].[gemini_testing_cases] ([testcaseid]),
CONSTRAINT [gemini_testing_cases_parenttestcaseid_fk] FOREIGN KEY ([parenttestcaseid]) REFERENCES [dbo].[gemini_testing_cases] ([testcaseid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_customdata]'
GO
ALTER TABLE [dbo].[gemini_testing_customdata] ADD
CONSTRAINT [gemini_testing_customdata_testcaseid_fk] FOREIGN KEY ([testcaseid]) REFERENCES [dbo].[gemini_testing_cases] ([testcaseid]),
CONSTRAINT [gemini_testing_customdata_testplanid_fk] FOREIGN KEY ([testplanid]) REFERENCES [dbo].[gemini_testing_plans] ([testplanid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_history]'
GO
ALTER TABLE [dbo].[gemini_testing_history] ADD
CONSTRAINT [gemini_testing_history_testcaseid_fk] FOREIGN KEY ([testcaseid]) REFERENCES [dbo].[gemini_testing_cases] ([testcaseid]),
CONSTRAINT [gemini_testing_history_testplanid_fk] FOREIGN KEY ([testplanid]) REFERENCES [dbo].[gemini_testing_plans] ([testplanid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_plan_cases]'
GO
ALTER TABLE [dbo].[gemini_testing_plan_cases] ADD
CONSTRAINT [gemini_testing_plan_cases_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_plans]'
GO
ALTER TABLE [dbo].[gemini_testing_plans] ADD
CONSTRAINT [gemini_testing_plans_parenttestplanid_fk] FOREIGN KEY ([parenttestplanid]) REFERENCES [dbo].[gemini_testing_plans] ([testplanid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
PRINT N'Adding foreign keys to [dbo].[gemini_testing_run_steps]'
GO
ALTER TABLE [dbo].[gemini_testing_run_steps] ADD
CONSTRAINT [gemini_testing_run_steps_testrunid_fk] FOREIGN KEY ([testrunid]) REFERENCES [dbo].[gemini_testing_runs] ([testrunid]),
CONSTRAINT [gemini_testing_run_steps_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT 'The database update succeeded'
COMMIT TRANSACTION
END
ELSE PRINT 'The database update failed'
GO
DROP TABLE #tmpErrors
GO
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
-- Pointer used for text / image updates. This might not be needed, but is declared here just in case
DECLARE @pv binary(16)

-- Drop constraints from [dbo].[gemini_projectgroupmembership]
ALTER TABLE [dbo].[gemini_projectgroupmembership] DROP CONSTRAINT [gemini_projectgroupmembership_projectgroupid]
ALTER TABLE [dbo].[gemini_projectgroupmembership] DROP CONSTRAINT [gemini_projectgroupmembership_projectid_fk]
ALTER TABLE [dbo].[gemini_projectgroupmembership] DROP CONSTRAINT [gemini_projectgroupmembership_userid_fk]

-- Drop constraints from [dbo].[gemini_issuetypes]
ALTER TABLE [dbo].[gemini_issuetypes] DROP CONSTRAINT [gemini_issuetypes_templateid_fk]

-- Drop constraint gemini_issues_issuetypeid_fk from [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] DROP CONSTRAINT [gemini_issues_issuetypeid_fk]

-- Drop constraints from [dbo].[gemini_issuetimetype]
ALTER TABLE [dbo].[gemini_issuetimetype] DROP CONSTRAINT [gemini_issuetimetype_templateid_fk]

-- Drop constraint gemini_testing_run_times_timetypeid_fk from [dbo].[gemini_testing_run_times]
ALTER TABLE [dbo].[gemini_testing_run_times] DROP CONSTRAINT [gemini_testing_run_times_timetypeid_fk]

-- Drop constraint gemini_timetracking_timetypeid_fk from [dbo].[gemini_timetracking]
ALTER TABLE [dbo].[gemini_timetracking] DROP CONSTRAINT [gemini_timetracking_timetypeid_fk]

-- Drop constraints from [dbo].[gemini_issuestatus]
ALTER TABLE [dbo].[gemini_issuestatus] DROP CONSTRAINT [gemini_issuestatus_templateid_fk]

-- Drop constraint gemini_issues_issuestatusid_fk from [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] DROP CONSTRAINT [gemini_issues_issuestatusid_fk]

-- Drop constraints from [dbo].[gemini_issueseverity]
ALTER TABLE [dbo].[gemini_issueseverity] DROP CONSTRAINT [gemini_issueseverity_templateid_fk]

-- Drop constraint gemini_issues_issueseverityid_fk from [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] DROP CONSTRAINT [gemini_issues_issueseverityid_fk]

-- Drop constraints from [dbo].[gemini_issueresolutions]
ALTER TABLE [dbo].[gemini_issueresolutions] DROP CONSTRAINT [gemini_issueresolutions_templateid_fk]

-- Drop constraint gemini_issues_issueresolutionid_fk from [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] DROP CONSTRAINT [gemini_issues_issueresolutionid_fk]

-- Drop constraints from [dbo].[gemini_issuepriorities]
ALTER TABLE [dbo].[gemini_issuepriorities] DROP CONSTRAINT [gemini_issuepriorities_templateid_fk]

-- Drop constraint gemini_issues_issuepriorityid_fk from [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] DROP CONSTRAINT [gemini_issues_issuepriorityid_fk]

-- Drop constraints from [dbo].[gemini_issuelinktypes]
ALTER TABLE [dbo].[gemini_issuelinktypes] DROP CONSTRAINT [gemini_issuelinktypes_templateid_fk]

-- Drop constraint gemini_issuelinks_linktypeid_fk from [dbo].[gemini_issuelinks]
ALTER TABLE [dbo].[gemini_issuelinks] DROP CONSTRAINT [gemini_issuelinks_linktypeid_fk]

-- Drop constraints from [dbo].[gemini_customfielddefinitions]
ALTER TABLE [dbo].[gemini_customfielddefinitions] DROP CONSTRAINT [gemini_customfielddefinitions_templateid_fk]

-- Drop constraint gemini_customfielddata_customfieldid_fk from [dbo].[gemini_customfielddata]
ALTER TABLE [dbo].[gemini_customfielddata] DROP CONSTRAINT [gemini_customfielddata_customfieldid_fk]

-- Drop constraint gemini_testing_customdata_customfieldid_fk from [dbo].[gemini_testing_customdata]
ALTER TABLE [dbo].[gemini_testing_customdata] DROP CONSTRAINT [gemini_testing_customdata_customfieldid_fk]

-- Drop constraint gemini_appointments_userid_fk from [dbo].[gemini_appointments]
ALTER TABLE [dbo].[gemini_appointments] DROP CONSTRAINT [gemini_appointments_userid_fk]

-- Drop constraint gemini_chat_userid_fk from [dbo].[gemini_chat]
ALTER TABLE [dbo].[gemini_chat] DROP CONSTRAINT [gemini_chat_userid_fk]

-- Drop constraint gemini_components_userid_fk from [dbo].[gemini_components]
ALTER TABLE [dbo].[gemini_components] DROP CONSTRAINT [gemini_components_userid_fk]

-- Drop constraint gemini_customfielddata_userid_fk from [dbo].[gemini_customfielddata]
ALTER TABLE [dbo].[gemini_customfielddata] DROP CONSTRAINT [gemini_customfielddata_userid_fk]

-- Drop constraint gemini_issueaudit_userid_fk from [dbo].[gemini_issueaudit]
ALTER TABLE [dbo].[gemini_issueaudit] DROP CONSTRAINT [gemini_issueaudit_userid_fk]

-- Drop constraint gemini_issuecomments_userid_fk from [dbo].[gemini_issuecomments]
ALTER TABLE [dbo].[gemini_issuecomments] DROP CONSTRAINT [gemini_issuecomments_userid_fk]

-- Drop constraint gemini_issueresources_userid_fk from [dbo].[gemini_issueresources]
ALTER TABLE [dbo].[gemini_issueresources] DROP CONSTRAINT [gemini_issueresources_userid_fk]

-- Drop constraint gemini_issues_creator_fk from [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] DROP CONSTRAINT [gemini_issues_creator_fk]

-- Drop constraint gemini_issues_reportedby_fk from [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] DROP CONSTRAINT [gemini_issues_reportedby_fk]

-- Drop constraint gemini_issuevotes_userid_fk from [dbo].[gemini_issuevotes]
ALTER TABLE [dbo].[gemini_issuevotes] DROP CONSTRAINT [gemini_issuevotes_userid_fk]

-- Drop constraint gemini_navigationcard_userid_fk from [dbo].[gemini_navigationcard]
ALTER TABLE [dbo].[gemini_navigationcard] DROP CONSTRAINT [gemini_navigationcard_userid_fk]

-- Drop constraint gemini_optoutemails_userid_fk from [dbo].[gemini_optoutemails]
ALTER TABLE [dbo].[gemini_optoutemails] DROP CONSTRAINT [gemini_optoutemails_userid_fk]

-- Drop constraint gemini_plannerviews_userid_fk from [dbo].[gemini_plannerviews]
ALTER TABLE [dbo].[gemini_plannerviews] DROP CONSTRAINT [gemini_plannerviews_userid_fk]

-- Drop constraint gemini_projectaudit_userid_fk from [dbo].[gemini_projectaudit]
ALTER TABLE [dbo].[gemini_projectaudit] DROP CONSTRAINT [gemini_projectaudit_userid_fk]

-- Drop constraint gemini_projects_userid_fk from [dbo].[gemini_projects]
ALTER TABLE [dbo].[gemini_projects] DROP CONSTRAINT [gemini_projects_userid_fk]

-- Drop constraint gemini_sharedviews_userid_fk from [dbo].[gemini_sharedviews]
ALTER TABLE [dbo].[gemini_sharedviews] DROP CONSTRAINT [gemini_sharedviews_userid_fk]

-- Drop constraint gemini_testing_attachments_createdby_fk from [dbo].[gemini_testing_attachments]
ALTER TABLE [dbo].[gemini_testing_attachments] DROP CONSTRAINT [gemini_testing_attachments_createdby_fk]

-- Drop constraint gemini_testing_case_issues_createdby_fk from [dbo].[gemini_testing_case_issues]
ALTER TABLE [dbo].[gemini_testing_case_issues] DROP CONSTRAINT [gemini_testing_case_issues_createdby_fk]

-- Drop constraint gemini_testing_case_steps_createdby_fk from [dbo].[gemini_testing_case_steps]
ALTER TABLE [dbo].[gemini_testing_case_steps] DROP CONSTRAINT [gemini_testing_case_steps_createdby_fk]

-- Drop constraint gemini_testing_cases_assignedto_fk from [dbo].[gemini_testing_cases]
ALTER TABLE [dbo].[gemini_testing_cases] DROP CONSTRAINT [gemini_testing_cases_assignedto_fk]

-- Drop constraint gemini_testing_cases_createdby_fk from [dbo].[gemini_testing_cases]
ALTER TABLE [dbo].[gemini_testing_cases] DROP CONSTRAINT [gemini_testing_cases_createdby_fk]

-- Drop constraint gemini_testing_customdata_userid_fk from [dbo].[gemini_testing_customdata]
ALTER TABLE [dbo].[gemini_testing_customdata] DROP CONSTRAINT [gemini_testing_customdata_userid_fk]

-- Drop constraint gemini_testing_plan_cases_createdby_fk from [dbo].[gemini_testing_plan_cases]
ALTER TABLE [dbo].[gemini_testing_plan_cases] DROP CONSTRAINT [gemini_testing_plan_cases_createdby_fk]

-- Drop constraint gemini_testing_plans_createdby_fk from [dbo].[gemini_testing_plans]
ALTER TABLE [dbo].[gemini_testing_plans] DROP CONSTRAINT [gemini_testing_plans_createdby_fk]

-- Drop constraint gemini_testing_run_steps_createdby_fk from [dbo].[gemini_testing_run_steps]
ALTER TABLE [dbo].[gemini_testing_run_steps] DROP CONSTRAINT [gemini_testing_run_steps_createdby_fk]

-- Drop constraint gemini_testing_run_times_userid_fk from [dbo].[gemini_testing_run_times]
ALTER TABLE [dbo].[gemini_testing_run_times] DROP CONSTRAINT [gemini_testing_run_times_userid_fk]

-- Drop constraint gemini_testing_runs_createdby_fk from [dbo].[gemini_testing_runs]
ALTER TABLE [dbo].[gemini_testing_runs] DROP CONSTRAINT [gemini_testing_runs_createdby_fk]

-- Drop constraint gemini_timetracking_userid_fk from [dbo].[gemini_timetracking]
ALTER TABLE [dbo].[gemini_timetracking] DROP CONSTRAINT [gemini_timetracking_userid_fk]

-- Drop constraint gemini_userissuesviews_userid_fk from [dbo].[gemini_userissuesviews]
ALTER TABLE [dbo].[gemini_userissuesviews] DROP CONSTRAINT [gemini_userissuesviews_userid_fk]

-- Drop constraint gemini_userwidgetdata_userid_fk from [dbo].[gemini_userwidgetdata]
ALTER TABLE [dbo].[gemini_userwidgetdata] DROP CONSTRAINT [gemini_userwidgetdata_userid_fk]

-- Drop constraint gemini_watchissues_userid_fk from [dbo].[gemini_watchissues]
ALTER TABLE [dbo].[gemini_watchissues] DROP CONSTRAINT [gemini_watchissues_userid_fk]

-- Drop constraint gemini_testing_cases_typeid_fk from [dbo].[gemini_testing_cases]
ALTER TABLE [dbo].[gemini_testing_cases] DROP CONSTRAINT [gemini_testing_cases_typeid_fk]

-- Drop constraint gemini_projects_templateid_fk from [dbo].[gemini_projects]
ALTER TABLE [dbo].[gemini_projects] DROP CONSTRAINT [gemini_projects_templateid_fk]

-- Drop constraint gemini_admappings_projectgroups_fk from [dbo].[gemini_admappings]
ALTER TABLE [dbo].[gemini_admappings] DROP CONSTRAINT [gemini_admappings_projectgroups_fk]

-- Drop constraint breeze_enquiry_alerttemplateid_fk from [dbo].[breeze_enquiry]
ALTER TABLE [dbo].[breeze_enquiry] DROP CONSTRAINT [breeze_enquiry_alerttemplateid_fk]

-- Drop constraint breeze_mailbox_alerttemplateid_fk from [dbo].[breeze_mailbox]
ALTER TABLE [dbo].[breeze_mailbox] DROP CONSTRAINT [breeze_mailbox_alerttemplateid_fk]

-- Add 1 row to [dbo].[breeze_matchexpression]
SET IDENTITY_INSERT [dbo].[breeze_matchexpression] ON
INSERT INTO [dbo].[breeze_matchexpression] ([expressionid], [name], [expression], [replacevalue], [created]) VALUES (1, N'Reply Above This Line', N'--- please reply above this line ---', N'', '2014-04-22T10:24:58.550')
SET IDENTITY_INSERT [dbo].[breeze_matchexpression] OFF

-- Add 7 rows to [dbo].[gemini_alerttemplates]
SET IDENTITY_INSERT [dbo].[gemini_alerttemplates] ON
INSERT INTO [dbo].[gemini_alerttemplates] ([alerttemplateid], [alerttype], [label], [alertcontent], [projects], [created], [templatedata]) VALUES (1, 4, N'When something in the Workspace changes', N'<table style="width: 100%; font-family: arial; font-size: 16px; font-weight: bold; border: none; background-color: #356aa0;" cellpadding="20">
<tbody>
<tr>
	<td><a href="@Html.Raw(Model.CardUrl)" style="text-decoration: none; color: #FFFFFF;">@(Model.CardTitle)</a></td>
</tr>
</tbody>
</table>
<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: 1px solid #e2e2e2; background-color: #FFFFFF;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">Just to let you know that there are <strong>@(Model.ChangeCount) changes </strong> to your <strong>@(Model.CardTitle)</strong> AppNav card.</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td>&nbsp;</td>
</tr>
</tbody>
</table>


@if (Model.AllItems.Count > 0)
{
	@foreach(var item in Model.AllItems)
	{
		<table style="margin-left: 20px; font-family: arial; font-size: 14px; font-weight: normal; border: none; background-color: whitesmoke; border-collapse: collapse;" cellpadding="10">
		<tbody>
		<tr>
			<td style="color: #4c4c4c; border-left: 3px solid #ebebeb;"><span style="font-size:10px;color: #808080;">@(Model.IsNew(item) ? "NEW" : "")</span> <a href="@Html.Raw(Model.ItemUrl(item))" style="text-decoration: none;">@item.IssueKey - @item.Title</a></td>
		</tr>
		</tbody>
		</table>
		<table style="margin-left: 40px; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: white; border-collapse: collapse;" cellpadding="5">
		<tbody>
			@foreach(var change in item.ChangeLog)
			{
		<tr>
			<td><strong>@change.Field</strong> @change.Change</td>
		</tr>
			}
			<tr><td><br/></td></tr>
		</tbody>
		</table>
	}
}


<table style="margin-left: 20px; height: 35px; width: 100px;  font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #4b9237;" cellpadding="2">
<tbody>
<tr>
<td style="height: 35px; color: #4c4c4c; text-align: center;"><a href="@Html.Raw(Model.CardUrl)" style="color: #fff; text-decoration: none;">VIEW CARD</a></td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: none; background-color: white; margin: 7px 0 0 9px;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">Thanks!</td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #ffffff;" cellpadding="5">
<tbody>
<tr><td><br/></td></tr>
<tr>
	<td style="color: #005682;" align="center"><a style="text-decoration:none;" href="http://www.countersoft.com">Powered by Countersoft Gemini</a> » <a href="@(Model.GeminiUrl)dashboard?manage-alerts">Manage alerts</a></td>
</tr>
</tbody>
</table>', N'', '2012-08-01T19:32:32.027', N'{"Subject":""}')
INSERT INTO [dbo].[gemini_alerttemplates] ([alerttemplateid], [alerttype], [label], [alertcontent], [projects], [created], [templatedata]) VALUES (2, 2, N'When followed items change', N'<table style="width: 100%; font-family: arial; font-size: 16px; font-weight: bold; border: none; background-color: #356aa0;" cellpadding="20">
<tbody>
<tr>
	<td style="color: #FFFFFF;">My Watched Items</td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: 1px solid #E2E2E2; background-color: #FFFFFF;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">Just to let you know that there are <strong>@(Model.ChangeCount) changes </strong> to your watched items.</td>
</tr>
</tbody>
</table>
<br/>

@if (Model.TheItemsUpdated.Count > 0)
{
	@foreach(var item in Model.TheItemsUpdated)
	{

		<table style="margin-left: 20px; font-family: arial; font-size: 14px; font-weight: normal; border: none; background-color: whitesmoke; border-collapse: collapse;" cellpadding="10">
		<tbody>
		<tr>
		<td style="color: #4c4c4c; border-left: 3px solid #ebebeb;"><a href="@Html.Raw(Model.ItemUrl(item))" style="text-decoration: none;">@item.IssueKey - @item.Title</a></td>
		</tr>
		</tbody>
		</table>
		<table style="margin-left: 40px; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: white; border-collapse: collapse;" cellpadding="5">
		<tbody>
			@foreach(var change in item.ChangeLog)
			{
		<tr>
			<td><strong>@change.Field</strong> @change.Change</td>
		</tr>
			}
			<tr><td>&nbsp;</td></tr>
		</tbody>
		</table>
	}
}

<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: none; background-color: white; margin: 7px 0 0 9px;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">Thanks!</td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #ffffff;" cellpadding="5">
<tbody>
<tr><td><br/></td></tr>
<tr>
	<td style="color: #005682;" align="center"><a style="text-decoration:none;" href="http://www.countersoft.com">Powered by Countersoft Gemini</a></td>
</tr>
</tbody>
</table>', N'', '2012-08-01T19:32:32.027', N'{"Subject":""}')
INSERT INTO [dbo].[gemini_alerttemplates] ([alerttemplateid], [alerttype], [label], [alertcontent], [projects], [created], [templatedata]) VALUES (3, 1, N'When new things are added', N'<table style="width: 100%; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: white;" cellpadding="10">
   	<tbody>
		<tr>
			<td style="color: #808080;" align="center">--- please reply above this line ---</td>
		</tr>
	</tbody>
</table>
<table style="width: 100%; font-family: arial; font-size: 16px; font-weight: bold; border: none; background-color: #356aa0;" cellpadding="20">
<tbody>
<tr>
	<td><a href="@Html.Raw(Model.ItemUrl(Model.TheItem))" style="color: #ffffff; text-decoration: none;">@Model.TheItem.IssueKey - @Model.TheItem.Title</a></td>
</tr>
</tbody>
</table>
<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: 1px solid #e2e2e2; background-color: white;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">New item has been created by @Model.TheItem.Reporter @Model.TheItem.CreatedRelative.</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
	<td>&nbsp;</td>
</tr>
</tbody>
</table>

<table style="margin-left: 20px; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: white; border-collapse: collapse;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;background-color:#f5f5f5;"><strong>Type</strong></td>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;">@(Model.TheItem.Type)</td>
</tr>
<tr>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;background-color:#f5f5f5;"><strong>Status</strong></td>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;">@(Model.TheItem.Status)</td>
</tr>
<tr>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;background-color:#f5f5f5;"><strong>Priority</strong></td>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;">@(Model.TheItem.Priority)</td>
</tr>
<tr>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;background-color:#f5f5f5;"><strong>Component</strong></td>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;">@(Model.TheItem.ComponentNames)</td>
</tr>
</tbody>
</table>


<table>
<tbody>
<tr>
	<td>&nbsp;</td>
</tr>
</tbody>
</table>


<table style="margin-left: 20px; height: 35px; width: 70px;  font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #4b9237;" cellpadding="2">
<tbody>
<tr>
	<td style="height: 35px; color: #4c4c4c; text-align: center;"><a href="@Html.Raw(Model.ItemUrl(Model.TheItem))" style="color: #fff; text-decoration: none;">VIEW</a></td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: none; background-color: white; margin: 7px 0 0 9px;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">Thanks!</td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #ffffff;" cellpadding="5">
<tbody>
<tr><td><br/></td></tr>
<tr>
	<td style="color: #005682;" align="center"><a style="text-decoration:none;" href="http://www.countersoft.com">Powered by Countersoft Gemini</a> » <a href="@(Model.GeminiUrl)dashboard?manage-alerts">Manage alerts</a></td>
</tr>
</tbody>
</table>', N'', '2012-08-01T19:32:32.030', N'{"Subject":""}')
INSERT INTO [dbo].[gemini_alerttemplates] ([alerttemplateid], [alerttype], [label], [alertcontent], [projects], [created], [templatedata]) VALUES (4, 3, N'When someone is resourced', N'<table style="width: 100%; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: white;" cellpadding="10">
   	<tbody>
		<tr>
			<td style="color: #808080;" align="center">--- please reply above this line ---</td>
		</tr>
	</tbody>
</table>


<table style="width: 100%; font-family: arial; font-size: 16px; font-weight: bold; border: none; background-color: #356aa0;" cellpadding="20">
<tbody>
<tr>
	<td><a href="@Html.Raw(Model.ItemUrl(Model.TheItem))" style="color: #ffffff; text-decoration: none;">@Model.TheItem.IssueKey - @Model.TheItem.Title</a></td>
</tr>
</tbody>
</table>


<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: 1px solid #e2e2e2; background-color: #FFFFFF;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">Just to let you know the following <strong>@(Model.TheItem.Type)</strong> in <strong>@(Model.TheItem.ProjectName)</strong> has been assigned to you.</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td>&nbsp;</td>
</tr>
</tbody>
</table>


<table style="margin-left: 20px; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: white; border-collapse: collapse;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;background-color:#f5f5f5;"><strong>Type</strong></td>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;">@(Model.TheItem.Type)</td>
</tr>
<tr>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;background-color:#f5f5f5;"><strong>Status</strong></td>
<td style="border: 1px solid #E2E2E2;">@(Model.TheItem.Status)</td>
</tr>
<tr>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;background-color:#f5f5f5;"><strong>Priority</strong></td>
<td style="border: 1px solid #E2E2E2;">@(Model.TheItem.Priority)</td>
</tr>
<tr>
<td style="color: #4c4c4c; border: 1px solid #E2E2E2;background-color:#f5f5f5;"><strong>Component</strong></td>
<td style="border: 1px solid #E2E2E2;">@(Model.TheItem.ComponentNames)</td>
</tr>
</tbody>
</table>


<table>
<tbody>
<tr>
<td>&nbsp;</td>
</tr>
</tbody>
</table>

<table style="margin-left: 20px; height: 35px; width: 70px;  font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #4b9237;" cellpadding="2">
<tbody>
<tr>
<td style="height: 35px; color: #4c4c4c; text-align: center;"><a href="@Html.Raw(Model.ItemUrl(Model.TheItem))" style="color: #fff; text-decoration: none;">VIEW</a></td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: none; background-color: white; margin: 7px 0 0 9px;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">Thanks!</td>
</tr>
</tbody>
</table>





<table style="width: 100%; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #ffffff;" cellpadding="5">
<tbody>
<tr><td><br/></td></tr>
<tr>
	<td style="color: #005682;" align="center"><a style="text-decoration:none;" href="http://www.countersoft.com">Powered by Countersoft Gemini</a></td>
</tr>
</tbody>
</table>', N'', '2012-08-01T19:32:32.030', N'{"Subject":""}')
INSERT INTO [dbo].[gemini_alerttemplates] ([alerttemplateid], [alerttype], [label], [alertcontent], [projects], [created], [templatedata]) VALUES (5, 5, N'Confirmation to customer that email has been logged as ticket', N'<table style="width: 100%; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: white;" cellpadding="10">
   	<tbody>
		<tr>
			<td style="color: #808080;" align="center">--- please reply above this line ---</td>
		</tr>
	</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 16px; font-weight: bold; border: none; background-color: #356aa0;" cellpadding="20">
<tbody>
<tr>
	<td><a href="@Html.Raw(Model.ItemUrl(Model.TheItem))" style="color: #ffffff; text-decoration: none;">@Model.TheItem.IssueKey - @Model.TheItem.Title</a></td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: 1px solid #e2e2e2; background-color: #FFFFFF;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">Thanks for your email which has been received and a ticket has been opened for you <strong>(@(Model.TheItem.IssueKey)).</strong></td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td>&nbsp;</td>
</tr>
</tbody>
</table>

<table style="margin-left: 20px; font-family: arial; font-size: 14px; font-weight: normal; border: none; background-color: whitesmoke; border-collapse: collapse;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c; border-left: 3px solid #ebebeb;"><strong>@(Model.TheItem.Title)</strong></td>
</tr>
<tr>
<td style="color: #4c4c4c; border-left: 3px solid #ebebeb;">@Html.Raw(Model.TheItem.Description)</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td>&nbsp;</td>
</tr>
</tbody>
</table>

<table style="margin-left: 20px; height: 35px; width: 70px;  font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #4b9237;" cellpadding="2">
<tbody>
<tr>
<td style="height: 35px; color: #4c4c4c; text-align: center;"><a href="@Html.Raw(Model.ItemUrl(Model.TheItem))" style="color: #fff; text-decoration: none;">VIEW</a></td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: none; background-color: white; margin: 7px 0 0 9px;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">Thanks!</td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #ffffff;" cellpadding="5">
<tbody>
<tr><td><br/></td></tr>
<tr>
	<td style="color: #005682;" align="center"><a style="text-decoration:none;" href="http://www.countersoft.com">Powered by Countersoft Gemini</a></td>
</tr>
</tbody>
</table>', N'', '2012-11-05T14:49:32.710', N'{"Subject":""}')
INSERT INTO [dbo].[gemini_alerttemplates] ([alerttemplateid], [alerttype], [label], [alertcontent], [projects], [created], [templatedata]) VALUES (6, 6, N'When ticket changes customer is sent an email with details', N'<table style="width: 100%; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: white;" cellpadding="10">
   	<tbody>
		<tr>
			<td style="color: #808080;" align="center">--- please reply above this line ---</td>
		</tr>
	</tbody>
</table>


<table style="width: 100%; font-family: arial; font-size: 16px; border: none; background-color: #356aa0;" cellpadding="20">
<tbody>
<tr>
	<td style="color: #FFFFFF;">You have a response to your ticket <a href="@Html.Raw(Model.ItemUrl(Model.TheItem))" style="color: #FFFFFF; font-weight: bold; text-decoration: none;">@Model.TheItem.IssueKey</a></td>
</tr>
</tbody>
</table>


<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: 1px solid #E2E2E2; background-color: #FFFFFF;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">@Html.Raw(Model.TheItem.LastComment)</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr>
<td>&nbsp;</td>
</tr>
</tbody>
</table>


<table style="margin-left: 20px; font-family: arial; font-size: 14px; font-weight: normal; border: none; background-color: whitesmoke; border-collapse: collapse;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c; border-left: 3px solid #ebebeb;"><strong>@(Model.TheItem.Title)</strong></td>
</tr>
<tr>
<td style="color: #4c4c4c; border-left: 3px solid #ebebeb;">@Html.Raw(Model.ResponseTo)</td>
</tr>
</tbody>
</table>


<table>
<tbody>
<tr>
<td>&nbsp;</td>
</tr>
</tbody>
</table>

<table style="margin-left: 20px; height: 35px; width: 70px;  font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #4b9237;" cellpadding="2">
<tbody>
<tr>
<td style="height: 35px; color: #4c4c4c; text-align: center;"><a href="@Html.Raw(Model.ItemUrl(Model.TheItem))" style="color: #fff; text-decoration: none;">VIEW</a></td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: none; background-color: white; margin: 7px 0 0 9px;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">Thanks!</td>
</tr>
</tbody>
</table>


<table style="width: 100%; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #ffffff;" cellpadding="5">
<tbody>
<tr><td><br/></td></tr>
<tr>
	<td style="color: #005682;" align="center"><a style="text-decoration:none;" href="http://www.countersoft.com">Powered by Countersoft Gemini</a></td>
</tr>
</tbody>
</table>', N'', '2012-11-20T14:04:46.710', N'{"Subject":""}')
INSERT INTO [dbo].[gemini_alerttemplates] ([alerttemplateid], [alerttype], [label], [alertcontent], [projects], [created], [templatedata]) VALUES (7, 8, N'When something is updated', N'<table style="width: 100%; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: white;" cellpadding="10">
   	<tbody>
		<tr>
			<td style="color: #808080;" align="center">--- please reply above this line ---</td>
		</tr>
	</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 16px; font-weight: bold; border: none; background-color: #356aa0;" cellpadding="20">
<tbody>
<tr>
	<td style="color: #FFFFFF;"><a href="@Html.Raw(Model.ItemUrl(Model.TheItem))" style="text-decoration: none; color: #FFFFFF;">@Model.TheItem.IssueKey - @Model.TheItem.Title</a></td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: 1px solid #E2E2E2; background-color: #FFFFFF;" cellpadding="10">
<tbody>
<tr>
	<td style="color: #4c4c4c;">Just to let you know the following <strong>@Model.TheItem.Type</strong> has been updated.</td>
</tr>
</tbody>
</table>


<table>
<tbody>
<tr>
<td>&nbsp;</td>
</tr>
</tbody>
</table>

<table style="margin-left: 40px; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: white; border-collapse: collapse;" cellpadding="5">
<tbody>
	@foreach(var change in Model.TheItem.ChangeLog)
	{
<tr>
	<td><strong>@change.Field</strong> @change.Change</td>
</tr>
	}
</tbody>
</table>

<table>
<tbody>
<tr>
<td>&nbsp;</td>
</tr>
</tbody>
</table>

<table style="margin-left: 20px; height: 35px; width: 70px;  font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #4b9237;" cellpadding="2">
<tbody>
<tr>
<td style="height: 35px; color: #4c4c4c; text-align: center;"><a href="@Html.Raw(Model.ItemUrl(Model.TheItem))" style="color: #fff; text-decoration: none;">VIEW</a></td>
</tr>
</tbody>
</table>

<table style="width: 100%; font-family: arial; font-size: 14px; font-weight: normal; border: none; background-color: white; margin: 7px 0 0 9px;" cellpadding="10">
<tbody>
<tr>
<td style="color: #4c4c4c;">Thanks!</td>
</tr>
</tbody>
</table>


<table style="width: 100%; font-family: arial; font-size: 13px; font-weight: normal; border: none; background-color: #ffffff;" cellpadding="5">
<tbody>
<tr><td><br/></td></tr>
<tr>
	<td style="color: #005682;" align="center"><a style="text-decoration:none;" href="http://www.countersoft.com">Powered by Countersoft Gemini</a> » <a href="@(Model.GeminiUrl)dashboard?manage-alerts">Manage alerts</a></td>
</tr>
</tbody>
</table>', N'', '2013-05-02T16:13:20.310', N'{"Subject":""}')
SET IDENTITY_INSERT [dbo].[gemini_alerttemplates] OFF

-- Add 79 rows to [dbo].[gemini_applicationsettings]
SET IDENTITY_INSERT [dbo].[gemini_applicationsettings] ON
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (1, N'OrganisationName', N'ACME Corp.')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (2, N'RegistrationCode', N'')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (3, N'AlwaysUseFullGeminiURL', N'NO')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (4, N'FullGeminiURL', N'http://localhost/gemini/')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (5, N'GeminiAdmins', N'admin@mycompany.com')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (6, N'WelcomeTitle', N'See Everything, Manage Anything')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (7, N'WelcomeMessage', N'<p><span>Gemini is flexible unified tracking &amp; workflow.</span></p>
<div>
<ul>
<li><span>All your projects in ONE place</span></li>
<li><span>All team members are welcome</span></li>
<li><span>Software Development (Agile, Scrum or None)</span></li>
<li><span>General Project Management</span></li>
<li><span>Help Desk / IT Support</span></li>
<li><span>Integrated Testing capability</span></li>
<li><span>Clients and Vendors as participants</span></li>
<li>Your taxonomy and workflow in every process and department</li>
</ul>
<p><span>Free for 10 users + &nbsp;instant on-demand team trials.</span></p>
<p><span>We are&nbsp;</span><span>here to help with installation and configuration.&nbsp;</span></p>
<p>&nbsp;</p>
</div>')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (8, N'ProjReposFileClick', N'None')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (9, N'EnableHTMLPosts', N'YES')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (10, N'CharSetForExcel', N'ISO-8859-1')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (11, N'SessionRefresher', N'600')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (12, N'Theme', N'Default')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (13, N'LayoutMode', N'')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (14, N'LanguageFilePath', N'Language')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (15, N'DefaultCultureName', N'en-US')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (16, N'InstalledLanguages', N'US English|en-US|UK English|en-GB|German|de-DE|Spanish|es-ES|Italian|it-IT|French|fr-FR|Japanese|ja-JP|Portuguese|pt-PT|Chinese Simplified|zh-CHS|Chinese Traditional|zh-TW|Russian|ru-RU|Greek|el-GR|Dutch|nl-NL|Polish|pl-PL|Brazilian Portuguese|pt-BR|Czech|cs-CZ|Slovak|sk-SK|Swedish|se-SE|Hindi|hi-IN|Danish|da-DK|Ukrainian|uk-UA')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (17, N'InstalledThemes', N'Default|Default2008|Army|AVG|Blue|BlueMetal|BlueSteel|Leather|Red')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (18, N'DateFormat', N'EU')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (19, N'TimeInWorkingDay', N'08:00')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (20, N'GlobalAssignResourceAtIssueCreation', N'NO')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (21, N'IssueDescriptionType', N'TinyMCE')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (22, N'IssueCommentType', N'TinyMCE')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (23, N'IssueLinkQualifier', N'GEM:')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (24, N'AutoAlertForIssueCreator', N'True')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (25, N'AutoAlertForIssueResource', N'True')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (26, N'PluginPath', N'bin/plugins')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (27, N'ShowUserRegistrationLink', N'False')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (28, N'AllowAnonymousAccess', N'False')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (29, N'ViewAllProjects', N'NO')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (30, N'AlwaysShowGeminiStats', N'YES')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (31, N'ResetPasswordSubject', N'Gemini Password Reset Request')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (32, N'ResetPasswordMessage', N'Please click on the link below to reset your Gemini password.')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (33, N'NewUserResetPassword', N'Never')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (34, N'SSOPasswordType', N'PLAIN')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (35, N'SSOKey', N'')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (36, N'WebServicesAccessCode', N'ABC123')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (37, N'UseAccessCodeForSourceControl', N'NO')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (38, N'SchedulerDebugMode', N'False')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (39, N'SMTPServer', N'127.0.0.1')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (40, N'SMTPServerPort', N'25')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (41, N'SMTPPOPBeforeSMTP', N'False')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (42, N'SMTPAuthenticationMode', N'None')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (43, N'SMTPAuthenticationUsername', N'')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (44, N'SMTPAuthenticationPassword', N'')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (45, N'EmailAlertsPollInterval', N'5')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (46, N'EmailAlertsEnabled', N'True')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (47, N'SMTPEncodingType', N'UTF8')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (48, N'SMTPFromEmailAddress', N'gemini@mycompany.com')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (49, N'SMTPFromDisplayName', N'Gemini Tracker')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (50, N'SMTPUseSSL', N'False')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (51, N'SMTPSSLMode', N'Auto')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (52, N'EmailAlertEngine', N'MailPlugin')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (53, N'HelpDeskModeGroup', N'11')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (54, N'CaptchaEnabled', N'NO')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (55, N'MultipleProjectsVisibilityScheme', N'0')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (60, N'ShowImages', N'YES')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (61, N'EnabledEmailAlertTypes', N'0')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (62, N'BackupPath', N'c:\')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (63, N'DefaultNewUserGlobalGroups', N'')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (64, N'HelpDeskWelcomeMessage', N'<p><span style="color: #808080;"><strong><span style="font-size: medium;">Report and track your tickets. You should expect to receive a response with 24 hours.</span></strong></span></p>')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (65, N'HelpDeskWelcomeTitle', N'Help Desk')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (66, N'TestPlanVisibilityScreen', N'0')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (67, N'TestCaseVisibilityScreen', N'0')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (68, N'TestRunVisibilityScreen', N'0')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (69, N'TestFilterVisibilityScreen', N'0')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (70, N'SyncWithActiveDirectory', N'False')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (71, N'ActiveDirectoryConnectionString', N'')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (72, N'ActiveDirectoryUserName', N'')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (73, N'ActiveDirectoryPassword', N'')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (74, N'ActiveDirectoryAddNewUsers', N'NO')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (75, N'EnableOpenId', N'False')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (76, N'EnableFacebookIntegration', N'False')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (77, N'FacebookAppId', N'')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (78, N'Plugins', N'{"A7B35450-6490-42FA-BC61-4DE9EEA65162":true,"6A6D919B-EC37-41BC-A398-AF755C87DE41":false,"4192EAA7-9D09-4E36-97C3-64FCE039EDB4":true,"5EBDDCA6-C472-40BE-9D56-F11CFA7BE61B":false,"DE5D3643-8433-4977-81FF-3E05A047DF58":false,"840D6D86-C74A-43D2-8D3A-3CF9985DB1D4":true,"C5DA3EF0-2B94-4FD3-81DB-2250E3894932":false,"03A51F30-91C1-47D5-9F80-31A101FDF5C4":false,"CEF9D547-5106-49D6-8B08-F753AE1E23BF":true,"9DCCB6BF-9B84-4127-B9FD-644563FA6854":true,"49389E25-0E54-46D4-990A-0A954D956C10":false,"6E0C7294-6494-4715-9EB1-B0B7C296E426":false,"034543A3-27D2-442A-A061-1BF6B57C34EC":false,"8D21A3D3-A1CB-429C-84A8-1A238EE967E3":true}')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (79, N'Url', N'')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (81, N'SchedulerSettings', N'{"LastCheckedWatchers":"2014-04-22T10:24:06.1034767Z"}')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (83, N'LicenseKeys', N'[]')
INSERT INTO [dbo].[gemini_applicationsettings] ([settingid], [settingname], [settingvalue]) VALUES (88, N'Logo', N'empty.png')
SET IDENTITY_INSERT [dbo].[gemini_applicationsettings] OFF

-- Add 3 rows to [dbo].[gemini_apppermissions]
SET IDENTITY_INSERT [dbo].[gemini_apppermissions] ON
INSERT INTO [dbo].[gemini_apppermissions] ([id], [appguid], [apppermissions], [created]) VALUES (3, N'1B9CB627-A2F2-4CC5-BE5B-D0FABB489F87', N'{"Projects":[0],"ViewGroups":[3],"CreateGroups":[],"EditGroups":[3],"DeleteGroups":[]}', '2014-02-27T19:00:05.020')
INSERT INTO [dbo].[gemini_apppermissions] ([id], [appguid], [apppermissions], [created]) VALUES (4, N'1F21A63F-94FF-46D0-8773-9E482EF0CA90', N'{"Projects":[0],"ViewGroups":[3],"CreateGroups":[],"EditGroups":[],"DeleteGroups":[]}', '2014-02-27T19:00:14.200')
INSERT INTO [dbo].[gemini_apppermissions] ([id], [appguid], [apppermissions], [created]) VALUES (5, N'20A79C86-9FB4-4160-A4FD-29E37E185673', N'{"Projects":[0],"ViewGroups":[3],"CreateGroups":[],"EditGroups":[],"DeleteGroups":[]}', '2014-02-27T19:00:19.530')
SET IDENTITY_INSERT [dbo].[gemini_apppermissions] OFF

-- Add 2 rows to [dbo].[gemini_install]
SET IDENTITY_INSERT [dbo].[gemini_install] ON
INSERT INTO [dbo].[gemini_install] ([attributeid], [attribute_key], [attribute_value], [created]) VALUES (2, N'DATE_CF_40', N'1', '2011-06-30T11:18:43.380')
INSERT INTO [dbo].[gemini_install] ([attributeid], [attribute_key], [attribute_value], [created]) VALUES (16, N'VERSION', N'6.2.0', '2014-04-11T14:51:58.330')
SET IDENTITY_INSERT [dbo].[gemini_install] OFF

-- Add 7 rows to [dbo].[gemini_projectgroups]
SET IDENTITY_INSERT [dbo].[gemini_projectgroups] ON
INSERT INTO [dbo].[gemini_projectgroups] ([projectgroupid], [projectgroupname], [projectgroupdesc], [created], [interactiongroups]) VALUES (1, N'Everyone', N'All users within Gemini', '2012-08-01T19:32:32.950', '[]')
INSERT INTO [dbo].[gemini_projectgroups] ([projectgroupid], [projectgroupname], [projectgroupdesc], [created], [interactiongroups]) VALUES (2, N'Gemini Administrators', N'Gemini administrators', '2012-08-01T19:32:32.950', '[]')
INSERT INTO [dbo].[gemini_projectgroups] ([projectgroupid], [projectgroupname], [projectgroupdesc], [created], [interactiongroups]) VALUES (3, N'Everyone (Authenticated)', N'Authenticated users', '2012-08-01T19:32:32.950', '[]')
INSERT INTO [dbo].[gemini_projectgroups] ([projectgroupid], [projectgroupname], [projectgroupdesc], [created], [interactiongroups]) VALUES (7, N'Developers', N'Development team', '2012-08-01T19:32:32.950', '[7,3,9,10]')
INSERT INTO [dbo].[gemini_projectgroups] ([projectgroupid], [projectgroupname], [projectgroupdesc], [created], [interactiongroups]) VALUES (9, N'Managers', N'Management', '2012-08-01T19:32:32.950', '[7,3,9,10]')
INSERT INTO [dbo].[gemini_projectgroups] ([projectgroupid], [projectgroupname], [projectgroupdesc], [created], [interactiongroups]) VALUES (10, N'Support Team', N'Support specialists', '2012-08-01T19:32:32.950', '[7,3,9,10]')
INSERT INTO [dbo].[gemini_projectgroups] ([projectgroupid], [projectgroupname], [projectgroupdesc], [created], [interactiongroups]) VALUES (11, N'External Users', N'Clients!', '2012-08-01T19:32:32.950', '[]')
SET IDENTITY_INSERT [dbo].[gemini_projectgroups] OFF

-- Add 4 rows to [dbo].[gemini_projecttemplate]
SET IDENTITY_INSERT [dbo].[gemini_projecttemplate] ON
EXEC(N'INSERT INTO [dbo].[gemini_projecttemplate] ([templateid], [templatekey], [title], [descrip], [author], [published], [versionnumber], [template], [created]) VALUES (10, ''AGILE'', N''Agile Development'', N''Agile planning and tracking with built-in support for Scrum, Kanban, backlogs, sprints and zoomable planning board. Integrate with source control systems with browser-based code review.'', N''Countersoft'', ''2012-07-03T11:54:07.000'', ''1.0.0'', N''{"Name":"Agile Development","Description":"Agile planning and tracking with built-in support for Scrum, Kanban, backlogs, sprints and zoomable planning board. Integrate with source control systems with browser-based code review.","Publisher":"Countersoft","Published":"2012-07-03T11:54:07.9423439+01:00","Version":"1.0.0","HomePage":2,"TemplateKey":"AGILE","Menu":[{"PageType":2,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":1},{"PageType":5,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":2},{"PageType":1,"AppId":"","ControlId":"","SeperateAfter":true,"ProjectGroups":[1],"Sequence":3},{"PageType":3,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":4},{"PageType":4,"AppId":"","ControlId":"","SeperateAfter":true,"ProjectGroups":[1],"Sequence":5},{"PageType":20,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":6},{"PageType":8,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":7}],"CustomField":[{"Label":"Customer","ScreenLabel":"Customer","ScreenDescription":"Our Client name","ScreenTooltip":"Select the customer from the list","MaxLen":0,"CanMultiSelect":true,"RegularExpression":"","Type":"C","ProjectIdFilter":true,"ShowInAttributes":true,"LookupStaticData":"Customer A\r\nCustomer B\r\nCustomer C\r\n\r\n\r\n\r\n                        \r\n                    ","MaxValue":0.0,"MinValue":0.0,"ListLimiter":"","CanFilter":false},{"Label":"Customer Backlog ID","ScreenLabel":"Customer Backlog ID","ScreenDescription":"","ScreenTooltip":"Customer Backlog ID","MaxLen":12,"CanMultiSelect":false,"RegularExpression":"","Type":"C","ProjectIdFilter":false,"ShowInAttributes":true,"LookupStaticData":"BACKLOG A\r\nBACKLOG B\r\nBACKLOG C\r\nBACKLOG D\r\nBACKLOG E","MaxValue":999.0,"MinValue":0.0,"ListLimiter":"","CanFilter":false}],"Priority":[{"Label":"Low","Image":"priority-low.png","Color":"#0000ff"},{"Label":"Medium","Image":"priority-medium.png","Color":"#ffffff"},{"Label":"High","Image":"priority-high.png","Color":"#eb0c1f"}],"Severity":[{"Label":"Trivial","Image":"severity-trivial.png","Color":""},{"Label":"Minor","Image":"severity-minor.png","Color":"#0000ff"},{"Label":"Major","Image":"severity-major.png","Color":"#8c054d"}],"Status":[{"Final":false,"Label":"Approved","Image":"status-approved.png","Color":"#36a820"},{"Final":false,"Label":"In Backlog","Image":"test-blackbox.png","Color":"#3d213d"},{"Final":false,"Label":"In Sprint","Image":"test-user.png","Color":"#337a0f"},{"Final":false,"Label":"Unassigned","Image":"status-unassigned.png","Color":"#0000ff"},{"Final":false,"Label":"Assigned","Image":"status-assigned.png","Color":"#47d119"},{"Final":false,"Label":"In Progress","Image":"status-inprogress.png","Color":"#a130a1"},{"Final":true,"Label":"Closed","Image":"status-closed.png","Color":"#ffffff"},{"Final":false,"Label":"Reopened","Image":"status-reopened.png","Color":"#0a1c91"}],"Resolution":[{"Final":true,"Label":"Parked - No Further Action"},{"Final":true,"Label":"Complete"}],"Link":[{"Label":"Duplicated"},{"Label":"Related"}],"Time":[{"Label":"Billable"},{"Label":"Non-Billable"},{"Label":"Internal"},{"Label":"Scrum Master PM"},{"Label":"Testing"}],"Process":[{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"23","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"25","CreateScreen":true,"EditSc'', ''2012-08-01T19:32:32.557'')')
EXEC(N'UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''reen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":1,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":42,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":14,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":23,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Status","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeLogged","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Visibility","CreateScreen":false,"EditScreen":true,"ViewScreen":false},{"InternalField":18,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateCreated","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHierarchy","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedLinks","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":34,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedSourceControl","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"","Item":[{"StatusFieldRef":"Approved","Top":"10","Left":"10","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Backlog","Top":"10","Left":"160","TransitionStatusFieldRef":["In Sprint"]},{"StatusFieldRef":"In Sprint","Top":"375","Left":"45","TransitionStatusFieldRef":["Unassigned","Assigned","In Progress","In Backlog"]},{"StatusFieldRef":"Unassigned","Top":"334","Left":"308","TransitionStatusFieldRef":["Assigned","In Progress"]},{"StatusFieldRef":"Assigned","Top":"564","Left":"423","TransitionStatusFieldRef":["In Progress","Unassigned"]},{"StatusFieldRef":"In Progress","Top":"10","Left":"760","TransitionStatusFieldRef":["Closed"]},{"StatusFieldRef":"Closed","Top":"523","Left":"726","TransitionStatusFieldRef":["Reopened"]},{"StatusFieldRef":"Reopened","Top":"206","Left":"10","TransitionStatusF'',NULL,NULL) WHERE [templateid]=10
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''ieldRef":["In Backlog"]}]},"Label":"Requirement","Image":"type-enhancement.png","Color":"#e612e6","Tag":""},{"TheScreen":{"UseFromProcessRef":"Requirement","Item":[{"InternalField":14,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"6","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":23,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":21,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"4","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":13,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":18,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"0B2B3E39-F37B-489F-AFA8-0B6C3FA63CFB","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":12,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":1,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":42,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":25,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":6,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":11,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":20,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":7,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":19,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":4,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":24,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":32,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":31,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":3,"IsExternalCustomField":f'',NULL,NULL) WHERE [templateid]=10
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''alse,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"878C76CF-E9AE-46B4-BE05-7CC2EA5FB574","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":22,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"598B4999-4C31-427D-9BBC-C84AD954E55A","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"C8F0693D-129C-4D19-9865-9CED964F06AB","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"11","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"74A39750-6C8F-4023-82D2-1F1F10FF4E70","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"28FE1D91-7730-4067-8A10-F452FCB9D090","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"18","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"617F1435-C0AA-48E6-B6A9-2C1F756E02A6","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"AC93C4F9-B512-4A3D-8B37-BC3D5F83429D","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":34,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"ACE2F8B3-C724-444F-9B72-B8B2137DDA16","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"EFEE5D50-7DF6-49C3-9D69-E7EFC1AFEF72","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"Requirement","Item":[]},"Label":"Story","Image":"type-newfeature.png","Color":"#0a5e85","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalC'',NULL,NULL) WHERE [templateid]=10
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''ustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":false,"ViewScreen":false},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"","Item":[{"StatusFieldRef":"In Backlog","Top":"10","Left":"10","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Sprint","Top":"10","Left":"160","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Unassigned","Top":"0","Left":"0","TransitionStatusFieldRef":["Assigned"]},{"StatusFieldRef":"Assigned","Top":"10","Left":"160","TransitionStatusFieldRef":["In Progress"]},{"StatusFieldRef":"In Progress","Top":"10","Left":"310","TransitionStatusFieldRef":["Closed"]},{"StatusFieldRef":"Closed","Top":"10","Left":"460","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Reopened","Top":"80","Left":"10","TransitionStatusFieldRef":[]}]},"Label":"Task","Image":"type-task.png","Color":"#e68012","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":false,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":false,"ViewScreen":false},{"InternalField":22,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"23","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"25","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHierarchy","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":37,"IsExternal'',NULL,NULL) WHERE [templateid]='
+N'10
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''CustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedLinks","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedWatchers","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"","Item":[{"StatusFieldRef":"Approved","Top":"0","Left":"0","TransitionStatusFieldRef":["In Backlog"]},{"StatusFieldRef":"In Backlog","Top":"0","Left":"0","TransitionStatusFieldRef":["In Sprint"]},{"StatusFieldRef":"In Sprint","Top":"0","Left":"0","TransitionStatusFieldRef":["Unassigned","Assigned","In Progress"]},{"StatusFieldRef":"Unassigned","Top":"10","Left":"460","TransitionStatusFieldRef":["Assigned"]},{"StatusFieldRef":"Assigned","Top":"10","Left":"610","TransitionStatusFieldRef":["In Progress"]},{"StatusFieldRef":"In Progress","Top":"10","Left":"760","TransitionStatusFieldRef":["Closed"]},{"StatusFieldRef":"Closed","Top":"0","Left":"0","TransitionStatusFieldRef":["Reopened"]},{"StatusFieldRef":"Reopened","Top":"0","Left":"0","TransitionStatusFieldRef":["In Backlog"]}]},"Label":"Change Request","Image":"type-changerequest.png","Color":"#171517","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":4,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":13,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":23,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":21,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":12,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":1,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":42,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":6,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":11,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":7,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"Exter'',NULL,NULL) WHERE [templateid]=10
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''nalFieldRef":"23","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"25","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":24,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":false},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":34,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":14,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"PercentComplete","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":18,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateCreated","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":19,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateRevised","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"Requirement","Item":[]},"Label":"Bug","Image":"type-bug.png","Color":"#ff0000","Tag":""}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-07-03T10:54:06.1482413Z","Revised":"2012-07-03T10:54:06.1482413Z","Errors":[],"HasErrors":false,"Id":0}'',NULL,NULL) WHERE [templateid]=10
')
EXEC(N'INSERT INTO [dbo].[gemini_projecttemplate] ([templateid], [templatekey], [title], [descrip], [author], [published], [versionnumber], [template], [created]) VALUES (12, ''TICKETING'', N''Service Desk & Ticketing'', N''Channel service requests, automatically convert inbound emails into tickets and reply from within Gemini. Supports POP3, IMAP, Microsoft Exchange, as well as providing Microsoft Outlook connector.'', N''Countersoft'', ''2012-07-03T11:54:07.000'', ''1.0.0'', N''{"Name":"Service Desk & Ticketing","Description":"Channel service requests, automatically convert inbound emails into tickets and reply from within Gemini. Supports POP3, IMAP, Microsoft Exchange, as well as providing Microsoft Outlook connector.","Publisher":"Countersoft","Published":"2012-07-03T11:54:07.9423439+01:00","Version":"1.0.0","HomePage":2,"TemplateKey":"TICKETING","Menu":[{"PageType":1,"AppId":"","ControlId":"","SeperateAfter":true,"ProjectGroups":[1],"Sequence":1},{"PageType":20,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":2},{"PageType":19,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":3},{"PageType":9,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":4},{"PageType":8,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":5},{"PageType":7,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":6}],"CustomField":[{"Label":"Customer","ScreenLabel":"Customer","ScreenDescription":"Our Client name","ScreenTooltip":"Select the customer from the list","MaxLen":0,"CanMultiSelect":true,"RegularExpression":"","Type":"L","ProjectIdFilter":true,"ShowInAttributes":true,"LookupStaticData":"Customer A\r\nCustomer B\r\nCustomer C\r\n                        \r\n                    ","MaxValue":0.0,"MinValue":0.0,"ListLimiter":"","CanFilter":false},{"Label":"User Application","ScreenLabel":"User Application","ScreenDescription":"","ScreenTooltip":"User Application","MaxLen":0,"CanMultiSelect":false,"RegularExpression":"","Type":"C","ProjectIdFilter":false,"ShowInAttributes":true,"LookupStaticData":"Peoplesoft Financials\r\nPeoplesoft HR\r\nDynamics CRM\r\nOURSYS\r\nInventory Management\r\nOther","MaxValue":0.0,"MinValue":0.0,"ListLimiter":"","CanFilter":false},{"Label":"Product Platform","ScreenLabel":"Product Platform (OS)","ScreenDescription":"","ScreenTooltip":"Product Platform (OS)","MaxLen":0,"CanMultiSelect":false,"RegularExpression":"","Type":"C","ProjectIdFilter":false,"ShowInAttributes":true,"LookupStaticData":"Windows 7\r\nWindows 8\r\nLinux\r\nUbuntu\r\nMac OS\r\niPad\r\n\r\n                        \r\n                    ","MaxValue":0.0,"MinValue":0.0,"ListLimiter":"","CanFilter":false}],"Priority":[{"Label":"Low","Image":"priority-low.png","Color":"#0000ff"},{"Label":"Medium","Image":"priority-medium.png","Color":"#ffffff"},{"Label":"High","Image":"priority-high.png","Color":"#eb0c1f"}],"Severity":[{"Label":"Trivial","Image":"severity-trivial.png","Color":""},{"Label":"Minor","Image":"severity-minor.png","Color":"#0000ff"},{"Label":"Major","Image":"severity-major.png","Color":"#8c054d"}],"Status":[{"Final":false,"Label":"In Backlog","Image":"test-blackbox.png","Color":"#3d213d"},{"Final":false,"Label":"In Sprint","Image":"test-user.png","Color":"#337a0f"},{"Final":false,"Label":"Unassigned","Image":"status-unassigned.png","Color":"#0000ff"},{"Final":false,"Label":"Assigned","Image":"status-assigned.png","Color":"#47d119"},{"Final":false,"Label":"In Progress","Image":"status-inprogress.png","Color":"#a130a1"},{"Final":true,"Label":"Closed","Image":"status-closed.png","Color":"#ffffff"},{"Final":false,"Label":"Reopened","Image":"status-reopened.png","Color":"#0a1c91"},{"Final":false,"Label":"QA Approved","Image":"status-approved.png","Color":"#1b8f1b"},{"Final":false,"Label":"user Accepted","Image":"test-acceptance.png","Color":"#541454"},{"Final":false,"Label":"Approved","Image":"status-approved.png","Color":"#099e38"}],"Resolution":[{"Final":true,"Label":"Parked - No Further Action"},{"Final":true,"Label":"Complete"}],"Link":[{"Label":"Duplicated"},{"Label":"Related"}],"Time":[{"Label":"Billable"},{"Label":"Non-Billable"},{"Label":"Internal"},{"Label":"Scrum Master PM"},{"Label":"Testing"}],"Process":[{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true'', ''2012-08-01T19:32:32.560'')')
EXEC(N'UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":13,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":false},{"InternalField":22,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"","Item":[{"StatusFieldRef":"QA Approved","Top":"10","Left":"10","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Assigned","Top":"0","Left":"0","TransitionStatusFieldRef":["Unassigned","In Progress"]},{"StatusFieldRef":"Closed","Top":"10","Left":"310","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Backlog","Top":"10","Left":"460","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Progress","Top":"217","Left":"383","TransitionStatusFieldRef":["Closed"]},{"StatusFieldRef":"In Sprint","Top":"10","Left":"760","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Reopened","Top":"80","Left":"10","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Unassigned","Top":"0","Left":"0","TransitionStatusFieldRef":["Assigned"]}]},"Label":"Investigation","Image":"type-investigation.png","Color":"#ffd000","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"30","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":4,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":13,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":23,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":21,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":12,"IsExternal'',NULL,NULL) WHERE [templateid]=12
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''CustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":1,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":42,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":11,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":7,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":24,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":false},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":34,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":14,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"PercentComplete","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":18,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateCreated","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":19,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateRevised","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"","Item":[{"StatusFieldRef":"Assigned","Top":"10","Left":"10","TransitionStatusFieldRef":["Unassigned","In Backlog","In Sprint"]},{"StatusFieldRef":"Closed","Top":"10","Left":"310","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Backlog","Top":"0","Left":"239","TransitionStatusFieldRef":["Assigned","In Sprint"]},{"StatusFieldRef":"In Progress","Top":"10","Left":"610","TransitionStatusFieldRef":["Closed","QA Approved"]},{"StatusFieldRef":"In Sprint","Top":"0","Left":"0","TransitionStatusFieldRef":["In Progress"]},{"StatusFieldRef":"QA Approved","Top":"111","Left":"655","TransitionStatusFieldRef":["user Accepted"]},{"StatusFieldRef":"Reopened","Top":"0","Left":"9","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Unassigned","Top":"0","Left":"0","TransitionStatusFieldRef":["Assigned","In Backlog"]},{"StatusFieldRef":"user Accepted","Top":"203","Left":"0","TransitionStatusFieldRef":["Closed"]}]},"Label":"Bug","Image":"type-bug.png","Color":"#ff0000","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"Intern'',NULL,NULL) WHERE [templateid]=12
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''alField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":1,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":42,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":14,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":23,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Status","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeLogged","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Visibility","CreateScreen":false,"EditScreen":true,"ViewScreen":false},{"InternalField":18,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateCreated","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHierarchy","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedLinks","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":34,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedSourceControl","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"","Item":[{"StatusFieldRef":"Approved","Top":"0","Left":"9","TransitionStatusFieldRef":["Assigned","In Progress"]},{"StatusFieldRef":"Assigned","Top":"0","Left":"0","TransitionStatusFieldRef":["Unassigned","In Progress"]},{"StatusFieldRef":"Closed","Top":"0","Left":"0","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Backlog","Top":"10","Left":"460","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Progress","Top":"0","Left":"0","TransitionStatusFieldRef":["QA Approved"]},{"StatusFieldRef":"In Sprint","Top":"10","Left":"760","TransitionStatusFieldRef":[]},{"S'',NULL,NULL) WHERE [templateid]=12
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''tatusFieldRef":"QA Approved","Top":"0","Left":"0","TransitionStatusFieldRef":["user Accepted","In Progress"]},{"StatusFieldRef":"Reopened","Top":"80","Left":"160","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Unassigned","Top":"0","Left":"0","TransitionStatusFieldRef":["Assigned"]},{"StatusFieldRef":"user Accepted","Top":"0","Left":"0","TransitionStatusFieldRef":["QA Approved","Closed"]}]},"Label":"New Requirement","Image":"type-enhancement.png","Color":"#e612e6","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":false,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":42,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":false,"ViewScreen":false},{"InternalField":22,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHierarchy","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedLinks","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedWatchers","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"New Requirement","Item":[]},"Label":"Change Request","Image":"type-changerequest.png","Color":"#171517","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":false,"ViewScreen":false},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExterna'',NULL,NULL) WHERE [templateid]='
+N'12
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''lWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"","Item":[{"StatusFieldRef":"Approved","Top":"0","Left":"0","TransitionStatusFieldRef":["Assigned"]},{"StatusFieldRef":"Assigned","Top":"0","Left":"0","TransitionStatusFieldRef":["In Progress"]},{"StatusFieldRef":"Closed","Top":"0","Left":"0","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Backlog","Top":"10","Left":"460","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Progress","Top":"0","Left":"0","TransitionStatusFieldRef":["Closed"]},{"StatusFieldRef":"In Sprint","Top":"10","Left":"760","TransitionStatusFieldRef":[]},{"StatusFieldRef":"QA Approved","Top":"80","Left":"10","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Reopened","Top":"80","Left":"160","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Unassigned","Top":"0","Left":"0","TransitionStatusFieldRef":[]},{"StatusFieldRef":"user Accepted","Top":"80","Left":"460","TransitionStatusFieldRef":[]}]},"Label":"Task","Image":"type-task.png","Color":"#e68012","Tag":""}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-07-03T10:54:06.1482413Z","Revised":"2012-07-03T10:54:06.1482413Z","Errors":[],"HasErrors":false,"Id":0}'',NULL,NULL) WHERE [templateid]=12
')
EXEC(N'INSERT INTO [dbo].[gemini_projecttemplate] ([templateid], [templatekey], [title], [descrip], [author], [published], [versionnumber], [template], [created]) VALUES (13, ''TRACKING'', N''Issue Tracking'', N''Flexible issue tracking to handle any and every kind of process across the enterprise. One click inline editing, instant cross project filtering, dashboards and scheduled Excel-based reporting delivered to your inbox.'', N''Countersoft'', ''2012-07-03T11:54:07.000'', ''1.0.0'', N''{"Name":"Issue Tracking","Description":"Flexible issue tracking to handle any and every kind of process across the enterprise. One click inline editing, instant cross project filtering, dashboards and scheduled Excel-based reporting delivered to your inbox.","Publisher":"Countersoft","Published":"2012-07-03T11:54:07.9423439+01:00","Version":"1.0.0","HomePage":2,"TemplateKey":"TRACKING","Menu":[{"PageType":1,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":1},{"PageType":2,"AppId":"","ControlId":"","SeperateAfter":true,"ProjectGroups":[1],"Sequence":2},{"PageType":9,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":3},{"PageType":19,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":4},{"PageType":20,"AppId":"","ControlId":"","SeperateAfter":true,"ProjectGroups":[1],"Sequence":5},{"PageType":3,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":6},{"PageType":5,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":7},{"PageType":4,"AppId":"","ControlId":"","SeperateAfter":true,"ProjectGroups":[1],"Sequence":8},{"PageType":7,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":9},{"PageType":8,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":10}],"CustomField":[{"Label":"Customer","ScreenLabel":"Customer","ScreenDescription":"Our Client name","ScreenTooltip":"Select the customer from the list","MaxLen":0,"CanMultiSelect":true,"RegularExpression":"","Type":"L","ProjectIdFilter":true,"ShowInAttributes":true,"LookupStaticData":"Customer A\r\nCustomer B\r\nCustomer C\r\n                        \r\n                    ","MaxValue":0.0,"MinValue":0.0,"ListLimiter":"","CanFilter":false},{"Label":"User Application","ScreenLabel":"User Application","ScreenDescription":"","ScreenTooltip":"User Application","MaxLen":0,"CanMultiSelect":false,"RegularExpression":"","Type":"C","ProjectIdFilter":false,"ShowInAttributes":true,"LookupStaticData":"Peoplesoft Financials\r\nPeoplesoft HR\r\nDynamics CRM\r\nOURSYS\r\nInventory Management\r\nOther","MaxValue":0.0,"MinValue":0.0,"ListLimiter":"","CanFilter":false},{"Label":"Product Platform","ScreenLabel":"Product Platform (OS)","ScreenDescription":"","ScreenTooltip":"Product Platform (OS)","MaxLen":0,"CanMultiSelect":false,"RegularExpression":"","Type":"C","ProjectIdFilter":false,"ShowInAttributes":true,"LookupStaticData":"Windows 7\r\nWindows 8\r\nLinux\r\nUbuntu\r\nMac OS\r\niPad\r\n\r\n                        \r\n                    ","MaxValue":0.0,"MinValue":0.0,"ListLimiter":"","CanFilter":false}],"Priority":[{"Label":"Low","Image":"priority-low.png","Color":"#0000ff"},{"Label":"Medium","Image":"priority-medium.png","Color":"#ffffff"},{"Label":"High","Image":"priority-high.png","Color":"#eb0c1f"}],"Severity":[{"Label":"Trivial","Image":"severity-trivial.png","Color":""},{"Label":"Minor","Image":"severity-minor.png","Color":"#0000ff"},{"Label":"Major","Image":"severity-major.png","Color":"#8c054d"}],"Status":[{"Final":false,"Label":"In Backlog","Image":"test-blackbox.png","Color":"#3d213d"},{"Final":false,"Label":"In Sprint","Image":"test-user.png","Color":"#337a0f"},{"Final":false,"Label":"Unassigned","Image":"status-unassigned.png","Color":"#0000ff"},{"Final":false,"Label":"Assigned","Image":"status-assigned.png","Color":"#47d119"},{"Final":false,"Label":"In Progress","Image":"status-inprogress.png","Color":"#a130a1"},{"Final":true,"Label":"Closed","Image":"status-closed.png","Color":"#ffffff"},{"Final":false,"Label":"Reopened","Image":"status-reopened.png","Color":"#0a1c91"},{"Final":false,"Label":"Approved","Image":"status-approved.png","Color":""}],"Resolution":[{"Final":true,"Label":"Parked - No Further Action"},{"Final":true,"Label":"Complete"}],"Link":[{"Label":"Duplicated"},{"Label":"Related"}],"Time":[{"Label":"Billable"},{"Label":"Non-Billable"},{"Label":"Internal"},{"Label":"Scrum Master PM"}'', ''2012-08-01T19:32:32.560'')')
EXEC(N'UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N'',{"Label":"Testing"}],"Process":[{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"26","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"28","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":13,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":false},{"InternalField":22,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"","Item":[{"StatusFieldRef":"Assigned","Top":"0","Left":"9","TransitionStatusFieldRef":["In Progress","Closed"]},{"StatusFieldRef":"Closed","Top":"407","Left":"0","TransitionStatusFieldRef":["Reopened"]},{"StatusFieldRef":"In Backlog","Top":"10","Left":"310","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Progress","Top":"0","Left":"577","TransitionStatusFieldRef":["Closed"]},{"StatusFieldRef":"In Sprint","Top":"10","Left":"610","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Reopened","Top":"41","Left":"151","TransitionStatusFieldRef":["Assigned","Unassigned"]},{"StatusFieldRef":"Unassigned","Top":"0","Left":"0","TransitionStatusFieldRef":["Assigned"]}]},"Label":"Investigation","Image":"type-investigation.png","Color":"#ffd000","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"30","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":4,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":13,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScr'',NULL,NULL) WHERE [templateid]=13
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''een":true,"ViewScreen":true},{"InternalField":23,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":21,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":12,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":1,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":42,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":11,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":7,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":24,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":false},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":34,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":14,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"PercentComplete","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":18,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateCreated","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":19,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateRevised","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"Investigation","Item":[]},"Label":"Bug","Image":"type-bug.png","Color":"#ff0000","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalFiel'',NULL,NULL) WHERE [templateid]=13
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''d":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":1,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":42,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":14,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":23,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Status","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeLogged","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Visibility","CreateScreen":false,"EditScreen":true,"ViewScreen":false},{"InternalField":18,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateCreated","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHierarchy","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedLinks","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":34,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedSourceControl","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"","Item":[{"StatusFieldRef":"Approved","Top":"10","Left":"10","TransitionStatusFieldRef":["Assigned","Unassigned"]},{"StatusFieldRef":"Assigned","Top":"10","Left":"160","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Closed","Top":"10","Left":"310","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Backlog","Top":"10","Left":"460","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Progress","Top":"0","Left":"0","TransitionStatusFieldRef":["Closed"]},{"StatusFieldRef":"In Sprint","Top":"10","Left":"760","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Reopened","Top":"80","Left":"10","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Unassigned","Top":"80","Left":"160","TransitionStatusFieldRef":["In Progress","Assigned"]}]},"Label":"New Requirement","Image":"type-enhancement.png","Color":"#e612e6","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":fals'',NULL,NULL) WHERE [templateid]=13
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''e,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":42,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":false,"ViewScreen":false},{"InternalField":22,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHierarchy","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedLinks","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedWatchers","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"New Requirement","Item":[]},"Label":"Change Request","Image":"type-changerequest.png","Color":"#171517","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":false,"ViewScreen":false},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"","Item":[{"StatusFieldRef":"Approved","Top":"10","Left":"10","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Assigned","Top":"0","Left":"0","TransitionStatusFieldRef":["Closed","Unassigned","In Progress"]},{"StatusFieldRef":"Closed","Top":"10","Left":"310","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In'',NULL,NULL) WHERE [templateid]='
+N'13
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N'' Backlog","Top":"10","Left":"460","TransitionStatusFieldRef":[]},{"StatusFieldRef":"In Progress","Top":"0","Left":"0","TransitionStatusFieldRef":["Closed"]},{"StatusFieldRef":"In Sprint","Top":"10","Left":"760","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Reopened","Top":"9","Left":"0","TransitionStatusFieldRef":[]},{"StatusFieldRef":"Unassigned","Top":"80","Left":"160","TransitionStatusFieldRef":["Assigned"]}]},"Label":"Task","Image":"type-task.png","Color":"#e68012","Tag":""}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-07-03T10:54:06.1482413Z","Revised":"2012-07-03T10:54:06.1482413Z","Errors":[],"HasErrors":false,"Id":0}'',NULL,NULL) WHERE [templateid]=13
')
EXEC(N'INSERT INTO [dbo].[gemini_projecttemplate] ([templateid], [templatekey], [title], [descrip], [author], [published], [versionnumber], [template], [created]) VALUES (26, ''ITIL'', N''ITIL Processes'', N''Standard Agile and Scrum project template'', N''Countersoft'', ''2012-07-03T11:54:07.000'', ''1.0.0'', N''{"Name":"ITIL Processes","Description":"Standard Agile and Scrum project template","Publisher":"Countersoft","Published":"2012-07-03T11:54:07.9423439+01:00","Version":"1.0.0","HomePage":2,"TemplateKey":"ITIL","Menu":[{"PageType":2,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":1},{"PageType":5,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":2},{"PageType":1,"AppId":"","ControlId":"","SeperateAfter":true,"ProjectGroups":[1],"Sequence":3},{"PageType":3,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":4},{"PageType":4,"AppId":"","ControlId":"","SeperateAfter":true,"ProjectGroups":[1],"Sequence":5},{"PageType":20,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":6},{"PageType":8,"AppId":"","ControlId":"","SeperateAfter":false,"ProjectGroups":[1],"Sequence":7}],"CustomField":[{"Label":"Customer","ScreenLabel":"Customer","ScreenDescription":"Our Client name","ScreenTooltip":"Select the customer from the list","MaxLen":0,"CanMultiSelect":true,"RegularExpression":"","Type":"C","ProjectIdFilter":true,"ShowInAttributes":true,"LookupStaticData":"Customer A\r\nCustomer B\r\nCustomer C\r\n","MaxValue":0.0,"MinValue":0.0,"ListLimiter":"","LookupName":"","LookupSortField":"","LookupTextField":"","LookupValueField":"","CanFilter":false},{"Label":"Site Location","ScreenLabel":"Site Location","ScreenDescription":"","ScreenTooltip":"Site Location","MaxLen":0,"CanMultiSelect":false,"RegularExpression":"","Type":"C","ProjectIdFilter":false,"ShowInAttributes":true,"LookupStaticData":"Location A\r\nLocation B\r\nLocation C\r\n","ListLimiter":"","LookupName":"","LookupSortField":"","LookupTextField":"","LookupValueField":"","CanFilter":true}],"Priority":[{"Label":"Low","Image":"priority-low.png","Color":"#3535bd"},{"Label":"Medium","Image":"priority-medium.png","Color":"#d1752e"},{"Label":"High","Image":"priority-high.png","Color":"#eb0c1f"}],"Severity":[{"Label":"Trivial","Image":"severity-trivial.png","Color":""},{"Label":"Minor","Image":"severity-minor.png","Color":"#0000ff"},{"Label":"Major","Image":"severity-major.png","Color":"#8c054d"}],"Status":[{"Final":false,"Label":"Logged","Image":"test-blackbox.png","Color":"#3d213d"},{"Final":false,"Label":"Assigned","Image":"status-inprogress.png","Color":"#7a6511"},{"Final":false,"Label":"In Progress","Image":"test-functional.png","Color":"#961896"},{"Final":false,"Label":"Test","Image":"type-qualitycheck.png","Color":"#d16817"},{"Final":false,"Label":"Deploy","Image":"status-approved.png","Color":"#6ee368"},{"Final":true,"Label":"Closed","Image":"status-closed.png","Color":"#1326f5"}],"Resolution":[{"Final":false,"Label":"Unresolved"},{"Final":false,"Label":"Parked"},{"Final":true,"Label":"Duplicate"},{"Final":true,"Label":"Rejected"},{"Final":true,"Label":"Complete"}],"Link":[{"Label":"Duplicated"},{"Label":"Related"}],"Time":[{"Label":"Billable"},{"Label":"Non-Billable"},{"Label":"Internal"},{"Label":"Testing"}],"Process":[{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Type","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Title","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Description","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Priority","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":13,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Component","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"S'', ''2014-04-11T14:52:25.963'')')
EXEC(N'UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''tartDate","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DueDate","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedAttachments","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHierarchy","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"EstimatedEffort","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedWatchers","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedLinks","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Site Location","CreateScreen":true,"EditScreen":false,"ViewScreen":false},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Visibility","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Status","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":7,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssignedTo","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":11,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Resolution","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":14,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"PercentComplete","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Site Location","CreateScreen":false,"EditScreen":true,"ViewScreen":false},{"InternalField":1,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"IssueKey","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeLogged","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":18,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateCreated","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":19,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateRevised","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":21,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"ClosedDate","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":6,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"ReportedBy","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":20,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"ResolvedDate","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":32,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeExceeded","CreateScre'',NULL,NULL) WHERE [templateid]=26
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''en":false,"EditScreen":false,"ViewScreen":true},{"InternalField":31,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeRemaining","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Site Location","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"BCADBC94-44C0-4116-8008-5A57F26E6573","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"","Item":[{"StatusFieldRef":"Logged","Top":"15","Left":"84","TransitionStatusFieldRef":["Assigned","Closed"]},{"StatusFieldRef":"Assigned","Top":"15","Left":"340","TransitionStatusFieldRef":["In Progress","Logged"]},{"StatusFieldRef":"In Progress","Top":"182","Left":"527","TransitionStatusFieldRef":["Test","Assigned"]},{"StatusFieldRef":"Test","Top":"410","Left":"532","TransitionStatusFieldRef":["Deploy","In Progress"]},{"StatusFieldRef":"Deploy","Top":"412","Left":"139","TransitionStatusFieldRef":["Closed","Test"]},{"StatusFieldRef":"Closed","Top":"255","Left":"97","TransitionStatusFieldRef":[]}]},"Label":"Event","Image":"event-icon.png","Color":"#e6e2f0","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Type","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Title","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Description","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Priority","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":42,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Points","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":13,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Component","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"StartDate","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DueDate","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedAttachments","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHierarchy","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"EstimatedEffort","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedWatchers","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false'',NULL,NULL) WHERE [templateid]=26
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N'',"ExternalFieldRef":"AssociatedLinks","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":12,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"FixedInVersion","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Site Location","CreateScreen":true,"EditScreen":false,"ViewScreen":false},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Visibility","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Status","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":11,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Resolution","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":14,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"PercentComplete","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":7,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssignedTo","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Site Location","CreateScreen":false,"EditScreen":true,"ViewScreen":false},{"InternalField":1,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"IssueKey","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeLogged","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":18,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateCreated","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":19,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateRevised","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":21,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"ClosedDate","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":6,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"ReportedBy","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":20,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"ResolvedDate","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":32,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeExceeded","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":31,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeRemaining","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Site Location","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"BCADBC94-44C0-4116-8008-5A57F26E6573","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"Event","Item":[]},"Label":"Incident","Image":"incident-icon.png","Color":"#e63212","Tag":""},{"TheScreen":{"UseFromProcessRef":"Incident","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Type","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":fa'',NULL,NULL) WHERE [templateid]=26
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''lse,"ExternalFieldRef":"Title","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":2,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Description","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Priority","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":42,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Points","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":13,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Component","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":16,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"StartDate","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DueDate","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedAttachments","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":40,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHierarchy","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":15,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"EstimatedEffort","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedWatchers","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":39,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedLinks","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"89","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":12,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"FixedInVersion","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Site Location","CreateScreen":true,"EditScreen":false,"ViewScreen":false},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Visibility","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Status","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":11,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Resolution","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":14,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"PercentComplete","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":7,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssignedTo","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Site Location","CreateScreen":false,"EditScreen":true,"ViewScreen":false},{"InternalField":1,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"IssueKey","CreateScreen":false,"EditScreen":false,"Vie'',NULL,NULL) WHERE [templateid]='
+N'26
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''wScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeLogged","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":18,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateCreated","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":19,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateRevised","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":21,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"ClosedDate","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":6,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"ReportedBy","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":20,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"ResolvedDate","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":32,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeExceeded","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":31,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeRemaining","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Site Location","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"BCADBC94-44C0-4116-8008-5A57F26E6573","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"Event","Item":[]},"Label":"Request","Image":"request-icon.png","Color":"#2b9e38","Tag":""},{"TheScreen":{"UseFromProcessRef":"Incident","Item":[]},"TheWorkflow":{"UseFromProcessRef":"Event","Item":[]},"Label":"Problem","Image":"problem-icon.png","Color":"#5e0915","Tag":""},{"TheScreen":{"UseFromProcessRef":"","Item":[{"InternalField":8,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Type","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":3,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Title","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Customer","CreateScreen":true,"EditScreen":false,"ViewScreen":false},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Site Location","CreateScreen":true,"EditScreen":false,"ViewScreen":false},{"InternalField":13,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Component","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":38,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedAttachments","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":36,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedComments","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":17,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DueDate","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":35,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedWatchers","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":9,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Priority","CreateScreen":true,"EditScreen":tru'',NULL,NULL) WHERE [templateid]=26
UPDATE [dbo].[gemini_projecttemplate] SET [template].WRITE(N''e,"ViewScreen":true},{"InternalField":6,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"ReportedBy","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":33,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedTime","CreateScreen":true,"EditScreen":true,"ViewScreen":false},{"InternalField":5,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Visibility","CreateScreen":true,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Customer","CreateScreen":false,"EditScreen":true,"ViewScreen":false},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Site Location","CreateScreen":false,"EditScreen":true,"ViewScreen":false},{"InternalField":10,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Status","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":7,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssignedTo","CreateScreen":false,"EditScreen":true,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Customer","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":true,"IsExternalWidgetField":false,"ExternalFieldRef":"Site Location","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":21,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"ClosedDate","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":19,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateRevised","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":18,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"DateCreated","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":24,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"Source","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":30,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"CalculatedTimeLogged","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":1,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"IssueKey","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":37,"IsExternalCustomField":false,"IsExternalWidgetField":false,"ExternalFieldRef":"AssociatedHistory","CreateScreen":false,"EditScreen":false,"ViewScreen":true},{"InternalField":0,"IsExternalCustomField":false,"IsExternalWidgetField":true,"ExternalFieldRef":"C8F0693D-129C-4D19-9865-9CED964F06AB","CreateScreen":false,"EditScreen":false,"ViewScreen":true}]},"TheWorkflow":{"UseFromProcessRef":"Event","Item":[]},"Label":"Identity","Image":"identity-icon.png","Color":"#1e289e","Tag":""}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-07-03T10:54:06.1482413Z","Revised":"2012-07-03T10:54:06.1482413Z","Errors":[],"HasErrors":false,"Id":0}'',NULL,NULL) WHERE [templateid]=26
')
SET IDENTITY_INSERT [dbo].[gemini_projecttemplate] OFF

-- Add 20 rows to [dbo].[gemini_testing_types]
SET IDENTITY_INSERT [dbo].[gemini_testing_types] ON
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (1, 1, N'Acceptance', N'assets/images/meta/test-acceptance.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (2, 2, N'Black Box', N'assets/images/meta/test-blackbox.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (3, 3, N'Boundary', N'assets/images/meta/test-boundary.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (4, 4, N'Component', N'assets/images/meta/test-component.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (5, 5, N'Functional', N'assets/images/meta/test-functional.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (6, 6, N'Integration', N'assets/images/meta/test-integration.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (7, 7, N'Installation', N'assets/images/meta/test-installation.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (8, 8, N'Load', N'assets/images/meta/test-load.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (9, 9, N'Performance', N'assets/images/meta/test-performance.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (10, 10, N'Regression', N'assets/images/meta/test-regression.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (11, 11, N'Requirements', N'assets/images/meta/test-requirements.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (12, 12, N'Security', N'assets/images/meta/test-security.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (13, 13, N'Smoke', N'assets/images/meta/test-smoke.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (14, 14, N'Stress', N'assets/images/meta/test-stress.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (15, 15, N'System', N'assets/images/meta/test-system.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (16, 16, N'Unit', N'assets/images/meta/test-unit.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (17, 17, N'Usability', N'assets/images/meta/test-usability.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (18, 18, N'User', N'assets/images/meta/test-user.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (19, 19, N'Validation', N'assets/images/meta/test-validation.png')
INSERT INTO [dbo].[gemini_testing_types] ([typeid], [seq], [typedesc], [imagepath]) VALUES (20, 20, N'White Box', N'assets/images/meta/test-whitebox.png')
SET IDENTITY_INSERT [dbo].[gemini_testing_types] OFF

-- Add 3 rows to [dbo].[gemini_users]
SET IDENTITY_INSERT [dbo].[gemini_users] ON
INSERT INTO [dbo].[gemini_users] ([userid], [username], [firstname], [surname], [pwd], [emailaddress], [roles], [resetpwd], [comment], [apikey], [active], [created], [lastupdated], [logindate], [previouslogindate], [openid], [timezoneid], [culture], [languageid], [theme], [emailme], [emailmemychanges], [settings], [userexperience], [previouspasswords], [locked]) VALUES (-2, N'-2system', N'System', N'Account', 0x00000000000000000000000000000000, N'', N'', NULL, N'', '', 1, '2008-01-31T14:38:25.873', '2013-11-21T11:09:18.000', '2013-11-21T11:09:18.000', '2013-11-19T18:08:44.000', N'', 'UTC', '', '', '', 1, 1, N'', 0, N'', 0)
INSERT INTO [dbo].[gemini_users] ([userid], [username], [firstname], [surname], [pwd], [emailaddress], [roles], [resetpwd], [comment], [apikey], [active], [created], [lastupdated], [logindate], [previouslogindate], [openid], [timezoneid], [culture], [languageid], [theme], [emailme], [emailmemychanges], [settings], [userexperience], [previouspasswords], [locked]) VALUES (-1, N'anon', N'* Anonymous', N'User *', 0x2ae66f90b7788ab8950e8f81b829c947, N'anon@anon.com', N'', NULL, N'', '', 1, '2008-01-31T14:38:25.873', '2008-03-17T10:19:17.000', '2009-11-27T13:48:37.000', '2009-11-27T13:48:37.000', N'', 'UTC', '', 'en-US', '', 1, 1, N'', 0, N'', 0)
INSERT INTO [dbo].[gemini_users] ([userid], [username], [firstname], [surname], [pwd], [emailaddress], [roles], [resetpwd], [comment], [apikey], [active], [created], [lastupdated], [logindate], [previouslogindate], [openid], [timezoneid], [culture], [languageid], [theme], [emailme], [emailmemychanges], [settings], [userexperience], [previouspasswords], [locked]) VALUES (1, N'manager', N'Manager', N'Person', 0x1d0258c2440a8d19e716292b231e3190, N'admin@mycompany.com', N'', NULL, N'', 'xvitjc5bmm', 1, '2008-01-31T14:38:25.873', '2013-11-21T11:09:18.000', '2013-11-21T11:09:18.000', '2013-11-19T18:08:44.000', N'', 'UTC', 'en-US', 'en-US', '', 1, 1, N'{"Picture":"/9j/4AAQSkZJRgABAQAAAQABAAD//gA7Q1JFQVRPUjogZ2QtanBlZyB2MS4wICh1c2luZyBJSkcgSlBFRyB2NjIpLCBxdWFsaXR5ID0gOTAK/9sAQwADAgIDAgIDAwMDBAMDBAUIBQUEBAUKBwcGCAwKDAwLCgsLDQ4SEA0OEQ4LCxAWEBETFBUVFQwPFxgWFBgSFBUU/9sAQwEDBAQFBAUJBQUJFA0LDRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU/8AAEQgAQABAAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A+uKKKKACipba1lvbiOCCNpZpDtVEGSTXe6X8Hry4iV769jtGIz5caeYR9TkD8s0Aee0V6Hqfwdu4ImexvUumHPlyJ5ZP0OSPzxXA3VpNY3EkFxE0M0ZwyOMEGgCKiiigAooooA9a+Enh+ODTX1aRA087FImP8KA4OPqQfyr0GuW+Glylx4OslQjdEXjcDsdxP8iD+NdTQAVwHxZ8Px3OlLqsaAXFuQsjAfeQnHP0JH5mu/rmfiPcpbeDr/eRmTbGo9SWH9AT+FAHhVFFFABRRVrS9MuNZv4bO1TzJpTgDsPUn2FAHQ+APGD+Gr8wyI81lcEB0QZZW7MB39x3/CvbYpBNGrrkKwBG5Sp/EHkVg+FfBdj4Xt1KIJ7wj57lhz9F9BXQ0ANkkEUbO2dqjJ2gk/kOTXifxA8Yv4kvVt4keGyt2O1HGGZuhYjt7D/Gvbq57xV4LsfFFuxdBBeAfJcqOfo3qKAPBaKtapplxo1/NZ3SeXNEcEdj6EexqrQAV678JvD62elvqki/v7klYyf4Ywf6kfoK8ir6P0ezGn6TZ2yjAhhRPyAoAuUUUUAFFFFAHA/Fnw+t5paapGv7+2IWQj+KMn+hP6mvIq+j9YsxqGk3lswyJoXT8wa+cKAP/9k=","PictureUploaded":false,"Actions":[],"ShowTourPopup":true,"Salt":"ieBAELtTSJNigojmn8J8KQ==","PageSize":20,"TourStatus":[],"NewsletterSubscriber":false,"LastUpdateDate":"2012-04-17T00:00:00+01:00","AppNavSettings":{"AppNavCardEmailSubject":"","AppNavCardEmailMessage":""},"UseGravatar":true,"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-08-01T20:02:24.5794469Z","Revised":"2012-08-01T20:02:24.5794469Z","Errors":[],"HasErrors":false,"Id":0}', 0, N'', 0)
SET IDENTITY_INSERT [dbo].[gemini_users] OFF

-- Add 5 rows to [dbo].[SAMPLE_CUSTOMFIELD_EDITION]
INSERT INTO [dbo].[SAMPLE_CUSTOMFIELD_EDITION] ([editionid], [editionname]) VALUES (1, N'Unknown')
INSERT INTO [dbo].[SAMPLE_CUSTOMFIELD_EDITION] ([editionid], [editionname]) VALUES (2, N'Express')
INSERT INTO [dbo].[SAMPLE_CUSTOMFIELD_EDITION] ([editionid], [editionname]) VALUES (3, N'Standard')
INSERT INTO [dbo].[SAMPLE_CUSTOMFIELD_EDITION] ([editionid], [editionname]) VALUES (4, N'Professional')
INSERT INTO [dbo].[SAMPLE_CUSTOMFIELD_EDITION] ([editionid], [editionname]) VALUES (5, N'Enterprise')

-- Add 4 rows to [dbo].[SAMPLE_CUSTOMFIELD_PLATFORM]
INSERT INTO [dbo].[SAMPLE_CUSTOMFIELD_PLATFORM] ([platformid], [platformname]) VALUES (1, N'Unknown')
INSERT INTO [dbo].[SAMPLE_CUSTOMFIELD_PLATFORM] ([platformid], [platformname]) VALUES (2, N'Windows XP')
INSERT INTO [dbo].[SAMPLE_CUSTOMFIELD_PLATFORM] ([platformid], [platformname]) VALUES (3, N'Windows Vista')
INSERT INTO [dbo].[SAMPLE_CUSTOMFIELD_PLATFORM] ([platformid], [platformname]) VALUES (4, N'Windows Server 2003')

-- Add 17 rows to [dbo].[gemini_customfielddefinitions]
SET IDENTITY_INSERT [dbo].[gemini_customfielddefinitions] ON
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (22, N'Customer', 0, N'Customer', N'Our Client name', N'Select the customer from the list', 0, 0, N'', N'C', N'', N'', N'', N'', 1, '2012-08-01T19:32:32.767', 1, N'Customer A
Customer B
Customer C
', 0.00000, 0.00000, N'', 0, 10, 1, 0, NULL, NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (27, N'Customer', 0, N'Customer', N'Our Client name', N'Select the customer from the list', 0, 1, N'', N'L', N'', N'', N'', N'', 1, '2012-08-01T19:32:32.770', 1, N'Customer A
Customer B
Customer C
', 0.00000, 0.00000, N'', 0, 12, 1, 0, NULL, NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (28, N'User Application', 0, N'User Application', N'', N'User Application', 0, 0, N'', N'C', N'', N'', N'', N'', 0, '2012-08-01T19:32:32.770', 1, N'Peoplesoft Financials
Peoplesoft HR
Dynamics CRM
OURSYS
Inventory Management
Other
', 0.00000, 0.00000, N'', 0, 12, 1, 0, NULL, NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (29, N'Product Platform', 0, N'Product Platform (OS)', N'', N'Product Platform (OS)', 0, 0, N'', N'C', N'', N'', N'', N'', 0, '2012-08-01T19:32:32.770', 1, N'Windows 7
Windows 8
Linux
Ubuntu
Mac OS
iPad
', 0.00000, 0.00000, N'', 0, 12, 1, 0, NULL, NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (30, N'Customer', 0, N'Customer', N'Our Client name', N'Select the customer from the list', 0, 1, N'', N'L', N'', N'', N'', N'', 1, '2012-08-01T19:32:32.770', 1, N'Customer A
Customer B
Customer C
', 0.00000, 0.00000, N'', 0, 13, 1, 0, NULL, NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (31, N'User Application', 0, N'User Application', N'', N'User Application', 0, 0, N'', N'C', N'', N'', N'', N'', 0, '2012-08-01T19:32:32.770', 1, N'Peoplesoft Financials
Peoplesoft HR
Dynamics CRM
OURSYS
Inventory Management
Other
', 0.00000, 0.00000, N'', 0, 13, 1, 0, NULL, NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (32, N'Product Platform', 0, N'Product Platform (OS)', N'', N'Product Platform (OS)', 0, 0, N'', N'C', N'', N'', N'', N'', 0, '2012-08-01T19:32:32.770', 1, N'Windows 7
Windows 8
Linux
Ubuntu
Mac OS
iPad
', 0.00000, 0.00000, N'', 0, 13, 1, 0, NULL, NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (33, N'Test Type', 0, N'Test Type', N'', N'Test Type', 0, 0, N'', N'C', N'gemini_testing_types', N'typeid', N'typedesc', N'typedesc', 0, '2013-08-01T14:51:42.063', 1, N'', 0.00000, 0.00000, N'', 1, 10, 0, 0, N'', NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (34, N'Preconditions', 0, N'Pre-Conditions', N'', N'Pre-Conditions', 250, 0, N'', N'R', N'', N'', N'', N'', 0, '2013-08-01T14:51:42.063', 0, N'                        
                    ', 0.00000, 0.00000, N'', 1, 10, 0, 0, N'', NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (35, N'Expected Results', 0, N'Expected Results', N'', N'Expected Results', 250, 0, N'', N'R', N'', N'', N'', N'', 0, '2013-08-01T14:51:42.063', 0, N'                        
                    ', 0.00000, 0.00000, N'', 1, 10, 0, 0, N'', NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (36, N'Run Status', 0, N'Run Status', N'', N'Run Status', 0, 0, N'', N'R', N'', N'', N'', N'', 0, '2013-09-12T11:05:01.670', 1, N'', NULL, NULL, N'', 0, 10, 0, 0, N'', 0, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (37, N'Test Type', 0, N'Test Type', N'', N'Test Type', 0, 0, N'', N'C', N'gemini_testing_types', N'typeid', N'typedesc', N'typedesc', 0, '2013-08-01T14:51:42.063', 1, N'', 0.00000, 0.00000, N'', 1, 13, 0, 0, N'', NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (38, N'Preconditions', 0, N'Pre-Conditions', N'', N'Pre-Conditions', 250, 0, N'', N'R', N'', N'', N'', N'', 0, '2013-08-01T14:51:42.063', 0, N'                        
                    ', 0.00000, 0.00000, N'', 1, 13, 0, 0, N'', NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (39, N'Expected Results', 0, N'Expected Results', N'', N'Expected Results', 250, 0, N'', N'R', N'', N'', N'', N'', 0, '2013-08-01T14:51:42.063', 0, N'                        
                    ', 0.00000, 0.00000, N'', 1, 13, 0, 0, N'', NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (40, N'Run Status', 0, N'Run Status', N'', N'Run Status', 0, 0, N'', N'R', N'', N'', N'', N'', 0, '2013-09-12T11:05:01.670', 1, N'', NULL, NULL, N'', 0, 13, 0, 0, N'', 0, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (41, N'Customer', 0, N'Customer', N'Our Client name', N'Select the customer from the list', 0, 1, N'', N'C', N'', N'', N'', N'', 1, '2014-04-11T14:52:25.987', 1, N'Customer A
Customer B
Customer C
', 0.00000, 0.00000, N'', 1, 26, 1, 0, N'', NULL, 0, 0)
INSERT INTO [dbo].[gemini_customfielddefinitions] ([customfieldid], [customfieldname], [screenorder], [screenlabel], [screendescription], [screentooltip], [maxlen], [canmultiselect], [regularexp], [customfieldtype], [lookupname], [lookupvaluefield], [lookuptextfield], [lookupsortfield], [projectidfilter], [created], [showinline], [lookupdata], [maxvalue], [minvalue], [listlimiter], [usedin], [templateid], [usestaticdata], [canfilter], [cascadinglookupvaluefield], [cascadingparentfield], [allownoselection], [autocomplete]) VALUES (42, N'Site Location', 0, N'Site Location', N'', N'Site Location', 0, 0, N'', N'C', N'', N'', N'', N'', 0, '2014-04-11T14:52:25.987', 1, N'Location A
Location B
Location C
', NULL, NULL, N'', 1, 26, 1, 1, N'', NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[gemini_customfielddefinitions] OFF

-- Add 8 rows to [dbo].[gemini_issuelinktypes]
SET IDENTITY_INSERT [dbo].[gemini_issuelinktypes] ON
INSERT INTO [dbo].[gemini_issuelinktypes] ([linktypeid], [linkname], [linkdesc], [created], [templateid]) VALUES (19, N'Duplicated', N'', '2012-08-01T19:32:32.760', 10)
INSERT INTO [dbo].[gemini_issuelinktypes] ([linktypeid], [linkname], [linkdesc], [created], [templateid]) VALUES (20, N'Related', N'', '2012-08-01T19:32:32.760', 10)
INSERT INTO [dbo].[gemini_issuelinktypes] ([linktypeid], [linkname], [linkdesc], [created], [templateid]) VALUES (23, N'Duplicated', N'', '2012-08-01T19:32:32.760', 12)
INSERT INTO [dbo].[gemini_issuelinktypes] ([linktypeid], [linkname], [linkdesc], [created], [templateid]) VALUES (24, N'Related', N'', '2012-08-01T19:32:32.760', 12)
INSERT INTO [dbo].[gemini_issuelinktypes] ([linktypeid], [linkname], [linkdesc], [created], [templateid]) VALUES (25, N'Duplicated', N'', '2012-08-01T19:32:32.760', 13)
INSERT INTO [dbo].[gemini_issuelinktypes] ([linktypeid], [linkname], [linkdesc], [created], [templateid]) VALUES (26, N'Related', N'', '2012-08-01T19:32:32.760', 13)
INSERT INTO [dbo].[gemini_issuelinktypes] ([linktypeid], [linkname], [linkdesc], [created], [templateid]) VALUES (51, N'Duplicated', N'', '2014-04-11T14:52:25.980', 26)
INSERT INTO [dbo].[gemini_issuelinktypes] ([linktypeid], [linkname], [linkdesc], [created], [templateid]) VALUES (52, N'Related', N'', '2014-04-11T14:52:25.980', 26)
SET IDENTITY_INSERT [dbo].[gemini_issuelinktypes] OFF

-- Add 12 rows to [dbo].[gemini_issuepriorities]
SET IDENTITY_INSERT [dbo].[gemini_issuepriorities] ON
INSERT INTO [dbo].[gemini_issuepriorities] ([priorityid], [seq], [prioritydesc], [imagepath], [color], [templateid]) VALUES (29, 1, N'Low', N'assets/images/meta/AGILE/priority-low.png', '#3535bd', 10)
INSERT INTO [dbo].[gemini_issuepriorities] ([priorityid], [seq], [prioritydesc], [imagepath], [color], [templateid]) VALUES (30, 2, N'Medium', N'assets/images/meta/AGILE/priority-medium.png', '#d1752e', 10)
INSERT INTO [dbo].[gemini_issuepriorities] ([priorityid], [seq], [prioritydesc], [imagepath], [color], [templateid]) VALUES (31, 3, N'High', N'assets/images/meta/AGILE/priority-high.png', '#eb0c1f', 10)
INSERT INTO [dbo].[gemini_issuepriorities] ([priorityid], [seq], [prioritydesc], [imagepath], [color], [templateid]) VALUES (35, 1, N'Low', N'assets/images/meta/TICKETING/priority-low.png', '#0000ff', 12)
INSERT INTO [dbo].[gemini_issuepriorities] ([priorityid], [seq], [prioritydesc], [imagepath], [color], [templateid]) VALUES (36, 2, N'Medium', N'assets/images/meta/TICKETING/priority-medium.png', '#ffffff', 12)
INSERT INTO [dbo].[gemini_issuepriorities] ([priorityid], [seq], [prioritydesc], [imagepath], [color], [templateid]) VALUES (37, 3, N'High', N'assets/images/meta/TICKETING/priority-high.png', '#eb0c1f', 12)
INSERT INTO [dbo].[gemini_issuepriorities] ([priorityid], [seq], [prioritydesc], [imagepath], [color], [templateid]) VALUES (38, 1, N'Low', N'assets/images/meta/TRACKING/priority-low.png', '#0000ff', 13)
INSERT INTO [dbo].[gemini_issuepriorities] ([priorityid], [seq], [prioritydesc], [imagepath], [color], [templateid]) VALUES (39, 2, N'Medium', N'assets/images/meta/TRACKING/priority-medium.png', '#ffffff', 13)
INSERT INTO [dbo].[gemini_issuepriorities] ([priorityid], [seq], [prioritydesc], [imagepath], [color], [templateid]) VALUES (40, 3, N'High', N'assets/images/meta/TRACKING/priority-high.png', '#eb0c1f', 13)
INSERT INTO [dbo].[gemini_issuepriorities] ([priorityid], [seq], [prioritydesc], [imagepath], [color], [templateid]) VALUES (77, 1, N'Low', N'assets/images/meta/ITIL/priority-low.png', '#3535bd', 26)
INSERT INTO [dbo].[gemini_issuepriorities] ([priorityid], [seq], [prioritydesc], [imagepath], [color], [templateid]) VALUES (78, 2, N'Medium', N'assets/images/meta/ITIL/priority-medium.png', '#d1752e', 26)
INSERT INTO [dbo].[gemini_issuepriorities] ([priorityid], [seq], [prioritydesc], [imagepath], [color], [templateid]) VALUES (79, 3, N'High', N'assets/images/meta/ITIL/priority-high.png', '#eb0c1f', 26)
SET IDENTITY_INSERT [dbo].[gemini_issuepriorities] OFF

-- Add 18 rows to [dbo].[gemini_issueresolutions]
SET IDENTITY_INSERT [dbo].[gemini_issueresolutions] ON
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (21, 1, 0, N'Unresolved', 10)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (22, 5, 1, N'Complete', 10)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (25, 1, 0, N'Unresolved', 12)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (26, 3, 1, N'Complete', 12)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (27, 1, 0, N'Unresolved', 13)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (28, 5, 1, N'Complete', 13)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (35, 4, 1, N'Rejected', 10)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (36, 3, 1, N'Duplicate', 10)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (37, 2, 0, N'Parked', 10)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (38, 3, 1, N'Duplicate', 13)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (39, 4, 1, N'Rejected', 13)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (40, 2, 0, N'Parked', 13)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (42, 2, 1, N'Rejected', 12)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (82, 1, 0, N'Unresolved', 26)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (83, 2, 0, N'Parked', 26)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (84, 3, 1, N'Duplicate', 26)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (85, 4, 1, N'Rejected', 26)
INSERT INTO [dbo].[gemini_issueresolutions] ([resolutionid], [seq], [isfinal], [resdesc], [templateid]) VALUES (86, 5, 1, N'Complete', 26)
SET IDENTITY_INSERT [dbo].[gemini_issueresolutions] OFF

-- Add 12 rows to [dbo].[gemini_issueseverity]
SET IDENTITY_INSERT [dbo].[gemini_issueseverity] ON
INSERT INTO [dbo].[gemini_issueseverity] ([severityid], [seq], [severitydesc], [imagepath], [color], [templateid]) VALUES (30, 1, N'Trivial', N'assets/images/meta/AGILE/severity-trivial.png', '#000000', 10)
INSERT INTO [dbo].[gemini_issueseverity] ([severityid], [seq], [severitydesc], [imagepath], [color], [templateid]) VALUES (31, 2, N'Minor', N'assets/images/meta/AGILE/severity-minor.png', '#0000ff', 10)
INSERT INTO [dbo].[gemini_issueseverity] ([severityid], [seq], [severitydesc], [imagepath], [color], [templateid]) VALUES (32, 3, N'Major', N'assets/images/meta/AGILE/severity-major.png', '#8c054d', 10)
INSERT INTO [dbo].[gemini_issueseverity] ([severityid], [seq], [severitydesc], [imagepath], [color], [templateid]) VALUES (37, 1, N'Trivial', N'assets/images/meta/TICKETING/severity-trivial.png', '#242224', 12)
INSERT INTO [dbo].[gemini_issueseverity] ([severityid], [seq], [severitydesc], [imagepath], [color], [templateid]) VALUES (38, 2, N'Minor', N'assets/images/meta/TICKETING/severity-minor.png', '#0000ff', 12)
INSERT INTO [dbo].[gemini_issueseverity] ([severityid], [seq], [severitydesc], [imagepath], [color], [templateid]) VALUES (39, 3, N'Major', N'assets/images/meta/TICKETING/severity-major.png', '#8c054d', 12)
INSERT INTO [dbo].[gemini_issueseverity] ([severityid], [seq], [severitydesc], [imagepath], [color], [templateid]) VALUES (40, 1, N'Trivial', N'assets/images/meta/TRACKING/severity-trivial.png', '#1f1a1f', 13)
INSERT INTO [dbo].[gemini_issueseverity] ([severityid], [seq], [severitydesc], [imagepath], [color], [templateid]) VALUES (41, 2, N'Minor', N'assets/images/meta/TRACKING/severity-minor.png', '#0000ff', 13)
INSERT INTO [dbo].[gemini_issueseverity] ([severityid], [seq], [severitydesc], [imagepath], [color], [templateid]) VALUES (42, 3, N'Major', N'assets/images/meta/TRACKING/severity-major.png', '#8c054d', 13)
INSERT INTO [dbo].[gemini_issueseverity] ([severityid], [seq], [severitydesc], [imagepath], [color], [templateid]) VALUES (78, 1, N'Trivial', N'assets/images/meta/ITIL/severity-trivial.png', '', 26)
INSERT INTO [dbo].[gemini_issueseverity] ([severityid], [seq], [severitydesc], [imagepath], [color], [templateid]) VALUES (79, 2, N'Minor', N'assets/images/meta/ITIL/severity-minor.png', '#0000ff', 26)
INSERT INTO [dbo].[gemini_issueseverity] ([severityid], [seq], [severitydesc], [imagepath], [color], [templateid]) VALUES (80, 3, N'Major', N'assets/images/meta/ITIL/severity-major.png', '#8c054d', 26)
SET IDENTITY_INSERT [dbo].[gemini_issueseverity] OFF

-- Add 21 rows to [dbo].[gemini_issuestatus]
SET IDENTITY_INSERT [dbo].[gemini_issuestatus] ON
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (65, 0, N'In Backlog', 0, N'assets/images/meta/AGILE/test-blackbox.png', N'', '#3d213d', 1, 10)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (66, 0, N'In Sprint', 0, N'assets/images/meta/status-ready-for-approval.png', N'', '#b4bf17', 2, 10)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (68, 0, N'Tested', 0, N'assets/images/meta/type-qualitycheck.png', N'', '#d16817', 4, 10)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (69, 0, N'In Progress', 0, N'assets/images/meta/AGILE/status-inprogress.png', N'', '#166b08', 3, 10)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (70, 1, N'Closed', 1, N'assets/images/meta/AGILE/status-closed.png', N'', '#1326f5', 5, 10)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (85, 0, N'Unassigned', 0, N'assets/images/meta/TICKETING/status-unassigned.png', N'', '#0000ff', 1, 12)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (87, 0, N'In Progress', 0, N'assets/images/meta/TICKETING/status-inprogress.png', N'', '#a130a1', 5, 12)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (88, 1, N'Closed', 1, N'assets/images/meta/TICKETING/status-closed.png', N'', '#eb8023', 6, 12)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (92, 0, N'Approved', 0, N'assets/images/meta/TICKETING/status-approved.png', N'', '#099e38', 2, 12)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (95, 0, N'Unassigned', 0, N'assets/images/meta/TRACKING/status-unassigned.png', N'', '#0000ff', 1, 13)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (96, 0, N'Assigned', 0, N'assets/images/meta/TRACKING/status-assigned.png', N'', '#d9782e', 2, 13)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (97, 0, N'In Progress', 0, N'assets/images/meta/TRACKING/status-inprogress.png', N'', '#a130a1', 3, 13)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (98, 1, N'Closed', 1, N'assets/images/meta/TRACKING/status-closed.png', N'', '#28b845', 4, 13)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (99, 0, N'Reopened', 0, N'assets/images/meta/TRACKING/status-reopened.png', N'', '#f52525', 5, 13)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (121, 0, N'Rejected', 0, N'assets/images/meta/status-rejected.png', N'', '#b3164f', 3, 12)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (182, 0, N'Logged', 0, N'assets/images/meta/ITIL/test-blackbox.png', N'', '#3d213d', 1, 26)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (183, 0, N'Assigned', 0, N'assets/images/meta/ITIL/status-inprogress.png', N'', '#7a6511', 2, 26)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (184, 0, N'In Progress', 0, N'assets/images/meta/ITIL/test-functional.png', N'', '#961896', 3, 26)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (185, 0, N'Test', 0, N'assets/images/meta/ITIL/type-qualitycheck.png', N'', '#d16817', 4, 26)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (186, 0, N'Deploy', 0, N'assets/images/meta/ITIL/status-approved.png', N'', '#6ee368', 5, 26)
INSERT INTO [dbo].[gemini_issuestatus] ([statusid], [isfinal], [statusdesc], [statustype], [imagepath], [comment], [color], [seq], [templateid]) VALUES (187, 1, N'Closed', 1, N'assets/images/meta/ITIL/status-closed.png', N'', '#1326f5', 6, 26)
SET IDENTITY_INSERT [dbo].[gemini_issuestatus] OFF

-- Add 19 rows to [dbo].[gemini_issuetimetype]
SET IDENTITY_INSERT [dbo].[gemini_issuetimetype] ON
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (30, N'Billable', N'', '2012-08-01T19:32:32.763', 10, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (31, N'Non-Billable', N'', '2012-08-01T19:32:32.763', 10, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (32, N'Internal', N'', '2012-08-01T19:32:32.763', 10, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (33, N'Scrum Master PM', N'', '2012-08-01T19:32:32.763', 10, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (34, N'Testing', N'', '2012-08-01T19:32:32.763', 10, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (38, N'Billable', N'', '2012-08-01T19:32:32.763', 12, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (39, N'Non-Billable', N'', '2012-08-01T19:32:32.763', 12, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (40, N'Internal', N'', '2012-08-01T19:32:32.763', 12, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (41, N'Scrum Master PM', N'', '2012-08-01T19:32:32.763', 12, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (42, N'Testing', N'', '2012-08-01T19:32:32.763', 12, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (43, N'Billable', N'', '2012-08-01T19:32:32.763', 13, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (44, N'Non-Billable', N'', '2012-08-01T19:32:32.767', 13, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (45, N'Internal', N'', '2012-08-01T19:32:32.767', 13, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (46, N'Scrum Master PM', N'', '2012-08-01T19:32:32.767', 13, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (47, N'Testing', N'', '2012-08-01T19:32:32.767', 13, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (98, N'Billable', N'', '2014-04-11T14:52:25.977', 26, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (99, N'Non-Billable', N'', '2014-04-11T14:52:25.977', 26, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (100, N'Internal', N'', '2014-04-11T14:52:25.977', 26, 0)
INSERT INTO [dbo].[gemini_issuetimetype] ([timetypeid], [timetypename], [timetypedesc], [created], [templateid], [seq]) VALUES (101, N'Testing', N'', '2014-04-11T14:52:25.977', 26, 0)
SET IDENTITY_INSERT [dbo].[gemini_issuetimetype] OFF

-- Add 23 rows to [dbo].[gemini_issuetypes]
SET IDENTITY_INSERT [dbo].[gemini_issuetypes] ON
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (55, 2, N''Story'', N''assets/images/meta/AGILE/type-enhancement.png'', ''#e612e6'', ''{"ReferenceId":0,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssociatedLinks","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"Visibility","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"ReportedBy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"ResolvedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"CalculatedTimeExceeded","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"CalculatedTimeRemaining","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":27,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":28,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":29,"Label":"","Id":"FA6EA42D-8D67-4763-86F5-E8745FBF3DC6","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":30,"Label":"","Id":"18FE1D21-77G0-4067-8A10-F452FCB9D090","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":31,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":32,"Label":"","Id":"AssociatedHistory","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":33,"Label":"","Id":"28FE1D91-7730-4067-8A10-F452FCB9D090","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":34,"Label":"","Id":"061F1F58-35BC-4509-83FC-CCC996ED4F36","Type":2}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2013-11-19T12:48:36.5174494Z","Revised":"2013-11-19T12:48:36.5174494Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":0,"Status":[{"StatusId":65,"Top":24,"Left":412,"Transitions":[{"StatusId":66,"Groups":[1]}]},{"StatusId":66,"Top":108,"Left":48,"Transitions":[{"StatusId":69,"Groups":[1]}]},{"StatusId":69,"Top":288,"Left":219,"Transitions":[{"StatusId":68,"Groups":[1]},{"StatusId":65,"Groups":[1]}]},{"StatusId":68,"Top":459,"Left":313,"Transitions":[{"StatusId":70,"Groups":[1]}]},{"StatusId":70,"Top":587,"Left":525,"Transitions":[]}]}'', '''', 10)')
INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (57, 3, N'Task', N'assets/images/meta/AGILE/type-task.png', '#e68012', '{"ReferenceId":55,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedAttachments","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedComments","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedTime","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-08-01T18:40:49.4754629Z","Revised":"2012-08-01T18:40:49.4754629Z","Errors":[],"HasErrors":false,"Id":0}', '{"ReferenceId":55,"Status":[{"StatusId":65,"Top":10,"Left":10,"Transitions":[]},{"StatusId":66,"Top":10,"Left":160,"Transitions":[]},{"StatusId":67,"Top":0,"Left":0,"Transitions":[{"StatusId":68,"Groups":[1]}]},{"StatusId":68,"Top":10,"Left":160,"Transitions":[{"StatusId":69,"Groups":[1]}]},{"StatusId":69,"Top":10,"Left":310,"Transitions":[{"StatusId":70,"Groups":[1]}]},{"StatusId":70,"Top":10,"Left":460,"Transitions":[]},{"StatusId":71,"Top":80,"Left":10,"Transitions":[]}]}', '', 10)
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (58, 4, N''Change Request'', N''assets/images/meta/AGILE/type-changerequest.png'', ''#e5f00e'', ''{"ReferenceId":55,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"23","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"DueDate","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"23","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"Visibility","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"23","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"AssociatedSourceControl","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AssociatedHistory","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-08-01T10:18:16.5718155Z","Revised":"2012-08-01T10:18:16.5718155Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":55,"Status":[{"StatusId":64,"Top":0,"Left":0,"Transitions":[{"StatusId":65,"Groups":[1]}]},{"StatusId":65,"Top":0,"Left":0,"Transitions":[{"StatusId":66,"Groups":[1]}]},{"StatusId":66,"Top":0,"Left":0,"Transitions":[{"StatusId":68,"Groups":[1]},{"StatusId":69,"Groups":[1]}]},{"StatusId":67,"Top":10,"Left":460,"Transitions":[{"StatusId":68,"Groups":[1]}]},{"StatusId":68,"Top":10,"Left":610,"Transitions":[{"StatusId":69,"Groups":[1]}]},{"StatusId":69,"Top":10,"Left":760,"Transitions":[{"StatusId":70,"Groups":[1]}]},{"StatusId":70,"Top":0,"Left":0,"Transitions":[]},{"StatusId":71,"Top":0,"Left":0,"Transitions":[{"StatusId":65,"Groups":[1]}]}]}'', '''', 10)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (59, 5, N''Bug'', N''assets/images/meta/AGILE/type-bug.png'', ''#ff0000'', ''{"ReferenceId":55,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"23","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"DueDate","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"23","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"Visibility","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"23","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"AssociatedSourceControl","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AssociatedHistory","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-08-01T10:18:20.5330421Z","Revised":"2012-08-01T10:18:20.5330421Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":55,"Status":[{"StatusId":64,"Top":10,"Left":10,"Transitions":[]},{"StatusId":68,"Top":564,"Left":423,"Transitions":[{"StatusId":69,"Groups":[1]}]},{"StatusId":70,"Top":523,"Left":726,"Transitions":[]},{"StatusId":65,"Top":67,"Left":345,"Transitions":[]},{"StatusId":69,"Top":10,"Left":760,"Transitions":[{"StatusId":70,"Groups":[1]}]},{"StatusId":66,"Top":498,"Left":91,"Transitions":[{"StatusId":68,"Groups":[1]},{"StatusId":65,"Groups":[1]}]},{"StatusId":71,"Top":206,"Left":10,"Transitions":[{"StatusId":65,"Groups":[1]}]},{"StatusId":67,"Top":334,"Left":308,"Transitions":[{"StatusId":68,"Groups":[1]},{"StatusId":69,"Groups":[1]}]}]}'', '''', 10)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (64, 1, N''Investigation'', N''assets/images/meta/TICKETING/type-investigation.png'', ''#ffd000'', ''{"ReferenceId":0,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedWatchers","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"27","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"29","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"Visibility","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Source","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"27","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"29","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"ReportedBy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"ResolvedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"SLA","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"BCADBC94-44C0-4116-8008-5A57F26E6573","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"AssociatedHistory","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2014-04-22T16:03:41.0708581Z","Revised":"2014-04-22T16:03:41.0708581Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":66,"Status":[{"StatusId":90,"Top":10,"Left":10,"Transitions":[]},{"StatusId":86,"Top":0,"Left":0,"Transitions":[{"StatusId":85,"Groups":[1]},{"StatusId":87,"Groups":[1]}]},{"StatusId":88,"Top":10,"Left":310,"Transitions":[]},{"StatusId":83,"Top":10,"Left":460,"Transitions":[]},{"StatusId":87,"Top":217,"Left":383,"Transitions":[{"StatusId":88,"Groups":[1]}]},{"StatusId":84,"Top":10,"Left":760,"Transitions":[]},{"StatusId":89,"Top":80,"Left":10,"Transitions":[]},{"StatusId":85,"Top":0,"Left":0,"Transitions":[]}]}'', '''', 12)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (66, 3, N''Support Request'', N''assets/images/meta/TICKETING/type-enhancement.png'', ''#e612e6'', ''{"ReferenceId":64,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AffectedVersions","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"Visibility","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"AssociatedHistory","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"AssociatedSourceControl","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-08-01T19:03:38.1437463Z","Revised":"2012-08-01T19:03:38.1437463Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":0,"Status":[{"StatusId":85,"Top":112,"Left":156,"Transitions":[{"StatusId":92,"Groups":[1]},{"StatusId":121,"Groups":[1]}]},{"StatusId":92,"Top":275,"Left":28,"Transitions":[{"StatusId":87,"Groups":[1]}]},{"StatusId":121,"Top":103,"Left":392,"Transitions":[{"StatusId":87,"Groups":[1]}]},{"StatusId":87,"Top":390,"Left":359,"Transitions":[{"StatusId":88,"Groups":[1]}]},{"StatusId":88,"Top":254,"Left":557,"Transitions":[]}]}'', '''', 12)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (67, 4, N''Change Request'', N''assets/images/meta/TICKETING/type-changerequest.png'', ''#171517'', ''{"ReferenceId":64,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedAttachments","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Votes","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedHierarchy","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Votes","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedHistory","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedWatchers","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-08-01T19:03:41.8119561Z","Revised":"2012-08-01T19:03:41.8119561Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":66,"Status":[{"StatusId":92,"Top":0,"Left":9,"Transitions":[{"StatusId":87,"Groups":[1]}]},{"StatusId":86,"Top":0,"Left":0,"Transitions":[{"StatusId":85,"Groups":[1]},{"StatusId":87,"Groups":[1]}]},{"StatusId":88,"Top":0,"Left":0,"Transitions":[]},{"StatusId":83,"Top":10,"Left":460,"Transitions":[]},{"StatusId":87,"Top":0,"Left":0,"Transitions":[]},{"StatusId":84,"Top":10,"Left":760,"Transitions":[]},{"StatusId":90,"Top":0,"Left":0,"Transitions":[{"StatusId":87,"Groups":[1]}]},{"StatusId":89,"Top":80,"Left":160,"Transitions":[]},{"StatusId":85,"Top":0,"Left":0,"Transitions":[]},{"StatusId":91,"Top":0,"Left":0,"Transitions":[{"StatusId":88,"Groups":[1]}]}]}'', '''', 12)')
INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (68, 5, N'Task', N'assets/images/meta/TICKETING/type-task.png', '#e68012', '{"ReferenceId":64,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"AssociatedAttachments","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"AssociatedComments","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedTime","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-08-02T10:20:19.2254056Z","Revised":"2012-08-02T10:20:19.2254056Z","Errors":[],"HasErrors":false,"Id":0}', '{"ReferenceId":66,"Status":[{"StatusId":92,"Top":0,"Left":0,"Transitions":[]},{"StatusId":86,"Top":0,"Left":0,"Transitions":[{"StatusId":87,"Groups":[1]}]},{"StatusId":88,"Top":0,"Left":0,"Transitions":[]},{"StatusId":83,"Top":10,"Left":460,"Transitions":[]},{"StatusId":87,"Top":0,"Left":0,"Transitions":[{"StatusId":88,"Groups":[1]}]},{"StatusId":84,"Top":10,"Left":760,"Transitions":[]},{"StatusId":90,"Top":80,"Left":10,"Transitions":[]},{"StatusId":89,"Top":80,"Left":160,"Transitions":[]},{"StatusId":85,"Top":0,"Left":0,"Transitions":[]},{"StatusId":91,"Top":80,"Left":460,"Transitions":[]}]}', '', 12)
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (69, 1, N''Investigation'', N''assets/images/meta/status-ready-for-approval.png'', ''#63625f'', ''{"ReferenceId":82,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"Votes","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"Votes","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"ReportedBy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"ResolvedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"CalculatedTimeExceeded","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"CalculatedTimeRemaining","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"Elapsed","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"Votes","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":27,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":28,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":29,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":30,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":31,"Label":"","Id":"18FE1D21-77G0-4067-8A10-F452FCB9D090","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":32,"Label":"","Id":"FA6EA42D-8D67-4763-86F5-E8745FBF3DC6","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":33,"Label":"","Id":"AssociatedHistory","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-08-01T08:48:03.368198Z","Revised":"2012-08-01T08:48:03.368198Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":82,"Status":[{"StatusId":96,"Top":128,"Left":54,"Transitions":[{"StatusId":97,"Groups":[1]}]},{"StatusId":98,"Top":477,"Left":497,"Transitions":[{"StatusId":99,"Groups":[1]}]},{"StatusId":97,"Top":297,"Left":259,"Transitions":[{"StatusId":98,"Groups":[1]}]},{"StatusId":99,"Top":126,"Left":673,"Transitions":[{"StatusId":95,"Groups":[1]},{"StatusId":97,"Groups":[1]}]},{"StatusId":95,"Top":35,"Left":273,"Transitions":[{"StatusId":96,"Groups":[1]},{"StatusId":97,"Groups":[1]}]}]}'', '''', 13)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (70, 2, N''Bug'', N''assets/images/meta/TRACKING/type-bug.png'', ''#ff0000'', ''{"ReferenceId":82,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"30","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Source","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AssociatedSourceControl","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"AssociatedWatchers","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"30","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Source","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AssociatedSourceControl","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":27,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":28,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":29,"Label":"","Id":"AssociatedTime","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"30","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Source","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"AssociatedSourceControl","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":27,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":28,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":29,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":30,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":31,"Label":"","Id":"AssociatedHistory","Type":0}],"IsNew":true,"IsExist'', ''{"ReferenceId":82,"Status":[{"StatusId":96,"Top":0,"Left":9,"Transitions":[{"StatusId":97,"Groups":[1]},{"StatusId":98,"Groups":[1]}]},{"StatusId":98,"Top":407,"Left":0,"Transitions":[{"StatusId":99,"Groups":[1]}]},{"StatusId":93,"Top":10,"Left":310,"Transitions":[]},{"StatusId":97,"Top":0,"Left":577,"Transitions":[{"StatusId":98,"Groups":[1]}]},{"StatusId":94,"Top":10,"Left":610,"Transitions":[]},{"StatusId":99,"Top":41,"Left":151,"Transitions":[{"StatusId":96,"Groups":[1]},{"StatusId":95,"Groups":[1]}]},{"StatusId":95,"Top":0,"Left":0,"Transitions":[{"StatusId":96,"Groups":[1]}]}]}'', '''', 13)')
UPDATE [dbo].[gemini_issuetypes] SET [screen].WRITE(N'ing":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-08-01T08:48:33.6919324Z","Revised":"2012-08-01T08:48:33.6919324Z","Errors":[],"HasErrors":false,"Id":0}',NULL,NULL) WHERE [typeid]=70
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (71, 3, N''Enhancement'', N''assets/images/meta/TRACKING/type-enhancement.png'', ''#e612e6'', ''{"ReferenceId":82,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedWatchers","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"AssociatedHistory","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"Visibility","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"AssociatedHistory","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"AssociatedSourceControl","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-08-01T08:48:37.9301748Z","Revised":"2012-08-01T08:48:37.9301748Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":82,"Status":[{"StatusId":100,"Top":10,"Left":10,"Transitions":[{"StatusId":96,"Groups":[1]},{"StatusId":95,"Groups":[1]}]},{"StatusId":96,"Top":10,"Left":160,"Transitions":[]},{"StatusId":98,"Top":10,"Left":310,"Transitions":[]},{"StatusId":93,"Top":10,"Left":460,"Transitions":[]},{"StatusId":97,"Top":0,"Left":0,"Transitions":[{"StatusId":98,"Groups":[1]}]},{"StatusId":94,"Top":10,"Left":760,"Transitions":[]},{"StatusId":99,"Top":80,"Left":10,"Transitions":[]},{"StatusId":95,"Top":80,"Left":160,"Transitions":[{"StatusId":97,"Groups":[1]},{"StatusId":96,"Groups":[1]}]}]}'', '''', 13)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (72, 4, N''Change Request'', N''assets/images/meta/TRACKING/type-changerequest.png'', ''#e5f00e'', ''{"ReferenceId":82,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedComments","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Votes","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedHierarchy","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Votes","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedHistory","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedWatchers","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-10-19T09:17:22.398751Z","Revised":"2012-10-19T09:17:22.398751Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":82,"Status":[{"StatusId":100,"Top":10,"Left":10,"Transitions":[{"StatusId":96,"Groups":[1]},{"StatusId":95,"Groups":[1]}]},{"StatusId":96,"Top":10,"Left":160,"Transitions":[]},{"StatusId":98,"Top":10,"Left":310,"Transitions":[]},{"StatusId":93,"Top":10,"Left":460,"Transitions":[]},{"StatusId":97,"Top":0,"Left":0,"Transitions":[{"StatusId":98,"Groups":[1]}]},{"StatusId":94,"Top":10,"Left":760,"Transitions":[]},{"StatusId":99,"Top":80,"Left":10,"Transitions":[]},{"StatusId":95,"Top":80,"Left":160,"Transitions":[{"StatusId":97,"Groups":[1]},{"StatusId":96,"Groups":[1]}]}]}'', '''', 13)')
INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (73, 5, N'Task', N'assets/images/meta/TRACKING/type-task.png', '#746b9e', '{"ReferenceId":82,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedAttachments","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedComments","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedTime","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2012-10-19T09:17:24.8758927Z","Revised":"2012-10-19T09:17:24.8758927Z","Errors":[],"HasErrors":false,"Id":0}', '{"ReferenceId":82,"Status":[{"StatusId":100,"Top":10,"Left":10,"Transitions":[]},{"StatusId":96,"Top":0,"Left":0,"Transitions":[{"StatusId":98,"Groups":[1]},{"StatusId":95,"Groups":[1]},{"StatusId":97,"Groups":[1]}]},{"StatusId":98,"Top":10,"Left":310,"Transitions":[]},{"StatusId":93,"Top":10,"Left":460,"Transitions":[]},{"StatusId":97,"Top":0,"Left":0,"Transitions":[{"StatusId":98,"Groups":[1]}]},{"StatusId":94,"Top":10,"Left":760,"Transitions":[]},{"StatusId":99,"Top":9,"Left":0,"Transitions":[]},{"StatusId":95,"Top":80,"Left":160,"Transitions":[{"StatusId":96,"Groups":[1]}]}]}', '', 13)
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (82, 0, N''New Feature'', N''assets/images/meta/type-newfeature.png'', ''#ed974c'', ''{"ReferenceId":0,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"Votes","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"Votes","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"ReportedBy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"ResolvedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"CalculatedTimeExceeded","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"CalculatedTimeRemaining","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"Elapsed","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"Votes","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":27,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":28,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":29,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":30,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":31,"Label":"","Id":"18FE1D21-77G0-4067-8A10-F452FCB9D090","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":32,"Label":"","Id":"FA6EA42D-8D67-4763-86F5-E8745FBF3DC6","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":33,"Label":"","Id":"AssociatedHistory","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2013-08-02T09:59:03.78445Z","Revised":"2013-08-02T09:59:03.78445Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":0,"Status":[{"StatusId":96,"Top":128,"Left":54,"Transitions":[{"StatusId":97,"Groups":[1]}]},{"StatusId":98,"Top":477,"Left":497,"Transitions":[{"StatusId":99,"Groups":[1]}]},{"StatusId":97,"Top":297,"Left":259,"Transitions":[{"StatusId":98,"Groups":[1]}]},{"StatusId":99,"Top":126,"Left":673,"Transitions":[{"StatusId":95,"Groups":[1]},{"StatusId":97,"Groups":[1]}]},{"StatusId":95,"Top":35,"Left":273,"Transitions":[{"StatusId":96,"Groups":[1]},{"StatusId":97,"Groups":[1]}]}]}'', '''', 13)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (102, 6, N''Test Plan'', N''assets/images/meta/type-investigation.png'', ''#1f1c1f'', ''{"ReferenceId":0,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"EstimatedEffort","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"EstimatedEffort","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"ReportedBy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"ResolvedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"CalculatedTimeExceeded","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"CalculatedTimeRemaining","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"36","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"598B4999-4C31-427D-9BBC-C84AD954E55A","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"D8DECEB7-BA6D-4A3F-A4A7-C79A5A5585BA","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"EFEE5D50-7DF6-49C3-9D69-E7EFC1AFEF72","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AC93C4F9-B512-4A3D-8B37-BC3D5F83429D","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"AssociatedComments","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2013-11-20T16:54:29.2531715Z","Revised":"2013-11-20T16:54:29.2531715Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":55,"Status":[]}'', ''PLAN'', 10)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (103, 6, N''Test Case'', N''assets/images/meta/test-requirements.png'', ''#3546b8'', ''{"ReferenceId":0,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"33","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"34","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"35","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Source","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssociatedTime","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"33","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"34","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"35","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Source","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssociatedTime","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"33","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"Source","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"ResolvedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"36","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"34","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"35","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":27,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":28,"Label":"","Id":"AssociatedHistory","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":29,"Label":"","Id":"617F1435-C0AA-48E6-B6A9-2C1F756E02A6","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":30,"Label":"","Id":"15627A0F-5AD2-4D35-BF24-60D678F59354","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":31,"Label":"","Id":"ACE2F8B3-C724-444F-9B72-B8B2137DDA16","Type":2}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2013-11-21T11:09:33.7558262Z","Revised":"2013-11-21T11:09:33.7558262Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":55,"Status":[]}'', ''CASE'', 10)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (104, 6, N''Test Plan'', N''assets/images/meta/type-investigation.png'', ''#0a0a0a'', ''{"ReferenceId":0,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedComments","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"EstimatedEffort","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"ReportedBy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"ResolvedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"CalculatedTimeExceeded","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"CalculatedTimeRemaining","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"40","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"598B4999-4C31-427D-9BBC-C84AD954E55A","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"D8DECEB7-BA6D-4A3F-A4A7-C79A5A5585BA","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"EFEE5D50-7DF6-49C3-9D69-E7EFC1AFEF72","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AC93C4F9-B512-4A3D-8B37-BC3D5F83429D","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"AssociatedComments","Type":0}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2013-11-20T17:21:52.991188Z","Revised":"2013-11-20T17:21:52.991188Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":82,"Status":[]}'', ''PLAN'', 13)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (105, 6, N''Test Case'', N''assets/images/meta/test-requirements.png'', ''#3546b8'', ''{"ReferenceId":0,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"37","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"38","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"39","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Source","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssociatedTime","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"37","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"38","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"39","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Source","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssociatedTime","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"37","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AffectedVersions","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"Severity","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"Source","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"ResolvedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"40","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"38","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"39","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":27,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":28,"Label":"","Id":"AssociatedHistory","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":29,"Label":"","Id":"617F1435-C0AA-48E6-B6A9-2C1F756E02A6","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":30,"Label":"","Id":"15627A0F-5AD2-4D35-BF24-60D678F59354","Type":2},{"ProjectGroups":[1],"Required":false,"Sequence":31,"Label":"","Id":"ACE2F8B3-C724-444F-9B72-B8B2137DDA16","Type":2}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2013-11-21T11:09:47.966639Z","Revised":"2013-11-21T11:09:47.966639Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":82,"Status":[]}'', ''CASE'', 13)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (128, 1, N''Event'', N''assets/images/meta/ITIL/event-icon.png'', ''#e6e2f0'', ''{"ReferenceId":0,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"42","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"Visibility","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"42","Type":1}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"ReportedBy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"ResolvedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"CalculatedTimeExceeded","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"CalculatedTimeRemaining","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"42","Type":1},{"ProjectGroups":[2,9,10],"Required":false,"Sequence":22,"Label":"","Id":"SLA","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":27,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":28,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":29,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":30,"Label":"","Id":"AssociatedHistory","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":31,"Label":"","Id":"BCADBC94-44C0-4116-8008-5A57F26E6573","Type":2}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2014-04-11T14:53:10.0994571Z","Revised":"2014-04-11T14:53:10.0994571Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":0,"Status":[{"StatusId":182,"Top":15,"Left":84,"Transitions":[{"StatusId":183,"Groups":[1]},{"StatusId":187,"Groups":[1]}]},{"StatusId":183,"Top":15,"Left":340,"Transitions":[{"StatusId":184,"Groups":[1]},{"StatusId":182,"Groups":[1]}]},{"StatusId":184,"Top":182,"Left":527,"Transitions":[{"StatusId":185,"Groups":[1]},{"StatusId":183,"Groups":[1]}]},{"StatusId":185,"Top":410,"Left":532,"Transitions":[{"StatusId":186,"Groups":[1]},{"StatusId":184,"Groups":[1]}]},{"StatusId":186,"Top":412,"Left":139,"Transitions":[{"StatusId":187,"Groups":[1]},{"StatusId":185,"Groups":[1]}]},{"StatusId":187,"Top":255,"Left":97,"Transitions":[]}]}'', '''', 26)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (129, 2, N''Incident'', N''assets/images/meta/ITIL/incident-icon.png'', ''#e63212'', ''{"ReferenceId":0,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"42","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Visibility","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"42","Type":1}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"ReportedBy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"ResolvedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"CalculatedTimeExceeded","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"CalculatedTimeRemaining","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"42","Type":1},{"ProjectGroups":[2,9,10],"Required":false,"Sequence":24,"Label":"","Id":"SLA","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":27,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":28,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":29,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":30,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":31,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":32,"Label":"","Id":"AssociatedHistory","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":33,"Label":"","Id":"BCADBC94-44C0-4116-8008-5A57F26E6573","Type":2}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2014-04-11T14:52:58.4777924Z","Revised":"2014-04-11T14:52:58.4777924Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":128,"Status":[]}'', '''', 26)')
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (130, 3, N''Request'', N''assets/images/meta/ITIL/request-icon.png'', ''#2b9e38'', ''{"ReferenceId":129,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"42","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"Visibility","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"42","Type":1}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"Description","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"Points","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"StartDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedHierarchy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"EstimatedEffort","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"AssociatedLinks","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"FixedInVersion","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":17,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"Resolution","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"PercentComplete","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":23,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":24,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":25,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":26,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":27,"Label":"","Id":"ReportedBy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":28,"Label":"","Id":"ResolvedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":29,"Label":"","Id":"CalculatedTimeExceeded","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":30,"Label":"","Id":"CalculatedTimeRemaining","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":31,"Label":"","Id":"42","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":32,"Label":"","Id":"AssociatedHistory","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":33,"Label":"","Id":"BCADBC94-44C0-4116-8008-5A57F26E6573","Type":2}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2014-04-11T14:52:25.9939344Z","Revised":"2014-04-11T14:52:25.9939344Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":128,"Status":[]}'', '''', 26)')
INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (131, 4, N'Problem', N'assets/images/meta/ITIL/problem-icon.png', '#5e0915', '{"ReferenceId":129,"Create":[],"Edit":[],"View":[],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2014-04-11T14:52:25.9949345Z","Revised":"2014-04-11T14:52:25.9949345Z","Errors":[],"HasErrors":false,"Id":0}', '{"ReferenceId":128,"Status":[]}', '', 26)
EXEC(N'INSERT INTO [dbo].[gemini_issuetypes] ([typeid], [seq], [typedesc], [imagepath], [color], [screen], [workflow], [tag], [templateid]) VALUES (132, 5, N''Identity'', N''assets/images/meta/ITIL/identity-icon.png'', ''#1e289e'', ''{"ReferenceId":0,"Create":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"41","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"42","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"ReportedBy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"Visibility","Type":0}],"Edit":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"ReportedBy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"AssociatedTime","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"41","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"42","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"AssignedTo","Type":0}],"View":[{"ProjectGroups":[1],"Required":false,"Sequence":0,"Label":"","Id":"Type","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":1,"Label":"","Id":"Title","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":2,"Label":"","Id":"Component","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":3,"Label":"","Id":"DueDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":4,"Label":"","Id":"Priority","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":5,"Label":"","Id":"ReportedBy","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":6,"Label":"","Id":"Visibility","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":7,"Label":"","Id":"Status","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":8,"Label":"","Id":"AssignedTo","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":9,"Label":"","Id":"41","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":10,"Label":"","Id":"42","Type":1},{"ProjectGroups":[1],"Required":false,"Sequence":11,"Label":"","Id":"ClosedDate","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":12,"Label":"","Id":"DateRevised","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":13,"Label":"","Id":"DateCreated","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":14,"Label":"","Id":"Source","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":15,"Label":"","Id":"CalculatedTimeLogged","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":16,"Label":"","Id":"IssueKey","Type":0},{"ProjectGroups":[2,9,10],"Required":false,"Sequence":17,"Label":"","Id":"SLA","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":18,"Label":"","Id":"AssociatedAttachments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":19,"Label":"","Id":"AssociatedComments","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":20,"Label":"","Id":"AssociatedWatchers","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":21,"Label":"","Id":"AssociatedHistory","Type":0},{"ProjectGroups":[1],"Required":false,"Sequence":22,"Label":"","Id":"C8F0693D-129C-4D19-9865-9CED964F06AB","Type":2}],"IsNew":true,"IsExisting":false,"Active":true,"Archived":false,"Deleted":false,"Created":"2014-04-11T14:53:26.0503695Z","Revised":"2014-04-11T14:53:26.0503695Z","Errors":[],"HasErrors":false,"Id":0}'', ''{"ReferenceId":128,"Status":[]}'', '''', 26)')
SET IDENTITY_INSERT [dbo].[gemini_issuetypes] OFF

-- Add 8 rows to [dbo].[gemini_projectgroupmembership]
SET IDENTITY_INSERT [dbo].[gemini_projectgroupmembership] ON
INSERT INTO [dbo].[gemini_projectgroupmembership] ([projectgroupmembershipid], [projectid], [projectgroupid], [userid], [created]) VALUES (1, NULL, 1, -1, '2012-08-01T19:32:32.950')
INSERT INTO [dbo].[gemini_projectgroupmembership] ([projectgroupmembershipid], [projectid], [projectgroupid], [userid], [created]) VALUES (4, NULL, 1, 1, '2012-08-01T19:32:32.950')
INSERT INTO [dbo].[gemini_projectgroupmembership] ([projectgroupmembershipid], [projectid], [projectgroupid], [userid], [created]) VALUES (6, NULL, 2, 1, '2012-08-01T19:32:32.950')
INSERT INTO [dbo].[gemini_projectgroupmembership] ([projectgroupmembershipid], [projectid], [projectgroupid], [userid], [created]) VALUES (8, NULL, 3, 1, '2012-08-01T19:32:32.950')
INSERT INTO [dbo].[gemini_projectgroupmembership] ([projectgroupmembershipid], [projectid], [projectgroupid], [userid], [created]) VALUES (9, NULL, 7, 1, '2012-08-01T19:32:32.950')
INSERT INTO [dbo].[gemini_projectgroupmembership] ([projectgroupmembershipid], [projectid], [projectgroupid], [userid], [created]) VALUES (12, NULL, 9, 1, '2012-08-01T19:32:32.950')
INSERT INTO [dbo].[gemini_projectgroupmembership] ([projectgroupmembershipid], [projectid], [projectgroupid], [userid], [created]) VALUES (13, NULL, 10, 1, '2012-08-01T19:32:32.950')
INSERT INTO [dbo].[gemini_projectgroupmembership] ([projectgroupmembershipid], [projectid], [projectgroupid], [userid], [created]) VALUES (14, NULL, 2, -2, '2013-12-06T12:53:56.900')
SET IDENTITY_INSERT [dbo].[gemini_projectgroupmembership] OFF

-- Add constraints to [dbo].[gemini_projectgroupmembership]
ALTER TABLE [dbo].[gemini_projectgroupmembership] ADD CONSTRAINT [gemini_projectgroupmembership_projectgroupid] FOREIGN KEY ([projectgroupid]) REFERENCES [dbo].[gemini_projectgroups] ([projectgroupid])
ALTER TABLE [dbo].[gemini_projectgroupmembership] ADD CONSTRAINT [gemini_projectgroupmembership_projectid_fk] FOREIGN KEY ([projectid]) REFERENCES [dbo].[gemini_projects] ([projectid])
ALTER TABLE [dbo].[gemini_projectgroupmembership] ADD CONSTRAINT [gemini_projectgroupmembership_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraints to [dbo].[gemini_issuetypes]
ALTER TABLE [dbo].[gemini_issuetypes] ADD CONSTRAINT [gemini_issuetypes_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])

-- Add constraint gemini_issues_issuetypeid_fk to [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] WITH NOCHECK ADD CONSTRAINT [gemini_issues_issuetypeid_fk] FOREIGN KEY ([issuetypeid]) REFERENCES [dbo].[gemini_issuetypes] ([typeid])

-- Add constraints to [dbo].[gemini_issuetimetype]
ALTER TABLE [dbo].[gemini_issuetimetype] ADD CONSTRAINT [gemini_issuetimetype_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])

-- Add constraint gemini_testing_run_times_timetypeid_fk to [dbo].[gemini_testing_run_times]
ALTER TABLE [dbo].[gemini_testing_run_times] WITH NOCHECK ADD CONSTRAINT [gemini_testing_run_times_timetypeid_fk] FOREIGN KEY ([timetypeid]) REFERENCES [dbo].[gemini_issuetimetype] ([timetypeid])

-- Add constraint gemini_timetracking_timetypeid_fk to [dbo].[gemini_timetracking]
ALTER TABLE [dbo].[gemini_timetracking] WITH NOCHECK ADD CONSTRAINT [gemini_timetracking_timetypeid_fk] FOREIGN KEY ([timetypeid]) REFERENCES [dbo].[gemini_issuetimetype] ([timetypeid])

-- Add constraints to [dbo].[gemini_issuestatus]
ALTER TABLE [dbo].[gemini_issuestatus] ADD CONSTRAINT [gemini_issuestatus_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])

-- Add constraint gemini_issues_issuestatusid_fk to [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] WITH NOCHECK ADD CONSTRAINT [gemini_issues_issuestatusid_fk] FOREIGN KEY ([issuestatusid]) REFERENCES [dbo].[gemini_issuestatus] ([statusid])

-- Add constraints to [dbo].[gemini_issueseverity]
ALTER TABLE [dbo].[gemini_issueseverity] ADD CONSTRAINT [gemini_issueseverity_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])

-- Add constraint gemini_issues_issueseverityid_fk to [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] WITH NOCHECK ADD CONSTRAINT [gemini_issues_issueseverityid_fk] FOREIGN KEY ([issueseverityid]) REFERENCES [dbo].[gemini_issueseverity] ([severityid])

-- Add constraints to [dbo].[gemini_issueresolutions]
ALTER TABLE [dbo].[gemini_issueresolutions] ADD CONSTRAINT [gemini_issueresolutions_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])

-- Add constraint gemini_issues_issueresolutionid_fk to [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] WITH NOCHECK ADD CONSTRAINT [gemini_issues_issueresolutionid_fk] FOREIGN KEY ([issueresolutionid]) REFERENCES [dbo].[gemini_issueresolutions] ([resolutionid])

-- Add constraints to [dbo].[gemini_issuepriorities]
ALTER TABLE [dbo].[gemini_issuepriorities] ADD CONSTRAINT [gemini_issuepriorities_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])

-- Add constraint gemini_issues_issuepriorityid_fk to [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] WITH NOCHECK ADD CONSTRAINT [gemini_issues_issuepriorityid_fk] FOREIGN KEY ([issuepriorityid]) REFERENCES [dbo].[gemini_issuepriorities] ([priorityid])

-- Add constraints to [dbo].[gemini_issuelinktypes]
ALTER TABLE [dbo].[gemini_issuelinktypes] ADD CONSTRAINT [gemini_issuelinktypes_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])

-- Add constraint gemini_issuelinks_linktypeid_fk to [dbo].[gemini_issuelinks]
ALTER TABLE [dbo].[gemini_issuelinks] WITH NOCHECK ADD CONSTRAINT [gemini_issuelinks_linktypeid_fk] FOREIGN KEY ([linktypeid]) REFERENCES [dbo].[gemini_issuelinktypes] ([linktypeid])

-- Add constraints to [dbo].[gemini_customfielddefinitions]
ALTER TABLE [dbo].[gemini_customfielddefinitions] ADD CONSTRAINT [gemini_customfielddefinitions_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])

-- Add constraint gemini_customfielddata_customfieldid_fk to [dbo].[gemini_customfielddata]
ALTER TABLE [dbo].[gemini_customfielddata] WITH NOCHECK ADD CONSTRAINT [gemini_customfielddata_customfieldid_fk] FOREIGN KEY ([customfieldid]) REFERENCES [dbo].[gemini_customfielddefinitions] ([customfieldid])

-- Add constraint gemini_testing_customdata_customfieldid_fk to [dbo].[gemini_testing_customdata]
ALTER TABLE [dbo].[gemini_testing_customdata] WITH NOCHECK ADD CONSTRAINT [gemini_testing_customdata_customfieldid_fk] FOREIGN KEY ([customfieldid]) REFERENCES [dbo].[gemini_customfielddefinitions] ([customfieldid])

-- Add constraint gemini_appointments_userid_fk to [dbo].[gemini_appointments]
ALTER TABLE [dbo].[gemini_appointments] WITH NOCHECK ADD CONSTRAINT [gemini_appointments_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_chat_userid_fk to [dbo].[gemini_chat]
ALTER TABLE [dbo].[gemini_chat] WITH NOCHECK ADD CONSTRAINT [gemini_chat_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_components_userid_fk to [dbo].[gemini_components]
ALTER TABLE [dbo].[gemini_components] WITH NOCHECK ADD CONSTRAINT [gemini_components_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_customfielddata_userid_fk to [dbo].[gemini_customfielddata]
ALTER TABLE [dbo].[gemini_customfielddata] WITH NOCHECK ADD CONSTRAINT [gemini_customfielddata_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_issueaudit_userid_fk to [dbo].[gemini_issueaudit]
ALTER TABLE [dbo].[gemini_issueaudit] WITH NOCHECK ADD CONSTRAINT [gemini_issueaudit_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_issuecomments_userid_fk to [dbo].[gemini_issuecomments]
ALTER TABLE [dbo].[gemini_issuecomments] WITH NOCHECK ADD CONSTRAINT [gemini_issuecomments_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_issueresources_userid_fk to [dbo].[gemini_issueresources]
ALTER TABLE [dbo].[gemini_issueresources] WITH NOCHECK ADD CONSTRAINT [gemini_issueresources_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_issues_creator_fk to [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] WITH NOCHECK ADD CONSTRAINT [gemini_issues_creator_fk] FOREIGN KEY ([creator]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_issues_reportedby_fk to [dbo].[gemini_issues]
ALTER TABLE [dbo].[gemini_issues] WITH NOCHECK ADD CONSTRAINT [gemini_issues_reportedby_fk] FOREIGN KEY ([reportedby]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_issuevotes_userid_fk to [dbo].[gemini_issuevotes]
ALTER TABLE [dbo].[gemini_issuevotes] WITH NOCHECK ADD CONSTRAINT [gemini_issuevotes_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_navigationcard_userid_fk to [dbo].[gemini_navigationcard]
ALTER TABLE [dbo].[gemini_navigationcard] WITH NOCHECK ADD CONSTRAINT [gemini_navigationcard_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_optoutemails_userid_fk to [dbo].[gemini_optoutemails]
ALTER TABLE [dbo].[gemini_optoutemails] WITH NOCHECK ADD CONSTRAINT [gemini_optoutemails_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_plannerviews_userid_fk to [dbo].[gemini_plannerviews]
ALTER TABLE [dbo].[gemini_plannerviews] WITH NOCHECK ADD CONSTRAINT [gemini_plannerviews_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_projectaudit_userid_fk to [dbo].[gemini_projectaudit]
ALTER TABLE [dbo].[gemini_projectaudit] WITH NOCHECK ADD CONSTRAINT [gemini_projectaudit_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_projects_userid_fk to [dbo].[gemini_projects]
ALTER TABLE [dbo].[gemini_projects] WITH NOCHECK ADD CONSTRAINT [gemini_projects_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_sharedviews_userid_fk to [dbo].[gemini_sharedviews]
ALTER TABLE [dbo].[gemini_sharedviews] WITH NOCHECK ADD CONSTRAINT [gemini_sharedviews_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_testing_attachments_createdby_fk to [dbo].[gemini_testing_attachments]
ALTER TABLE [dbo].[gemini_testing_attachments] WITH NOCHECK ADD CONSTRAINT [gemini_testing_attachments_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_testing_case_issues_createdby_fk to [dbo].[gemini_testing_case_issues]
ALTER TABLE [dbo].[gemini_testing_case_issues] WITH NOCHECK ADD CONSTRAINT [gemini_testing_case_issues_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_testing_case_steps_createdby_fk to [dbo].[gemini_testing_case_steps]
ALTER TABLE [dbo].[gemini_testing_case_steps] WITH NOCHECK ADD CONSTRAINT [gemini_testing_case_steps_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_testing_cases_assignedto_fk to [dbo].[gemini_testing_cases]
ALTER TABLE [dbo].[gemini_testing_cases] WITH NOCHECK ADD CONSTRAINT [gemini_testing_cases_assignedto_fk] FOREIGN KEY ([assignedto]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_testing_cases_createdby_fk to [dbo].[gemini_testing_cases]
ALTER TABLE [dbo].[gemini_testing_cases] WITH NOCHECK ADD CONSTRAINT [gemini_testing_cases_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_testing_customdata_userid_fk to [dbo].[gemini_testing_customdata]
ALTER TABLE [dbo].[gemini_testing_customdata] WITH NOCHECK ADD CONSTRAINT [gemini_testing_customdata_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_testing_plan_cases_createdby_fk to [dbo].[gemini_testing_plan_cases]
ALTER TABLE [dbo].[gemini_testing_plan_cases] WITH NOCHECK ADD CONSTRAINT [gemini_testing_plan_cases_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_testing_plans_createdby_fk to [dbo].[gemini_testing_plans]
ALTER TABLE [dbo].[gemini_testing_plans] WITH NOCHECK ADD CONSTRAINT [gemini_testing_plans_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_testing_run_steps_createdby_fk to [dbo].[gemini_testing_run_steps]
ALTER TABLE [dbo].[gemini_testing_run_steps] WITH NOCHECK ADD CONSTRAINT [gemini_testing_run_steps_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_testing_run_times_userid_fk to [dbo].[gemini_testing_run_times]
ALTER TABLE [dbo].[gemini_testing_run_times] WITH NOCHECK ADD CONSTRAINT [gemini_testing_run_times_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_testing_runs_createdby_fk to [dbo].[gemini_testing_runs]
ALTER TABLE [dbo].[gemini_testing_runs] WITH NOCHECK ADD CONSTRAINT [gemini_testing_runs_createdby_fk] FOREIGN KEY ([createdby]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_timetracking_userid_fk to [dbo].[gemini_timetracking]
ALTER TABLE [dbo].[gemini_timetracking] WITH NOCHECK ADD CONSTRAINT [gemini_timetracking_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_userissuesviews_userid_fk to [dbo].[gemini_userissuesviews]
ALTER TABLE [dbo].[gemini_userissuesviews] WITH NOCHECK ADD CONSTRAINT [gemini_userissuesviews_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_userwidgetdata_userid_fk to [dbo].[gemini_userwidgetdata]
ALTER TABLE [dbo].[gemini_userwidgetdata] WITH NOCHECK ADD CONSTRAINT [gemini_userwidgetdata_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_watchissues_userid_fk to [dbo].[gemini_watchissues]
ALTER TABLE [dbo].[gemini_watchissues] WITH NOCHECK ADD CONSTRAINT [gemini_watchissues_userid_fk] FOREIGN KEY ([userid]) REFERENCES [dbo].[gemini_users] ([userid])

-- Add constraint gemini_testing_cases_typeid_fk to [dbo].[gemini_testing_cases]
ALTER TABLE [dbo].[gemini_testing_cases] WITH NOCHECK ADD CONSTRAINT [gemini_testing_cases_typeid_fk] FOREIGN KEY ([typeid]) REFERENCES [dbo].[gemini_testing_types] ([typeid])

-- Add constraint gemini_projects_templateid_fk to [dbo].[gemini_projects]
ALTER TABLE [dbo].[gemini_projects] WITH NOCHECK ADD CONSTRAINT [gemini_projects_templateid_fk] FOREIGN KEY ([templateid]) REFERENCES [dbo].[gemini_projecttemplate] ([templateid])

-- Add constraint gemini_admappings_projectgroups_fk to [dbo].[gemini_admappings]
ALTER TABLE [dbo].[gemini_admappings] WITH NOCHECK ADD CONSTRAINT [gemini_admappings_projectgroups_fk] FOREIGN KEY ([projectgroupid]) REFERENCES [dbo].[gemini_projectgroups] ([projectgroupid])

-- Add constraint breeze_enquiry_alerttemplateid_fk to [dbo].[breeze_enquiry]
ALTER TABLE [dbo].[breeze_enquiry] WITH NOCHECK ADD CONSTRAINT [breeze_enquiry_alerttemplateid_fk] FOREIGN KEY ([alerttemplateid]) REFERENCES [dbo].[gemini_alerttemplates] ([alerttemplateid])

-- Add constraint breeze_mailbox_alerttemplateid_fk to [dbo].[breeze_mailbox]
ALTER TABLE [dbo].[breeze_mailbox] WITH NOCHECK ADD CONSTRAINT [breeze_mailbox_alerttemplateid_fk] FOREIGN KEY ([alerttemplateid]) REFERENCES [dbo].[gemini_alerttemplates] ([alerttemplateid])
COMMIT TRANSACTION
GO
