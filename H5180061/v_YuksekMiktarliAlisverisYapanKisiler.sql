



create view v_YuksekMiktarliAlisverisYapanKisiler
as
select m.Ad +' ' + m.Soyad as 'Müþteri Adý Soyadý', s.ToplamFiyat as 'Alýþveriþ Tutarý'  from tbl_Urun u, tbl_Sepet s, tbl_Musteri m  
where u.Id=s.UrunId and m.Id=s.MusteriId and s.ToplamFiyat>3500