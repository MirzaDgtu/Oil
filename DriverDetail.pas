unit DriverDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TDriverDetailDialog = class(TForm)
    DriverGB: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FamilyEdit: TEdit;
    NameEdit: TEdit;
    LastNameEdit: TEdit;
    Label4: TLabel;
    BirthDayDP: TDateTimePicker;
    PassportGB: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    PassSerialEdit: TEdit;
    PassNumEdit: TEdit;
    PassGaveGB: TGroupBox;
    PassGaveMemo: TMemo;
    BtnsPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    AvailableChB: TCheckBox;
    CarGB: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    CarBtn: TBitBtn;
    ModelEdit: TEdit;
    RegSymbolEdit: TEdit;
    TypeEdit: TEdit;
    ColorEdit: TEdit;
    YearEdit: TEdit;
    PrimechGB: TGroupBox;
    PrimechMemo: TMemo;
    LicenseGB: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    LicenseGaveGB: TGroupBox;
    LicenseGaveMemo: TMemo;
    LicenseSerialEdit: TEdit;
    LicenseNumEdit: TEdit;
    LicenseCategoriesEdit: TEdit;
    LicenseBegDP: TDateTimePicker;
    LicenseEndDP: TDateTimePicker;
    AdressEdit: TEdit;
    Label17: TLabel;
    HiringDP: TDateTimePicker;
    Label18: TLabel;
    ClearCarBtn: TBitBtn;
    procedure CarBtnClick(Sender: TObject);
    procedure ClearCarBtnClick(Sender: TObject);
  private
    FUID_Car: integer;
    procedure SetUID_Car(const Value: integer);
    procedure SetNewDriver();
    procedure SetCorrDriver();
    procedure SetViewDriver();
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; TypeView: integer); overload;

    property UID_Car: integer read FUID_Car write SetUID_Car;
  end;

var
  DriverDetailDialog: TDriverDetailDialog;

implementation

uses Car, CarStory, AppDM, Globals, DB;

{$R *.dfm}

procedure TDriverDetailDialog.CarBtnClick(Sender: TObject);
var
    CarF: TCarStoryForm;
begin
  CarF := TCarStoryForm.Create(g_New, 0);

  try
        CarF.Caption := 'Выбор автомобиля';
        if CarF.ShowModal = mrOk then
          try
             ModelEdit.Text := AppData.Cars.FieldByName('Model').AsString;
             RegSymbolEdit.Text := AppData.Cars.FieldByName('REG_SYMBOL').AsString;
             TypeEdit.Text := AppData.Cars.FieldByName('TYPE_TC').AsString;
             ColorEdit.Text := AppData.Cars.FieldByName('Color').AsString;
             YearEdit.Text := AppData.Cars.FieldByName('MADEYEAR').AsString;
             UID_Car := AppData.Cars.FieldByName('UID').AsInteger;
          finally
          end;
  finally
    FreeAndNil(CarF);
  end;
end;

constructor TDriverDetailDialog.Create(AOwner: TComponent;
  TypeView: integer);
begin
  inherited Create(AOwner);

  case TypeView of
    g_New: SetNewDriver();
    g_Corr: SetCorrDriver();
    g_View: SetViewDriver();
  end;
end;

procedure TDriverDetailDialog.SetCorrDriver;
begin
   if (AppData.DriversL.Active) and
      (AppData.DriversL.RecordCount > 0) then
      try
        // Водитель
        FamilyEdit.Text := AppData.DriversL.FieldByName('Family').AsString;
        NameEdit.Text := AppData.DriversL.FieldByName('Name').AsString;
        LastNameEdit.Text := AppData.DriversL.FieldByName('LastName').AsString;
        AdressEdit.Text := AppData.DriversL.FieldByName('Adress').AsString;
        BirthDayDP.DateTime := AppData.DriversL.FieldByName('BirthDay').AsDateTime  ;
        HiringDP.Date := AppData.DriversL.FieldByName('Date_Hiring').AsDateTime;
        AvailableChB.Checked := AppData.DriversL.FieldByName('Available').AsBoolean;

        // Паспорт
        PassSerialEdit.Text := AppData.DriversL.FieldByName('Pass_Serial').AsString;
        PassNumEdit.Text := AppData.DriversL.FieldByName('Pass_Num').AsString;
        PassGaveMemo.Lines.Text := AppData.DriversL.FieldByName('Pass_Gave').AsString;

        // Водительское удостоверение
        LicenseSerialEdit.Text := AppData.DriversL.FieldByName('License_Serial').AsString;
        LicenseNumEdit.Text := AppData.DriversL.FieldByName('License_Num').AsString;
        LicenseCategoriesEdit.Text := AppData.DriversL.FieldByName('License_Access').AsString;
        LicenseBegDP.Date := AppData.DriversL.FieldByName('License_BegDate').AsDateTime;
        LicenseEndDP.Date := AppData.DriversL.FieldByName('License_EndDate').AsDateTime;
        LicenseGaveMemo.Lines.Text := AppData.DriversL.FieldByName('License_Gave').AsString;

        // Автомобиль
        ModelEdit.Text := AppData.DriversL.FieldByName('MODEL').AsString;
        RegSymbolEdit.Text := AppData.DriversL.FieldByName('REG_SYMBOL').AsString;
        TypeEdit.Text := AppData.DriversL.FieldByName('TYPE_TC').AsString;
        ColorEdit.Text := AppData.DriversL.FieldByName('COLOR').AsString;
        YearEdit.Text := AppData.DriversL.FieldByName('MADEYEAR').AsString;
        UID_Car := AppData.DriversL.FieldByName('UID_Car').AsInteger;

        // Примечание
        PrimechMemo.Lines.Text := AppData.DriversL.FieldByName('Primech').AsString;
      finally
      end;
end;

procedure TDriverDetailDialog.SetNewDriver;
begin
  BirthDayDP.Date := Now();
  HiringDP.Date := Now();
  LicenseBegDP.Date := Now();
  LicenseEndDP.Date := Now();
end;

procedure TDriverDetailDialog.SetUID_Car(const Value: integer);
begin
  FUID_Car := Value;
end;

procedure TDriverDetailDialog.SetViewDriver;
begin
  SetCorrDriver();

  // Блокировка полей
  DriverGB.Enabled := False;
  PassportGB.Enabled := False;
  LicenseGB.Enabled := False;
  DriverGB.Enabled := False;
  PrimechGB.Enabled := False;

end;

procedure TDriverDetailDialog.ClearCarBtnClick(Sender: TObject);
var
    i: integer;
begin
  UID_Car := 0;
  with CarGB do
    Begin
      for i := 0 to ControlCount -1 do
        if Controls[i] is TEdit then
          TEdit(Controls[i]).Text := EmptyStr;
    end;
end;
end.
