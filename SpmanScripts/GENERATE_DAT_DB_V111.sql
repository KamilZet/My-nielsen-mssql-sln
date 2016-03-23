/* Spaceman Connectivity Pack for v11.1 */
/* Microsoft SQL Server script-file */
/* (c) 2015 The Nielsen Company  */
/* February 2015 */

create database [db_name]
GO

use [db_name]
GO


CREATE TABLE ACN_PLANOGRAMS (
    PLN_ID 				int NOT NULL ,
    DEPARTMENT 			varchar (50) NULL ,
    CATEGORY 			varchar (50) NULL ,
    SUBCATEGORY 		varchar (50) NULL ,
    FIXTURESIZE			varchar (50) NULL ,
    CODE				varchar (50) NULL ,
    PLANOGRAM 			varchar (50) NULL ,
    OWNER 				varchar (50) NULL ,
    MODIFIEDBY 			varchar (50) NULL ,
    ACCESSEDBY 			varchar (50) NULL ,
    CREATIONDATE 		datetime NULL ,
    MODIFIEDDATE 		datetime NULL ,
    ACCESSEDDATE 		datetime NULL ,
    STATUS 				varchar (50) NULL ,
    INUSEBY 			varchar (50) NULL ,
)
GO

ALTER TABLE ACN_PLANOGRAMS WITH NOCHECK ADD
    CONSTRAINT PK_ACN_PLANOGRAMS PRIMARY KEY NONCLUSTERED
    (
        PLN_ID
    )
GO

GRANT SELECT, UPDATE, INSERT, DELETE ON ACN_PLANOGRAMS TO PUBLIC
GO

CREATE INDEX IX_DEPARTMENT ON ACN_PLANOGRAMS (DEPARTMENT)
GO

CREATE INDEX IX_CATEGORY ON ACN_PLANOGRAMS (CATEGORY)
GO

CREATE INDEX IX_SUBCATEGORY ON ACN_PLANOGRAMS (SUBCATEGORY)
GO

CREATE INDEX IX_FIXTURESIZE ON ACN_PLANOGRAMS (FIXTURESIZE)
GO

CREATE INDEX IX_CODE ON ACN_PLANOGRAMS (CODE)
GO

CREATE INDEX IX_PLANOGRAM ON ACN_PLANOGRAMS (PLANOGRAM)
GO

CREATE TABLE ACN_STORE (
    PLN_ID 				int NOT NULL ,
    STORE_ID 			varchar (32) NOT NULL ,
    STORE_NAME 			varchar (32) NULL ,
    DESC_1 				varchar (100) NULL ,
    DESC_2 				varchar (100) NULL ,
    DESC_3 				varchar (100) NULL ,
    DESC_4 				varchar (100) NULL ,
    DESC_5 				varchar (100) NULL ,
    DESC_6 				varchar (100) NULL ,
    DESC_7 				varchar (100) NULL ,
    CURRENCY_SYMBOL 	varchar (4) NULL ,
    NORMALIZE_TO 		smallint NULL ,
    TITLE 				varchar (120) NULL ,
    SUBTITLE 			varchar (120) NULL ,
    FOR_LINE 			varchar (120) NULL ,
    BY_LINE_1			varchar (120) NULL ,
    BY_LINE_2 			varchar (120) NULL ,
    MESSAGE_LINE_1 		varchar (120) NULL ,
    MESSAGE_LINE_2 		varchar (120) NULL ,
    MESSAGE_LINE_3 		varchar (120) NULL ,
    MESSAGE_LINE_4 		varchar (120) NULL ,
    MESSAGE_LINE_5 		varchar (120) NULL ,
    MESSAGE_LINE_6 		varchar (120) NULL ,
    MESSAGE_LINE_7 		varchar (120) NULL ,
    MESSAGE_LINE_8 		varchar (120) NULL ,
    MESSAGE_LINE_9 		varchar (120) NULL ,
    MESSAGE_LINE_10		varchar (120) NULL ,
    NOTES 				varchar (100) NULL ,
    FILEVERSION 		varchar(32) NULL ,
    USINGOVERFLOWSPACE	int NULL ,    
	PLANOGRAMID	varchar (100) NULL , 
	PLANOGRAMTEMPLATEID int NULL , 
)
GO

