unit AppDM;

interface

uses
  SysUtils, Classes, DB, ADODB, ComCtrls, UCustomFlexCelReport,
  UFlexCelReport, UExcelAdapter, OLEAdapter, IniFiles, Dialogs;

type
  TAppData = class(TDataModule)
    Connection: TADOConnection;
    Subjects: TADODataSet;
    Consumptions: TADODataSet;
    fldCode: TStringField;
    fldFolioName: TStringField;
    fldDayNo: TIntegerField;
    fldConsumption: TFloatField;
    fldCustomer: TStringField;
    Cars: TADODataSet;
    DS_Cars: TDataSource;
    CarDetail: TADODataSet;
    CarsUID: TIntegerField;
    fldREG_SYMBOL: TStringField;
    fldMODEL: TStringField;
    CarsTYPE_TC: TStringField;
    CarsCATEGORY: TStringField;
    CarsMADEYEAR: TIntegerField;
    CarsCARCASS: TStringField;
    CarsCOLOR: TStringField;
    CarsECOLOGY: TStringField;
    CarsRESERVE: TBooleanField;
    CarDetailROWID: TIntegerField;
    CarDetailUID_CAR: TIntegerField;
    CarDetailMASS_MAX: TFloatField;
    CarDetailMASS_LOADOUT: TFloatField;
    CarDetailBEG_DATE: TDateTimeField;
    CarDetailEND_DATE: TDateTimeField;
    CarDetailSHASSIS: TStringField;
    CarDetailWORKSTATE: TStringField;
    CarDetailPRIMECH: TStringField;
    CarsCREATE_DATE: TDateTimeField;
    CarsFAMILY: TStringField;
    CarsCORR_DATE: TDateTimeField;
    CarsWHO_CORR: TStringField;
    CarDetailPassport: TStringField;
    Command: TADOCommand;
    CarsVIN: TStringField;
    CarDetailINS_UID: TIntegerField;
    CarsEmployeeName: TStringField;
    CarssWHO_CORR: TStringField;
    Insurance: TADODataSet;
    InsuranceDetail: TADODataSet;
    DS_Insurance: TDataSource;
    InsuranceUID: TIntegerField;
    InsuranceDOC_DATE: TDateTimeField;
    InsuranceBEG_DATE: TDateTimeField;
    InsuranceEND_DATE: TDateTimeField;
    InsuranceFAMILY: TStringField;
    InsuranceEmployeeName: TStringField;
    InsuranceCREATE_DATE: TDateTimeField;
    InsuranceWHO_CORR: TStringField;
    InsurancesWho_Corr: TStringField;
    InsuranceCORR_DATE: TDateTimeField;
    InsuranceRESERVE: TBooleanField;
    InsuranceInsConcat: TStringField;
    InsurancePRIMECH: TStringField;
    InsuranceDetailUID: TIntegerField;
    InsuranceDetailBEG_DATE: TDateTimeField;
    InsuranceDetailEND_DATE: TDateTimeField;
    InsuranceDetailDOC_DATE: TDateTimeField;
    InsuranceDetailFAMILY: TStringField;
    InsuranceDetailCREATE_DATE: TDateTimeField;
    InsuranceDetailWHO_CORR: TStringField;
    InsuranceDetailCORR_DATE: TDateTimeField;
    InsuranceDetailPRIMECH: TStringField;
    InsuranceDetailRESERVE: TBooleanField;
    InsuranceDetailUID_CAR: TIntegerField;
    InsuranceDetailMODEL: TStringField;
    InsuranceDetailREG_SYMBOL: TStringField;
    InsuranceDetailTYPE_TC: TStringField;
    InsuranceDetailCOLOR: TStringField;
    InsuranceDetailMADEYEAR: TIntegerField;
    InsuranceValidDay: TIntegerField;
    InsuranceArchive: TStringField;
    CarsArchive: TStringField;
    Nakl: TADODataSet;
    Move: TADODataSet;
    DS_Nakl: TDataSource;
    DS_Move: TDataSource;
    fldUNICUM_NUM: TIntegerField;
    fldNUM_DOC: TIntegerField;
    fldDATE_DOC: TDateTimeField;
    NaklSUM_DOC: TFloatField;
    NaklCAR_UID: TIntegerField;
    NaklREG_SYMBOL: TStringField;
    NaklVIN: TStringField;
    NaklMODEL: TStringField;
    NaklCOLOR: TStringField;
    NaklFAMILY: TStringField;
    NaklCREATE_DATE: TDateTimeField;
    NaklsFamily: TStringField;
    NaklsWHO_CORR: TStringField;
    NaklCORR_DATE: TDateTimeField;
    NaklTYPE_DOC: TStringField;
    NaklOTMETKA: TStringField;
    fldPRIMECH: TStringField;
    NaklArchive: TStringField;
    MoveROWID: TIntegerField;
    MoveUNICUM_NUM: TIntegerField;
    MoveNUM_DOC: TIntegerField;
    MoveNUM_PREDM: TIntegerField;
    MoveNAME_PREDM: TStringField;
    MoveKOLC_PREDM: TFloatField;
    MoveSUM_PREDM: TFloatField;
    MoveFAMILY: TStringField;
    MovesFamily: TStringField;
    MoveCREATE_DATE: TDateTimeField;
    MoveWHO_CORR: TStringField;
    MovesWho_Corr: TStringField;
    MoveCORR_DATE: TDateTimeField;
    MovePrimech: TStringField;
    MoveRes_Sum: TFloatField;
    NaklWHO_CORR: TStringField;
    Products: TADODataSet;
    DS_Products: TDataSource;
    GroupsProduct: TADODataSet;
    GroupsProductNGROUP_TVR: TStringField;
    GroupsProductNGROUP_TV2: TStringField;
    GroupsProductNGROUP_TV3: TStringField;
    GroupsProductNGROUP_TV4: TStringField;
    GroupsProductNGROUP_TV5: TStringField;
    GroupsProductNGROUP_TV6: TStringField;
    ProductsCOD_ARTIC: TIntegerField;
    ProductsNAME_ARTIC: TStringField;
    ProductsCENA_ARTC: TFloatField;
    ProductsNDS_ARTIC: TFloatField;
    ProductsEDIN_IZMER: TStringField;
    ProductsKON_KOLCH: TFloatField;
    ProductsVES_EDINIC: TFloatField;
    ProductsEDN_V_UPAK: TFloatField;
    ProductsNGROUP_TVR: TStringField;
    ProductsNGROUP_TV2: TStringField;
    ProductsNGROUP_TV3: TStringField;
    ProductsNGROUP_TV4: TStringField;
    ProductsNGROUP_TV5: TStringField;
    ProductsNGROUP_TV6: TStringField;
    ProductsTYPE_TOVR: TStringField;
    ProductsFAMILY: TStringField;
    ProductsCREATE_DATE: TDateTimeField;
    ProductsWHO_CORR: TStringField;
    ProductsCORR_DATE: TDateTimeField;
    CarStory: TADODataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    CarStoryTYPE_TC: TStringField;
    StringField5: TStringField;
    IntegerField2: TIntegerField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField1: TFloatField;
    StringField8: TStringField;
    BooleanField1: TBooleanField;
    DateTimeField1: TDateTimeField;
    StringField9: TStringField;
    DateTimeField2: TDateTimeField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    DS_CarStory: TDataSource;
    ProductDetail: TADODataSet;
    flCODE_ARTIC: TIntegerField;
    StringField14: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField15: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    DateTimeField3: TDateTimeField;
    StringField24: TStringField;
    DateTimeField4: TDateTimeField;
    TypeTovr: TADODataSet;
    TypeTovrTYPE_TOVR: TStringField;
    InsuranceStory: TADODataSet;
    IntegerField3: TIntegerField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    DateTimeField7: TDateTimeField;
    StringField25: TStringField;
    StringField26: TStringField;
    DateTimeField8: TDateTimeField;
    StringField27: TStringField;
    StringField28: TStringField;
    DateTimeField9: TDateTimeField;
    BooleanField2: TBooleanField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    IntegerField6: TIntegerField;
    DS_InsuranceStory: TDataSource;
    Adapter: TOLEAdapter;
    Report: TFlexCelReport;
    NaklMADEYEAR: TIntegerField;
    Drivers: TADODataSet;
    TypeDocs: TADODataSet;
    DriversDriver: TStringField;
    TypeDocsTYPE_DOC: TStringField;
    fldTYPE_TC: TStringField;
    fldDRIVER: TStringField;
    CarDetailREG_SYMBOL: TStringField;
    CarDetailVIN: TStringField;
    CarDetailMODEL: TStringField;
    CarDetailTYPE_TC: TStringField;
    CarDetailCATEGORY: TStringField;
    CarDetailMADEYEAR: TIntegerField;
    CarDetailCARCASS: TStringField;
    CarDetailCOLOR: TStringField;
    CarsMOTOR_POWER: TFloatField;
    CarDetailMOTOR_POWER: TFloatField;
    CarDetailECOLOGY: TStringField;
    CarDetailRESERVE: TBooleanField;
    DriversL: TADODataSet;
    DriversLUID: TIntegerField;
    DriversLFamily: TStringField;
    DriversLName: TStringField;
    DriversLLastName: TStringField;
    DriversLPass_Serial: TStringField;
    DriversLPass_Num: TStringField;
    DriversLLicense_Serial: TStringField;
    DriversLLicense_Num: TStringField;
    DriversLLicense_Gave: TStringField;
    DriversLLicense_Access: TStringField;
    DriversLAdress: TStringField;
    DriversLUID_Car: TIntegerField;
    DriversLDate_Hiring: TDateTimeField;
    DriversLAvailable: TBooleanField;
    DriversLPrimech: TStringField;
    DriversLPass_Gave: TStringField;
    DS_DriversL: TDataSource;
    DriversLMODEL: TStringField;
    DriversLREG_SYMBOL: TStringField;
    DriversLTYPE_TC: TStringField;
    DriversLCOLOR: TStringField;
    DriversLMADEYEAR: TIntegerField;
    DriversLBirthDay: TDateTimeField;
    DriversLLicense_BegDate: TDateTimeField;
    DriversLLicense_EndDate: TDateTimeField;
    DriverCar: TADODataSet;
    DriverCarUID: TIntegerField;
    DriverCarMODEL: TStringField;
    DriverCarREG_SYMBOL: TStringField;
    DriverCarTYPE_TC: TStringField;
    DriverCarCOLOR: TStringField;
    DriverCarMADEYEAR: TIntegerField;
    TypeDocsUID: TIntegerField;
    TypeDocsRESERVE: TBooleanField;
    DS_TypeDocs: TDataSource;
    TypeDocsName: TStringField;
    ProductReport: TADODataSet;
    ProductReportNUM_PREDM: TIntegerField;
    ProductReportNAME_PREDM: TStringField;
    ProductReportEDIN_IZMER: TStringField;
    ProductReportKOLC_PREDM: TFloatField;
    ProductReportSUM_PREDM: TFloatField;
    ProductReportEDN_V_UPAK: TFloatField;
    DS_ProductReport: TDataSource;
    NaklBusy: TBooleanField;
    MoveBusy: TBooleanField;
    DriversLFullName: TStringField;
    MoveDifference: TFloatField;
    MoveKolSclad: TFloatField;
    MoveSummSclad: TFloatField;
    CarDetailPASSPORT_NUM: TStringField;
    CarDetailPASSPORT_SERIAL: TStringField;
    CarDetailINS_NUM: TStringField;
    CarDetailINS_SERIAL: TStringField;
    CarDetailDOC_SERIAL: TStringField;
    CarDetailDOC_NUM: TStringField;
    InsuranceDetailSERIAL: TStringField;
    InsuranceDetailNUMBER: TStringField;
    InsuranceSERIAL: TStringField;
    InsuranceNUMBER: TStringField;
    InsuranceStorySERIAL: TStringField;
    InsuranceStoryNUMBER: TStringField;
    procedure SubjectsBeforeOpen(DataSet: TDataSet);
    procedure ConsumptionsBeforeOpen(DataSet: TDataSet);
    procedure TypeTovrBeforeOpen(DataSet: TDataSet);
    procedure MoveBeforeOpen(DataSet: TDataSet);
    procedure NaklAfterScroll(DataSet: TDataSet);
    procedure DriversLAfterScroll(DataSet: TDataSet);
  private
    FgBegD: variant;
    FgEndD: variant;
    FDriverReport: Variant;
    FTypeTovrReport: Variant;
    FTypeDocReport: Variant;
    procedure QuitApplication(const Msg: string);
    procedure SetgBegD(const Value: variant);
    procedure SetgEndD(const Value: variant);
    function GetNumDoc: Variant;
    function GetDateDoc: Variant;
    function GetDriverDoc: Variant;
    function GetTypeDoc: Variant;
    function GetPrimechDoc: Variant;
    function GetModelCarDoc: Variant;
    function GetRegSymbolDoc: Variant;
    function GetTypeTcDoc: Variant;
    function GetColorDoc: Variant;
    function GetYearCarDoc: Variant;
    function GetdBeg: Variant;
    function GetdEnd: Variant;
    procedure SetDriverReport(const Value: Variant);
    procedure SetTypeDocReport(const Value: Variant);
    procedure SetTypeTovrReport(const Value: Variant);
  public
    class procedure SetInfoSB(DataSet: TADODataSet; SB: TStatusBar);
    procedure SetInfoToSB(DataSet: TADODataSet; SB: TStatusBar); overload;
    procedure SetInfoToSB(DataSet: TADODataSet; SB: TStatusBar; Archive, Reserve: Boolean; ArchiveField, ReserveField: String); overload;
    class procedure SetRangeCaption(BegD, EndD: TDateTime; Panel: TStatusPanel);
    constructor Create(AOwner: TComponent); override;

  published
    property gBegD: variant read FgBegD write SetgBegD;
    property gEndD: variant read FgEndD write SetgEndD;

    // Свойство используются при печати документа
      // Свойства документа (Nakl)
    property NumDoc: variant read GetNumDoc;
    property DateDoc: Variant read GetDateDoc;
    property DriverDoc: Variant read GetDriverDoc;
    property TypeDoc: Variant read GetTypeDoc;
    property PrimechDoc: Variant read GetPrimechDoc;

    // Начальная и конечная дата (Только для чтения)
    property dBeg: Variant read GetdBeg;
    property dEnd: Variant read GetdEnd;

      // Свойства автомобиля из документа (Car)
    property ModelCarDoc: Variant read GetModelCarDoc;
    property RegSymbolCarDoc: Variant read GetRegSymbolDoc;
    property TypeTcCarDoc: Variant read GetTypeTcDoc;
    property ColorCarDoc: Variant read GetColorDoc;
    property YearCarDoc: Variant read GetYearCarDoc;

    // Свойства для печати
    property TypeTovrReport: Variant read FTypeTovrReport write SetTypeTovrReport;
    property TypeDocReport: Variant read FTypeDocReport write SetTypeDocReport;
    property DriverReport: Variant read FDriverReport write SetDriverReport;
    
  end;

