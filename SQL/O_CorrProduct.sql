GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<pmp>
-- Create date: <2020-06-09>
-- Description:	<Добавление нового товара>
-- =============================================
CREATE PROCEDURE O_CorrProduct
@Article int = 0,
@NAME_ARTIC varchar(200) = Null,
@CENA_ARTC float = 0,
@NDS_ARTIC float = 0,
@EDIN_IZMER varchar(10) = Null,
@KON_KOLCH float = 0,
@VES_EDINIC float = 0,
@EDN_V_UPAK float =0,
@NGROUP_TVR varchar(30) = Null,
@NGROUP_TV2 varchar(30) = Null,
@NGROUP_TV3 varchar(30) = Null,
@NGROUP_TV4 varchar(30) = Null,
@NGROUP_TV5 varchar(30) = Null,
@NGROUP_TV6 varchar(30)  = Null,
@TYPE_TOVR varchar(10) = Null,
@FAMILY varchar(30) = Null
AS

if @Article <> 0
	BEGIN TRANSACTION
		BEGIN TRY
			UPDATE REPORTS..O_ARTC
				SET NAME_ARTIC = @NAME_ARTIC, CENA_ARTC = @CENA_ARTC, NDS_ARTIC = @NDS_ARTIC, EDIN_IZMER = @EDIN_IZMER,
					KON_KOLCH = @KON_KOLCH, VES_EDINIC = @VES_EDINIC, EDN_V_UPAK = @EDN_V_UPAK, NGROUP_TVR = @NGROUP_TVR,
					NGROUP_TV2 = @NGROUP_TV2, NGROUP_TV3 = @NGROUP_TV3, NGROUP_TV4 = @NGROUP_TV4, NGROUP_TV5 = @NGROUP_TV5,
					NGROUP_TV6 = @NGROUP_TV6, TYPE_TOVR = @TYPE_TOVR,  WHO_CORR = @FAMILY, CORR_DATE = GETDATE()
			WHERE COD_ARTIC = @Article
		END TRY
		BEGIN CATCH
			SELECT ERROR_NUMBER() AS ErrN,
				   ERROR_MESSAGE() as ErrM

			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION;
		END CATCH

	IF @@TRANCOUNT > 0
		COMMIT TRANSACTION;
GO
