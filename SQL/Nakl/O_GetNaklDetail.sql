USE [REPORTS]
GO

/****** Object:  StoredProcedure [dbo].[O_GetNaklDetail]    Script Date: 24.08.2020 13:01:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<pmp>
-- Create date: <2020-06-02>
-- Description:	<Получение параметров накладной ГСМ>
-- =============================================
CREATE PROCEDURE [dbo].[O_GetNaklDetail]
@UNICUM_NUM int = 0,
@Archive bit = 0
AS
	if @UNICUM_NUM <> 0
		BEGIN
			IF IsNull(@Archive, 0) = 0
				SELECT M.ROWID,
					   M.UNICUM_NUM,
					   M.NUM_DOC,
					   M.NUM_PREDM,
					   M.NAME_PREDM,
					   M.KOLC_PREDM,
					   M.SUM_PREDM,
					   (IsNull(M.KOLC_PREDM, 0)  * (IsNull(M.SUM_PREDM, 0))) as Res_Sum,
					   M.FAMILY,
					   E.EmployeeName as 'sFamily',
					   M.CREATE_DATE,
					   M.TYPE_DOC,
					   M.WHO_CORR,
					   EE.EmployeeName as 'sWho_Corr',
					   M.CORR_DATE,
					   M.Primech
				FROM REPORTS..O_MOVE M WITH (NOLOCK)
					LEFT JOIN DELIVERY..A_EMPLOYEES E WITH (NOLOCK) ON E.sName = M.FAMILY COLLATE Cyrillic_General_CI_AS
					LEFT JOIN DELIVERY..A_EMPLOYEES EE WITH (NOLOCK) ON EE.sName = M.WHO_CORR COLLATE Cyrillic_General_CI_AS
				WHERE M.UNICUM_NUM = @UNICUM_NUM
				ORDER BY M.NUM_PREDM
			ELSE
				SELECT M.ROWID,
					   M.UNICUM_NUM,
					   M.NUM_DOC,
					   M.NUM_PREDM,
					   M.NAME_PREDM,
					   M.KOLC_PREDM,
					   M.SUM_PREDM,
					   (IsNull(M.KOLC_PREDM, 0)  * (IsNull(M.SUM_PREDM, 0))) as Res_Sum,
					   M.FAMILY,
					   E.EmployeeName as 'sFamily',
					   M.CREATE_DATE,
					   M.TYPE_DOC,
					   M.WHO_CORR,
					   EE.EmployeeName as 'sWho_Corr',
					   M.CORR_DATE,
					   M.Primech
				FROM REPORTS..O_MOVE_ARC M WITH (NOLOCK)
					LEFT JOIN DELIVERY..A_EMPLOYEES E WITH (NOLOCK) ON E.sName = M.FAMILY COLLATE Cyrillic_General_CI_AS
					LEFT JOIN DELIVERY..A_EMPLOYEES EE WITH (NOLOCK) ON EE.sName = M.WHO_CORR COLLATE Cyrillic_General_CI_AS
				WHERE M.UNICUM_NUM = @UNICUM_NUM
				ORDER BY M.NUM_PREDM
				
		END

GO


