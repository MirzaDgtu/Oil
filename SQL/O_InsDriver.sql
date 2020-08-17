SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-08-17>
-- Description:	<Добавление нового водителя>
-- =============================================
CREATE PROCEDURE O_InsDriver
@Family varchar(35) = Null,
@Name varchar(15) = Null,
@LastName varchar(40) = Null,
@BirthDay date = Null,
@Pass_Serial varchar(6) = Null,
@Pass_Num varchar(10) = Null,
@License_Serial varchar(6) = Null,
@License_Num varchar(10) = Null,
@License_BegDate smalldatetime = Null,
@License_EndDate smalldatetime = null,
@License_Gave varchar(50) = Null,
@License_Access varchar(30) = Null,
@Adress varchar(150) = null,
@UID_Car int = 0,
@Date_Hiring smalldatetime = Null,
@Available bit = 0,
@Primech varchar(250) = Null
AS
	If isNull(@Family, '') <> ''
		BEGIN TRANSACTION
			BEGIN TRY
				INSERT INTO REPORTS..O_DRIVERS(Family,
											   Name,
											   LastName,
											   BirthDay,
											   Pass_Serial,
											   Pass_Num,
											   License_Serial,
											   License_Num,
											   License_BegDate,
											   License_EndDate,
											   License_Gave,
											   License_Access,
											   Adress,
											   UID_Car,
											   Date_Hiring,
											   Available,
											   Primech)

				VALUES						  (@Family,
											   @Name,
											   @LastName,
											   @BirthDay,
											   @Pass_Serial,
											   @Pass_Num,
											   @License_Serial,
											   @License_Num,
											   @License_BegDate,
											   @License_EndDate,
											   @License_Gave,
											   @License_Access,
											   @Adress,
											   @UID_Car,
											   @Date_Hiring,
											   @Available,
											   @Primech)	
			END TRY
			BEGIN CATCH
				SELECT ERROR_NUMBER() AS ErrN,
					   ERROR_LINE() as ErrL,
					   ERROR_MESSAGE() as ErrM 

				IF @@ROWCOUNT > 0
					ROLLBACK TRANSACTION;
			END CATCH


		IF @@ROWCOUNT > 0
			COMMIT TRANSACTION;

GO
