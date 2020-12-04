





create function fn_KarOrani2
(
	@UrunId int
)
returns decimal
as
begin

	declare @TotalAlışFiyatı money
	declare @TotalSatışFiyatı money
	declare @KarOranı decimal
	declare @TotalAdet int

	set @TotalAlışFiyatı = (select sum(AlisFiyati*Adet) from tbl_Urun where Id=@UrunId)
	set @TotalSatışFiyatı = (select sum(us.SatisFiyati*us.Adet) from tbl_Urun u, tbl_UrunStok us 
	where u.Id=us.UrunId and u.Id=@UrunId)
	set @TotalAdet = (select sum(us.Adet) from tbl_Urun u, tbl_UrunStok us 
	where u.Id=us.UrunId and u.Id=@UrunId)

	set @KarOranı = (@TotalSatışFiyatı-@TotalAlışFiyatı)*100/@TotalAlışFiyatı

	return @KarOranı
end


select dbo.fn_KarOrani2(11) as 'Kar Oranı'

select sum(Adet) from tbl_Urun where Marka='a' and Ad='b'

select * from tbl_Urun
