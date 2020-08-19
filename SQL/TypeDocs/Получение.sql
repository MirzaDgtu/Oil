USE [REPORTS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<pmp>
-- Create date: <2020-08-18>
-- Description:	<Получение списка типа документа>
-- =============================================
ALTER PROCEDURE O_GetTypeDocs
@Reserve bit = 0
AS
	IF ISNULL (@Reserve, 0) = 0
	  BEGIN
		SELECT T.UID,
			   T.DESCRIPTION as 'TYPE_DOC',
			   T.Name,
			   T.RESERVE
		FROM REPORTS..O_TYPEDOC T WITH(NOLOCK)
		WHERE ISNULL(T.RESERVE, 0) = 0
		ORDER BY T.DESCRIPTION
      END
	ELSE
		SELECT T.UID,
			   T.DESCRIPTION as 'TYPE_DOC',
			   T.Name,
			   T.RESERVE
		FROM REPORTS..O_TYPEDOC T WITH(NOLOCK)
		ORDER BY T.DESCRIPTION