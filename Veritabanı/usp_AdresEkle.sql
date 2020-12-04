



alter procedure usp_AdresEkle
(
	@Ad nvarchar(50),
	@Soyad nvarchar(50),
	@Email nvarchar(50),
	@Adres nvarchar(150)
)
as
begin
		declare @Id int
		set @Id = (select top(1)Id from tbl_Musteri m where m.Ad=@Ad and m.Soyad=@Soyad and m.Email=@Email)
		insert into tbl_Adres (Adres, MusteriId)
		values (@Adres,@Id)
end

exec usp_AdresEkle 'zz','sa','asd@gmail.com','Sarýyer'