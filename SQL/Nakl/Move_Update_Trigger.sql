USE [REPORTS]
GO
/****** Object:  Trigger [dbo].[Move_Update_Trigger]    Script Date: 21.08.2020 11:25:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-08-21>
-- Description:	<Триггер для обработки действий при обновлении записи в O_MOVE>
-- =============================================
ALTER TRIGGER [dbo].[Move_Update_Trigger] 
   ON  [dbo].[O_MOVE] 
   INSTEAD OF UPDATE
AS 

	DECLARE @UnicumNum int, @TypeDoc varchar(6), @CodArtic int, @KonKolch float, @OldKonKolch float

	SELECT @UnicumNum = I.UNICUM_NUM,
		   @TypeDoc   = i.TYPE_DOC,
		   @CodArtic  = i.NUM_PREDM ,
		   @KonKolch  = i.KOLC_PREDM	
	FROM inserted I WITH (NOLOCK)

	SET @OldKonKolch = (SELECT M.KOLC_PREDM
						FROM REPORTS..O_MOVE M WITH (NOLOCK)
						WHERE M.UNICUM_NUM = @UnicumNum AND
							  M.NUM_PREDM = @CodArtic)


	BEGIN TRAN
		BEGIN TRY
	
				UPDATE REPORTS..O_ARTC
					SET KON_KOLCH = (SELECT (CASE WHEN TYPE_DOC = 'П' THEN  KON_KOLCH - @OldKonKolch + @KonKolch 
												  WHEN TYPE_DOC = 'Р' THEN  KON_KOLCH + @OldKonKolch - @KonKolch  
											END) FROM inserted WITH (NOLOCK))
				WHERE COD_ARTIC = @CodArtic		
				
				UPDATE REPORTS..O_MOVE
					SET KOLC_PREDM = @KonKolch,
						TYPE_DOC = @TypeDoc
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