ALTER TABLE ACN_STORE WITH NOCHECK ADD
    CONSTRAINT PK_ACN_STORE PRIMARY KEY NONCLUSTERED
    (
        PLN_ID,
        STORE_ID
    )
GO

GRANT SELECT, UPDATE, INSERT, DELETE ON ACN_STORE TO PUBLIC
GO


CREATE TABLE ACN_PRN (
    BLUEPRINT 						smallint NULL ,
    CUSTOMSEGMENTSTRING 			varchar(32) NULL ,
    DATEFONTBOLD 					smallint NULL ,
    DATEFONTCHARSET 				smallint NULL ,
    DATEFONTITALIC 					smallint NULL ,
    DATEFONTSIZE 					smallint NULL ,
    DIMELEVATIONENDPOINT 			smallint NULL ,
    DIMENSIONSFONTBOLD 				smallint NULL ,
    DIMENSIONSFONTCHARSET 			smallint NULL ,
    DIMENSIONSFONTITALIC 			smallint NULL ,
    DIMENSIONSFONTNAME 				varchar(32) NULL ,
    DIMENSIONSFONTSIZE 				smallint NULL ,
    DIM_GR_HEIGHTS 					smallint NULL ,
    DIM_SHELF_DEPTHS 				smallint NULL ,
    DIST_RELATIVE 					smallint NULL ,
    FILENAMEFONTBOLD 				smallint NULL ,
    FILENAMEFONTCHARSET 			smallint NULL ,
    FILENAMEFONTITALIC 				smallint NULL ,
    FILENAMEFONTNAME 				varchar (32) NULL ,
    FILENAMEFONTSIZE 				smallint NULL ,
    FIRST_PEG_HEIGHT 				smallint NULL ,
    FIRST_PEG_LENGTH 				smallint NULL ,
    FIRSTSEGMENT 					smallint NULL ,
    FIXEL_DISTANCES 				smallint NULL ,
    IGNORENONSEGMENTOBJECTS 		smallint NULL ,
    INCLUDEDIMENSIONS 				smallint NULL ,
    INCLUDEFILENAME 				smallint NULL ,
    INCLUDELOGOS 					smallint NULL ,
    INCLUDENOTES 					smallint NULL ,
    INCLUDEOUTPUTDESIGNERTEMPLATE 	smallint NULL ,
    INCLUDEPAGENUMBER 				smallint NULL ,
    INCLUDETIME 					smallint NULL ,
    LASTSEGMENT 					smallint NULL ,
    LOGOFILENAME 					varchar(128) NULL ,
    NOTEPOSITION 					smallint NULL ,
    OUTPUTDESIGNERTEMPLATEFILENAME 	varchar(128) NULL ,
    PAGENUMBERFORMAT 				smallint NULL ,
    PLN_ID 							int NOT NULL ,
    PRIMARYHORIZONTALROTATION 		smallint NULL ,
    PRIMARYSTRETCHTOFIT 			smallint NULL ,
    PRIMARYVERTICALROTATION 		smallint NULL ,
    PRIMARYVIEW 					smallint NULL ,
    PRINTSEGMENTNUMBER 				smallint NULL ,
    SECONDARYHORIZONTALROTATION 	smallint NULL ,
    SECONDARYSTRETCHTOFIT 			smallint NULL ,
    SECONDARYVERTICALROTATION 		smallint NULL ,
    SECONDARYVIEW 					smallint NULL ,
    SEGMENTDESCRIPTIONFONTBOLD 		smallint NULL ,
    SEGMENTDESCRIPTIONFONTCHARSET 	smallint NULL ,
    SEGMENTDESCRIPTIONFONTITALIC 	smallint NULL ,
    SEGMENTDESCRIPTIONFONTNAME 		varchar (32) NULL ,
    SEGMENTDESCRIPTIONFONTSIZE 		smallint NULL ,
    SEGMENTEVERY 					float NULL ,
    SEGMENTFROM 					float NULL ,
    SEGMENTOPTION 					smallint NULL ,
    SEGMENTTO 						float NULL ,
    SEGMENTSPLIT 					smallint NULL ,
    SEG_WIDTHS_ARROWS 				smallint NULL ,
    SELECTSEGMENT 					smallint NULL ,
    SHOWDATE 						smallint NULL ,
    SHOWHORZRULER 					smallint NULL ,
    SHOWTEXTBOXES 					smallint NULL ,
    SHOWTITLE 						smallint NULL ,
    SHOWSUBTITLE 					smallint NULL ,
    SHOWVERTRULER 					smallint NULL ,
    SPLIT 							smallint NULL ,
    STORE_ID 						varchar (32) NOT NULL ,
    SUBTITLEFONTBOLD 				smallint NULL ,
    SUBTITLEFONTCHARSET 			smallint NULL ,
    SUBTITLEFONTITALIC 				smallint NULL ,
    SUBTITLEFONTNAME 				varchar (32) NULL ,
    SUBTITLEFONTSIZE 				smallint NULL ,
    TIMEFONTBOLD 					smallint NULL ,
    TIMEFONTCHARSET 				smallint NULL ,
    TIMEFONTITALIC 					smallint NULL ,
    TIMEFONTNAME 					varchar (32) NULL ,
    TIMEFONTSIZE 					smallint NULL ,
    TITLEFONTBOLD 					smallint NULL ,
    TITLEFONTCHARSET 				smallint NULL ,
    TITLEFONTITALIC 				smallint NULL ,
    TITLEFONTNAME 					varchar (32) NULL ,
    TITLEFONTSIZE 					smallint NULL ,
    TRAFFIC_ARROW 					smallint NULL ,
	LEGENDFONTBOLD 					smallint NULL , 
	LEGENDFONTCHARSET 				smallint NULL , 
	LEGENDFONTITALIC 				smallint NULL , 
	LEGENDFONTNAME 					varchar(32) NULL , 
	LEGENDFONTSIZE 					smallint NULL , 
	LEGENDLOCATION 					smallint NULL ,
	NOTESFONTBOLD 					smallint NULL , 
	NOTESFONTCHARSET 				smallint NULL , 
	NOTESFONTITALIC 				smallint NULL , 
	NOTESFONTNAME 					varchar(32) NULL , 
	NOTESFONTSIZE 					smallint NULL ,
	ORIENTATION 					smallint NULL , 
	PRINTLEGEND 					smallint NULL ,
)
GO