var
  AppData: TAppData;

implementation

uses
  Windows, SConst, Login, Globals, Controls, Forms, Car, DriversF,
  DateUtils;

{$R *.dfm}

resourcestring
  SServerConnect   = 'Provider=SQLOLEDB.1;' +
                     'Persist Security Info=False;' +
                     'User ID=;' +
                     'Password=;'+
                     'Initial Catalog=REPORTS;'+
                     'Data Source=%s';



{ TAppData }

constructor TAppData.Create(AOwner: TComponent);
var
  Str: string;
begin
  inherited;
  if RegisterUser(g_User, Str, g_Server) then
  try
    Connection.ConnectionString := Format(SServerConnect, [g_Server]);
    Connection.Open(g_User, Str);
  except
    on E: Exception do QuitApplication(SConnectError);
  end
  else
  begin
    Application.ShowMainForm := False;
    QuitApplication(EmptyStr);
    Exit;
  end;
end;

procedure TAppData.QuitApplication(const Msg: string);
begin
  if Msg <> '' then
    MessageDlg(Msg, mtError, [mbOk], 0);
  Application.Terminate();
end;

procedure TAppData.SubjectsBeforeOpen(DataSet: TDataSet);
begin
  Subjects.CommandText := Format(SSQLGetSubjects, [g_Year, g_Month]);
