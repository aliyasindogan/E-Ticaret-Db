


alter function fn_KarOrani
(
	@Marka nvarchar(50),
	@Ad nvarchar(50)
)
returns decimal
as
begin
	declare @sayac int = 0
	declare @ToplamKay�t int
	declare @Al��Fiyat� money
	declare @Sat��Fiyat� money
	declare @Adet int
	declare @KarOran� decimal
	declare @TotalKarOran� decimal = 0
	declare @Y�zdelikPay decimal
	declare @ToplamAdet int

	set @ToplamKay�t = (select Count(*) from tbl_Urun)
	
	
	while @sayac < @ToplamKay�t
	begin
	set @sayac = @sayac + 1;
	set @Al��Fiyat� = (select AlisFiyati from tbl_Urun where Id=@sayac and Marka=@Marka and Ad=@Ad)
	set @Sat��Fiyat� = (select SatisFiyati from tbl_Urun where Id=@sayac and Marka=@Marka and Ad=@Ad)
	set @Adet = (select Top(@sayac)Adet from tbl_Urun where Id=@sayac and Marka=@Marka and Ad=@Ad)
	set @ToplamAdet = (select sum(Adet) from tbl_Urun where Marka=@Marka and Ad=@Ad)
		if @Al��Fiyat�>1 begin
		set @KarOran� = (@Sat��Fiyat�-@Al��Fiyat�)*100/@Al��Fiyat�
		set @Y�zdelikPay = @Adet/@ToplamAdet*100
		set @KarOran� = @KarOran�*@Y�zdelikPay/100
		set @TotalKarOran� = @TotalKarOran� + @KarOran�*@Y�zdelikPay/100
		end
	end
	return @TotalKarOran�
end


select dbo.fn_KarOrani('a','b')

select sum(Adet) from tbl_Urun where Marka='a' and Ad='b'
