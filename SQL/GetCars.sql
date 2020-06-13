
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-05-22>
-- Description:	<Поучение списка автомобилей>
-- =============================================
CREATE PROCEDURE O_GetCars
@Reserve  bit = 0
AS

if IsNull(@Reserve, 0) = 0
	BEGIN
		SELECT H.UID,
			   H.REG_SYMBOL,
			   H.VIN,
			   H.MODEL,
			   H.TYPE_TC,
			   H.CATEGORY,
			   H.MADEYEAR,
			   H.CARCASS,
			   H.COLOR,
			   H.MOTOR_POWER,
			   H.ECOLOGY,
			   IsNull(H.RESERVE, 0) as 'RESERVE',
			   H.DOC_NUM,
			   H.DOC_SERIAL, 
			   H.CREATE_DATE
		FROM REPORTS..CARS_HEAD H WITH (NOLOCK)
		WHERE IsNull(H.RESERVE,0) = Isnull(@Reserve, 0)
	END
ELSE
			SELECT H.UID,
			   H.REG_SYMBOL,
			   H.VIN,
			   H.MODEL,
			   H.TYPE_TC,
			   H.CATEGORY,
			   H.MADEYEAR,
			   H.CARCASS,
			   H.COLOR,
			   H.MOTOR_POWER,
			   H.ECOLOGY,
			   IsNull(H.RESERVE, 0) as 'RESERVE',
			   H.DOC_NUM,
			   H.DOC_SERIAL, 
			   H.CREATE_DATE
			FROM REPORTS..CARS_HEAD H WITH (NOLOCK)
GO
