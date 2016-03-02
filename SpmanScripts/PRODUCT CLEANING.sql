USE SPACEMAN
GO

/************************************************************
Developer:	Kamil Zien
Date:		2016-02-25
Purpose:	Remove all products 
			NOT referenced on any of the planograms
			existing inside the connectivity database
************************************************************/

IF object_id('dbo.ProductArchive') is null
SELECT
	*
	,CAST(GETDATE() AS DATETIME2)	AS removalDate
	,CAST('x' AS NVARCHAR(255))		AS removalUser
INTO
	dbo.ProductArchive
FROM
	ACN_PRODUCT
WHERE
	1 = 0
GO

BEGIN tran DeleteUnusedProducts;

;
WITH UnusedProducts as(
SELECT
	product_id
FROM ACN_PRODUCT EXCEPT SELECT
	product_id
FROM ACN_PRODUCT_PLN)

DELETE a
	OUTPUT
		DELETED.*,
		GETDATE(),
		SUSER_NAME()
		INTO dbo.ProductArchive
	FROM ACN_PRODUCT a
	INNER JOIN UnusedProducts b
		ON a.product_id = b.product_id

COMMIT tran DeleteUnusedProducts;