end;

procedure TAppData.ConsumptionsBeforeOpen(DataSet: TDataSet);
begin
  Consumptions.CommandText := Format(SSQLGetConsumptions, [g_Year, g_Month]);
end;

procedure TAppData.TypeTovrBeforeOpen(DataSet: TDataSet);
begin
    TypeTovr.CommandText := SSQLGetTypeTovr;
end;

class procedure TAppData.SetInfoSB(DataSet: TADODataSet; SB: TStatusBar);
var
    ValueRes, ValueArch, locUID: integer;
begin
  ValueRes := 0;
  ValueArch := 0;

  if (DataSet.Active) and  (not DataSet.IsEmpty) then
    Try
      locUID := DataSet.FieldByName('UID').AsInteger;
      DataSet.DisableControls;
      DataSet.First;
      while not DataSet.Eof do
        Begin
          if DataSet.FieldByName('Reserve').AsBoolean = True then
            ValueRes := ValueRes + 1;

          if DataSet.FieldByName('Archive').AsString = '*' then
            ValueArch := ValueArch + 1;

          DataSet.Next;
        end;
    finally
      if SB.Panels.Count >= 3 then
        Begin
         with SB do
          Begin
            Panels[0].Text := Format(SAllRows, [DataSet.RecordCount]);
            if DataSet.Name = 'Insurance' then
              Panels[1].Text := Format(SReserveRows, [ValueRes])
            else
              Panels[1].Text := Format(SReserveRows, [0]);
            Panels[2].Text := Format(SArchiveRows, [ValueArch]);
          end;
         end;
       DataSet.Locate('UID', locUID, [loCaseInsensitive, loPartialKey]);
       DataSet.EnableControls;
    end;
