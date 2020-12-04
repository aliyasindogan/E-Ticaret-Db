




alter procedure usp_SepetEkle
(
	@MusteriAdý nvarchar(50),
	@MusteriSoyadý nvarchar(50),
	@Marka nvarchar(50),
	@Ad nvarchar(50),
	@Adet int
)
as
begin
		declare @MusteriId int
		declare @UrunId int
		declare @UrunFiyat money
		declare @ToplamFiyat money
		declare @AdresId int
		declare @SepetId int
		declare @SiparisId int

		set @MusteriId = (select m.Id from tbl_Musteri m where m.Ad=@MusteriAdý and m.Soyad=@MusteriSoyadý)
		set @UrunId = (select u.Id from tbl_Urun u where u.Marka=@Marka and u.Ad=@Ad)
		set @UrunFiyat = (select AlisFiyati from tbl_Urun where Id=@UrunId)
		set @ToplamFiyat = @UrunFiyat*@Adet
		set @AdresId = (select Id from tbl_Musteri where Id=@MusteriId)

		insert into tbl_Sepet (MusteriId, UrunId, Adet, ToplamFiyat)
		values (@MusteriId, @UrunId, @Adet, @ToplamFiyat)

		set @SepetId = (select top(1)Id from tbl_Sepet order by Id desc)

		insert into tbl_Siparis (AdresId, MusteriId, SepetId, ToplamFiyat)
		values (@AdresId, @MusteriId, @SepetId, @ToplamFiyat)

		set @SiparisId = (select top(1)Id from tbl_Siparis order by Id desc)

		insert into tbl_SiparisSepet (SiparisId, UrunId)
		values (@SiparisId, @UrunId)

end

exec usp_SepetEkle 'Mustafa','Kýzýlýþýk','Apple','Macbook','2'

select * from tbl_Musteri
select * from tbl_Urun

select * from tbl_Sepet

select * from tbl_SiparisSepet