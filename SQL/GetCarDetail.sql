SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-05-22>
-- Description:	<Получение информации по автомобилю.>
-- =============================================
CREATE PROCEDURE O_GetCarDetail
@UID int = 0
AS

if @UID <> 0
	BEGIN
		SELECT D.ROWID,
			   D.UID_CAR,
			   D.PASSPORT_NUM,
			   D.PASSPORT_SERIAL,
			   D.MASS_MAX,
			   D.MASS_LOADOUT,
			   D.INS_NUM,
			   D.INS_SERIAL,
			   D.BEG_DATE,
			   D.END_DATE,
			   D.SHASSIS,
			   D.WORKSTATE,
			   D.PRIMECH
		FROM REPORTS..CARS_DETAIL D WITH (NOLOCK)
		WHERE D.UID_CAR = @UID
	END
GO
