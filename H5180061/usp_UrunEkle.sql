



alter procedure usp_UrunEkle
(
	@Marka nvarchar(50),
	@Ad nvarchar(50),
	@Adet int,
	@AlisFiyati money,
	@SatisFiyati money,
	@Tur nvarchar(20)
)
as
begin
		declare @TurId int
		declare @UrunId int
		declare @StokAlisFiyat money
		declare @StokAdet int

		set @TurId = (select top(1)Id from tbl_Tur t where t.Turu=@Tur)
		insert into tbl_Urun(Marka, Ad, Adet, AlisFiyati, SatisFiyati, TurId)
		values (@Marka, @Ad, @Adet, @AlisFiyati, @SatisFiyati, @TurId)
		set @UrunId = (select top(1)u.Id from tbl_Urun u order by Id desc)
		set @StokAlisFiyat = (select top(1)u.AlisFiyati from tbl_Urun u order by Id desc)
		set @StokAdet = (select top(1)u.Adet from tbl_Urun u order by Id desc)
		insert into tbl_UrunStok(Adet, UrunId)
		values (@StokAdet, @UrunId)
end

exec usp_UrunEkle 'Apple','Macbook','7','1100','2000','Dizüstü'

select * from tbl_Tur 

select * from tbl_Urun u, tbl_Tur t, tbl_Kategori k where u.TurId=t.Id and t.KategoriId=k.Id

select * from tbl_Urun

--id sýfýrlama
delete from tbl_Urun
DBCC CHECKIDENT (tbl_Urun,RESEED,0)

select * from tbl_Urun u , tbl_UrunStok us where u.Id=us.UrunId

select * from tbl_UrunStok