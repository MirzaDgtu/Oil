USE [REPORTS]
GO
/****** Object:  StoredProcedure [dbo].[O_CorrNaklMove]    Script Date: 21.08.2020 11:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-06-02>
-- Description:	<Создание детализации накладной по ГСМ>
-- =============================================
ALTER PROCEDURE [dbo].[O_CorrNaklMove]
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
	BEGIN
		DECLARE @IsAvailable bit, @Oldcount float


		SET @Oldcount = (SELECT M.KOLC_PREDM
						 FROM REPORTS..O_MOVE M WITH (NOLOCK)
						 WHERE M.UNICUM_NUM = @UNICUM_NUM AND
								M.NUM_PREDM = @NUM_PREDM) 
		IF iSnULL(@Oldcount , 0) > 0 
			  SET @IsAvailable = 1
		 ELSE
			  SET @IsAvailable = 0	

	
		IF @IsAvailable = 0
			BEGIN
				BEGIN TRANSACTION
					BEGIN TRY
						insert into REPORTS..O_MOVE(UNICUM_NUM,
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

					/*IF LOWER(@TYPE_DOC) = LOWER('п')
						BEGIN
							UPDATE REPORTS..O_ARTC
								SET KON_KOLCH = KON_KOLCH + @KOLC_PREDM
							WHERE COD_ARTIC = @NUM_PREDM
						END
						
					IF LOWER(IsNull(@TYPE_DOC, '')) = 'р'
						BEGIN
							UPDATE REPORTS..O_ARTC
								SET KON_KOLCH = KON_KOLCH - @KOLC_PREDM
							WHERE COD_ARTIC = @NUM_PREDM
						END*/

					END TRY
					BEGIN CATCH
						SELECT  ERROR_NUMBER() AS ErrN,
								ERROR_MESSAGE() as ErrM,
								ERROR_LINE() AS ErrL,
								'Ошибка при вставке нового товара' as 'UserM'
			
						IF @@TRANCOUNT > 0
							ROLLBACK TRANSACTION;
					END CATCH
				END

ELSE
				BEGIN
					BEGIN TRY
						/*IF LOWER(IsNull(@TYPE_DOC, '')) =  'п'
						  BEGIN
							UPDATE REPORTS..O_ARTC
								SET KON_KOLCH = KON_KOLCH - @Oldcount + @KOLC_PREDM
							WHERE COD_ARTIC = @NUM_PREDM								
						  END
						
					    IF LOWER(IsNull(@TYPE_DOC, '')) = 'р'
						  BEGIN
							UPDATE REPORTS..O_ARTC
								SET KON_KOLCH = KON_KOLCH + @Oldcount - @KOLC_PREDM
							WHERE COD_ARTIC = @NUM_PREDM
						  END*/

						  -- Перевод товара(СТАРОЙ ВЕРСИИ) в архив
						INSERT INTO REPORTS..O_MOVE_ARC (ROWID,
														 UNICUM_NUM,
														 NUM_DOC,
														 NUM_PREDM,
														 NAME_PREDM,
														 KOLC_PREDM,
														 SUM_PREDM,														 
														 TYPE_DOC,
														 Primech,
														 FAMILY,
														 CREATE_DATE,
														 WHO_CORR,
														 CORR_DATE
														 )

						SELECT							 ROWID,
														 UNICUM_NUM,
														 NUM_DOC,
														 NUM_PREDM,
														 NAME_PREDM,
														 KOLC_PREDM,
														 SUM_PREDM,														 
														 TYPE_DOC,
														 Primech,
														 FAMILY,
														 CREATE_DATE,
														 WHO_CORR,
														 CORR_DATE
					    FROM    REPORTS..O_MOVE M WITH (NOLOCK)
						WHERE M.UNICUM_NUM = @UNICUM_NUM AND
							  M.NUM_PREDM = @NUM_PREDM
						

						  -- Обновление товара
						UPDATE REPORTS..O_MOVE
							SET KOLC_PREDM = @KOLC_PREDM,
								SUM_PREDM = @SUM_PREDM,
								Primech = @Primech
						WHERE UNICUM_NUM = @UNICUM_NUM AND
							  NUM_PREDM = @NUM_PREDM



					END TRY

					BEGIN CATCH
							SELECT  ERROR_NUMBER() AS ErrN,
									ERROR_MESSAGE() as ErrM,
									ERROR_LINE() AS ErrL,
									'Ошибка при ОБНОВЛЕНИИ товара' as 'UserM'
			
							IF @@TRANCOUNT > 0
								ROLLBACK TRANSACTION;
					END CATCH
				

					IF @@TRANCOUNT > 0
						COMMIT TRANSACTION;
				END
	END