end;
procedure TAppData.MoveBeforeOpen(DataSet: TDataSet);
begin
  Move.CommandText := Format(SSQLGetNaklDetail, [fldUNICUM_NUM.AsInteger, g_New]);
end;

procedure TAppData.NaklAfterScroll(DataSet: TDataSet);
begin
  if (Nakl.Active) and
     (not Nakl.IsEmpty) and
      Assigned(fldUNICUM_NUM) and
     (fldUNICUM_NUM.AsInteger <> 0) then
      Begin
        Move.Active := False;
        Move.Active := True;
      end
  else
        Move.Active := False;
end;

procedure TAppData.SetgBegD(const Value: variant);
begin
  FgBegD := Value;
end;

procedure TAppData.SetgEndD(const Value: variant);
begin
  FgEndD := Value;
end;

function TAppData.GetNumDoc: Variant;
begin
  if (Nakl.Active) and
     (not Nakl.IsEmpty) then
      Result := fldNUM_DOC.AsString;
end;

function TAppData.GetDateDoc: Variant;
begin
  if (Nakl.Active) and
     (not Nakl.IsEmpty) then
       Result := FormatDateTime('yyyy-mm-dd', fldDATE_DOC.AsDateTime);
end;

function TAppData.GetDriverDoc: Variant;
begin
  if (Nakl.Active) and
     (not Nakl.IsEmpty) then
       Result := fldDRIVER.AsString;
