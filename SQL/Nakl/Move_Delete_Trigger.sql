USE [REPORTS]
GO
/****** Object:  Trigger [dbo].[Move_Delete_Trigger]    Script Date: 21.08.2020 17:08:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-08-20>
-- Description:	<Удаление записи с товаром из накладной O_MOVE>
-- =============================================
ALTER TRIGGER [dbo].[Move_Delete_Trigger]
   ON  [dbo].[O_MOVE]
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
				
			-- Перевод товара(СТАРОЙ ВЕРСИИ) в архив
				INSERT INTO REPORTS..O_MOVE_ARC (ROWID,
													UNICUM_NUM,
													NUM_DOC,
													NUM_PREDM,
													NAME_PREDM,
													KOLC_PREDM,
													SUM_PREDM,														 
													TYPE_DOC,
													Primech,
													FAMILY,
													CREATE_DATE,
													WHO_CORR,
													CORR_DATE
													)

				SELECT							 ROWID,
													UNICUM_NUM,
													NUM_DOC,
													NUM_PREDM,
													NAME_PREDM,
													KOLC_PREDM,
													SUM_PREDM,														 
													TYPE_DOC,
													Primech,
													FAMILY,
													CREATE_DATE,
													WHO_CORR,
													CORR_DATE
				FROM    REPORTS..O_MOVE M WITH (NOLOCK)
				WHERE M.UNICUM_NUM = @UnicumNum AND
						M.NUM_PREDM = @CodArtic	

				-- Удаление товара
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

