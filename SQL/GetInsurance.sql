USE [REPORTS]
GO
/****** Object:  StoredProcedure [dbo].[O_GetInsurance]    Script Date: 28.05.2020 10:42:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-05-26>
-- Description:	<Получение списка страховых документов>
-- =============================================
ALTER PROCEDURE [dbo].[O_GetInsurance]
@Reserve bit = 0,
@Archive bit = 0,
@BegDate smalldatetime = Null,
@EndDate smalldatetime = Null 
AS

if @Reserve = 0
	BEGIN
		IF @Archive = 0
			BEGIN	
				SELECT  I.UID,
						I.SERIAL,
						I.NUMBER,
						CONCAT(I.SERIAL, ' ', I.NUMBER) as InsConcat,
						I.DOC_DATE,
						I.BEG_DATE,
						I.END_DATE,
						I.FAMILY,
						E.EmployeeName,
						I.CREATE_DATE,
						I.WHO_CORR,
						EE.EmployeeName AS 'sWho_Corr',
						I.CORR_DATE,
						I.RESERVE,
						I.PRIMECH,
						'' AS 'Archive',
						DATEDIFF(DAY, I.BEG_DATE, I.END_DATE) as 'ValidDay'	
				FROM REPORTS..CARS_INSURANCE I WITH (NOLOCK)
					 LEFT JOIN DELIVERY..A_EMPLOYEES E WITH (NOLOCK) ON E.sName = I.FAMILY   COLLATE Cyrillic_General_CI_AS
					 LEFT JOIN DELIVERY..A_EMPLOYEES EE WITH (NOLOCK) ON EE.sName = I.WHO_CORR   COLLATE Cyrillic_General_CI_AS
				WHERE ISNULL(I.RESERVE, 0) = 0 AND
					  I.CREATE_DATE BETWEEN @BegDate AND @EndDate
				ORDER BY I.SERIAL, InsConcat
			END
		ELSE
		IF @Archive = 1
			BEGIN					
				SELECT  I.UID,
						I.SERIAL,
						I.NUMBER,
						CONCAT(I.SERIAL, ' ', I.NUMBER) as InsConcat,
						I.DOC_DATE,
						I.BEG_DATE,
						I.END_DATE,
						I.FAMILY,
						E.EmployeeName,
						I.CREATE_DATE,
						I.WHO_CORR,
						EE.EmployeeName AS 'sWho_Corr',
						I.CORR_DATE,
						I.RESERVE,
						I.PRIMECH,
						'' AS 'Archive',
						DATEDIFF(DAY, I.BEG_DATE, I.END_DATE) as 'ValidDay'	
				FROM REPORTS..CARS_INSURANCE I WITH (NOLOCK)
					 LEFT JOIN DELIVERY..A_EMPLOYEES E WITH (NOLOCK) ON E.sName = I.FAMILY   COLLATE Cyrillic_General_CI_AS
					 LEFT JOIN DELIVERY..A_EMPLOYEES EE WITH (NOLOCK) ON EE.sName = I.WHO_CORR   COLLATE Cyrillic_General_CI_AS
				WHERE ISNULL(I.RESERVE, 0) = 0 AND
					  I.CREATE_DATE BETWEEN @BegDate AND @EndDate

				UNION
				
				SELECT IA.UID,
					   IA.SERIAL,
					   IA.NUMBER,
					   CONCAT(IA.SERIAL, ' ', IA.NUMBER) as InsConcat,
					   IA.DOC_DATE,
					   IA.BEG_DATE,
					   IA.END_DATE,
					   IA.FAMILY,
					   E.EmployeeName,
					   IA.CREATE_DATE,
					   IA.WHO_CORR,
					   EE.EmployeeName AS 'sWho_Corr',
					   IA.CORR_DATE,
					   IA.RESERVE,
					   IA.PRIMECH,
					   '*' AS 'Archive',
					   DATEDIFF(DAY, IA.BEG_DATE, IA.END_DATE) as 'ValidDay'
				FROM REPORTS..CARS_INSURANCE_ARC IA WITH (NOLOCK)
					 LEFT JOIN DELIVERY..A_EMPLOYEES E WITH (NOLOCK) ON E.sName = IA.FAMILY   COLLATE Cyrillic_General_CI_AS
					 LEFT JOIN DELIVERY..A_EMPLOYEES EE WITH (NOLOCK) ON EE.sName = IA.WHO_CORR   COLLATE Cyrillic_General_CI_AS
				WHERE IA.CREATE_DATE BETWEEN @BegDate AND @EndDate		
				ORDER BY I.UID				
			END
	END
ELSE		
if @Reserve = 1
	BEGIN
		if @Archive = 0
			BEGIN
				SELECT I.UID,
					   I.SERIAL,
					   I.NUMBER,
					   CONCAT(I.SERIAL, ' ', I.NUMBER) as InsConcat,
					   I.DOC_DATE,
					   I.BEG_DATE,
					   I.END_DATE,
					   I.FAMILY,
					   E.EmployeeName,
					   I.CREATE_DATE,
					   I.WHO_CORR,
					   EE.EmployeeName AS 'sWho_Corr',
					   I.CORR_DATE,
					   I.RESERVE,
					   I.PRIMECH,
					   '' AS 'Archive',
					   DATEDIFF(DAY, I.BEG_DATE, I.END_DATE) as 'ValidDay'
				FROM REPORTS..CARS_INSURANCE I WITH (NOLOCK)
					 LEFT JOIN DELIVERY..A_EMPLOYEES E WITH (NOLOCK) ON E.sName = I.FAMILY   COLLATE Cyrillic_General_CI_AS
					 LEFT JOIN DELIVERY..A_EMPLOYEES EE WITH (NOLOCK) ON EE.sName = I.WHO_CORR   COLLATE Cyrillic_General_CI_AS
				WHERE I.CREATE_DATE BETWEEN @BegDate AND @EndDate
				ORDER BY I.SERIAL, InsConcat
			END
		ELSE 
		if @Archive = 1
			BEGIN
				SELECT I.UID,
					   I.SERIAL,
					   I.NUMBER,
					   CONCAT(I.SERIAL, ' ', I.NUMBER) as InsConcat,
					   I.DOC_DATE,
					   I.BEG_DATE,
					   I.END_DATE,
					   I.FAMILY,
					   E.EmployeeName,
					   I.CREATE_DATE,
					   I.WHO_CORR,
					   EE.EmployeeName AS 'sWho_Corr',
					   I.CORR_DATE,
					   I.RESERVE,
					   I.PRIMECH,
					   '' AS 'Archive',
					   DATEDIFF(DAY, I.BEG_DATE, I.END_DATE) as 'ValidDay'	
				FROM REPORTS..CARS_INSURANCE I WITH (NOLOCK)
					 LEFT JOIN DELIVERY..A_EMPLOYEES E WITH (NOLOCK) ON E.sName = I.FAMILY   COLLATE Cyrillic_General_CI_AS
					 LEFT JOIN DELIVERY..A_EMPLOYEES EE WITH (NOLOCK) ON EE.sName = I.WHO_CORR   COLLATE Cyrillic_General_CI_AS				
				WHERE I.CREATE_DATE BETWEEN @BegDate AND @EndDate
				UNION				
				SELECT IA.UID,
					   IA.SERIAL,
					   IA.NUMBER,
					   CONCAT(IA.SERIAL, ' ', IA.NUMBER) as InsConcat,
					   IA.DOC_DATE,
					   IA.BEG_DATE,
					   IA.END_DATE,
					   IA.FAMILY,
					   E.EmployeeName,
					   IA.CREATE_DATE,
					   IA.WHO_CORR,
					   EE.EmployeeName AS 'sWho_Corr',
					   IA.CORR_DATE,
					   IA.RESERVE,
					   IA.PRIMECH,
					   '*' AS 'Archive',
					   DATEDIFF(DAY, IA.BEG_DATE, IA.END_DATE) as 'ValidDay'
				FROM REPORTS..CARS_INSURANCE_ARC IA WITH (NOLOCK)
					 LEFT JOIN DELIVERY..A_EMPLOYEES E WITH (NOLOCK) ON E.sName = IA.FAMILY   COLLATE Cyrillic_General_CI_AS
					 LEFT JOIN DELIVERY..A_EMPLOYEES EE WITH (NOLOCK) ON EE.sName = IA.WHO_CORR   COLLATE Cyrillic_General_CI_AS
				WHERE IA.CREATE_DATE BETWEEN @BegDate AND @EndDate		
				ORDER BY I.UID
			END
	END
