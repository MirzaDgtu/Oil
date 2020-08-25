USE [REPORTS]
GO

/****** Object:  StoredProcedure [dbo].[O_CorrNaklHead]    Script Date: 24.08.2020 13:00:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<pmp>
-- Create date: <2020-06-24>
-- Description:	<Изменение шапки накладной>
-- =============================================
CREATE PROCEDURE [dbo].[O_CorrNaklHead]
@UNICUM_NUM int = 0,
@DATE_DOC smalldatetime = Null,
@SUM_DOC float = 0,
@DRIVER  varchar(40) = Null,
@CAR_UID int = 0,
@Type_DOC varchar(20) = Null,
@Family varchar(10) = Null,
@PRIMECH varchar(200) = Null
AS

if @UNICUM_NUM <> 0	
		BEGIN TRANSACTION
			BEGIN TRY
				UPDATE REPORTS..O_NAKL
					SET DATE_DOC = @DATE_DOC,
						SUM_DOC = @SUM_DOC,
						DRIVER = @DRIVER,
						CAR_UID = @CAR_UID,
						TYPE_DOC = @Type_DOC,
						WHO_CORR = @Family,
						CORR_DATE = GETDATE(),
						PRIMECH = @PRIMECH 
				WHERE UNICUM_NUM = @UNICUM_NUM
			END TRY

			BEGIN CATCH
				SELECT ERROR_NUMBER() AS ErrN,
					   ERROR_MESSAGE() AS ErrM,
					   ERROR_LINE() AS ErrL

				IF @@TRANCOUNT > 0
					ROLLBACK TRANSACTION;
			END CATCH

		IF @@TRANCOUNT > 0
			COMMIT TRANSACTION;


GO


