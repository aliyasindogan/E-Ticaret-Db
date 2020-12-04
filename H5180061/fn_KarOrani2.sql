





create function fn_KarOrani2
(
	@UrunId int
)
returns decimal
as
begin

	declare @TotalAl��Fiyat� money
	declare @TotalSat��Fiyat� money
	declare @KarOran� decimal
	declare @TotalAdet int

	set @TotalAl��Fiyat� = (select sum(AlisFiyati*Adet) from tbl_Urun where Id=@UrunId)
	set @TotalSat��Fiyat� = (select sum(us.SatisFiyati*us.Adet) from tbl_Urun u, tbl_UrunStok us 
	where u.Id=us.UrunId and u.Id=@UrunId)
	set @TotalAdet = (select sum(us.Adet) from tbl_Urun u, tbl_UrunStok us 
	where u.Id=us.UrunId and u.Id=@UrunId)

	set @KarOran� = (@TotalSat��Fiyat�-@TotalAl��Fiyat�)*100/@TotalAl��Fiyat�

	return @KarOran�
end


select dbo.fn_KarOrani2(11) as 'Kar Oran�'

select sum(Adet) from tbl_Urun where Marka='a' and Ad='b'

select * from tbl_Urun