end;

function TAppData.GetTypeDoc: Variant;
begin
  if (Nakl.Active) and
     (not Nakl.IsEmpty) then
      Result := NaklTYPE_DOC.AsString;
end;

function TAppData.GetPrimechDoc: Variant;
begin
  if (Nakl.Active) and
     (not Nakl.IsEmpty) then
       Result := fldPRIMECH.AsString;
end;

function TAppData.GetModelCarDoc: Variant;
begin
   if (Cars.Active) and
      (not Cars.IsEmpty) then
        Result := AppData.Nakl.FieldByName('MODEL').AsString;
end;

function TAppData.GetRegSymbolDoc: Variant;
begin
  if (Nakl.Active) and
     (not Nakl.IsEmpty) then
        Result := NaklREG_SYMBOL.AsString;
end;

function TAppData.GetTypeTcDoc: Variant;
begin
  if (Nakl.Active) and
     (not Nakl.IsEmpty) then
      Result := fldTYPE_TC.AsString;
end;

function TAppData.GetColorDoc: Variant;
begin
  if (Nakl.Active) and
     (not Nakl.IsEmpty) then
      Result := NaklCOLOR.AsString;
end;

function TAppData.GetYearCarDoc: Variant;
begin
  if (Nakl.Active) and
     (not Nakl.IsEmpty) then
       Result := NaklMADEYEAR.AsString;
