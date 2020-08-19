USE REPORTS
GO
/****** Object:  StoredProcedure [dbo].[O_InsTypeDocs]    Script Date: 19.08.2020 14:37:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-08-19>
-- Description:	<Добавление нового типа документа>
-- =============================================
create PROCEDURE O_InsTypeDocs
@Name varchar(6) = null,
@Description varchar(40) = null,
@Reserve bit = 0
AS

IF ISNULL(@Name, '') <> ''
	BEGIN TRANSACTION
		BEGIN TRY
			INSERT INTO  REPORTS..O_TYPEDOC (Name,
											 DESCRIPTION, 
											 RESERVE)

			VALUES							(@Name, 
											 @Description, 
											 @Reserve)
		END TRY
		BEGIN CATCH
			SELECT 
				ERROR_NUMBER() as ErrNum,
				ERROR_LINE()   AS ErrLine,
				ERROR_MESSAGE() as ErrMes

			if @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;				   
		END CATCH

	if @@TRANCOUNT > 0
		COMMIT TRANSACTION

