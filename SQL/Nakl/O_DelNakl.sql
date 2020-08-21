USE [REPORTS]
GO
/****** Object:  StoredProcedure [dbo].[O_DelNakl]    Script Date: 20.08.2020 16:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-06-02>
-- Description:	<Удаление накладной ГСМ>
-- =============================================
ALTER PROCEDURE [dbo].[O_DelNakl]
@UNICUM_NUM int = 0
AS
	if @UNICUM_NUM <> 0
		BEGIN TRANSACTION
			BEGIN TRY
				DELETE FROM REPORTS..O_NAKL
				WHERE UNICUM_NUM = @UNICUM_NUM

				DELETE FROM REPORTS..O_MOVE
				WHERE UNICUM_NUM = @UNICUM_NUM
			END TRY

			BEGIN CATCH
				SELECT ERROR_NUMBER() AS ErrN,
					   ERROR_MESSAGE() as ErrM

				IF @@TRANCOUNT > 0
					ROLLBACK TRANSACTION;
			END CATCH
		IF @@TRANCOUNT > 0
			COMMIT TRANSACTION;
