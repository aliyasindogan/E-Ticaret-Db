



create view v_YuksekMiktarliAlisverisYapanKisiler
as
select m.Ad +' ' + m.Soyad as 'M��teri Ad� Soyad�', s.ToplamFiyat as 'Al��veri� Tutar�'  from tbl_Urun u, tbl_Sepet s, tbl_Musteri m  
where u.Id=s.UrunId and m.Id=s.MusteriId and s.ToplamFiyat>3500