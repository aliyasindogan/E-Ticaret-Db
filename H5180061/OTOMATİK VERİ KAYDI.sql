



exec usp_KategoriEkle 'Bilgisayar'
exec usp_KategoriEkle 'Cep Telefonu'

exec usp_TurEkle 'Bilgisayar','Laptop'
exec usp_TurEkle 'Bilgisayar','Masaüstü'
exec usp_TurEkle 'Cep Telefonu','Telefon'

exec usp_UrunEkle 'Apple','Macbook','6','1200','2000','Laptop'
exec usp_UrunEkle 'HP','Pavilion','5','1450','1800','Masaüstü'
exec usp_UrunEkle 'Samsung','S10','2','1100','1650','Laptop'

--exec usp_UrunStokEkle 'Apple','Macbook','1200','2000','7'
--exec usp_UrunStokEkle 'HP','Pavilion','1450','1800','4'
--exec usp_UrunStokEkle 'Samsung','S10','1100','1650','2'

exec usp_MusteriEkle 'Ali','Tatlý','E','alitatli@gmail.com','123','Beþiktaþ'
exec usp_MusteriEkle 'Veli','Ekþi','E','velieksi@gmail.com','123456','Sarýyer'
exec usp_MusteriEkle 'Aslý','Þeker','K','asliseker@gmail.com','123321','Ortaköy'

--exec usp_AdresEkle 'Ali','Tatlý','alitatli@gmail.com','Emirgan'

exec usp_YorumEkle 'Ali','Tatlý','Apple','Macbook','Beðendim',''
exec usp_YorumEkle 'Veli','Ekþi','Apple','Macbook','Güzel cihaz','Beðendim'

exec usp_SepetEkle 'Ali','Tatlý','Apple','Macbook','2'
exec usp_SepetEkle 'Aslý','Þeker','Samsung','S10','1'
exec usp_SepetEkle 'Veli','Ekþi','Apple','Macbook','4'
