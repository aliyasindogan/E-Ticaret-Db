

alter procedure usp_UrunStokEkle
(
	@Marka nvarchar(50),
	@Ad nvarchar(50),
	@AlisFiyati money,
	@SatisFiyati money,
	@EklenenAdet int
	
)
as
begin
		declare @UrunId int
		declare @StokId int
		declare @StokAdet int

		set @UrunId = (select u.Id from tbl_Urun u where Marka=@Marka and Ad=@Ad and AlisFiyati=@AlisFiyati and SatisFiyati=@SatisFiyati)
		set @StokId = (select s.Id from tbl_UrunStok s where s.UrunId=@UrunId)
		
		update tbl_UrunStok
		set Adet=Adet+@EklenenAdet where Id=@StokId and AlisFiyati=@AlisFiyati and SatisFiyati=@SatisFiyati
end

exec usp_UrunStokEkle 'AA','BB','1100','2000','1'

select * from tbl_Urun

select * from tbl_UrunStok us, tbl_Urun u where u.Id=us.UrunId