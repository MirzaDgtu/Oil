USE [REPORTS]
GO

/****** Object:  StoredProcedure [dbo].[O_GetNakl]    Script Date: 24.08.2020 13:01:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<pmp>
-- Create date: <2020-06-02>
-- Description:	<Получение реестра накладных>
-- =============================================
CREATE PROCEDURE [dbo].[O_GetNakl]
@BegD smalldatetime = Null,
@EndD smalldatetime = Null,
@Archive bit = 0
AS

if IsNull(@BegD, '' ) = ''
	SET @BegD = GETDATE()
if ISNULL(@EndD, '') = ''
	SET @EndD = GETDATE() + 1;

if IsNull(@Archive, 0) = 0
	BEGIN
		SELECT N.UNICUM_NUM,
			   N.NUM_DOC,
			   N.DATE_DOC,
			   N.SUM_DOC,
			   N.CAR_UID,
			   H.REG_SYMBOL,
			   H.VIN,
			   H.MODEL,
			   H.COLOR,
			   H.MADEYEAR,
			   H.TYPE_TC,
			   N.FAMILY,
			   E.EmployeeName as 'sFamily',
			   N.CREATE_DATE,
			   N.WHO_CORR,
			   EE.EmployeeName as 'sWHO_CORR',
			   N.CORR_DATE,
			   N.TYPE_DOC,
			   CAST((CASE N.OTMETKA WHEN 0 THEN ''
								    WHEN 1 THEN '*' 
					END) as varchar(3)) as 'OTMETKA',
			   N.PRIMECH,
			   '' as 'Archive' ,
			   CONCAT(D.Family, ' ', D.Name) as 'DRIVER'
		FROM REPORTS..O_NAKL N WITH (NOLOCK)
			 LEFT JOIN DELIVERY..A_EMPLOYEES E WITH (NOLOCK) ON E.sName = N.FAMILY COLLATE Cyrillic_General_CI_AS
			 LEFT JOIN DELIVERY..A_EMPLOYEES EE WITH (NOLOCK) ON EE.sName = N.WHO_CORR COLLATE Cyrillic_General_CI_AS
			 LEFT JOIN REPORTS..CARS_HEAD H WITH (NOLOCK) ON H.UID = N.CAR_UID
			 LEFT JOIN REPORTS..O_DRIVERS D WITH (NOLOCK) ON CAST(D.UID AS varchar(15)) = N.DRIVER COLLATE Cyrillic_General_CI_AS
		WHERE N.CREATE_DATE BETWEEN @BegD AND @EndD
		ORDER BY N.NUM_DOC
	END
ELSE
		SELECT N.UNICUM_NUM,
			   N.NUM_DOC,
			   N.DATE_DOC,
			   N.SUM_DOC,
			   N.CAR_UID,
			   H.REG_SYMBOL,
			   H.VIN,
			   H.MODEL,
			   H.COLOR,
			   H.MADEYEAR,
			   H.TYPE_TC,
			   N.FAMILY,
			   E.EmployeeName as 'sFamily',
			   N.CREATE_DATE,
			   N.WHO_CORR,
			   EE.EmployeeName as 'sWHO_CORR',
			   N.CORR_DATE,
			   N.TYPE_DOC,			   
			   CAST((CASE N.OTMETKA WHEN 0 THEN ''
								    WHEN 1 THEN '*' 
					END) as varchar(3)) as 'OTMETKA',
			   N.PRIMECH,
			   '' as 'Archive',
			   CONCAT(D.Family, ' ', D.Name) as 'DRIVER'
		FROM REPORTS..O_NAKL N WITH (NOLOCK)
			 LEFT JOIN DELIVERY..A_EMPLOYEES E WITH (NOLOCK) ON E.sName = N.FAMILY COLLATE Cyrillic_General_CI_AS
			 LEFT JOIN DELIVERY..A_EMPLOYEES EE WITH (NOLOCK) ON EE.sName = N.WHO_CORR COLLATE Cyrillic_General_CI_AS
			 LEFT JOIN REPORTS..CARS_HEAD H WITH (NOLOCK) ON H.UID = N.CAR_UID
			 LEFT JOIN REPORTS..O_DRIVERS D WITH (NOLOCK) ON CAST(D.UID AS varchar(15)) = N.DRIVER COLLATE Cyrillic_General_CI_AS
		WHERE N.CREATE_DATE BETWEEN @BegD AND @EndD
		
		UNION

		SELECT NA.UNICUM_NUM,
			   NA.NUM_DOC,
			   NA.DATE_DOC,
			   NA.SUM_DOC,
			   NA.CAR_UID,
			   H.REG_SYMBOL,
			   H.VIN,
			   H.MODEL,
			   H.COLOR,
			   H.MADEYEAR,
			   H.TYPE_TC,
			   NA.FAMILY,
			   E.EmployeeName as 'sFamily',
			   NA.CREATE_DATE,
			   NA.WHO_CORR,
			   EE.EmployeeName as 'sWHO_CORR',
			   NA.CORR_DATE,
			   NA.TYPE_DOC,
			   CAST((CASE NA.OTMETKA WHEN 0 THEN ''
								    WHEN 1 THEN '*' 
					END) as varchar(3)) as 'OTMETKA',
			   NA.PRIMECH,
			   '*' as 'Archive',			   
			   CONCAT(D.Family, ' ', D.Name) as 'DRIVER' 
		FROM REPORTS..O_NAKL_ARC NA  WITH (NOLOCK)
			 LEFT JOIN DELIVERY..A_EMPLOYEES E WITH (NOLOCK) ON E.sName = NA.FAMILY COLLATE Cyrillic_General_CI_AS
			 LEFT JOIN DELIVERY..A_EMPLOYEES EE WITH (NOLOCK) ON EE.sName = NA.WHO_CORR COLLATE Cyrillic_General_CI_AS
			 LEFT JOIN REPORTS..CARS_HEAD H WITH (NOLOCK) ON H.UID = NA.CAR_UID
			 LEFT JOIN REPORTS..O_DRIVERS D WITH (NOLOCK) ON CAST(D.UID AS varchar(15)) = NA.DRIVER COLLATE Cyrillic_General_CI_AS
		WHERE NA.CREATE_DATE BETWEEN @BegD AND @EndD
		ORDER BY N.NUM_DOC

GO


