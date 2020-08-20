USE [REPORTS]
GO
/****** Object:  Trigger [dbo].[Move_Ins1_Trigger]    Script Date: 20.08.2020 15:36:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp1>
-- Create date: <2020-08-20>
-- Description:	<Триггер при создание накладной. Необходим для арифметических манипуляций товара в O_ARTC>
-- =============================================
ALTER TRIGGER [dbo].[Move_Ins1_Trigger]
	ON [dbo].[O_MOVE]
	AFTER INSERT
AS 

DECLARE @TypeDoc varchar(6), @CodArtic int, @KonKolch float

SELECT  @CodArtic = I.NUM_PREDM,
	    @KonKolch = I.KOLC_PREDM
 FROM inserted I with (nolock)

	BEGIN TRAN
			BEGIN TRY
				UPDATE REPORTS..O_ARTC
					SET KON_KOLCH = (SELECT (CASE WHEN TYPE_DOC = 'П' THEN  KON_KOLCH + @KonKolch
												  WHEN TYPE_DOC = 'Р' THEN  KON_KOLCH - @KonKolch 
											END) FROM inserted WITH (NOLOCK))
				WHERE COD_ARTIC = @CodArtic
					
				
			END TRY
			BEGIN CATCH
				SELECT ERROR_NUMBER() AS ErrN,
					   ERROR_MESSAGE() AS ErrM,
					   ERROR_LINE() AS ErrL 

				IF @@TRANCOUNT > 0
					ROLLBACK TRAN;
			END CATCH
	IF @@TRANCOUNT > 0
		COMMIT TRAN;
		
