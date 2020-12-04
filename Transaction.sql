BEGIN TRANSACTION
BEGIN TRY

UPDATE tbl_Sepet SET Adet = Adet + 1
WHERE UrunId = 2

UPDATE tbl_Urun SET Adet = Adet - 1
WHERE Id = 2

COMMIT
END TRY
BEGIN CATCH
ROLLBACK
END CATCH

--ürün sepete eklendiði adet kadar ürünün stoktaki adetinden düþüyor.

 select * from tbl_Urun

 select * from tbl_Sepet