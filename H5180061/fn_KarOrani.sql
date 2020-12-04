


alter function fn_KarOrani
(
	@Marka nvarchar(50),
	@Ad nvarchar(50)
)
returns decimal
as
begin
	declare @sayac int = 0
	declare @ToplamKayýt int
	declare @AlýþFiyatý money
	declare @SatýþFiyatý money
	declare @Adet int
	declare @KarOraný decimal
	declare @TotalKarOraný decimal = 0
	declare @YüzdelikPay decimal
	declare @ToplamAdet int

	set @ToplamKayýt = (select Count(*) from tbl_Urun)
	
	
	while @sayac < @ToplamKayýt
	begin
	set @sayac = @sayac + 1;
	set @AlýþFiyatý = (select AlisFiyati from tbl_Urun where Id=@sayac and Marka=@Marka and Ad=@Ad)
	set @SatýþFiyatý = (select SatisFiyati from tbl_Urun where Id=@sayac and Marka=@Marka and Ad=@Ad)
	set @Adet = (select Top(@sayac)Adet from tbl_Urun where Id=@sayac and Marka=@Marka and Ad=@Ad)
	set @ToplamAdet = (select sum(Adet) from tbl_Urun where Marka=@Marka and Ad=@Ad)
		if @AlýþFiyatý>1 begin
		set @KarOraný = (@SatýþFiyatý-@AlýþFiyatý)*100/@AlýþFiyatý
		set @YüzdelikPay = @Adet/@ToplamAdet*100
		set @KarOraný = @KarOraný*@YüzdelikPay/100
		set @TotalKarOraný = @TotalKarOraný + @KarOraný*@YüzdelikPay/100
		end
	end
	return @TotalKarOraný
end


select dbo.fn_KarOrani('a','b')

select sum(Adet) from tbl_Urun where Marka='a' and Ad='b'