ALTER TABLE ACN_PRN WITH NOCHECK ADD
    CONSTRAINT PK_ACN_PRN PRIMARY KEY NONCLUSTERED
    (
        PLN_ID,
        STORE_ID
    )
GO

GRANT SELECT, UPDATE, INSERT, DELETE ON ACN_PRN TO PUBLIC
GO


CREATE TABLE ACN_SECTION (
    PLN_ID 				int NOT NULL ,
    BASE_WIDTH 			float NULL ,
    BASE_HEIGHT 		float NULL ,
    FILL_COLOR 			smallint NULL ,
    BASE_DEPTH 			float NULL ,
    NOTCH_WIDTH 		float NULL ,
    NOTCH_SPACING 		float NULL ,
    NOTCH_START 		float NULL ,
    HORIZ_START 		float NULL ,
    SEGMENT_WIDTH 		float NULL ,
    HORIZ_SPACING 		float NULL ,
    VERT_SPACING 		float NULL ,
    VERT_START 			float NULL ,
    BACK_DEPTH 			float NULL ,
    DEPTH 				float NULL ,
    WIDTH 				float NULL ,
    TRAFFIC_FLOW 		smallint NULL ,
    Y 					float NULL ,
    Z 					float NULL ,
    X 					float NULL ,
    MIN_Y 				float NULL ,
    MIN_X 				float NULL ,
    ALLOW_OVERLAP 		smallint NULL ,
    MIN_Z 				float NULL ,
    HEIGHT 				float NULL ,
    AISLE 				varchar (32) NULL ,
    SECTION_NAME 		varchar (32) NULL ,
    GONDOLA 			varchar (32) NULL ,
    DEPARTMENT 			varchar (32) NULL ,
    SECTION_ID 			varchar (32) NOT NULL ,
    COLOUR 				int NULL, 
    COLOURISCLEAR 		smallint NULL, 
    FILL_PATTERN 		smallint NULL,
)
GO

