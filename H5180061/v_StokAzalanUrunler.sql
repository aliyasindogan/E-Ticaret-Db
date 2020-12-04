



create view v_StokAzalanUrunler
as
select u.Marka, u.Ad, us.Adet as 'Kalan Stok Adedi' from tbl_Urun u, tbl_UrunStok us 
where u.Id=us.UrunId and us.Adet<=10

select * from v_StokAzalanUrunler