



exec usp_KategoriEkle 'Bilgisayar'
exec usp_KategoriEkle 'Cep Telefonu'

exec usp_TurEkle 'Bilgisayar','Laptop'
exec usp_TurEkle 'Bilgisayar','Masa�st�'
exec usp_TurEkle 'Cep Telefonu','Telefon'

exec usp_UrunEkle 'Apple','Macbook','6','1200','2000','Laptop'
exec usp_UrunEkle 'HP','Pavilion','5','1450','1800','Masa�st�'
exec usp_UrunEkle 'Samsung','S10','2','1100','1650','Laptop'

--exec usp_UrunStokEkle 'Apple','Macbook','1200','2000','7'
--exec usp_UrunStokEkle 'HP','Pavilion','1450','1800','4'
--exec usp_UrunStokEkle 'Samsung','S10','1100','1650','2'

exec usp_MusteriEkle 'Ali','Tatl�','E','alitatli@gmail.com','123','Be�ikta�'
exec usp_MusteriEkle 'Veli','Ek�i','E','velieksi@gmail.com','123456','Sar�yer'
exec usp_MusteriEkle 'Asl�','�eker','K','asliseker@gmail.com','123321','Ortak�y'

--exec usp_AdresEkle 'Ali','Tatl�','alitatli@gmail.com','Emirgan'

exec usp_YorumEkle 'Ali','Tatl�','Apple','Macbook','Be�endim',''
exec usp_YorumEkle 'Veli','Ek�i','Apple','Macbook','G�zel cihaz','Be�endim'

exec usp_SepetEkle 'Ali','Tatl�','Apple','Macbook','2'
exec usp_SepetEkle 'Asl�','�eker','Samsung','S10','1'
exec usp_SepetEkle 'Veli','Ek�i','Apple','Macbook','4'
