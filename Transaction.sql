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

--�r�n sepete eklendi�i adet kadar �r�n�n stoktaki adetinden d���yor.

 select * from tbl_Urun

 select * from tbl_Sepet