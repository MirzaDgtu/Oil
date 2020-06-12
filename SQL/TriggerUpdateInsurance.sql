SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-05-27>
-- Description:	<Обработка удаления и обновления страховых документов>
-- =============================================
CREATE TRIGGER Insurance_Update_TRIGGER
	ON REPORTS..CARS_INSURANCE
	INSTEAD OF UPDATE
AS

DECLARE @UID INT, @SERIAL int, @NUMBER int,
		@DOC_DATE smalldatetime, @BEG_DATE smalldatetime, @END_DATE smalldatetime,
		@CAR_UID int, @FAMILY varchar(10), @CREATE_DATE smalldatetime,
		@WHO_CORR varchar(10), @CORR_DATE smalldatetime, @PRIMECH varchar(200), @RESERVE bit


SELECT @UID = I.UID,
	   @SERIAL = I.SERIAL,
	   @NUMBER = I.NUMBER,
	   @DOC_DATE = I.DOC_DATE,
	   @BEG_DATE = I.BEG_DATE,
	   @END_DATE = I.END_DATE,
	   @CAR_UID = I.CAR_UID,
	   @FAMILY = I.FAMILY,
	   @CREATE_DATE = I.CREATE_DATE,
	   @WHO_CORR = I.WHO_CORR,
	   @CORR_DATE = I.CORR_DATE,
	   @PRIMECH = I.PRIMECH,
	   @RESERVE = I.RESERVE	   
FROM inserted I WITH (NOLOCK)


-- Вставка старой версии страхового документа в архивную таблицу
	BEGIN TRANSACTION
		BEGIN TRY
			INSERT INTO REPORTS..CARS_INSURANCE_ARC(UID,
													SERIAL,
													NUMBER,
													DOC_DATE,
													BEG_DATE,
													END_DATE,
													CAR_UID,
													FAMILY,
													CREATE_DATE,
													WHO_CORR,
													CORR_DATE,
													PRIMECH,
													RESERVE)
	
			SELECT									I.UID,
													I.SERIAL,
													I.NUMBER,
													I.DOC_DATE,
													I.BEG_DATE,
													I.END_DATE,
													I.CAR_UID,
													I.FAMILY,
													I.CREATE_DATE,
													I.WHO_CORR,
													I.CORR_DATE,
													I.PRIMECH,
													I.RESERVE
			FROM REPORTS..CARS_INSURANCE I WITH (NOLOCK)
			WHERE UID = @UID	
			
			UPDATE REPORTS..CARS_INSURANCE
				SET SERIAL = @SERIAL,
					NUMBER = @NUMBER,
					DOC_DATE = @DOC_DATE,
					BEG_DATE = @BEG_DATE,
					END_DATE = @END_DATE,
					CAR_UID = @CAR_UID,
					FAMILY = @FAMILY,
					CREATE_DATE = @CREATE_DATE,
					WHO_CORR = @WHO_CORR,
					CORR_DATE = @CORR_DATE,
					PRIMECH = @PRIMECH,
					RESERVE	= @RESERVE
			WHERE UID = @UID
		END TRY
		BEGIN CATCH
			SELECT ERROR_NUMBER() AS ErrNum,
				   ERROR_MESSAGE() as ErrM

			if @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
		END CATCH

		IF @@TRANCOUNT > 0
			COMMIT TRANSACTION;
GO
