create proc spNestLvl
as
begin
declare @nl int = @@nestlevel
exec spNestLvl
end
go


exec spNestLvl