ALTER TABLE ACN_SECTION WITH NOCHECK ADD
    CONSTRAINT PK_ACN_SECTION PRIMARY KEY NONCLUSTERED
    (
        PLN_ID,
        SECTION_ID
    )
GO

GRANT SELECT, UPDATE, INSERT, DELETE ON ACN_SECTION TO PUBLIC
GO

CREATE TABLE ACN_FIXEL (
    PLN_ID 					int NOT NULL ,
    FIT_TYPE 				smallint NULL ,
    LEFT_OVERHANG 			float NULL ,
    RIGHT_OVERHANG 			float NULL ,
    PLACEMENT 				smallint NULL ,
    MIN_DEEP 				smallint NULL ,
    MIN_HIGH 				smallint NULL ,
    MAX_DEEP 				smallint NULL ,
    FILL_MODE 				smallint NULL ,
    FRONT_OVERHANG 			float NULL ,
    BASKET_FILL 			smallint NULL ,
    MAX_HIGH 				smallint NULL ,
    SPREAD_PRODUCTS 		smallint NULL ,
    BACK_OVERHANG 			float NULL ,
    UPPER_OVERHANG 			float NULL ,
    LOWER_OVERHANG 			float NULL ,
    FRAME_ELEMENT 			smallint NULL ,
    ANGLE 					float NULL ,
    OCCUPANCY 				smallint NULL ,
    FLIPPED 				smallint NULL ,
    NOTCH_SNAP_Y 			float NULL ,
    AUTO_CRUSH 				smallint NULL ,
    TANGENT 				float NULL ,
    DIM_WIDTH 				smallint NULL ,
    COMBINE 				smallint NULL ,
    DIM_ELEVATION 			smallint NULL ,
    ALLOW_OVERLAP 			smallint NULL ,
    LABEL_ON 				smallint NULL ,
    DRAW 					smallint NULL ,
    AVAILABLE 				float NULL ,
    GRILL 					float NULL ,
    SPACER_THICK 			float NULL ,
    FILL_COLOR 				smallint NULL ,
    ROTATION 				smallint NULL ,
    FINGER_SPACE 			float NULL ,
    SEGMENT 				smallint NULL ,
    NOTCH_POSITION 			smallint NULL ,
    RISE 					float NULL ,
    DEPTH 					float NULL ,
    TYPE 					smallint NULL ,
    HEIGHT 					float NULL ,
    WIDTH 					float NULL ,
    THICKNESS 				float NULL ,
    X 						float NULL ,
    SLOPE 					smallint NULL ,
    Z 						float NULL ,
    Y 						float NULL ,
    GRID_TYPE 				smallint NULL ,
    HORIZ_GAP 				float NULL ,
    SP_TOP 					float NULL ,
    MAX_MERCH 				float NULL ,
    FRONT 					float NULL ,
    HORIZ_SPACING 			float NULL ,
    VERT_SPACING 			float NULL ,
    DEP_SPACING 			float NULL ,
    HORIZ_START 			float NULL ,
    VERT_START 				float NULL ,
    DEP_START 				float NULL ,
    HORIZ_END 				float NULL ,
    VERT_END 				float NULL ,
    DEP_END 				float NULL ,
    GRILL_SLOPE 			float NULL ,
    GRILL_HEIGHT 			float NULL ,
    ASSEMBLY 				varchar (32) NULL ,
    ATTACHED_TO 			varchar (32) NULL ,
    LABEL 					varchar (255) NULL ,
    TEXTFIELD 				varchar (255) NULL ,
    FIXEL_NAME 				varchar (32) NULL ,
    FIXEL_ID 				varchar (32) NOT NULL ,
    SECTION_ID 				varchar (32) NULL ,
    FONTID 					varchar (50) NULL ,
    COLOUR 					int NULL, 
    COLOURISCLEAR 			smallint NULL, 
    FILL_PATTERN 			smallint NULL, 
    TEXTBOX_WORD_WRAP 		smallint NULL, 
    MANUFACTURER			varchar (32) NULL,
    TEXTBOX_REDUCE_TO_FIT 	smallint NULL,
	DEPTHSLOTSPACING 		float NULL, 
	DEPTHSLOTSTART 			float NULL, 
	HORIZSLOTSPACING 		float NULL, 
	HORIZSLOTSTART 			float NULL, 
	LOCALX 					float NULL, 
	LOCALY 					float NULL, 
	LOCALZ 					float NULL, 
	SLOT_ORIENTATION 		smallint NULL, 
	SNAPTOSLOT 				smallint NULL,
	FIXED					smallint NULL,
	FIXTUREDISTANCE			float NULL,
	treatassign 			smallint NULL,
)
GO