end;

procedure TAppData.DriversLAfterScroll(DataSet: TDataSet);
begin
  if Assigned(DriversForm) then
  TDriversForm.SetDriverDetail();
end;

procedure TAppData.SetInfoToSB(DataSet: TADODataSet; SB: TStatusBar);
begin
  if (DataSet.Active) and (not DataSet.IsEmpty) then
    try
       SB.Panels[0].Text := Format(SProductRow, [DataSet.RecordCount]);
    finally
    end;
end;

procedure TAppData.SetInfoToSB(DataSet: TADODataSet; SB: TStatusBar;
  Archive, Reserve: Boolean; ArchiveField, ReserveField: String);
var
    i, Res, Arch: integer;
begin
  Res := 0;
  Arch := 0;

  if (DataSet.Active) and (not DataSet.IsEmpty) then
    try
       if Reserve = True then
          for i := 0 to DataSet.RecordCount-1 do
             if DataSet.FieldByName(ReserveField).AsBoolean = True then
               Inc(Res);

        if Archive = True then
          for i := 0 to DataSet.RecordCount-1 do
            if DataSet.FieldByName(ArchiveField).AsBoolean = True then
              Inc(Arch)
    finally
        SB.Panels[0].Text := Format(SAllRows, [DataSet.RecordCount]);
        if Reserve = True then SB.Panels[1].Text := Format(SReserveRows, [Res]);
        If Archive = True then SB.Panels[2].Text := Format(SArchiveRows, [Arch]);
    end;

end;

class procedure TAppData.SetRangeCaption(BegD, EndD: TDateTime;
  Panel: TStatusPanel);
begin
  Panel.Text := Format(SRange, [FormatDateTime('dd-mm-yyyy', BegD),
                                 FormatDateTime('dd-mm-yyyy', EndD)]);
end;

function TAppData.GetdBeg: Variant;
begin
    Result := dBeg;
end;

function TAppData.GetdEnd: Variant;
begin
    Result := dEnd;
end;

procedure TAppData.SetDriverReport(const Value: Variant);
begin
  FDriverReport := Value;
end;

procedure TAppData.SetTypeDocReport(const Value: Variant);
begin
  FTypeDocReport := Value;
end;

procedure TAppData.SetTypeTovrReport(const Value: Variant);
begin
  FTypeTovrReport := Value;
end;

end.
