



create procedure usp_KategoriEkle
(
	@Ad nvarchar(50)
)
as
begin
		insert into tbl_Kategori (Ad)
		values (@Ad)
end

exec usp_KategoriEkle 'Bilgisayar'

select * from tbl_Kategori
