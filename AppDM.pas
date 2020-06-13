unit AppDM;

interface

uses
  SysUtils, Classes, DB, ADODB, ComCtrls;

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
    CarsREG_SYMBOL: TStringField;
    CarsMODEL: TStringField;
    CarsTYPE_TC: TStringField;
    CarsCATEGORY: TStringField;
    CarsMADEYEAR: TIntegerField;
    CarsCARCASS: TStringField;
    CarsCOLOR: TStringField;
    CarsMOTOR_POWER: TFloatField;
    CarsECOLOGY: TStringField;
    CarsRESERVE: TBooleanField;
    CarDetailROWID: TIntegerField;
    CarDetailUID_CAR: TIntegerField;
    CarDetailPASSPORT_NUM: TIntegerField;
    flPASSPORT_SERIAL: TIntegerField;
    CarDetailMASS_MAX: TFloatField;
    CarDetailMASS_LOADOUT: TFloatField;
    CarDetailINS_NUM: TIntegerField;
    CarDetailINS_SERIAL: TIntegerField;
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
    CarDetailDOC_SERIAL: TIntegerField;
    CarDetailDOC_NUM: TIntegerField;
    CarDetailINS_UID: TIntegerField;
    CarsEmployeeName: TStringField;
    CarssWHO_CORR: TStringField;
    Insurance: TADODataSet;
    InsuranceDetail: TADODataSet;
    DS_Insurance: TDataSource;
    InsuranceUID: TIntegerField;
    InsuranceSERIAL: TIntegerField;
    InsuranceNUMBER: TIntegerField;
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
    InsuranceDetailSERIAL: TIntegerField;
    InsuranceDetailNUMBER: TIntegerField;
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
    NaklUNICUM_NUM: TIntegerField;
    NaklNUM_DOC: TIntegerField;
    NaklDATE_DOC: TDateTimeField;
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
    NaklPRIMECH: TStringField;
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
    StringField4: TStringField;
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
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
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
    procedure SubjectsBeforeOpen(DataSet: TDataSet);
    procedure ConsumptionsBeforeOpen(DataSet: TDataSet);
    procedure CarDetailBeforeOpen(DataSet: TDataSet);
    procedure CarsAfterScroll(DataSet: TDataSet);
    procedure TypeTovrBeforeOpen(DataSet: TDataSet);
  private
    procedure QuitApplication(const Msg: string);
  public
    class procedure SetInfoSB(DataSet: TADODataSet; SB: TStatusBar);
    constructor Create(AOwner: TComponent); override;
  end;

var
  AppData: TAppData;

implementation

uses
  Windows, SConst, Login, Globals, Controls, Forms, Dialogs;

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

procedure TAppData.CarDetailBeforeOpen(DataSet: TDataSet);
begin
    CarDetail.CommandText := Format(SSQLGetCarDetail, [Cars.FieldByName('UID').AsInteger,
                                                       Cars.FieldByName('Archive').AsString]);
end;

procedure TAppData.CarsAfterScroll(DataSet: TDataSet);
begin
    CarDetail.Active := False;
    CarDetail.Active := True;
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
          if DataSet.FieldByName('Reserve').AsBoolean then
            ValueRes := ValueRes + 1;

          if DataSet.FieldByName('Archive').AsString = '*' then
            ValueArch := ValueArch + 1;

          DataSet.Next;
        end;
    finally
      if SB.Panels.Count = 3 then
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
end.