ALTER TABLE ACN_FIXEL WITH NOCHECK ADD
    CONSTRAINT PK_ACN_FIXEL PRIMARY KEY NONCLUSTERED
    (
        PLN_ID,
        FIXEL_ID
    )
GO

GRANT SELECT, UPDATE, INSERT, DELETE ON ACN_FIXEL TO PUBLIC
GO


CREATE TABLE ACN_FONT (
    PLN_ID 				int NOT NULL ,
    COLLECTION_ID 		varchar (32) NULL ,
    BOLD 				smallint NULL ,
    CHARSET 			smallint NULL ,
    ITALIC 				smallint NULL ,
    FONT_NAME 			varchar (50) NULL ,
    SIZE_VAL 			float NULL ,
    STRIKETHROUGH 		smallint NULL ,
    UNDERLINE 			smallint NULL ,
    WEIGHT 				smallint NULL ,
    COLOUR 				smallint NULL ,
)
GO

GRANT SELECT, UPDATE, INSERT, DELETE ON ACN_FONT TO PUBLIC
GO

CREATE INDEX IX_COLLECTION_ID ON ACN_FONT (COLLECTION_ID)
GO

CREATE TABLE ACN_POSITION (
    PLN_ID 				int NOT NULL ,
    FIXEL_ID 			varchar (32) NULL ,
    POSITION_ID 		varchar (50) NOT NULL ,
    POS_ORDER 			smallint NULL ,
    X 					float NULL ,
    Y 					float NULL ,
    Z 					float NULL ,
    FIXED 				smallint NULL ,
    SHELF_TAGS 			smallint NULL ,
    MERCH_STYLE 		smallint NULL ,
    CAP_STYLE 			smallint NULL ,
    DEPTH_FILL 			smallint NULL ,
    PEG_ID 				varchar (32) NULL ,
    HORIZONTAL 			smallint NULL ,
    VERTICAL 			smallint NULL ,
    TOTAL_UNITS 		smallint NULL ,
    SHELF_LOC 			smallint NULL ,
    HORIZ_SPACE 		float NULL ,
    VERT_SPACE 			float NULL ,
    DEPTH_SPACE 		float NULL ,
    DIRECTION 			smallint NULL ,
    SLOPE 				smallint NULL ,
    ORIENTATION 		smallint NULL ,
    REQ_INV 			smallint NULL ,
    H_REMAIN 			smallint NULL ,
    V_REMAIN 			smallint NULL ,
    D_REMAIN 			smallint NULL ,
    FIT_TYPE 			smallint NULL ,
    LOCATION_ID 		varchar (20) NULL ,
    DEPTH_FACINGS 		smallint NULL ,
    PRODUCT_ID 			varchar (32) NULL ,
    SECTION_ID 			varchar (32) NULL ,
    HIGHLIGHT 			smallint NULL ,
    PEG_ROW 			smallint NULL ,
    PEG_COL 			smallint NULL ,
    TOTAL_FACINGS 		smallint NULL ,
    MAX_UNITS 			smallint NULL ,
    FILL_COLOR 			smallint NULL ,
    PEG 				smallint NULL ,
    HORIZ_CRUSH 		float NULL ,
    VERT_CRUSH 			float NULL ,
    DEPTH_CRUSH 		float NULL ,
	AUTOFILLPEG 		smallint NULL ,
	BACKDEPTHCRUSH 		float NULL ,
	BACKDEPTHFACINGS 	smallint NULL ,
	BACKHORIZCRUSH 		float NULL ,
	BACKHORIZONTAL 		smallint NULL ,
	BACKMERCHSTYLE 		smallint NULL ,
	BACKORIENTATION		smallint NULL ,
	BACKVERTCRUSH 		float NULL ,
	BACKVERTICAL 		smallint NULL ,
	COMPLEX 			smallint NULL ,
	CONTAINERPOSITIONID varchar(32) NULL ,
	LEFTDEPTHCRUSH 		float NULL ,
	LEFTDEPTHFACINGS 	smallint NULL ,
	LEFTHORIZCRUSH 		float NULL ,
	LEFTHORIZONTAL 		smallint NULL ,
	LEFTVERTCRUSH 		float NULL ,
	LEFTVERTICAL 		smallint NULL ,
	LEFTMERCHSTYLE 		smallint NULL ,
	LEFTORIENTATION 	smallint NULL ,
	PEGSPREAD 			smallint NULL ,
	RIGHTDEPTHCRUSH 	float NULL ,
	RIGHTDEPTHFACINGS 	smallint NULL ,
	RIGHTHORIZCRUSH 	float NULL ,
	RIGHTHORIZONTAL 	smallint NULL ,
	RIGHTMERCHSTYLE 	smallint NULL ,
	RIGHTORIENTATION 	smallint NULL ,
	RIGHTVERTCRUSH 		float NULL ,
	RIGHTVERTICAL 		float NULL ,
	ROTATION 			smallint NULL ,
	SHAREDPEGID 		varchar(32) NULL ,
	TOPDEPTHCRUSH 		float NULL ,
	TOPDEPTHFACINGS 	smallint NULL ,
	TOPHORIZCRUSH 		float NULL ,
	TOPHORIZONTAL 		smallint NULL ,
	TOPMERCHSTYLE 		smallint NULL ,
	TOPORIENTATION		smallint NULL ,
	TOPVERTCRUSH 		float NULL ,
	TOPVERTICAL 		smallint NULL ,
	RANKX 				int NULL ,
	RANKY 				int NULL ,
	RANKZ 				int NULL ,
	PEGSPERFACING		smallint NULL ,
	TOTALPEGS			smallint NULL ,
)
GO

