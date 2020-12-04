DECLARE @fiyat MONEY 
DECLARE @zam_fiyatlar CURSOR 
SET @zam_fiyatlar = CURSOR FOR 
SELECT SatisFiyati FROM tbl_Urun

OPEN @zam_fiyatlar 
FETCH NEXT FROM @zam_fiyatlar INTO @fiyat

SELECT SatisFiyati FROM tbl_Urun

WHILE ( @@FETCH_STATUS = 0) 
BEGIN 
      IF @fiyat > 2200
            UPDATE tbl_Urun SET SatisFiyati = (@fiyat + (@fiyat * 0.2)) 
            WHERE CURRENT OF @zam_fiyatlar
      ELSE 
            UPDATE tbl_Urun SET SatisFiyati = (@fiyat + (@fiyat * 0.1)) 
            WHERE CURRENT OF @zam_fiyatlar 
FETCH NEXT FROM @zam_fiyatlar INTO @fiyat 
END

SELECT SatisFiyati FROM tbl_Urun
CLOSE @zam_fiyatlar

DEALLOCATE @zam_fiyatlar

--satýþ fiyatý 2200 üstündeki ürünlere %20, altýndaki ürünlere %10 zam yapan cursor.

select SatisFiyati from tbl_Urun