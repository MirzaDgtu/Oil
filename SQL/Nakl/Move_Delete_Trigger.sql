GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-08-20>
-- Description:	<Удаление записи с товаром из накладной O_MOVE>
-- =============================================
CREATE TRIGGER Move_Delete_Trigger
   ON  REPORTS..O_MOVE
   INSTEAD OF DELETE
AS 
	DECLARE @UnicumNum int, @TypeDoc varchar(6), @CodArtic int, @KonKolch float

	SELECT @UnicumNum = D.UNICUM_NUM,
		   @TypeDoc = D.TYPE_DOC,
		   @CodArtic = D.NUM_PREDM ,
		   @KonKolch = D.KOLC_PREDM	
	FROM deleted D WITH (NOLOCK)

	BEGIN TRAN
		BEGIN TRY
				UPDATE REPORTS..O_ARTC
					SET KON_KOLCH = (SELECT (CASE WHEN TYPE_DOC = 'П' THEN  KON_KOLCH - @KonKolch
												  WHEN TYPE_DOC = 'Р' THEN  KON_KOLCH + @KonKolch 
											END) FROM deleted WITH (NOLOCK))
				WHERE COD_ARTIC = @CodArtic		
				
				DELETE FROM REPORTS..O_MOVE
				WHERE NUM_PREDM = @CodArtic AND
					  UNICUM_NUM = @UnicumNum	
		END TRY
		BEGIN CATCH
			SELECT ERROR_NUMBER() AS ErrN,
				   ERROR_MESSAGE() AS ErrM,
				   ERROR_LINE() AS ErrL

			IF @@TRANCOUNT > 0
				ROLLBACk TRAN;
		END CATCH

	IF @@TRANCOUNT > 0
		COMMIT TRAN;

GO
 