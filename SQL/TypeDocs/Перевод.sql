USE [REPORTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-08-19>
-- Description:	<Перевод тип документа в резерв>
-- =============================================
create PROCEDURE O_TransferTypeDoc
@UID int = 0,
@Reserve bit = 0
AS
	IF @UID <> 0
		BEGIN TRANSACTION
			BEGIN TRY
				UPDATE REPORTS..O_TYPEDOC			
					SET RESERVE = @Reserve
				WHERE UID = @UID
			END TRY
			BEGIN CATCH
				SELECT  ERROR_NUMBER() as ErrNum,
						ERROR_LINE()   AS ErrLine,
						ERROR_MESSAGE() as ErrMes
				
				if @@TRANCOUNT > 0
					ROLLBACK TRANSACTION;				  
			END CATCH
		if @@TRANCOUNT > 0
			COMMIT TRANSACTION;
