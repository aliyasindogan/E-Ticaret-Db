



alter procedure usp_MusteriEkle
(
	@Ad nvarchar(50),
	@Soyad nvarchar(50),
	@Cinsiyet char(1),
	@Email nvarchar(50),
	@Sifre nvarchar(20),
	@Adres nvarchar(150)
)
as
begin
		declare @Id int
		insert into tbl_Musteri (Ad, Soyad, Cinsiyet, Email, Sifre)
		values (@Ad, @Soyad, @Cinsiyet, @Email, @Sifre)
		set @Id = (select top(1)Id from tbl_Musteri order by Id desc)
		insert into tbl_Adres (Adres, MusteriId)
		values (@Adres,@Id)
end

exec usp_MusteriEkle 'zz','sa','E','asd@gmail.com','123','AA'

select m.Id,m.Ad,m.Soyad,m.Cinsiyet,m.Sifre,a.Adres from tbl_Adres a, tbl_Musteri m where a.MusteriId=m.Id and m.Ad='zz'

select * from tbl_Musteri
