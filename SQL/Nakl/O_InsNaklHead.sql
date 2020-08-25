USE [REPORTS]
GO

/****** Object:  StoredProcedure [dbo].[O_InsNaklHead]    Script Date: 24.08.2020 12:59:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<pmp>
-- Create date: <2020-06-02>
-- Description:	<Создание новой накладной по ГСМ>
-- =============================================
CREATE PROCEDURE [dbo].[O_InsNaklHead]
@DATE_DOC smalldatetime = Null,
@SUM_DOC float = 0,
@DRIVER  varchar(40) = Null,
@CAR_UID int = 0,
@Type_DOC varchar(20) = Null,
@Family varchar(10) = Null,
@PRIMECH varchar(200) = Null
AS

DECLARE @NUM_DOC int
	SET @NUM_DOC =  (SELECT IsNull(N.NUM_DOC, 0) + 1
					 FROM REPORTS..O_NAKL N WITH (NOLOCK)
					 WHERE N.NUM_DOC = (SELECT MAX(IsNull(NN.NUM_DOC, 0))
										   FROM REPORTS..O_NAKL NN WITH (NOLOCK)
										   WHERE YEAR(NN.CREATE_DATE) = YEAR(GETDATE())))

	if ISNULL(@NUM_DOC, '') = '' 
		SET @NUM_DOC = 1

BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO REPORTS..O_NAKL (NUM_DOC,
									 DATE_DOC,
									 SUM_DOC,
									 DRIVER,
									 CAR_UID,
									 TYPE_DOC,
									 FAMILY,
									 CREATE_DATE,
									 PRIMECH)

		VALUES						(@NUM_DOC,
									 @DATE_DOC,
									 @SUM_DOC,
									 @DRIVER,
									 @CAR_UID,
									 @Type_DOC,
									 @Family,
									 GETDATE(),
									 @PRIMECH)		
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() as  ErrN,
			   ERROR_MESSAGE() as ErrM,
			   ERROR_LINE() as ErrL
		
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;	
	END CATCH

IF @@TRANCOUNT > 0 
	COMMIT TRANSACTION;

SELECT MAX(ISnULL(UNICUM_NUM, 0)) AS UNICUM_NUM,
	   ISNULL(N.NUM_DOC, 0) AS NUM_DOC
FROM REPORTS..O_NAKL N WITH (NOLOCK)
GROUP BY N.NUM_DOC

GO


