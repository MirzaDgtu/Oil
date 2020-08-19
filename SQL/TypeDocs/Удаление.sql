USE [REPORTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-08-18>
-- Description:	<Удаление типа документа>
-- =============================================
create PROCEDURE O_DelTypeDocs
@UID  int = 0
AS

IF @UID <> 0
	BEGIN TRANSACTION
		BEGIN TRY
			DELETE FROM REPORTS..O_TYPEDOC
			WHERE UID = @UID
		END TRY
		BEGIN CATCH
			SELECT 
				ERROR_NUMBER() AS ERRNUM,
				ERROR_MESSAGE()AS ERRMES

			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
		END CATCH	
	IF @@TRANCOUNT > 0 
		COMMIT TRANSACTION; 


