object AppData: TAppData
  OldCreateOrder = False
  Left = 691
  Top = 199
  Height = 512
  Width = 628
  object Connection: TADOConnection
    ConnectionTimeout = 10
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object Subjects: TADODataSet
    Connection = Connection
    LockType = ltReadOnly
    BeforeOpen = SubjectsBeforeOpen
    Parameters = <>
    Left = 112
    Top = 16
    object fldCode: TStringField
      FieldName = 'ORG_PREDM'
      Size = 8
    end
    object fldFolioName: TStringField
      FieldName = 'NAME_USER'
      Size = 50
    end
  end
  object Consumptions: TADODataSet
    Connection = Connection
    LockType = ltReadOnly
    BeforeOpen = ConsumptionsBeforeOpen
    Parameters = <>
    Left = 176
    Top = 16
    object fldDayNo: TIntegerField
      FieldName = 'DayNo'
    end
    object fldConsumption: TFloatField
      FieldName = 'Consumption'
    end
    object fldCustomer: TStringField
      FieldName = 'Customer'
      Size = 8
    end
  end
  object Cars: TADODataSet
    Connection = Connection
    AfterScroll = CarsAfterScroll
    Parameters = <>
    Left = 240
    Top = 16
    object CarsUID: TIntegerField
      FieldName = 'UID'
    end
    object CarsREG_SYMBOL: TStringField
      FieldName = 'REG_SYMBOL'
      Size = 15
    end
    object CarsVIN: TStringField
      FieldName = 'VIN'
    end
    object CarsMODEL: TStringField
      FieldName = 'MODEL'
      Size = 50
    end
    object CarsTYPE_TC: TStringField
      FieldName = 'TYPE_TC'
      Size = 30
    end
    object CarsCATEGORY: TStringField
      FieldName = 'CATEGORY'
      Size = 5
    end
    object CarsMADEYEAR: TIntegerField
      FieldName = 'MADEYEAR'
    end
    object CarsCARCASS: TStringField
      FieldName = 'CARCASS'
      Size = 12
    end
    object CarsCOLOR: TStringField
      FieldName = 'COLOR'
      Size = 40
    end
    object CarsMOTOR_POWER: TFloatField
      FieldName = 'MOTOR_POWER'
    end
    object CarsECOLOGY: TStringField
      FieldName = 'ECOLOGY'
      Size = 30
    end
    object CarsRESERVE: TBooleanField
      FieldName = 'RESERVE'
    end
    object CarsCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object CarsFAMILY: TStringField
      FieldName = 'FAMILY'
      Size = 10
    end
    object CarsCORR_DATE: TDateTimeField
      FieldName = 'CORR_DATE'
    end
    object CarsWHO_CORR: TStringField
      FieldName = 'WHO_CORR'
      Size = 10
    end
    object CarsEmployeeName: TStringField
      FieldName = 'EmployeeName'
      Size = 50
    end
    object CarssWHO_CORR: TStringField
      FieldName = 'sWHO_CORR'
      Size = 50
    end
    object CarsArchive: TStringField
      FieldName = 'Archive'
      Size = 3
    end
  end
  object DS_Cars: TDataSource
    DataSet = Cars
    Left = 240
    Top = 64
  end
  object CarDetail: TADODataSet
    Connection = Connection
    BeforeOpen = CarDetailBeforeOpen
    Parameters = <>
    Left = 392
    Top = 24
    object CarDetailROWID: TIntegerField
      FieldName = 'ROWID'
    end
    object CarDetailUID_CAR: TIntegerField
      FieldName = 'UID_CAR'
    end
    object CarDetailPASSPORT_NUM: TIntegerField
      FieldName = 'PASSPORT_NUM'
    end
    object flPASSPORT_SERIAL: TIntegerField
      FieldName = 'PASSPORT_SERIAL'
    end
    object CarDetailMASS_MAX: TFloatField
      FieldName = 'MASS_MAX'
    end
    object CarDetailMASS_LOADOUT: TFloatField
      FieldName = 'MASS_LOADOUT'
    end
    object CarDetailINS_NUM: TIntegerField
      FieldName = 'INS_NUM'
    end
    object CarDetailINS_SERIAL: TIntegerField
      FieldName = 'INS_SERIAL'
    end
    object CarDetailBEG_DATE: TDateTimeField
      FieldName = 'BEG_DATE'
    end
    object CarDetailEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object CarDetailSHASSIS: TStringField
      FieldName = 'SHASSIS'
      Size = 15
    end
    object CarDetailWORKSTATE: TStringField
      FieldName = 'WORKSTATE'
      Size = 30
    end
    object CarDetailPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 200
    end
    object CarDetailPassport: TStringField
      FieldName = 'Passport'
    end
    object CarDetailDOC_SERIAL: TIntegerField
      FieldName = 'DOC_SERIAL'
    end
    object CarDetailDOC_NUM: TIntegerField
      FieldName = 'DOC_NUM'
    end
    object CarDetailINS_UID: TIntegerField
      FieldName = 'INS_UID'
    end
  end
  object DS_CarDetail: TDataSource
    DataSet = CarDetail
    Left = 392
    Top = 72
  end
  object Command: TADOCommand
    Connection = Connection
    Parameters = <>
    Left = 48
    Top = 64
  end
  object Insurance: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 472
    Top = 24
    object InsuranceUID: TIntegerField
      FieldName = 'UID'
    end
    object InsuranceSERIAL: TIntegerField
      FieldName = 'SERIAL'
    end
    object InsuranceNUMBER: TIntegerField
      FieldName = 'NUMBER'
    end
    object InsuranceDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object InsuranceBEG_DATE: TDateTimeField
      FieldName = 'BEG_DATE'
    end
    object InsuranceEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object InsuranceFAMILY: TStringField
      FieldName = 'FAMILY'
      Size = 10
    end
    object InsuranceEmployeeName: TStringField
      FieldName = 'EmployeeName'
      Size = 50
    end
    object InsuranceCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object InsuranceWHO_CORR: TStringField
      FieldName = 'WHO_CORR'
      Size = 10
    end
    object InsurancesWho_Corr: TStringField
      FieldName = 'sWho_Corr'
      Size = 50
    end
    object InsuranceCORR_DATE: TDateTimeField
      FieldName = 'CORR_DATE'
    end
    object InsuranceRESERVE: TBooleanField
      FieldName = 'RESERVE'
    end
    object InsuranceInsConcat: TStringField
      FieldName = 'InsConcat'
    end
    object InsurancePRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 200
    end
    object InsuranceArchive: TStringField
      FieldName = 'Archive'
      Size = 3
    end
    object InsuranceValidDay: TIntegerField
      FieldName = 'ValidDay'
    end
  end
  object InsuranceDetail: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 552
    Top = 24
    object InsuranceDetailUID: TIntegerField
      FieldName = 'UID'
    end
    object InsuranceDetailSERIAL: TIntegerField
      FieldName = 'SERIAL'
    end
    object InsuranceDetailNUMBER: TIntegerField
      FieldName = 'NUMBER'
    end
    object InsuranceDetailBEG_DATE: TDateTimeField
      FieldName = 'BEG_DATE'
    end
    object InsuranceDetailEND_DATE: TDateTimeField
      FieldName = 'END_DATE'
    end
    object InsuranceDetailDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object InsuranceDetailFAMILY: TStringField
      FieldName = 'FAMILY'
      Size = 10
    end
    object InsuranceDetailCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object InsuranceDetailWHO_CORR: TStringField
      FieldName = 'WHO_CORR'
      Size = 10
    end
    object InsuranceDetailCORR_DATE: TDateTimeField
      FieldName = 'CORR_DATE'
    end
    object InsuranceDetailPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 200
    end
    object InsuranceDetailRESERVE: TBooleanField
      FieldName = 'RESERVE'
    end
    object InsuranceDetailUID_CAR: TIntegerField
      FieldName = 'UID_CAR'
    end
    object InsuranceDetailMODEL: TStringField
      FieldName = 'MODEL'
      Size = 50
    end
    object InsuranceDetailREG_SYMBOL: TStringField
      FieldName = 'REG_SYMBOL'
      Size = 15
    end
    object InsuranceDetailTYPE_TC: TStringField
      FieldName = 'TYPE_TC'
      Size = 30
    end
    object InsuranceDetailCOLOR: TStringField
      FieldName = 'COLOR'
      Size = 40
    end
    object InsuranceDetailMADEYEAR: TIntegerField
      FieldName = 'MADEYEAR'
    end
  end
  object DS_Insurance: TDataSource
    DataSet = Insurance
    Left = 472
    Top = 72
  end
  object Nakl: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 40
    Top = 280
    object NaklUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object NaklNUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
    end
    object NaklDATE_DOC: TDateTimeField
      FieldName = 'DATE_DOC'
    end
    object NaklSUM_DOC: TFloatField
      FieldName = 'SUM_DOC'
    end
    object NaklCAR_UID: TIntegerField
      FieldName = 'CAR_UID'
    end
    object NaklREG_SYMBOL: TStringField
      FieldName = 'REG_SYMBOL'
      Size = 15
    end
    object NaklVIN: TStringField
      FieldName = 'VIN'
    end
    object NaklMODEL: TStringField
      FieldName = 'MODEL'
      Size = 50
    end
    object NaklCOLOR: TStringField
      FieldName = 'COLOR'
      Size = 40
    end
    object NaklFAMILY: TStringField
      FieldName = 'FAMILY'
      Size = 10
    end
    object NaklsFamily: TStringField
      FieldName = 'sFamily'
      Size = 50
    end
    object NaklCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object NaklsWHO_CORR: TStringField
      FieldName = 'sWHO_CORR'
      Size = 50
    end
    object NaklCORR_DATE: TDateTimeField
      FieldName = 'CORR_DATE'
    end
    object NaklTYPE_DOC: TStringField
      FieldName = 'TYPE_DOC'
      Size = 30
    end
    object NaklOTMETKA: TStringField
      FieldName = 'OTMETKA'
      Size = 3
    end
    object NaklPRIMECH: TStringField
      FieldName = 'PRIMECH'
      Size = 200
    end
    object NaklArchive: TStringField
      FieldName = 'Archive'
      Size = 3
    end
    object NaklWHO_CORR: TStringField
      FieldName = 'WHO_CORR'
      Size = 10
    end
  end
  object Move: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 96
    Top = 280
    object MoveROWID: TIntegerField
      FieldName = 'ROWID'
    end
    object MoveUNICUM_NUM: TIntegerField
      FieldName = 'UNICUM_NUM'
    end
    object MoveNUM_DOC: TIntegerField
      FieldName = 'NUM_DOC'
    end
    object MoveNUM_PREDM: TIntegerField
      FieldName = 'NUM_PREDM'
    end
    object MoveNAME_PREDM: TStringField
      FieldName = 'NAME_PREDM'
      Size = 30
    end
    object MoveKOLC_PREDM: TFloatField
      FieldName = 'KOLC_PREDM'
    end
    object MoveSUM_PREDM: TFloatField
      FieldName = 'SUM_PREDM'
    end
    object MoveFAMILY: TStringField
      FieldName = 'FAMILY'
      Size = 10
    end
    object MovesFamily: TStringField
      FieldName = 'sFamily'
      Size = 50
    end
    object MoveCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object MoveWHO_CORR: TStringField
      FieldName = 'WHO_CORR'
      Size = 10
    end
    object MovesWho_Corr: TStringField
      FieldName = 'sWho_Corr'
      Size = 50
    end
    object MoveCORR_DATE: TDateTimeField
      FieldName = 'CORR_DATE'
    end
    object MovePrimech: TStringField
      FieldName = 'Primech'
      Size = 200
    end
    object MoveRes_Sum: TFloatField
      FieldName = 'Res_Sum'
    end
  end
  object DS_Nakl: TDataSource
    DataSet = Nakl
    Left = 40
    Top = 336
  end
  object DS_Move: TDataSource
    DataSet = Move
    Left = 96
    Top = 336
  end
  object Products: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 160
    Top = 280
    object ProductsCOD_ARTIC: TIntegerField
      FieldName = 'COD_ARTIC'
    end
    object ProductsNAME_ARTIC: TStringField
      FieldName = 'NAME_ARTIC'
      Size = 200
    end
    object ProductsCENA_ARTC: TFloatField
      FieldName = 'CENA_ARTC'
    end
    object ProductsNDS_ARTIC: TFloatField
      FieldName = 'NDS_ARTIC'
    end
    object ProductsEDIN_IZMER: TStringField
      FieldName = 'EDIN_IZMER'
      Size = 10
    end
    object ProductsKON_KOLCH: TFloatField
      FieldName = 'KON_KOLCH'
    end
    object ProductsVES_EDINIC: TFloatField
      FieldName = 'VES_EDINIC'
    end
    object ProductsEDN_V_UPAK: TFloatField
      FieldName = 'EDN_V_UPAK'
    end
    object ProductsNGROUP_TVR: TStringField
      FieldName = 'NGROUP_TVR'
      Size = 30
    end
    object ProductsNGROUP_TV2: TStringField
      FieldName = 'NGROUP_TV2'
      Size = 30
    end
    object ProductsNGROUP_TV3: TStringField
      FieldName = 'NGROUP_TV3'
      Size = 30
    end
    object ProductsNGROUP_TV4: TStringField
      FieldName = 'NGROUP_TV4'
      Size = 30
    end
    object ProductsNGROUP_TV5: TStringField
      FieldName = 'NGROUP_TV5'
      Size = 30
    end
    object ProductsNGROUP_TV6: TStringField
      FieldName = 'NGROUP_TV6'
      Size = 30
    end
    object ProductsTYPE_TOVR: TStringField
      FieldName = 'TYPE_TOVR'
      Size = 10
    end
    object ProductsFAMILY: TStringField
      FieldName = 'FAMILY'
      Size = 10
    end
    object ProductsCREATE_DATE: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object ProductsWHO_CORR: TStringField
      FieldName = 'WHO_CORR'
      Size = 10
    end
    object ProductsCORR_DATE: TDateTimeField
      FieldName = 'CORR_DATE'
    end
  end
  object DS_Products: TDataSource
    DataSet = Products
    Left = 160
    Top = 336
  end
  object GroupsProduct: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 296
    Top = 280
    object GroupsProductNGROUP_TV2: TStringField
      FieldName = 'NGROUP_TV2'
      Size = 30
    end
    object GroupsProductNGROUP_TVR: TStringField
      FieldName = 'NGROUP_TVR'
      Size = 30
    end
    object GroupsProductNGROUP_TV3: TStringField
      FieldName = 'NGROUP_TV3'
      Size = 30
    end
    object GroupsProductNGROUP_TV4: TStringField
      FieldName = 'NGROUP_TV4'
      Size = 30
    end
    object GroupsProductNGROUP_TV5: TStringField
      FieldName = 'NGROUP_TV5'
      Size = 30
    end
    object GroupsProductNGROUP_TV6: TStringField
      FieldName = 'NGROUP_TV6'
      Size = 30
    end
  end
  object CarStory: TADODataSet
    Connection = Connection
    AfterScroll = CarsAfterScroll
    Parameters = <>
    Left = 304
    Top = 16
    object IntegerField1: TIntegerField
      FieldName = 'UID'
    end
    object StringField1: TStringField
      FieldName = 'REG_SYMBOL'
      Size = 15
    end
    object StringField2: TStringField
      FieldName = 'VIN'
    end
    object StringField3: TStringField
      FieldName = 'MODEL'
      Size = 50
    end
    object StringField4: TStringField
      FieldName = 'TYPE_TC'
      Size = 30
    end
    object StringField5: TStringField
      FieldName = 'CATEGORY'
      Size = 5
    end
    object IntegerField2: TIntegerField
      FieldName = 'MADEYEAR'
    end
    object StringField6: TStringField
      FieldName = 'CARCASS'
      Size = 12
    end
    object StringField7: TStringField
      FieldName = 'COLOR'
      Size = 40
    end
    object FloatField1: TFloatField
      FieldName = 'MOTOR_POWER'
    end
    object StringField8: TStringField
      FieldName = 'ECOLOGY'
      Size = 30
    end
    object BooleanField1: TBooleanField
      FieldName = 'RESERVE'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object StringField9: TStringField
      FieldName = 'FAMILY'
      Size = 10
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'CORR_DATE'
    end
    object StringField10: TStringField
      FieldName = 'WHO_CORR'
      Size = 10
    end
    object StringField11: TStringField
      FieldName = 'EmployeeName'
      Size = 50
    end
    object StringField12: TStringField
      FieldName = 'sWHO_CORR'
      Size = 50
    end
    object StringField13: TStringField
      FieldName = 'Archive'
      Size = 3
    end
  end
  object DS_CarStory: TDataSource
    DataSet = CarStory
    Left = 304
    Top = 64
  end
  object ProductDetail: TADODataSet
    Connection = Connection
    Parameters = <>
    Left = 224
    Top = 280
    object flCODE_ARTIC: TIntegerField
      FieldName = 'COD_ARTIC'
    end
    object StringField14: TStringField
      FieldName = 'NAME_ARTIC'
      Size = 200
    end
    object FloatField2: TFloatField
      FieldName = 'CENA_ARTC'
    end
    object FloatField3: TFloatField
      FieldName = 'NDS_ARTIC'
    end
    object StringField15: TStringField
      FieldName = 'EDIN_IZMER'
      Size = 10
    end
    object FloatField4: TFloatField
      FieldName = 'KON_KOLCH'
    end
    object FloatField5: TFloatField
      FieldName = 'VES_EDINIC'
    end
    object FloatField6: TFloatField
      FieldName = 'EDN_V_UPAK'
    end
    object StringField16: TStringField
      FieldName = 'NGROUP_TVR'
      Size = 30
    end
    object StringField17: TStringField
      FieldName = 'NGROUP_TV2'
      Size = 30
    end
    object StringField18: TStringField
      FieldName = 'NGROUP_TV3'
      Size = 30
    end
    object StringField19: TStringField
      FieldName = 'NGROUP_TV4'
      Size = 30
    end
    object StringField20: TStringField
      FieldName = 'NGROUP_TV5'
      Size = 30
    end
    object StringField21: TStringField
      FieldName = 'NGROUP_TV6'
      Size = 30
    end
    object StringField22: TStringField
      FieldName = 'TYPE_TOVR'
      Size = 10
    end
    object StringField23: TStringField
      FieldName = 'FAMILY'
      Size = 10
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'CREATE_DATE'
    end
    object StringField24: TStringField
      FieldName = 'WHO_CORR'
      Size = 10
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'CORR_DATE'
    end
  end
  object TypeTovr: TADODataSet
    Connection = Connection
    BeforeOpen = TypeTovrBeforeOpen
    Parameters = <>
    Left = 368
    Top = 280
    object TypeTovrTYPE_TOVR: TStringField
      FieldName = 'TYPE_TOVR'
      Size = 10
    end
  end
end
