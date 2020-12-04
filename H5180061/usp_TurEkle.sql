


alter procedure usp_TurEkle
(
	@Kategori nvarchar(20),
	@Tur nvarchar(20)
)
as
begin
		declare @Id int
		set @Id = (select top(1)Id from tbl_Kategori k where k.Ad=@Kategori)
		insert into tbl_Tur (Turu, KategoriId)
		values (@Tur, @Id)
end

exec usp_TurEkle 'Bilgisayar','Dizüstü'

select k.Ad as Kategori, t.Turu as Türü from tbl_Kategori k, tbl_Tur t where k.Id=t.KategoriId

select * from tbl_Tur

select * from tbl_Kategori