/*------------------------------------------------------------------------------------------------*/
/* System - Category                                                                              */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/

create database STOREID_SYS
go


use STOREID_SYS
go


CREATE TABLE [USR_CAT_CATEGORY]
(
    [AUTOADD] [int]           CONSTRAINT [DF_USR_CAT_CATEGORYAUTOADD] DEFAULT ((0)),
    [CODE]    [varchar] (255),
    [ID]      [int]           CONSTRAINT [DF_USR_CAT_CATEGORYID] DEFAULT ((0)) NOT  NULL,
    [NAME]    [varchar] (255)
)
GO

ALTER TABLE [USR_CAT_CATEGORY] WITH NOCHECK ADD CONSTRAINT [PK_USR_CAT_CATEGORY] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - CategorySuperUsers                                                                    */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [USR_CAT_CATEGORYSUPERUSERS]
(
    [USERID] [int]  CONSTRAINT [DF_USR_CAT_CATEGORYSUPERUSERSUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [USR_CAT_CATEGORYSUPERUSERS] WITH NOCHECK ADD CONSTRAINT [PK_USR_CAT_CATEGORYSUPERUSERS] PRIMARY KEY CLUSTERED 
(
    [USERID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - CategoryUsers                                                                         */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [USR_CAT_CATEGORYUSERS]
(
    [CATEGORYID] [int]  CONSTRAINT [DF_USR_CAT_CATEGORYUSERSCATEGORYID] DEFAULT ((0)) NOT  NULL,
    [USERID]     [int]  CONSTRAINT [DF_USR_CAT_CATEGORYUSERSUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [USR_CAT_CATEGORYUSERS] WITH NOCHECK ADD CONSTRAINT [PK_USR_CAT_CATEGORYUSERS] PRIMARY KEY CLUSTERED 
(
    [CATEGORYID],
    [USERID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ColumnSettings                                                                        */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_COLUMNSETTINGS]
(
    [ID]    [int]           CONSTRAINT [DF_SYS_MYS_COLUMNSETTINGSID] DEFAULT ((0)) NOT  NULL,
    [NAME]  [varchar] (255),
    [OWNER] [int]           CONSTRAINT [DF_SYS_MYS_COLUMNSETTINGSOWNER] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_MYS_COLUMNSETTINGS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_COLUMNSETTINGS] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ContentReceiver                                                                       */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [USR_CR_CONTENTRECVR]
(
    [TYPE]         [varchar] (50) ,
    [DESCRIPTIONA] [varchar] (255),
    [DESCRIPTIONB] [varchar] (255),
    [DESCRIPTIONC] [varchar] (255),
    [DESCRIPTIOND] [varchar] (255),
    [DESCRIPTIONE] [varchar] (255),
    [EMAIL]        [varchar] (255),
    [FTPFOLDER]    [varchar] (255),
    [FTPPASSWORD]  [varchar] (255),
    [FTPSERVER]    [varchar] (255),
    [FTPUSERNAME]  [varchar] (50) ,
    [ID]           [int]           CONSTRAINT [DF_USR_CR_CONTENTRECVRID] DEFAULT ((0)) NOT  NULL,
    [NAME]         [varchar] (255)
)
GO

ALTER TABLE [USR_CR_CONTENTRECVR] WITH NOCHECK ADD CONSTRAINT [PK_USR_CR_CONTENTRECVR] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ContentReceiverCategory                                                               */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [USR_CR_CONTENTRECVRCATEGORY]
(
    [CATEGORYID]        [int]  CONSTRAINT [DF_USR_CR_CONTENTRECVRCATEGORYCATEGORYID] DEFAULT ((0)) NOT  NULL,
    [CONTENTRECEIVERID] [int]  CONSTRAINT [DF_USR_CR_CONTENTRECVRCATEGORYCONTENTRECEIVERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [USR_CR_CONTENTRECVRCATEGORY] WITH NOCHECK ADD CONSTRAINT [PK_USR_CR_CONTENTRECVRCATEGORY] PRIMARY KEY CLUSTERED 
(
    [CONTENTRECEIVERID],
    [CATEGORYID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ContentReceiverPlanograms                                                             */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [USR_CR_CONTENTRECVRPLANOGRAMS]
(
    [CONTENTRECEIVERID] [int]  CONSTRAINT [DF_USR_CR_CONTENTRECVRPLANOGRAMSCONTENTRECEIVERID] DEFAULT ((0)) NOT  NULL,
    [PLANOCONTAINERID]  [int]  CONSTRAINT [DF_USR_CR_CONTENTRECVRPLANOGRAMSPLANOCONTAINERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [USR_CR_CONTENTRECVRPLANOGRAMS] WITH NOCHECK ADD CONSTRAINT [PK_USR_CR_CONTENTRECVRPLANOGRAMS] PRIMARY KEY CLUSTERED 
(
    [CONTENTRECEIVERID],
    [PLANOCONTAINERID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - CRCategoryCleanup                                                                     */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_CRCATEGORYCLEANUP]
(
    [MODULENAME]    [varchar] (255),
    [SECTIONNUMBER] [int]           CONSTRAINT [DF_SYS_MYS_CRCATEGORYCLEANUPSECTIONNUMBER] DEFAULT ((0)) NOT  NULL,
    [SQLSECTION]    [varchar] (255),
    [STEPNUMBER]    [int]           CONSTRAINT [DF_SYS_MYS_CRCATEGORYCLEANUPSTEPNUMBER] DEFAULT ((0)) NOT  NULL
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - CRCategoryTableNames                                                                  */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_CRCATEGORYTABLENAMES]
(
    [CATEGORYFIELDNAME] [varchar] (255),
    [CRFIELDNAME]       [varchar] (255),
    [DSN_ID]            [int]           CONSTRAINT [DF_SYS_MYS_CRCATEGORYTABLENAMESDSN_ID] DEFAULT ((0)) NOT  NULL,
    [TABLENAME]         [varchar] (255)
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - CRCategoryUsage                                                                       */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_CRCATEGORYUSAGE]
(
    [MODULECONDITIONS] [varchar] (255),
    [MODULEKEYS]       [varchar] (255),
    [MODULENAME]       [varchar] (255),
    [MODULETABLES]     [varchar] (255)
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - DSNs                                                                                  */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_DSNS]
(
    [DSN_ID] [int]          CONSTRAINT [DF_SYS_MYS_DSNSDSN_ID] DEFAULT ((0)) NOT  NULL,
    [NAME]   [varchar] (50)
)
GO

ALTER TABLE [SYS_MYS_DSNS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_DSNS] PRIMARY KEY CLUSTERED 
(
    [DSN_ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - Event                                                                                 */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_EVENT]
(
    [EXECUTEDUSERID] [int]           CONSTRAINT [DF_SYS_MYS_EVENTEXECUTEDUSERID] DEFAULT ((0)),
    [ID]             [int]           CONSTRAINT [DF_SYS_MYS_EVENTID] DEFAULT ((0)) NOT  NULL,
    [OBJECTID]       [int]           CONSTRAINT [DF_SYS_MYS_EVENTOBJECTID] DEFAULT ((0)),
    [OBJECTOWNER]    [varchar] (255),
    [EVENTTIME]      [binary] (8)   ,
    [TYPE]           [int]           CONSTRAINT [DF_SYS_MYS_EVENTTYPE] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_MYS_EVENT] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_EVENT] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ExcelTemplateFile                                                                     */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_EXCELTEMPLATES]
(
    [DESCRIPTION]    [varchar] (255),
    [TEMPLATEGROUP]  [varchar] (150),
    [ICON]           [varchar] (255),
    [ID]             [int]           CONSTRAINT [DF_SYS_OTP_EXCELTEMPLATESID] DEFAULT ((0)) NOT  NULL,
    [MAXSELECTION]   [int]           CONSTRAINT [DF_SYS_OTP_EXCELTEMPLATESMAXSELECTION] DEFAULT ((0)),
    [MINSELECTION]   [int]           CONSTRAINT [DF_SYS_OTP_EXCELTEMPLATESMINSELECTION] DEFAULT ((0)),
    [MODIFIEDDATE]   [binary] (8)   ,
    [MODIFIEDUSERID] [int]           CONSTRAINT [DF_SYS_OTP_EXCELTEMPLATESMODIFIEDUSERID] DEFAULT ((0)),
    [NAME]           [varchar] (255),
    [QUESTION]       [varchar] (255),
    [URI]            [varchar] (255)
)
GO

ALTER TABLE [SYS_OTP_EXCELTEMPLATES] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_EXCELTEMPLATES] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - expression                                                                            */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_EXPRESSIONS]
(
    [FILTERID]        [int]          CONSTRAINT [DF_SYS_MYS_EXPRESSIONSFILTERID] DEFAULT ((0)),
    [EXPRESSIONID]    [int]          CONSTRAINT [DF_SYS_MYS_EXPRESSIONSEXPRESSIONID] DEFAULT ((0)) NOT  NULL,
    [LHSEXPRESSIONID] [int]          CONSTRAINT [DF_SYS_MYS_EXPRESSIONSLHSEXPRESSIONID] DEFAULT ((0)),
    [LHSFIELD]        [varchar] (50),
    [LHSOBJECTNAME]   [varchar] (50),
    [LHSTYPE]         [int]          CONSTRAINT [DF_SYS_MYS_EXPRESSIONSLHSTYPE] DEFAULT ((0)),
    [LHSVALUE]        [varchar] (50),
    [OPERATOR]        [int]          CONSTRAINT [DF_SYS_MYS_EXPRESSIONSOPERATOR] DEFAULT ((0)),
    [RHSEXPRESSIONID] [int]          CONSTRAINT [DF_SYS_MYS_EXPRESSIONSRHSEXPRESSIONID] DEFAULT ((0)),
    [RHSFIELD]        [varchar] (50),
    [RHSOBJECTNAME]   [varchar] (50),
    [RHSTYPE]         [int]          CONSTRAINT [DF_SYS_MYS_EXPRESSIONSRHSTYPE] DEFAULT ((0)),
    [RHSVALUE]        [varchar] (50)
)
GO

ALTER TABLE [SYS_MYS_EXPRESSIONS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_EXPRESSIONS] PRIMARY KEY CLUSTERED 
(
    [EXPRESSIONID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - filter                                                                                */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_FILTERS]
(
    [EXPRESSIONID] [int]          CONSTRAINT [DF_SYS_MYS_FILTERSEXPRESSIONID] DEFAULT ((0)),
    [FILTERID]     [int]          CONSTRAINT [DF_SYS_MYS_FILTERSFILTERID] DEFAULT ((0)) NOT  NULL,
    [NAME]         [varchar] (50)
)
GO

ALTER TABLE [SYS_MYS_FILTERS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_FILTERS] PRIMARY KEY CLUSTERED 
(
    [FILTERID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - filterobjects                                                                         */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_FILTEROBJECTS]
(
    [FILTERID] [int]          CONSTRAINT [DF_SYS_MYS_FILTEROBJECTSFILTERID] DEFAULT ((0)) NOT  NULL,
    [OBJECT]   [varchar] (50) NOT  NULL
)
GO

ALTER TABLE [SYS_MYS_FILTEROBJECTS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_FILTEROBJECTS] PRIMARY KEY CLUSTERED 
(
    [FILTERID],
    [OBJECT]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - GridColumnInfo                                                                        */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_GRIDCOLUMNINFO]
(
    [FIELDNAME]   [varchar] (255),
    [OBJECTNAME]  [varchar] (255),
    [ORDINAL]     [int]           CONSTRAINT [DF_SYS_MYS_GRIDCOLUMNINFOORDINAL] DEFAULT ((0)),
    [SETTINGSID]  [int]           CONSTRAINT [DF_SYS_MYS_GRIDCOLUMNINFOSETTINGSID] DEFAULT ((0)),
    [SORTORDER]   [int]           CONSTRAINT [DF_SYS_MYS_GRIDCOLUMNINFOSORTORDER] DEFAULT ((0)),
    [SORTORDINAL] [int]           CONSTRAINT [DF_SYS_MYS_GRIDCOLUMNINFOSORTORDINAL] DEFAULT ((0)),
    [VISIBLE]     [int]           CONSTRAINT [DF_SYS_MYS_GRIDCOLUMNINFOVISIBLE] DEFAULT ((0)),
    [WIDTH]       [int]           CONSTRAINT [DF_SYS_MYS_GRIDCOLUMNINFOWIDTH] DEFAULT ((0))
)
GO

CREATE  NONCLUSTERED INDEX [IDX_SYS_MYS_GRIDCOLUMNINFO] ON [SYS_MYS_GRIDCOLUMNINFO]
(
    [SETTINGSID] ASC
)
GO

CREATE  NONCLUSTERED INDEX [IDX_SYS_MYS_GRIDCOLUMNINFO1] ON [SYS_MYS_GRIDCOLUMNINFO]
(
    [OBJECTNAME] ASC
)
GO

CREATE  NONCLUSTERED INDEX [IDX_SYS_MYS_GRIDCOLUMNINFO2] ON [SYS_MYS_GRIDCOLUMNINFO]
(
    [FIELDNAME] ASC
)
GO



/*------------------------------------------------------------------------------------------------*/
/* System - ObjectDeleteProcedures                                                                */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_OBJECTDELETEPROCEDURES]
(
    [MODULENAME]    [varchar] (255) NOT  NULL,
    [OBJECTTYPE_ID] [int]           CONSTRAINT [DF_SYS_MYS_OBJECTDELETEPROCEDURESOBJECTTYPE_ID] DEFAULT ((0)) NOT  NULL,
    [SECTIONNUMBER] [int]           CONSTRAINT [DF_SYS_MYS_OBJECTDELETEPROCEDURESSECTIONNUMBER] DEFAULT ((0)) NOT  NULL,
    [SQLSECTION]    [varchar] (255),
    [STEPNUMBER]    [int]           CONSTRAINT [DF_SYS_MYS_OBJECTDELETEPROCEDURESSTEPNUMBER] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_MYS_OBJECTDELETEPROCEDURES] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_OBJECTDELETEPROCEDURES] PRIMARY KEY CLUSTERED 
(
    [OBJECTTYPE_ID],
    [MODULENAME],
    [STEPNUMBER],
    [SECTIONNUMBER]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ObjectDeleteTable                                                                     */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_OBJECTDELETETABLE]
(
    [MODULECONDITIONS] [varchar] (255),
    [MODULEKEYS]       [varchar] (255),
    [MODULENAME]       [varchar] (255),
    [MODULETABLES]     [varchar] (255),
    [OBJECTTYPE_ID]    [int]           CONSTRAINT [DF_SYS_MYS_OBJECTDELETETABLEOBJECTTYPE_ID] DEFAULT ((0))
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ObjectDeleteVersion                                                                   */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_OBJECTDELETEVERSION]
(
    [MODULENAME]    [varchar] (255) NOT  NULL,
    [VERSIONNUMBER] [int]           CONSTRAINT [DF_SYS_MYS_OBJECTDELETEVERSIONVERSIONNUMBER] DEFAULT ((0)),
    [VERSIONTYPE]   [int]           CONSTRAINT [DF_SYS_MYS_OBJECTDELETEVERSIONVERSIONTYPE] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_MYS_OBJECTDELETEVERSION] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_OBJECTDELETEVERSION] PRIMARY KEY CLUSTERED 
(
    [MODULENAME],
    [VERSIONTYPE]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ObjectInfo                                                                            */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_OBJECTINFO]
(
    [OBJECTNAME]    [varchar] (50),
    [OBJECTTYPE_ID] [int]          CONSTRAINT [DF_SYS_MYS_OBJECTINFOOBJECTTYPE_ID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_MYS_OBJECTINFO] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_OBJECTINFO] PRIMARY KEY CLUSTERED 
(
    [OBJECTTYPE_ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ObjectKeys                                                                            */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_OBJECTKEYS]
(
    [DSN_ID]        [int]          CONSTRAINT [DF_SYS_MYS_OBJECTKEYSDSN_ID] DEFAULT ((0)) NOT  NULL,
    [KEYFIELDNAME]  [varchar] (50) NOT  NULL,
    [OBJECTTYPE_ID] [int]          CONSTRAINT [DF_SYS_MYS_OBJECTKEYSOBJECTTYPE_ID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_MYS_OBJECTKEYS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_OBJECTKEYS] PRIMARY KEY CLUSTERED 
(
    [OBJECTTYPE_ID],
    [DSN_ID],
    [KEYFIELDNAME]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ObjectTableNames                                                                      */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_OBJECTTABLENAMES]
(
    [DSN_ID]        [int]          CONSTRAINT [DF_SYS_MYS_OBJECTTABLENAMESDSN_ID] DEFAULT ((0)) NOT  NULL,
    [OBJECTTYPE_ID] [int]          CONSTRAINT [DF_SYS_MYS_OBJECTTABLENAMESOBJECTTYPE_ID] DEFAULT ((0)) NOT  NULL,
    [TABLENAME]     [varchar] (50)
)
GO

ALTER TABLE [SYS_MYS_OBJECTTABLENAMES] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_OBJECTTABLENAMES] PRIMARY KEY CLUSTERED 
(
    [OBJECTTYPE_ID],
    [DSN_ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - OverlayGroups                                                                         */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_OVERLAYGROUPS]
(
    [ID]       [int]           CONSTRAINT [DF_SYS_MYS_OVERLAYGROUPSID] DEFAULT ((0)) NOT  NULL,
    [NAME]     [varchar] (255) NOT  NULL,
    [PRIORITY] [int]           CONSTRAINT [DF_SYS_MYS_OVERLAYGROUPSPRIORITY] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_MYS_OVERLAYGROUPS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_OVERLAYGROUPS] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - Overlays                                                                              */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_OVERLAYS]
(
    [GROUPID]      [int]            CONSTRAINT [DF_SYS_MYS_OVERLAYSGROUPID] DEFAULT ((0)),
    [LANGUAGECODE] [varchar] (10)   NOT  NULL,
    [LANGUAGEFILE] [varchar] (255)  NOT  NULL,
    [NAMESPACE]    [varchar] (255) ,
    [OBJECT]       [varchar] (255)  NOT  NULL,
    [OVERLAY]      [varchar] (1000),
    [TRANSLATION]  [varchar] (255)  NOT  NULL
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - Peg                                                                                   */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_PEG]
(
    [HEADROOM]    [float]        CONSTRAINT [DF_SYS_MYS_PEGHEADROOM] DEFAULT ((0)),
    [ID]          [varchar] (50) NOT  NULL,
    [LENGTH]      [float]        CONSTRAINT [DF_SYS_MYS_PEGLENGTH] DEFAULT ((0)),
    [RISE]        [float]        CONSTRAINT [DF_SYS_MYS_PEGRISE] DEFAULT ((0)),
    [SPAN]        [int]          CONSTRAINT [DF_SYS_MYS_PEGSPAN] DEFAULT ((0)),
    [TAGHEIGHT]   [float]        CONSTRAINT [DF_SYS_MYS_PEGTAGHEIGHT] DEFAULT ((0)),
    [TAGLOCDOWN]  [float]        CONSTRAINT [DF_SYS_MYS_PEGTAGLOCDOWN] DEFAULT ((0)),
    [TAGLOCRIGHT] [float]        CONSTRAINT [DF_SYS_MYS_PEGTAGLOCRIGHT] DEFAULT ((0)),
    [TAGWIDTH]    [float]        CONSTRAINT [DF_SYS_MYS_PEGTAGWIDTH] DEFAULT ((0))
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - PlanoContainer                                                                        */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_PLANOCONTAINER]
(
    [CATEGORYID]   [int]          CONSTRAINT [DF_SYS_MYS_PLANOCONTAINERCATEGORYID] DEFAULT ((0)),
    [CONTAINERID]  [int]          CONSTRAINT [DF_SYS_MYS_PLANOCONTAINERCONTAINERID] DEFAULT ((0)) NOT  NULL,
    [DBIDENTIFIER] [varchar] (50),
    [PLANOGRAMID]  [varchar] (50),
    [PLANOID]      [int]          CONSTRAINT [DF_SYS_MYS_PLANOCONTAINERPLANOID] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_MYS_PLANOCONTAINER] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_PLANOCONTAINER] PRIMARY KEY CLUSTERED 
(
    [CONTAINERID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - PlanoKeyCache                                                                         */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_PLANOKEYCACHE]
(
    [DBIDENTIFIER] [varchar] (50) ,
    [PLANOGRAMID]  [varchar] (255),
    [KEY_ID]       [int]           CONSTRAINT [DF_SYS_MYS_PLANOKEYCACHEKEY_ID] DEFAULT ((0)),
    [STRING1]      [varchar] (255),
    [STRING10]     [varchar] (255),
    [STRING11]     [varchar] (255),
    [STRING12]     [varchar] (255),
    [STRING13]     [varchar] (255),
    [STRING14]     [varchar] (255),
    [STRING15]     [varchar] (255),
    [STRING16]     [varchar] (255),
    [STRING17]     [varchar] (255),
    [STRING18]     [varchar] (255),
    [STRING19]     [varchar] (255),
    [STRING2]      [varchar] (255),
    [STRING20]     [varchar] (255),
    [STRING21]     [varchar] (255),
    [STRING22]     [varchar] (255),
    [STRING23]     [varchar] (255),
    [STRING24]     [varchar] (255),
    [STRING25]     [varchar] (255),
    [STRING3]      [varchar] (255),
    [STRING4]      [varchar] (255),
    [STRING5]      [varchar] (255),
    [STRING6]      [varchar] (255),
    [STRING7]      [varchar] (255),
    [STRING8]      [varchar] (255),
    [STRING9]      [varchar] (255)
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - PlanoKeyCacheColumns                                                                  */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_PLANOKEYCACHECOLUMNS]
(
    [COLUMNNAME]   [varchar] (50) NOT  NULL,
    [DBIDENTIFIER] [varchar] (50) NOT  NULL,
    [ORDINAL]      [int]          CONSTRAINT [DF_SYS_MYS_PLANOKEYCACHECOLUMNSORDINAL] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_MYS_PLANOKEYCACHECOLUMNS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_PLANOKEYCACHECOLUMNS] PRIMARY KEY CLUSTERED 
(
    [DBIDENTIFIER],
    [COLUMNNAME]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - PlanoTemplateFile                                                                     */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_PLANOGRAMTEMPLATES]
(
    [DESCRIPTION]    [varchar] (255),
    [TEMPLATEGROUP]  [varchar] (150),
    [ICON]           [varchar] (255),
    [ID]             [int]           CONSTRAINT [DF_SYS_OTP_PLANOGRAMTEMPLATESID] DEFAULT ((0)) NOT  NULL,
    [MODIFIEDDATE]   [binary] (8)   ,
    [MODIFIEDUSERID] [int]           CONSTRAINT [DF_SYS_OTP_PLANOGRAMTEMPLATESMODIFIEDUSERID] DEFAULT ((0)),
    [NAME]           [varchar] (255),
    [QUESTION]       [varchar] (255),
    [URI]            [varchar] (255)
)
GO

ALTER TABLE [SYS_OTP_PLANOGRAMTEMPLATES] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_PLANOGRAMTEMPLATES] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - PublishingFile                                                                        */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_FILE]
(
    [TEMPLATEGROUP]  [varchar] (150),
    [ID]             [int]           CONSTRAINT [DF_SYS_PUB_FILEID] DEFAULT ((0)) NOT  NULL,
    [MODIFIEDDATE]   [binary] (8)   ,
    [MODIFIEDUSERID] [int]           CONSTRAINT [DF_SYS_PUB_FILEMODIFIEDUSERID] DEFAULT ((0)),
    [NAME]           [varchar] (255),
    [URI]            [varchar] (255)
)
GO

ALTER TABLE [SYS_PUB_FILE] WITH NOCHECK ADD CONSTRAINT [PK_SYS_PUB_FILE] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ReportGroupOrderSettings                                                              */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_RPT_GROUPORDERSETTINGS]
(
    [ORDINAL]       [int]           CONSTRAINT [DF_SYS_RPT_GROUPORDERSETTINGSORDINAL] DEFAULT ((0)) NOT  NULL,
    [TEMPLATEGROUP] [varchar] (150) NOT  NULL,
    [USERID]        [int]           CONSTRAINT [DF_SYS_RPT_GROUPORDERSETTINGSUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_RPT_GROUPORDERSETTINGS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_RPT_GROUPORDERSETTINGS] PRIMARY KEY CLUSTERED 
(
    [USERID],
    [TEMPLATEGROUP],
    [ORDINAL]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ReportInfo                                                                            */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_RPT_REPORTINFO]
(
    [FILENAME]        [varchar] (255),
    [ID]              [int]           CONSTRAINT [DF_SYS_RPT_REPORTINFOID] DEFAULT ((0)) NOT  NULL,
    [TEMPLATEID]      [int]           CONSTRAINT [DF_SYS_RPT_REPORTINFOTEMPLATEID] DEFAULT ((0)),
    [REPORTTIMESTAMP] [binary] (8)   ,
    [TYPE]            [int]           CONSTRAINT [DF_SYS_RPT_REPORTINFOTYPE] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_RPT_REPORTINFO] WITH NOCHECK ADD CONSTRAINT [PK_SYS_RPT_REPORTINFO] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ReportOrderSettings                                                                   */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_RPT_REPORTORDERSETTINGS]
(
    [ORDINAL]       [int]           CONSTRAINT [DF_SYS_RPT_REPORTORDERSETTINGSORDINAL] DEFAULT ((0)) NOT  NULL,
    [REPORTNAME]    [varchar] (255) NOT  NULL,
    [TEMPLATEGROUP] [varchar] (150) NOT  NULL,
    [USERID]        [int]           CONSTRAINT [DF_SYS_RPT_REPORTORDERSETTINGSUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_RPT_REPORTORDERSETTINGS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_RPT_REPORTORDERSETTINGS] PRIMARY KEY CLUSTERED 
(
    [USERID],
    [TEMPLATEGROUP],
    [REPORTNAME],
    [ORDINAL]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - ReportPlanogramInfo                                                                   */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_RPT_REPORTPLANOGRAMINFO]
(
    [MODIFIEDDATE]     [binary] (8) ,
    [ORDINAL]          [int]         CONSTRAINT [DF_SYS_RPT_REPORTPLANOGRAMINFOORDINAL] DEFAULT ((0)) NOT  NULL,
    [PLANOCONTAINERID] [int]         CONSTRAINT [DF_SYS_RPT_REPORTPLANOGRAMINFOPLANOCONTAINERID] DEFAULT ((0)),
    [REPORTINFOID]     [int]         CONSTRAINT [DF_SYS_RPT_REPORTPLANOGRAMINFOREPORTINFOID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_RPT_REPORTPLANOGRAMINFO] WITH NOCHECK ADD CONSTRAINT [PK_SYS_RPT_REPORTPLANOGRAMINFO] PRIMARY KEY CLUSTERED 
(
    [REPORTINFOID],
    [ORDINAL]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - rolepermissions                                                                       */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_ROLEPERMISSIONS]
(
    [PERMISSION] [varchar] (255) NOT  NULL,
    [ROLEID]     [int]           CONSTRAINT [DF_SYS_MYS_ROLEPERMISSIONSROLEID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_MYS_ROLEPERMISSIONS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_ROLEPERMISSIONS] PRIMARY KEY CLUSTERED 
(
    [ROLEID],
    [PERMISSION]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - roles                                                                                 */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_ROLELIST]
(
    [DISPLAYNAME]   [varchar] (50) ,
    [ROLEID]        [int]           CONSTRAINT [DF_SYS_MYS_ROLELISTROLEID] DEFAULT ((0)) NOT  NULL,
    [NAME]          [varchar] (50) ,
    [PERMISSIONKEY] [varchar] (255)
)
GO

ALTER TABLE [SYS_MYS_ROLELIST] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_ROLELIST] PRIMARY KEY CLUSTERED 
(
    [ROLEID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - UserAdmin                                                                             */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_USERACTIVITY]
(
    [LOGINTIME] [binary] (8)  ,
    [MACHINEID] [varchar] (50) NOT  NULL,
    [USERID]    [int]          CONSTRAINT [DF_SYS_MYS_USERACTIVITYUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_MYS_USERACTIVITY] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_USERACTIVITY] PRIMARY KEY CLUSTERED 
(
    [USERID],
    [MACHINEID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - UserEvent                                                                             */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_USEREVENT]
(
    [EVENTID] [int]  CONSTRAINT [DF_SYS_MYS_USEREVENTEVENTID] DEFAULT ((0)) NOT  NULL,
    [USERID]  [int]  CONSTRAINT [DF_SYS_MYS_USEREVENTUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_MYS_USEREVENT] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_USEREVENT] PRIMARY KEY CLUSTERED 
(
    [USERID],
    [EVENTID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - UserNotificationList                                                                  */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_USERNOTIFICATIONLIST]
(
    [OBJECTID]    [int]           CONSTRAINT [DF_SYS_MYS_USERNOTIFICATIONLISTOBJECTID] DEFAULT ((0)) NOT  NULL,
    [OBJECTOWNER] [varchar] (255) NOT  NULL,
    [TYPE]        [int]           CONSTRAINT [DF_SYS_MYS_USERNOTIFICATIONLISTTYPE] DEFAULT ((0)) NOT  NULL,
    [USERID]      [int]           CONSTRAINT [DF_SYS_MYS_USERNOTIFICATIONLISTUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_MYS_USERNOTIFICATIONLIST] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_USERNOTIFICATIONLIST] PRIMARY KEY CLUSTERED 
(
    [OBJECTOWNER],
    [OBJECTID],
    [USERID],
    [TYPE]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - userroles                                                                             */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_USERROLES]
(
    [ROLEID] [int]  CONSTRAINT [DF_SYS_MYS_USERROLESROLEID] DEFAULT ((0)) NOT  NULL,
    [USERID] [int]  CONSTRAINT [DF_SYS_MYS_USERROLESUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_MYS_USERROLES] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_USERROLES] PRIMARY KEY CLUSTERED 
(
    [USERID],
    [ROLEID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - users                                                                                 */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_USERS]
(
    [DISPLAYNAME]     [varchar] (255),
    [EMAIL]           [varchar] (50) ,
    [USERID]          [int]           CONSTRAINT [DF_SYS_MYS_USERSUSERID] DEFAULT ((0)) NOT  NULL,
    [NAME]            [varchar] (50) ,
    [PASSWORD]        [varchar] (255),
    [USEWINDOWSLOGON] [int]           CONSTRAINT [DF_SYS_MYS_USERSUSEWINDOWSLOGON] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_MYS_USERS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_USERS] PRIMARY KEY CLUSTERED 
(
    [USERID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - UserSettingKeys                                                                       */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_USERSETTINGKEYS]
(
    [KEYID] [int]           CONSTRAINT [DF_SYS_MYS_USERSETTINGKEYSKEYID] DEFAULT ((0)) NOT  NULL,
    [NAME]  [varchar] (255),
    [TYPE]  [int]           CONSTRAINT [DF_SYS_MYS_USERSETTINGKEYSTYPE] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_MYS_USERSETTINGKEYS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_USERSETTINGKEYS] PRIMARY KEY CLUSTERED 
(
    [KEYID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - UserSettingsInt                                                                       */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_USERSETTINGSINT]
(
    [KEYID]   [int]  CONSTRAINT [DF_SYS_MYS_USERSETTINGSINTKEYID] DEFAULT ((0)) NOT  NULL,
    [SETTING] [int]  CONSTRAINT [DF_SYS_MYS_USERSETTINGSINTSETTING] DEFAULT ((0)),
    [USERID]  [int]  CONSTRAINT [DF_SYS_MYS_USERSETTINGSINTUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_MYS_USERSETTINGSINT] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_USERSETTINGSINT] PRIMARY KEY CLUSTERED 
(
    [USERID],
    [KEYID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - UserSettingsString                                                                    */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_USERSETTINGSSTRING]
(
    [KEYID]   [int]           CONSTRAINT [DF_SYS_MYS_USERSETTINGSSTRINGKEYID] DEFAULT ((0)) NOT  NULL,
    [SETTING] [varchar] (255),
    [USERID]  [int]           CONSTRAINT [DF_SYS_MYS_USERSETTINGSSTRINGUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_MYS_USERSETTINGSSTRING] WITH NOCHECK ADD CONSTRAINT [PK_SYS_MYS_USERSETTINGSSTRING] PRIMARY KEY CLUSTERED 
(
    [USERID],
    [KEYID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* System - Version                                                                               */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_MYS_VERSION]
(
    [VERSION] [varchar] (50)
)
GO

INSERT INTO [SYS_MYS_VERSION] (VERSION) VALUES ('5.0')
GO


/*------------------------------------------------------------------------------------------------*/
/* System - Person                                                                                */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [USR_CR_PERSON]
(
    [ADDRESS1]     [varchar] (255),
    [ADDRESS2]     [varchar] (255),
    [ADDRESS3]     [varchar] (255),
    [ADDRESS4]     [varchar] (255),
    [COMPANY]      [varchar] (100),
    [DEPARTMENT]   [varchar] (100),
    [FIRSTNAME]    [varchar] (50) ,
    [ID]           [int]           CONSTRAINT [DF_USR_CR_PERSONID] DEFAULT ((0)) NOT  NULL,
    [LASTNAME]     [varchar] (50) ,
    [PHONE]        [varchar] (50) ,
    [REGION]       [varchar] (100),
    [TITLE]        [varchar] (100)
)
GO

ALTER TABLE [USR_CR_PERSON] WITH NOCHECK ADD CONSTRAINT [PK_USR_CR_PERSON] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO

CREATE  NONCLUSTERED INDEX [IDX_USR_CR_PERSON] ON [USR_CR_PERSON]
(
    [LASTNAME] ASC
)
GO

CREATE  NONCLUSTERED INDEX [IDX_USR_CR_PERSON1] ON [USR_CR_PERSON]
(
    [COMPANY] ASC
)
GO


ALTER TABLE [USR_CR_PERSON]  WITH  NOCHECK  ADD  CONSTRAINT [FK_USR_CR_PERSON] FOREIGN KEY ([ID]) REFERENCES [USR_CR_CONTENTRECVR] ([ID])
GO
ALTER TABLE [USR_CR_PERSON]  NOCHECK  CONSTRAINT [FK_USR_CR_PERSON]
GO


/*------------------------------------------------------------------------------------------------*/
/* System - Store                                                                                 */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [USR_CR_STORELIST]
(
    [ADDRESS1]     [varchar] (255),
    [ADDRESS2]     [varchar] (255),
    [ADDRESS3]     [varchar] (255),
    [ADDRESS4]     [varchar] (255),
    [BANNER]       [varchar] (255),
    [STORECLUSTER] [varchar] (255),
    [GRADEID]      [int]           CONSTRAINT [DF_USR_CR_STORELISTGRADEID] DEFAULT ((0)),
    [CONTACT]      [varchar] (100),
    [ID]           [int]           CONSTRAINT [DF_USR_CR_STORELISTID] DEFAULT ((0)) NOT  NULL,
    [STORENUMBER]  [varchar] (50) ,
    [REGION]       [varchar] (100),
    [STORESIZE]    [varchar] (50) ,
    [STORETYPE]    [varchar] (50) 
)
GO

ALTER TABLE [USR_CR_STORELIST] WITH NOCHECK ADD CONSTRAINT [PK_USR_CR_STORELIST] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO

ALTER TABLE [USR_CR_STORELIST]  WITH  NOCHECK  ADD  CONSTRAINT [FK_USR_CR_STORELIST] FOREIGN KEY ([ID]) REFERENCES [USR_CR_CONTENTRECVR] ([ID])
GO
ALTER TABLE [USR_CR_STORELIST]  NOCHECK  CONSTRAINT [FK_USR_CR_STORELIST]
GO

/*------------------------------------------------------------------------------------------------*/
/* Publishing - DestinationValue                                                                  */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_DESTINATIONVALUE]
(
    [DESTINATIONID]    [int]           CONSTRAINT [DF_SYS_OTP_DESTINATIONVALUEDESTINATIONID] DEFAULT ((0)),
    [DESTVALUE]        [varchar] (255),
    [ID]               [int]           CONSTRAINT [DF_SYS_OTP_DESTINATIONVALUEID] DEFAULT ((0)) NOT  NULL,
    [ITEMID]           [int]           CONSTRAINT [DF_SYS_OTP_DESTINATIONVALUEITEMID] DEFAULT ((0)),
    [ITEMTYPEID]       [int]           CONSTRAINT [DF_SYS_OTP_DESTINATIONVALUEITEMTYPEID] DEFAULT ((0)),
    [PARAMETERID]      [int]           CONSTRAINT [DF_SYS_OTP_DESTINATIONVALUEPARAMETERID] DEFAULT ((0)),
    [PUBLISHINGDECKID] [int]           CONSTRAINT [DF_SYS_OTP_DESTINATIONVALUEPUBLISHINGDECKID] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_OTP_DESTINATIONVALUE] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_DESTINATIONVALUE] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - DistributionJobCreate                                                             */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_DISTRIBUTIONJOBCREATE]
(
    [JOBID]          [int]           CONSTRAINT [DF_SYS_PUB_DISTRIBUTIONJOBCREATEJOBID] DEFAULT ((0)) NOT  NULL,
    [TOPLEVELFOLDER] [varchar] (255) NOT  NULL
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - DistributionJobFile                                                               */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_DISTRIBUTIONJOBFILE]
(
    [CONTENTRECEIVERID]   [int]           CONSTRAINT [DF_SYS_PUB_DISTRIBUTIONJOBFILECONTENTRECEIVERID] DEFAULT ((0)),
    [DISTRIBUTEDFILENAME] [varchar] (255),
    [DISTRIBUTEDFILEPATH] [varchar] (255),
    [ERRORTEXT]           [varchar] (255),
    [JOBID]               [int]           CONSTRAINT [DF_SYS_PUB_DISTRIBUTIONJOBFILEJOBID] DEFAULT ((0)) NOT  NULL,
    [ORIGINALFILENAME]    [varchar] (255),
    [ORIGINALFILEPATH]    [varchar] (255),
    [RERUN]               [int]           CONSTRAINT [DF_SYS_PUB_DISTRIBUTIONJOBFILERERUN] DEFAULT ((0)),
    [SUCCESS]             [int]           CONSTRAINT [DF_SYS_PUB_DISTRIBUTIONJOBFILESUCCESS] DEFAULT ((0))
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - DistributionJobStatus                                                             */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_DISTRIBUTIONJOBSTATUS]
(
    [F1]              [varchar] (255),
    [F10]             [varchar] (255),
    [F2]              [varchar] (255),
    [F3]              [varchar] (255),
    [F4]              [varchar] (255),
    [F5]              [varchar] (255),
    [F6]              [varchar] (255),
    [F7]              [varchar] (255),
    [F8]              [varchar] (255),
    [F9]              [varchar] (255),
    [JOBID]           [int]           CONSTRAINT [DF_SYS_PUB_DISTRIBUTIONJOBSTATUSJOBID] DEFAULT ((0)) NOT  NULL,
    [RERUN]           [int]           CONSTRAINT [DF_SYS_PUB_DISTRIBUTIONJOBSTATUSRERUN] DEFAULT ((0)),
    [STATUSID]        [int]           CONSTRAINT [DF_SYS_PUB_DISTRIBUTIONJOBSTATUSSTATUSID] DEFAULT ((0)),
    [RESULTTIMESTAMP] [binary] (8)   
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - FallBackItems                                                                     */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_FALLBACKITEMS]
(
    [ITEMID]           [int]           CONSTRAINT [DF_SYS_OTP_FALLBACKITEMSITEMID] DEFAULT ((0)) NOT  NULL,
    [NAME]             [varchar] (255),
    [PLANOTEMPLATEID]  [int]           CONSTRAINT [DF_SYS_OTP_FALLBACKITEMSPLANOTEMPLATEID] DEFAULT ((0)),
    [PUBLISHINGDECKID] [int]           CONSTRAINT [DF_SYS_OTP_FALLBACKITEMSPUBLISHINGDECKID] DEFAULT ((0))
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - NamingRule                                                                        */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_NAMINGRULE]
(
    [CHARCOUNT]       [int]          CONSTRAINT [DF_SYS_PUB_NAMINGRULECHARCOUNT] DEFAULT ((0)),
    [ID]              [int]          CONSTRAINT [DF_SYS_PUB_NAMINGRULEID] DEFAULT ((0)) NOT  NULL,
    [MIRRORPLACEMENT] [int]          CONSTRAINT [DF_SYS_PUB_NAMINGRULEMIRRORPLACEMENT] DEFAULT ((0)),
    [MIRRORTEXT]      [varchar] (50),
    [RECEIVERTYPE]    [varchar] (50),
    [SEPARATOR]       [varchar] (2) ,
    [USERID]          [int]          CONSTRAINT [DF_SYS_PUB_NAMINGRULEUSERID] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_PUB_NAMINGRULE] WITH NOCHECK ADD CONSTRAINT [PK_SYS_PUB_NAMINGRULE] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - NamingRuleMember                                                                  */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_NAMINGRULEMEMBER]
(
    [CONSTANT]            [varchar] (255),
    [CONTENTRECEIVERTYPE] [varchar] (255),
    [FIELDNAME]           [varchar] (255),
    [ID]                  [int]           CONSTRAINT [DF_SYS_PUB_NAMINGRULEMEMBERID] DEFAULT ((0)) NOT  NULL,
    [OBJECTTYPE]          [int]           CONSTRAINT [DF_SYS_PUB_NAMINGRULEMEMBEROBJECTTYPE] DEFAULT ((0)),
    [ORDINAL]             [int]           CONSTRAINT [DF_SYS_PUB_NAMINGRULEMEMBERORDINAL] DEFAULT ((0)),
    [RULEID]              [int]           CONSTRAINT [DF_SYS_PUB_NAMINGRULEMEMBERRULEID] DEFAULT ((0)),
    [TRUNCATENAME]        [int]           CONSTRAINT [DF_SYS_PUB_NAMINGRULEMEMBERTRUNCATENAME] DEFAULT ((0)),
    [TRUNCATIONLENGTH]    [int]           CONSTRAINT [DF_SYS_PUB_NAMINGRULEMEMBERTRUNCATIONLENGTH] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_PUB_NAMINGRULEMEMBER] WITH NOCHECK ADD CONSTRAINT [PK_SYS_PUB_NAMINGRULEMEMBER] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - OtherFileDistributableItem                                                        */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_OTHERFILEDISTRIBUTITEM]
(
    [DIRECTORY]            [varchar] (255),
    [FILESOURCE]           [int]           CONSTRAINT [DF_SYS_OTP_OTHERFILEDISTRIBUTITEMFILESOURCE] DEFAULT ((0)),
    [ITEMID]               [int]           CONSTRAINT [DF_SYS_OTP_OTHERFILEDISTRIBUTITEMITEMID] DEFAULT ((0)) NOT  NULL,
    [MASK]                 [varchar] (50) ,
    [NAME]                 [varchar] (50) ,
    [PUBLISHINGDECKID]     [int]           CONSTRAINT [DF_SYS_OTP_OTHERFILEDISTRIBUTITEMPUBLISHINGDECKID] DEFAULT ((0)),
    [PUBLISHINGDECKSEQNUM] [int]           CONSTRAINT [DF_SYS_OTP_OTHERFILEDISTRIBUTITEMPUBLISHINGDECKSEQNUM] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_OTP_OTHERFILEDISTRIBUTITEM] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_OTHERFILEDISTRIBUTITEM] PRIMARY KEY CLUSTERED 
(
    [ITEMID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - OtherFileUri                                                                      */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_OTHERFILEURI]
(
    [OTHERFILEITEMID] [int]           CONSTRAINT [DF_SYS_OTP_OTHERFILEURIOTHERFILEITEMID] DEFAULT ((0)) NOT  NULL,
    [URI]             [varchar] (255)
)
GO

ALTER TABLE [SYS_OTP_OTHERFILEURI] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_OTHERFILEURI] PRIMARY KEY CLUSTERED 
(
    [OTHERFILEITEMID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PlanogramTypeDistributableItem                                                    */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_PLANOTYPEDISTRIBUTITEM]
(
    [FILTERID]             [int]           CONSTRAINT [DF_SYS_OTP_PLANOTYPEDISTRIBUTITEMFILTERID] DEFAULT ((0)),
    [ITEMID]               [int]           CONSTRAINT [DF_SYS_OTP_PLANOTYPEDISTRIBUTITEMITEMID] DEFAULT ((0)) NOT  NULL,
    [NAME]                 [varchar] (255),
    [PLANOGRAMTYPEID]      [int]           CONSTRAINT [DF_SYS_OTP_PLANOTYPEDISTRIBUTITEMPLANOGRAMTYPEID] DEFAULT ((0)),
    [PUBLISHINGDECKID]     [int]           CONSTRAINT [DF_SYS_OTP_PLANOTYPEDISTRIBUTITEMPUBLISHINGDECKID] DEFAULT ((0)),
    [PUBLISHINGDECKSEQNUM] [int]           CONSTRAINT [DF_SYS_OTP_PLANOTYPEDISTRIBUTITEMPUBLISHINGDECKSEQNUM] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_OTP_PLANOTYPEDISTRIBUTITEM] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_PLANOTYPEDISTRIBUTITEM] PRIMARY KEY CLUSTERED 
(
    [ITEMID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PLTDistributableItem                                                              */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_PLTDISTRIBUTITEM]
(
    [ITEMID]               [int]          CONSTRAINT [DF_SYS_OTP_PLTDISTRIBUTITEMITEMID] DEFAULT ((0)) NOT  NULL,
    [NAME]                 [varchar] (50),
    [PLANOTEMPLATEID]      [int]          CONSTRAINT [DF_SYS_OTP_PLTDISTRIBUTITEMPLANOTEMPLATEID] DEFAULT ((0)),
    [PUBLISHINGDECKID]     [int]          CONSTRAINT [DF_SYS_OTP_PLTDISTRIBUTITEMPUBLISHINGDECKID] DEFAULT ((0)),
    [PUBLISHINGDECKSEQNUM] [int]          CONSTRAINT [DF_SYS_OTP_PLTDISTRIBUTITEMPUBLISHINGDECKSEQNUM] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_OTP_PLTDISTRIBUTITEM] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_PLTDISTRIBUTITEM] PRIMARY KEY CLUSTERED 
(
    [ITEMID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PLTPointerDistributableItem                                                       */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_PLTPTRDISTRIBUTITEM]
(
    [ID]                   [int]  CONSTRAINT [DF_SYS_OTP_PLTPTRDISTRIBUTITEMID] DEFAULT ((0)) NOT  NULL,
    [PUBLISHINGDECKID]     [int]  CONSTRAINT [DF_SYS_OTP_PLTPTRDISTRIBUTITEMPUBLISHINGDECKID] DEFAULT ((0)),
    [PUBLISHINGDECKSEQNUM] [int]  CONSTRAINT [DF_SYS_OTP_PLTPTRDISTRIBUTITEMPUBLISHINGDECKSEQNUM] DEFAULT ((0))
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishedPlanograms                                                               */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_PUBLISHEDPLANOGRAMS]
(
    [CONTENTRECEIVERID]     [int]          CONSTRAINT [DF_SYS_PUB_PUBLISHEDPLANOGRAMSCONTENTRECEIVERID] DEFAULT ((0)) NOT  NULL,
    [DISTRIBUTABLEITEMID]   [int]          CONSTRAINT [DF_SYS_PUB_PUBLISHEDPLANOGRAMSDISTRIBUTABLEITEMID] DEFAULT ((0)) NOT  NULL,
    [DISTRIBUTABLEITEMTYPE] [int]          CONSTRAINT [DF_SYS_PUB_PUBLISHEDPLANOGRAMSDISTRIBUTABLEITEMTYPE] DEFAULT ((0)) NOT  NULL,
    [MIRROREDIMAGE]         [int]          CONSTRAINT [DF_SYS_PUB_PUBLISHEDPLANOGRAMSMIRROREDIMAGE] DEFAULT ((0)) NOT  NULL,
    [PLANOCONTAINERID]      [int]          CONSTRAINT [DF_SYS_PUB_PUBLISHEDPLANOGRAMSPLANOCONTAINERID] DEFAULT ((0)) NOT  NULL,
    [PLANOMODIFIEDDATE]     [varchar] (50)
)
GO

ALTER TABLE [SYS_PUB_PUBLISHEDPLANOGRAMS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_PUB_PUBLISHEDPLANOGRAMS] PRIMARY KEY CLUSTERED 
(
    [DISTRIBUTABLEITEMID],
    [DISTRIBUTABLEITEMTYPE],
    [CONTENTRECEIVERID],
    [PLANOCONTAINERID],
    [MIRROREDIMAGE]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingDeck                                                                    */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_PUBLISHINGDECK]
(
    [BUSINESSISSUE]           [varchar] (255),
    [COLLATIONID]             [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKCOLLATIONID] DEFAULT ((0)),
    [COMPLEXITY]              [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKCOMPLEXITY] DEFAULT ((0)),
    [DESCRIPTION]             [varchar] (50) ,
    [DESTINATIONAPPLICATION]  [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKDESTINATIONAPPLICATION] DEFAULT ((0)),
    [DESTINATIONEMAIL]        [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKDESTINATIONEMAIL] DEFAULT ((0)),
    [DESTINATIONFILE]         [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKDESTINATIONFILE] DEFAULT ((0)),
    [DESTINATIONFTP]          [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKDESTINATIONFTP] DEFAULT ((0)),
    [DESTINATIONPRINTER]      [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKDESTINATIONPRINTER] DEFAULT ((0)),
    [PUBLISHINGDECKID]        [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKPUBLISHINGDECKID] DEFAULT ((0)) NOT  NULL,
    [INCLUDELIVEIMAGES]       [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKINCLUDELIVEIMAGES] DEFAULT ((0)),
    [INCLUDEPLANOGRAMASFILES] [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKINCLUDEPLANOGRAMASFILES] DEFAULT ((0)),
    [NAME]                    [varchar] (50) ,
    [TOPICID]                 [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKTOPICID] DEFAULT ((0)),
    [USERID]                  [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKUSERID] DEFAULT ((0)),
    [ZEROOUTFINANCIALS]       [int]           CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKZEROOUTFINANCIALS] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_OTP_PUBLISHINGDECK] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_PUBLISHINGDECK] PRIMARY KEY CLUSTERED 
(
    [PUBLISHINGDECKID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingDeckTopic                                                               */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_PUBLISHINGDECKTOPIC]
(
    [DESCRIPTION] [varchar] (50),
    [TOPICID]     [int]          CONSTRAINT [DF_SYS_OTP_PUBLISHINGDECKTOPICTOPICID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_OTP_PUBLISHINGDECKTOPIC] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_PUBLISHINGDECKTOPIC] PRIMARY KEY CLUSTERED 
(
    [TOPICID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJobCRHierarchy                                                          */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOBCRHIERARCHY]
(
    [HIERARCHY] [varchar] (512) NOT  NULL,
    [JOBID]     [int]           CONSTRAINT [DF_SYS_PUB_JOBCRHIERARCHYJOBID] DEFAULT ((0)) NOT  NULL,
    [TYPE]      [varchar] (255) NOT  NULL
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJobHierarchy                                                            */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOBHIERARCHY]
(
    [DBIDENTIFIER] [varchar] (255)  NOT  NULL,
    [HIERARCHY]    [varchar] (4000) NOT  NULL,
    [JOBID]        [int]            CONSTRAINT [DF_SYS_PUB_JOBHIERARCHYJOBID] DEFAULT ((0)) NOT  NULL
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJobQueue                                                                */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOBQUEUE]
(
    [JOBID]          [int]           CONSTRAINT [DF_SYS_PUB_JOBQUEUEJOBID] DEFAULT ((0)) NOT  NULL,
    [ORDERTIMESTAMP] [binary] (8)   ,
    [PROCESSORID]    [int]           CONSTRAINT [DF_SYS_PUB_JOBQUEUEPROCESSORID] DEFAULT ((0)),
    [SERVICENAME]    [varchar] (100),
    [STATUS]         [int]           CONSTRAINT [DF_SYS_PUB_JOBQUEUESTATUS] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_PUB_JOBQUEUE] WITH NOCHECK ADD CONSTRAINT [PK_SYS_PUB_JOBQUEUE] PRIMARY KEY CLUSTERED 
(
    [JOBID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJobRerun                                                                */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOBRERUN]
(
    [ENDTIME]   [binary] (8) ,
    [JOBID]     [int]         CONSTRAINT [DF_SYS_PUB_JOBRERUNJOBID] DEFAULT ((0)) NOT  NULL,
    [RERUN]     [int]         CONSTRAINT [DF_SYS_PUB_JOBRERUNRERUN] DEFAULT ((0)) NOT  NULL,
    [STARTTIME] [binary] (8) 
)
GO

ALTER TABLE [SYS_PUB_JOBRERUN] WITH NOCHECK ADD CONSTRAINT [PK_SYS_PUB_JOBRERUN] PRIMARY KEY CLUSTERED 
(
    [JOBID],
    [RERUN]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJobResultFile                                                           */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOBRESULTFILE]
(
    [CONTENTRECEIVERID] [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTFILECONTENTRECEIVERID] DEFAULT ((0)) NOT  NULL,
    [ITEMID]            [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTFILEITEMID] DEFAULT ((0)) NOT  NULL,
    [ITEMTYPE]          [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTFILEITEMTYPE] DEFAULT ((0)) NOT  NULL,
    [JOBID]             [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTFILEJOBID] DEFAULT ((0)) NOT  NULL,
    [MIRROREDIMAGE]     [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTFILEMIRROREDIMAGE] DEFAULT ((0)) NOT  NULL,
    [PLANOCONTAINERID]  [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTFILEPLANOCONTAINERID] DEFAULT ((0)) NOT  NULL,
    [RERUN]             [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTFILERERUN] DEFAULT ((0)) NOT  NULL,
    [STATUS]            [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTFILESTATUS] DEFAULT ((0)),
    [UNITID]            [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTFILEUNITID] DEFAULT ((0)) NOT  NULL,
    [URL]               [varchar] (255)
)
GO

ALTER TABLE [SYS_PUB_JOBRESULTFILE] WITH NOCHECK ADD CONSTRAINT [PK_SYS_PUB_JOBRESULTFILE] PRIMARY KEY CLUSTERED 
(
    [JOBID],
    [UNITID],
    [PLANOCONTAINERID],
    [CONTENTRECEIVERID],
    [ITEMID],
    [ITEMTYPE],
    [MIRROREDIMAGE],
    [RERUN]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJobResultsStatus                                                        */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOBRESULTSSTATUS]
(
    [CONTENTRECEIVERID] [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTSSTATUSCONTENTRECEIVERID] DEFAULT ((0)) NOT  NULL,
    [F1]                [varchar] (255),
    [F10]               [varchar] (255),
    [F2]                [varchar] (255),
    [F3]                [varchar] (255),
    [F4]                [varchar] (255),
    [F5]                [varchar] (255),
    [F6]                [varchar] (255),
    [F7]                [varchar] (255),
    [F8]                [varchar] (255),
    [F9]                [varchar] (255),
    [ITEMID]            [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTSSTATUSITEMID] DEFAULT ((0)) NOT  NULL,
    [ITEMTYPE]          [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTSSTATUSITEMTYPE] DEFAULT ((0)) NOT  NULL,
    [JOBID]             [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTSSTATUSJOBID] DEFAULT ((0)) NOT  NULL,
    [MIRROREDIMAGE]     [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTSSTATUSMIRROREDIMAGE] DEFAULT ((0)) NOT  NULL,
    [PLANOCONTAINERID]  [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTSSTATUSPLANOCONTAINERID] DEFAULT ((0)) NOT  NULL,
    [RERUN]             [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTSSTATUSRERUN] DEFAULT ((0)) NOT  NULL,
    [STATUSCODE]        [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTSSTATUSSTATUSCODE] DEFAULT ((0)) NOT  NULL,
    [STATUSID]          [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTSSTATUSSTATUSID] DEFAULT ((0)),
    [RESULTTIMESTAMP]   [binary] (8)   ,
    [UNITID]            [int]           CONSTRAINT [DF_SYS_PUB_JOBRESULTSSTATUSUNITID] DEFAULT ((0)) NOT  NULL
)
GO

CREATE  NONCLUSTERED INDEX [IDX_SYS_PUB_JOBRESULTSSTATUS] ON [SYS_PUB_JOBRESULTSSTATUS]
(
    [JOBID] ASC,
    [UNITID] ASC,
    [PLANOCONTAINERID] ASC,
    [CONTENTRECEIVERID] ASC,
    [ITEMID] ASC,
    [STATUSID] ASC
)
GO



/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJobResultUnit                                                           */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOBRESULTUNIT]
(
    [CONTENTRECEIVERID] [int]         CONSTRAINT [DF_SYS_PUB_JOBRESULTUNITCONTENTRECEIVERID] DEFAULT ((0)) NOT  NULL,
    [FINISHTIME]        [binary] (8) ,
    [JOBID]             [int]         CONSTRAINT [DF_SYS_PUB_JOBRESULTUNITJOBID] DEFAULT ((0)) NOT  NULL,
    [MIRROREDIMAGE]     [int]         CONSTRAINT [DF_SYS_PUB_JOBRESULTUNITMIRROREDIMAGE] DEFAULT ((0)) NOT  NULL,
    [RERUN]             [int]         CONSTRAINT [DF_SYS_PUB_JOBRESULTUNITRERUN] DEFAULT ((0)) NOT  NULL,
    [STARTTIME]         [binary] (8) ,
    [STATUS]            [int]         CONSTRAINT [DF_SYS_PUB_JOBRESULTUNITSTATUS] DEFAULT ((0)),
    [UNITID]            [int]         CONSTRAINT [DF_SYS_PUB_JOBRESULTUNITUNITID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_PUB_JOBRESULTUNIT] WITH NOCHECK ADD CONSTRAINT [PK_SYS_PUB_JOBRESULTUNIT] PRIMARY KEY CLUSTERED 
(
    [JOBID],
    [UNITID],
    [CONTENTRECEIVERID],
    [MIRROREDIMAGE],
    [RERUN]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJobUnit                                                                 */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOBUNIT]
(
    [ID]               [int]  CONSTRAINT [DF_SYS_PUB_JOBUNITID] DEFAULT ((0)) NOT  NULL,
    [JOBID]            [int]  CONSTRAINT [DF_SYS_PUB_JOBUNITJOBID] DEFAULT ((0)),
    [PUBLISHINGDECKID] [int]  CONSTRAINT [DF_SYS_PUB_JOBUNITPUBLISHINGDECKID] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_PUB_JOBUNIT] WITH NOCHECK ADD CONSTRAINT [PK_SYS_PUB_JOBUNIT] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJobUnitCatSelection                                                     */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOBUNITCATSELECTION]
(
    [JOBID]         [int]            CONSTRAINT [DF_SYS_PUB_JOBUNITCATSELECTIONJOBID] DEFAULT ((0)) NOT  NULL,
    [SELECTION]     [varchar] (4000) NOT  NULL,
    [SELECTIONTYPE] [int]            CONSTRAINT [DF_SYS_PUB_JOBUNITCATSELECTIONSELECTIONTYPE] DEFAULT ((0)) NOT  NULL,
    [UNITID]        [int]            CONSTRAINT [DF_SYS_PUB_JOBUNITCATSELECTIONUNITID] DEFAULT ((0)) NOT  NULL
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJobUnitCrSelection                                                      */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOBUNITCRSELECTION]
(
    [JOBID]         [int]            CONSTRAINT [DF_SYS_PUB_JOBUNITCRSELECTIONJOBID] DEFAULT ((0)),
    [SELECTION]     [varchar] (4000),
    [SELECTIONTYPE] [int]            CONSTRAINT [DF_SYS_PUB_JOBUNITCRSELECTIONSELECTIONTYPE] DEFAULT ((0)),
    [TYPE]          [varchar] (50)  ,
    [UNITID]        [int]            CONSTRAINT [DF_SYS_PUB_JOBUNITCRSELECTIONUNITID] DEFAULT ((0))
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJobUnitExcludes                                                         */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOBUNITEXCLUDES]
(
    [CATEGORYID]        [int]  CONSTRAINT [DF_SYS_PUB_JOBUNITEXCLUDESCATEGORYID] DEFAULT ((0)),
    [CONTENTRECEIVERID] [int]  CONSTRAINT [DF_SYS_PUB_JOBUNITEXCLUDESCONTENTRECEIVERID] DEFAULT ((0)),
    [JOBID]             [int]  CONSTRAINT [DF_SYS_PUB_JOBUNITEXCLUDESJOBID] DEFAULT ((0)) NOT  NULL,
    [PLANOCONTAINERID]  [int]  CONSTRAINT [DF_SYS_PUB_JOBUNITEXCLUDESPLANOCONTAINERID] DEFAULT ((0)),
    [STOREID]           [int]  CONSTRAINT [DF_SYS_PUB_JOBUNITEXCLUDESSTOREID] DEFAULT ((0)),
    [UNITID]            [int]  CONSTRAINT [DF_SYS_PUB_JOBUNITEXCLUDESUNITID] DEFAULT ((0)) NOT  NULL
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJobUnitPlanoSelection                                                   */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOBUNITPLANOSELECTION]
(
    [DBIDENTIFIER]  [varchar] (255)  NOT  NULL,
    [JOBID]         [int]            CONSTRAINT [DF_SYS_PUB_JOBUNITPLANOSELECTIONJOBID] DEFAULT ((0)) NOT  NULL,
    [SELECTION]     [varchar] (4000),
    [SELECTIONTYPE] [int]            CONSTRAINT [DF_SYS_PUB_JOBUNITPLANOSELECTIONSELECTIONTYPE] DEFAULT ((0)) NOT  NULL,
    [UNITID]        [int]            CONSTRAINT [DF_SYS_PUB_JOBUNITPLANOSELECTIONUNITID] DEFAULT ((0)) NOT  NULL
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PubServiceActivity                                                                */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_SERVICEACTIVITY]
(
    [LASTACTIVETIME] [binary] (8)   ,
    [MACHINEID]      [varchar] (255) NOT  NULL,
    [PROCESSID]      [int]           CONSTRAINT [DF_SYS_PUB_SERVICEACTIVITYPROCESSID] DEFAULT ((0)),
    [SERVICENAME]    [varchar] (255) NOT  NULL
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - XLTDistributableItem                                                              */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_XLTDISTRIBUTITEM]
(
    [EXCELTEMPLATEID]      [int]          CONSTRAINT [DF_SYS_OTP_XLTDISTRIBUTITEMEXCELTEMPLATEID] DEFAULT ((0)),
    [ITEMID]               [int]          CONSTRAINT [DF_SYS_OTP_XLTDISTRIBUTITEMITEMID] DEFAULT ((0)) NOT  NULL,
    [NAME]                 [varchar] (50),
    [PUBLISHINGDECKID]     [int]          CONSTRAINT [DF_SYS_OTP_XLTDISTRIBUTITEMPUBLISHINGDECKID] DEFAULT ((0)),
    [PUBLISHINGDECKSEQNUM] [int]          CONSTRAINT [DF_SYS_OTP_XLTDISTRIBUTITEMPUBLISHINGDECKSEQNUM] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_OTP_XLTDISTRIBUTITEM] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_XLTDISTRIBUTITEM] PRIMARY KEY CLUSTERED 
(
    [ITEMID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Publishing - PublishingJob                                                                     */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_PUB_JOB]
(
    [COPYOTHERCONTENTRECEIVERS]    [int]           CONSTRAINT [DF_SYS_PUB_JOBCOPYOTHERCONTENTRECEIVERS] DEFAULT ((0)),
    [COPYPLANOCONTENTRECEIVERS]    [int]           CONSTRAINT [DF_SYS_PUB_JOBCOPYPLANOCONTENTRECEIVERS] DEFAULT ((0)),
    [DELETEEXISTINGDIRECTORY]      [int]           CONSTRAINT [DF_SYS_PUB_JOBDELETEEXISTINGDIRECTORY] DEFAULT ((0)),
    [DELETETEMPFOLDER]             [int]           CONSTRAINT [DF_SYS_PUB_JOBDELETETEMPFOLDER] DEFAULT ((0)),
    [DESCRIPTION]                  [varchar] (max),
    [DISTRIBUTE]                   [int]           CONSTRAINT [DF_SYS_PUB_JOBDISTRIBUTE] DEFAULT ((0)),
    [GENERATENEWCONTENTONLY]       [int]           CONSTRAINT [DF_SYS_PUB_JOBGENERATENEWCONTENTONLY] DEFAULT ((0)),
    [GROUPCONTENTRECEIVERS]        [int]           CONSTRAINT [DF_SYS_PUB_JOBGROUPCONTENTRECEIVERS] DEFAULT ((0)),
    [JOBID]                        [int]           CONSTRAINT [DF_SYS_PUB_JOBJOBID] DEFAULT ((0)) NOT  NULL,
    [INCLUDEMIRRORIMAGES]          [int]           CONSTRAINT [DF_SYS_PUB_JOBINCLUDEMIRRORIMAGES] DEFAULT ((0)),
    [ISRECURRINGJOB]               [int]           CONSTRAINT [DF_SYS_PUB_JOBISRECURRINGJOB] DEFAULT ((0)),
    [NAMINGRULESID]                [int]           CONSTRAINT [DF_SYS_PUB_JOBNAMINGRULESID] DEFAULT ((0)),
    [OUTPUTADHOC]                  [int]           CONSTRAINT [DF_SYS_PUB_JOBOUTPUTADHOC] DEFAULT ((0)),
    [OUTPUTPRODUCTION]             [int]           CONSTRAINT [DF_SYS_PUB_JOBOUTPUTPRODUCTION] DEFAULT ((0)),
    [OWNERID]                      [int]           CONSTRAINT [DF_SYS_PUB_JOBOWNERID] DEFAULT ((0)),
    [PRODUCTIONTOPLEVEL]           [varchar] (255),
    [PUBLISHEDFILEPATH]            [varchar] (255),
    [RECURRENCEDAILYCOUNT]         [int]           CONSTRAINT [DF_SYS_PUB_JOBRECURRENCEDAILYCOUNT] DEFAULT ((0)),
    [RECURRENCEDAILYEVERYWEEKDAY]  [int]           CONSTRAINT [DF_SYS_PUB_JOBRECURRENCEDAILYEVERYWEEKDAY] DEFAULT ((0)),
    [RECURRENCEFREQUENCY]          [int]           CONSTRAINT [DF_SYS_PUB_JOBRECURRENCEFREQUENCY] DEFAULT ((0)),
    [RECURRENCEMONTHLYCOUNT]       [int]           CONSTRAINT [DF_SYS_PUB_JOBRECURRENCEMONTHLYCOUNT] DEFAULT ((0)),
    [RECURRENCEMONTHLYDAY]         [int]           CONSTRAINT [DF_SYS_PUB_JOBRECURRENCEMONTHLYDAY] DEFAULT ((0)),
    [RECURRENCEMONTHLYOPTION]      [int]           CONSTRAINT [DF_SYS_PUB_JOBRECURRENCEMONTHLYOPTION] DEFAULT ((0)),
    [RECURRENCEMONTHLYORDINAL]     [int]           CONSTRAINT [DF_SYS_PUB_JOBRECURRENCEMONTHLYORDINAL] DEFAULT ((0)),
    [RECURRENCEMONTHLYWEEKDAY]     [int]           CONSTRAINT [DF_SYS_PUB_JOBRECURRENCEMONTHLYWEEKDAY] DEFAULT ((0)),
    [RECURRENCERANGEENDAFTER]      [int]           CONSTRAINT [DF_SYS_PUB_JOBRECURRENCERANGEENDAFTER] DEFAULT ((0)),
    [RECURRENCERANGEENDDATE]       [binary] (8)   ,
    [RECURRENCERANGEENDOPTION]     [int]           CONSTRAINT [DF_SYS_PUB_JOBRECURRENCERANGEENDOPTION] DEFAULT ((0)),
    [RECURRENCERANGESTARTDATE]     [binary] (8)   ,
    [RECURRENCESTARTTIME]          [binary] (8)   ,
    [RECURRENCEWEEKLYCOUNT]        [int]           CONSTRAINT [DF_SYS_PUB_JOBRECURRENCEWEEKLYCOUNT] DEFAULT ((0)),
    [RECURRENCEWEEKLYDAYS]         [varchar] (7)  ,
    [SCHEDULEDSTARTTIME]           [binary] (8)   ,
    [SCHEDULEDSTARTTIMEOPTION]     [int]           CONSTRAINT [DF_SYS_PUB_JOBSCHEDULEDSTARTTIMEOPTION] DEFAULT ((0)),
    [SELECTASSIGNEDONLY]           [int]           CONSTRAINT [DF_SYS_PUB_JOBSELECTASSIGNEDONLY] DEFAULT ((0)),
    [SELECTIONTYPE]                [int]           CONSTRAINT [DF_SYS_PUB_JOBSELECTIONTYPE] DEFAULT ((0)),
    [SENDALERTSTOCONTENTRECEIVERS] [int]           CONSTRAINT [DF_SYS_PUB_JOBSENDALERTSTOCONTENTRECEIVERS] DEFAULT ((0)),
    [SENDALERTSTOUSERS]            [int]           CONSTRAINT [DF_SYS_PUB_JOBSENDALERTSTOUSERS] DEFAULT ((0)),
    [SINGLEFILEOUTPUT]             [int]           CONSTRAINT [DF_SYS_PUB_JOBSINGLEFILEOUTPUT] DEFAULT ((0)),
    [SUBMITTEDTIME]                [binary] (8)   ,
    [ZEROFINANCIAL]                [int]           CONSTRAINT [DF_SYS_PUB_JOBZEROFINANCIAL] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_PUB_JOB] WITH NOCHECK ADD CONSTRAINT [PK_SYS_PUB_JOB] PRIMARY KEY CLUSTERED 
(
    [JOBID]
)
GO

ALTER TABLE [SYS_PUB_JOB]  WITH  NOCHECK  ADD  CONSTRAINT [FK_SYS_PUB_JOB] FOREIGN KEY ([JOBID]) REFERENCES [SYS_PUB_JOBQUEUE] ([JOBID])
GO
ALTER TABLE [SYS_PUB_JOB]  NOCHECK  CONSTRAINT [FK_SYS_PUB_JOB]
GO

/*------------------------------------------------------------------------------------------------*/
/* Analysis - AnalysisField                                                                       */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_MYANALYSISFIELDS]
(
    [ID]         [int]          CONSTRAINT [DF_SYS_OTP_MYANALYSISFIELDSID] DEFAULT ((0)) NOT  NULL,
    [FIELDNAME]  [varchar] (50),
    [OBJECTTYPE] [int]          CONSTRAINT [DF_SYS_OTP_MYANALYSISFIELDSOBJECTTYPE] DEFAULT ((0)),
    [ORDINAL]    [int]          CONSTRAINT [DF_SYS_OTP_MYANALYSISFIELDSORDINAL] DEFAULT ((0)),
    [FIELDTYPE]  [int]          CONSTRAINT [DF_SYS_OTP_MYANALYSISFIELDSFIELDTYPE] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_OTP_MYANALYSISFIELDS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_MYANALYSISFIELDS] PRIMARY KEY CLUSTERED 
(
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Analysis - myAnalysisCharacteristics                                                           */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_MYANALYSISCHARS]
(
    [CHARSEQUENCE] [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISCHARSCHARSEQUENCE] DEFAULT ((0)),
    [DIMENSIONID]  [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISCHARSDIMENSIONID] DEFAULT ((0)) NOT  NULL,
    [DISPLAYNAME]  [varchar] (255),
    [INCLUDE]      [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISCHARSINCLUDE] DEFAULT ((0)),
    [NAME]         [varchar] (255) NOT  NULL,
    [TOTAL]        [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISCHARSTOTAL] DEFAULT ((0)),
    [USERID]       [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISCHARSUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_OTP_MYANALYSISCHARS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_MYANALYSISCHARS] PRIMARY KEY CLUSTERED 
(
    [USERID],
    [DIMENSIONID],
    [NAME]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Analysis - myAnalysisDimensions                                                                */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_MYANALYSISDIMENSIONS]
(
    [DIMSEQUENCE] [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISDIMENSIONSDIMSEQUENCE] DEFAULT ((0)),
    [DISPLAYNAME] [varchar] (255),
    [ID]          [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISDIMENSIONSID] DEFAULT ((0)) NOT  NULL,
    [NAME]        [varchar] (255),
    [NAMECOLUMN]  [varchar] (255),
    [TYPECOLUMN]  [varchar] (255),
    [USERID]      [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISDIMENSIONSUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_OTP_MYANALYSISDIMENSIONS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_MYANALYSISDIMENSIONS] PRIMARY KEY CLUSTERED 
(
    [USERID],
    [ID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Analysis - myAnalysisExtractors                                                                */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_MYANALYSISEXTRACTORS]
(
    [CREATED]                [binary] (8)   ,
    [DESCRIPTION]            [varchar] (255),
    [EXTRACTED]              [binary] (8)   ,
    [EXTRACTFILEDIRECTORY]   [varchar] (255),
    [EXTRACTFILENAME]        [varchar] (255),
    [INCLUDESCHEMA]          [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISEXTRACTORSINCLUDESCHEMA] DEFAULT ((0)),
    [INCLUDETOTALS]          [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISEXTRACTORSINCLUDETOTALS] DEFAULT ((0)),
    [INFOSERVERDSN]          [varchar] (255),
    [LOGICALDB]              [varchar] (255),
    [MODIFIED]               [binary] (8)   ,
    [OUTPUTSCHEMA]           [varchar] (255),
    [SCRIPTONLY]             [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISEXTRACTORSSCRIPTONLY] DEFAULT ((0)),
    [SKIPDATA]               [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISEXTRACTORSSKIPDATA] DEFAULT ((0)),
    [SUPPORTINFOSERVER]      [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISEXTRACTORSSUPPORTINFOSERVER] DEFAULT ((0)),
    [SUPPORTTIMEDIMENSION]   [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISEXTRACTORSSUPPORTTIMEDIMENSION] DEFAULT ((0)),
    [SUPPORTWORKSTATIONPLUS] [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISEXTRACTORSSUPPORTWORKSTATIONPLUS] DEFAULT ((0)),
    [TIMEDIMENSION]          [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISEXTRACTORSTIMEDIMENSION] DEFAULT ((0)),
    [USERID]                 [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISEXTRACTORSUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_OTP_MYANALYSISEXTRACTORS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_MYANALYSISEXTRACTORS] PRIMARY KEY CLUSTERED 
(
    [USERID]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Analysis - myAnalysisFacts                                                                     */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_MYANALYSISFACTS]
(
    [DISPLAYNAME]     [varchar] (255),
    [FACTAGGREGATION] [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISFACTSFACTAGGREGATION] DEFAULT ((0)),
    [FACTSEQUENCE]    [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISFACTSFACTSEQUENCE] DEFAULT ((0)),
    [INCLUDE]         [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISFACTSINCLUDE] DEFAULT ((0)),
    [NAME]            [varchar] (255) NOT  NULL,
    [USERID]          [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISFACTSUSERID] DEFAULT ((0)) NOT  NULL
)
GO

ALTER TABLE [SYS_OTP_MYANALYSISFACTS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_MYANALYSISFACTS] PRIMARY KEY CLUSTERED 
(
    [USERID],
    [NAME]
)
GO


/*------------------------------------------------------------------------------------------------*/
/* Analysis - myAnalysisReport                                                                    */
/*                                                                                                */
/* Script Date: 24 wrzeœnia 2015 15:24:12                                                         */
/*------------------------------------------------------------------------------------------------*/
CREATE TABLE [SYS_OTP_MYANALYSISREPORTS]
(
    [DESCRIPTION]        [varchar] (50) ,
    [EXTENSION]          [varchar] (50) ,
    [MYANALYSISREPORTID] [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISREPORTSMYANALYSISREPORTID] DEFAULT ((0)) NOT  NULL,
    [LASTRUN]            [float]         CONSTRAINT [DF_SYS_OTP_MYANALYSISREPORTSLASTRUN] DEFAULT ((0)),
    [LOCATION]           [varchar] (255),
    [NAME]               [varchar] (50) ,
    [USERID]             [int]           CONSTRAINT [DF_SYS_OTP_MYANALYSISREPORTSUSERID] DEFAULT ((0))
)
GO

ALTER TABLE [SYS_OTP_MYANALYSISREPORTS] WITH NOCHECK ADD CONSTRAINT [PK_SYS_OTP_MYANALYSISREPORTS] PRIMARY KEY CLUSTERED 
(
    [MYANALYSISREPORTID]
)
GO

CREATE  NONCLUSTERED INDEX [IDX_SYS_OTP_MYANALYSISREPORTS] ON [SYS_OTP_MYANALYSISREPORTS]
(
    [NAME] ASC
)
GO