ALTER TABLE ACN_POSITION WITH NOCHECK ADD
    CONSTRAINT PK_ACN_POSITION PRIMARY KEY NONCLUSTERED
    (
        PLN_ID,
        POSITION_ID
    )
GO

GRANT SELECT, UPDATE, INSERT, DELETE ON ACN_POSITION TO PUBLIC
GO

CREATE INDEX IX_FIXEL_ID ON ACN_POSITION (FIXEL_ID)
GO

CREATE TABLE ACN_T_PRODUCT (
    PRODUCT_ID 			varchar (32) NOT NULL ,
    UPC 				varchar (32) NULL ,
    PROD_NAME 			varchar (50) NULL ,
    PROD_SIZE 			float NULL ,
    UOM 				varchar (5) NULL ,
    MANUFACTURER 		varchar (32) NULL ,
    CATEGORY 			varchar (32) NULL ,
    DESC_A 				varchar (100) NULL ,
    DESC_B 				varchar (100) NULL ,
    DESC_C 				varchar (100) NULL ,
    DESC_D 				varchar (100) NULL ,
    DESC_E 				varchar (100) NULL ,
    DESC_F 				varchar (100) NULL ,
    DESC_G 				varchar (100) NULL ,
    DESC_H 				varchar (100) NULL ,
    DESC_I 				varchar (100) NULL ,
    DESC_J 				varchar (100) NULL ,
    KEY_VAL				varchar (32) NULL ,
    FILL_COLOR 			smallint NULL ,
    PACKAGE_TYPE 		smallint NULL ,
    SHAPE_ID 			varchar (50) NULL ,
    HEIGHT 				float NULL ,
    WIDTH 				float NULL ,
    DEPTH 				float NULL ,
    TRAY_HEIGHT 		float NULL ,
    TRAY_WIDTH 			float NULL ,
    TRAY_DEPTH 			float NULL ,
    UNITS_CASE 			smallint NULL ,
    UNITS_CASE_HIGH 	smallint NULL ,
    UNITS_CASE_WIDE 	smallint NULL ,
    UNITS_CASE_DEEP 	smallint NULL ,
    UNITS_TRAY 			smallint NULL ,
    UNITS_TRAY_HIGH 	smallint NULL ,
    UNITS_TRAY_WIDE 	smallint NULL ,
    UNITS_TRAY_DEEP 	smallint NULL ,
    PEG_1_RIGHT 		float NULL ,
    PEG_1_DOWN 			float NULL ,
    VERT_NEST 			float NULL ,
    HORIZ_NEST 			float NULL ,
    DEPTH_NEST 			float NULL ,
    BASKET_FACTOR 		smallint NULL ,
    DEPTH_FILL 			smallint NULL ,
    STD_ORIENT 			smallint NULL ,
    STD_PEG 			varchar (32) NULL ,
    FIT_TYPE 			smallint NULL ,
    PREFERRED_FIXEL 	varchar (15) NULL ,
    RANK 				varchar (6) NULL ,
    HANG 				smallint NULL ,
    FRONT_0 			smallint NULL ,
    FRONT_90 			smallint NULL ,
    FRONT_180 			smallint NULL ,
    FRONT_270 			smallint NULL ,
    BACK_0 				smallint NULL ,
    BACK_90 			smallint NULL ,
    BACK_180 			smallint NULL ,
    BACK_270 			smallint NULL ,
    LEFT_0 				smallint NULL ,
    LEFT_90 			smallint NULL ,
    LEFT_180 			smallint NULL ,
    LEFT_270 			smallint NULL ,
    RIGHT_0 			smallint NULL ,
    RIGHT_90 			smallint NULL ,
    RIGHT_180 			smallint NULL ,
    RIGHT_270 			smallint NULL ,
    TOP_0 				smallint NULL ,
    TOP_90 				smallint NULL ,
    TOP_180 			smallint NULL ,
    TOP_270 			smallint NULL ,
    BOTTOM_0 			smallint NULL ,
    BOTTOM_90 			smallint NULL ,
    BOTTOM_180 			smallint NULL ,
    BOTTOM_270 			smallint NULL ,
    UNIT_COST 			float NULL ,
    CASE_HEIGHT 		float NULL ,
    CASE_WIDTH 			float NULL ,
    CASE_DEPTH 			float NULL ,
    DISPLAY_HEIGHT 		float NULL ,
    DISPLAY_WIDTH 		float NULL ,
    DISPLAY_DEPTH 		float NULL ,
    PEG_2_RIGHT 		float NULL ,
    PEG_2_DOWN 			float NULL ,
    PEG_3_RIGHT 		float NULL ,
    PEG_3_DOWN 			float NULL ,
    STD_PEG_HOLE 		smallint NULL ,
    OVERHANG 			float NULL ,
    MIN_FACINGS 		smallint NULL ,
    MAX_FACINGS 		smallint NULL ,
    PEG_NEST 			float NULL ,
    MAX_HORIZ_CRUSH 	float NULL ,
    MAX_VERT_CRUSH 		float NULL ,
    MAX_DEPTH_CRUSH 	float NULL ,
    COLOUR 				int NULL, 
    COLOURISCLEAR 		smallint NULL,
	CONTAINDEPTH 		float NULL,
	CONTAINHEIGHT 		float NULL,
	CONTAINWIDTH 		float NULL,
	PEG_1_DEPTH 		float NULL,
    HORIZ_GAP 			float NULL ,
    VERT_GAP 			float NULL ,
    MERCH_STYLE 		smallint NULL ,
    CAP_STYLE 			smallint NULL ,
    FULL_FACINGS 		smallint NULL ,
    MAX_HIGH 			smallint NULL ,
    MAX_DEEP 			smallint NULL ,
    MIN_HIGH 			smallint NULL ,
    MIN_DEEP 			smallint NULL ,
    CONTAINER 			smallint NULL ,
    PEGSPERFACING		smallint NULL , 
    LOCATION_ID			varchar (32) NULL ,

    UseImageOverride            smallint NULL,
    UseUnitImageForTraysAndCases        smallint NULL,
    ImageOverride               varchar (255) NULL,    
	Brand				varchar(100) NULL ,
	Subcategory 		varchar(100) NULL ,
)
GO

