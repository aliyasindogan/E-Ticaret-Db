



create procedure usp_YorumEkle
(
	@MusteriAdý nvarchar(50),
	@MusteriSoyadý nvarchar(50),
	@Marka nvarchar(50),
	@Ad nvarchar(50),
	@Yorum nvarchar(MAX),
	@UstYorum nvarchar(MAX)

)
as
begin
		declare @MusteriId int
		declare @UrunId int
		declare @UstYorumId int

		set @MusteriId = (select m.Id from tbl_Musteri m where m.Ad=@MusteriAdý and m.Soyad=@MusteriSoyadý)
		set @UrunId = (select u.Id from tbl_Urun u where u.Marka=@Marka and u.Ad=@Ad)
		set	@UstYorumId = (select Id from tbl_Yorum where Yorum=@UstYorum)

		insert into tbl_Yorum(MusteriId, UrunId, Yorum, UstYorumId)
		values (@MusteriId, @UrunId, @Yorum, @UstYorumId)
	
end 


exec usp_YorumEkle 'Mustafa','Kýzýlýþýk','Apple','Macbook','Beðendim','Güzel cihaz'

select * from tbl_Yorum

delete from tbl_Yorum
DBCC CHECKIDENT (tbl_Yorum,RESEED,0)