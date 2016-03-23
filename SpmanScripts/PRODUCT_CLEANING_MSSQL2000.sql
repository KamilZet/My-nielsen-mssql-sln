
/************************************************************
Please replace the name for the target database				 
************************************************************/
USE SPACEMAN--<<<
GO

/************************************************************
INIT:
Developer:	Kamil Zien
Date:		2016-02-25
Purpose:	Remove all products 
			NOT referenced on any of the planograms
			existing inside the connectivity database

UPDATES:
#1
Developer:	Kamil Zien
Date:		2016-03-07
Purpose:	datetime2 replaced with datetime to provide backward compatibility feature

#2
Developer:	Kamil Zien
Date:		2016-03-16
Purpose:	query syntax to be complient with sql server 2000

************************************************************/

IF object_id('dbo.ProductArchive') is null
SELECT
	*
	,CAST(GETDATE() AS DATETIME) /*#1 as datetime2*/	AS removalDate
	,CAST('x' AS NVARCHAR(255))							AS removalUser
INTO
	dbo.ProductArchive
FROM
	ACN_PRODUCT
WHERE
	1 = 0;
GO


BEGIN tran DeleteUnusedProducts;

/*#2 will not be compiled in mssql 2000*/
--WITH UnusedProducts as(
--SELECT
--	product_id
--FROM ACN_PRODUCT EXCEPT SELECT
--	product_id
--FROM ACN_PRODUCT_PLN)

INSERT INTO dbo.productArchive
	SELECT
		*
		,GETDATE()
		,SUSER_NAME()
	FROM
		ACN_PRODUCT allProducts
		LEFT JOIN ACN_PRODUCT_PLN usedProducts ON allProducts.product_id = usedProducts.product_id
	WHERE
		usedProducts.product_id IS NULL;


DELETE allProducts
/*#2 will not be compiled in mssql 2000*/
--OUTPUT
--		DELETED.*,
--		GETDATE(),
--		SUSER_NAME()
--		INTO dbo.ProductArchive
	FROM ACN_PRODUCT allProducts
	LEFT JOIN ACN_PRODUCT_PLN usedProducts
		ON allProducts.product_id = usedProducts.product_id
WHERE usedProducts.product_id IS NULL;

COMMIT tran DeleteUnusedProducts;