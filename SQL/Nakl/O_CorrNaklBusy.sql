SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-09-08>
-- Description:	<Изменение статуса занятости документа>
-- =============================================
CREATE PROCEDURE O_CorrNaklBusy
@UNICUM_NUM int = 0,
@Busy bit = Null
AS
	if @UNICUM_NUM <> 0
		BEGIN TRAN
			BEGIN TRY
				UPDATE REPORTS..O_NAKL
					SET Busy = @Busy
				WHERE UNICUM_NUM = UNICUM_NUM
			END TRY
			BEGIN CATCH
				SELECT ERROR_NUMBER() as ErrN,
					   ERROR_MESSAGE() as ErrM,
					   ERROR_LINE() as ErrL

				if @@TRANCOUNT > 0
					ROLLBACK TRAN;
			END CATCH

		IF @@TRANCOUNT > 0
			COMMIT TRAN;
GO