ALTER TABLE ACN_T_PRODUCT WITH NOCHECK ADD
    CONSTRAINT PK_ACN_T_PRODUCT PRIMARY KEY NONCLUSTERED
    (
        PRODUCT_ID
    )
GO

GRANT SELECT, UPDATE, INSERT, DELETE ON ACN_T_PRODUCT TO PUBLIC
GO

CREATE INDEX IX_MANUFACTURER ON ACN_T_PRODUCT (MANUFACTURER)
GO

CREATE INDEX IX_CATEGORY ON ACN_T_PRODUCT (CATEGORY)
GO

select * into ACN_PRODUCT
from ACN_T_PRODUCT
where 1=0
GO

ALTER TABLE ACN_PRODUCT WITH NOCHECK ADD
    CONSTRAINT PK_ACN_PRODUCT PRIMARY KEY NONCLUSTERED
    (
        PRODUCT_ID
    )
GO

GRANT SELECT, UPDATE, INSERT, DELETE ON ACN_PRODUCT TO PUBLIC
GO

CREATE INDEX IX_CATEGORY ON ACN_PRODUCT (CATEGORY)
GO

CREATE INDEX IX_MANUFACTURER ON ACN_PRODUCT (MANUFACTURER)
GO

CREATE TABLE ACN_PRODUCT_PLN (
    PLN_ID 				int NOT NULL ,
	ACTION				smallint NULL ,
	TIMESTAMP			float NULL ,
	LINKPRODUCTID		varchar (32) NULL ,
    PRICE 				float NULL ,
    PRICE_2 			float NULL ,
    PRODUCT_ID 			varchar (32) NOT NULL ,
    PROMO_MOVEMENT 		float NULL ,
    REG_MOVEMENT 		float NULL ,
    SHARE_VAL			float NULL ,
    MANUAL_INV 			smallint NULL ,    
    PRICE_MULTIPLE 		smallint NULL ,
    COST_BASIS 			smallint NULL ,
    COST 				float NULL ,
    COST_2 				float NULL ,
    MOVEMENT_BASIS 		smallint NULL ,
    DISCOUNT 			float NULL ,
    DISCOUNT_PER 		float NULL ,
    NET_DISCOUNT_PER 	float NULL ,
    TAX_CODE 			smallint NULL ,
    TAX_PER 			float NULL ,
)
GO

ALTER TABLE ACN_PRODUCT_PLN WITH NOCHECK ADD
    CONSTRAINT PK_ACN_PRODUCT_PLN PRIMARY KEY NONCLUSTERED
    (
        PLN_ID,
        PRODUCT_ID
    )
GO

GRANT SELECT, UPDATE, INSERT, DELETE ON ACN_PRODUCT_PLN TO PUBLIC
GO

CREATE PROCEDURE delProducts
@Dummy varchar(1) = '%'
AS
DELETE FROM ACN_PRODUCT
WHERE ACN_PRODUCT.PRODUCT_ID
IN (SELECT PRODUCT_ID FROM ACN_T_PRODUCT)
GO

GRANT EXECUTE ON delProducts TO PUBLIC
GO

CREATE PROCEDURE insProducts
@Dummy varchar(1) = '%'
AS
INSERT INTO ACN_PRODUCT
SELECT * FROM ACN_T_PRODUCT
GO

GRANT EXECUTE ON insProducts TO PUBLIC
GO

