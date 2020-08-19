USE REPORTS
GO
/****** Object:  StoredProcedure [dbo].[O_CorrTypeDoc]    Script Date: 19.08.2020 14:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<pmp>
-- Create date: <2020-08-18>
-- Description:	<Корректировка типа документа>
-- =============================================
create PROCEDURE O_CorrTypeDoc
@UID int = 0,
@Name varchar(6),
@Description varchar(40),
@Reserve bit = 0
AS
	if @UID <> 0
		IF ISNULL(@Name, '') <> ''
			BEGIN TRANSACTION
				BEGIN TRY 
					UPDATE REPORTS..O_TYPEDOC
						SET Name = @Name,
							DESCRIPTION = @Description,
							RESERVE = @Reserve
					WHERE UID = @UID 
				END TRY
				BEGIN CATCH
					SELECT ERROR_NUMBER() AS ErrN,
						   ERROR_MESSAGE() as ErrM

					IF @@TRANCOUNT > 0
						ROLLBACK TRANSACTION;
				END CATCH
			IF @@TRANCOUNT > 0
				COMMIT TRANSACTION 
