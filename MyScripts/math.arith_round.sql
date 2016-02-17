use TSQL2012
GO

if object_id('arith_round') is not null drop function arith_round;
GO

create function arith_round(
	@inVal as float
)
returns float
as
begin
/*	
	author:		Kamil Zieñ
	email:		kamilxzien@gmail.com
	purpose:	to calculate value rounded to the second position on the right from the decimal point using basic arightmetic operations
*/

declare @scale		int= power(10,2) 

declare @scalInVal	float = @inVal * @scale;
declare @decPart	float

select @decPart = IIf(@scalInVal < 16384, @scalInVal, @scalInVal - 16384);
select @decPart = IIf(@decPart < 8192, @decPart, @decPart - 8192);
select @decPart = IIf(@decPart < 4096, @decPart, @decPart - 4096);
select @decPart = IIf(@decPart < 2048, @decPart, @decPart - 2048);
select @decPart = IIf(@decPart < 1024, @decPart, @decPart - 1024);
select @decPart = IIf(@decPart < 512, @decPart, @decPart - 512);
select @decPart = IIf(@decPart < 256, @decPart, @decPart - 256);
select @decPart = IIf(@decPart < 128, @decPart, @decPart - 128);
select @decPart = IIf(@decPart < 64, @decPart, @decPart - 64);
select @decPart = IIf(@decPart < 32, @decPart, @decPart - 32);
select @decPart = IIf(@decPart < 16, @decPart, @decPart - 16);
select @decPart = IIf(@decPart < 8, @decPart, @decPart - 8);
select @decPart = IIf(@decPart < 4, @decPart, @decPart - 4);
select @decPart = IIf(@decPart < 2, @decPart, @decPart - 2);
select @decPart = IIf(@decPart < 1, @decPart, @decPart - 1);

return (@scalInVal - @decPart) / @scale;

end
go

select dbo.arith_round(123.12342132112323);

