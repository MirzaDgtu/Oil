USE [REPORTS]
GO

/****** Object:  StoredProcedure [dbo].[O_InsNaklMove]    Script Date: 24.08.2020 13:00:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<pmp>
-- Create date: <2020-06-02>
-- Description:	<Создание детализации накладной по ГСМ>
-- =============================================
CREATE PROCEDURE [dbo].[O_InsNaklMove]
@UNICUM_NUM int = 0,
@NUM_DOC int = 0,
@NUM_PREDM int = 0,
@NAME_PREDM varchar(50) = Null,
@KOLC_PREDM float = 0,
@SUM_PREDM float = 0,
@FAMILY varchar(10) = Null,
@TYPE_DOC varchar(20) = Null,
@Primech varchar(200) = Null
AS
	
if @UNICUM_NUM > 0
	BEGIN TRANSACTION
		BEGIN TRY
			INSERT INTO REPORTS..O_MOVE(UNICUM_NUM,
										NUM_DOC,
										NUM_PREDM,
										NAME_PREDM,
										KOLC_PREDM,
										SUM_PREDM,
										FAMILY,
										CREATE_DATE,
										TYPE_DOC,
										Primech)

			VALUES						(@UNICUM_NUM,
										 @NUM_DOC,
										 @NUM_PREDM,
										 @NAME_PREDM,
										 @KOLC_PREDM,
										 @SUM_PREDM,
										 @FAMILY,
										 GETDATE(),
										 @TYPE_DOC,
										 @Primech)

		/*IF LOWER(@TYPE_DOC) = LOWER('П')
			BEGIN
				UPDATE REPORTS..O_ARTC
					SET KON_KOLCH = KON_KOLCH + @KOLC_PREDM
				WHERE COD_ARTIC = @NUM_PREDM
			END
		ELSE
			BEGIN
				UPDATE REPORTS..O_ARTC
					SET KON_KOLCH = KON_KOLCH - @KOLC_PREDM
				WHERE COD_ARTIC = @NUM_PREDM
			END*/

		END TRY
		BEGIN CATCH
			SELECT  ERROR_NUMBER() AS ErrN,
					ERROR_MESSAGE() as ErrM
			
			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
		END CATCH

	IF @@TRANCOUNT > 0
		COMMIT TRANSACTION;

GO


