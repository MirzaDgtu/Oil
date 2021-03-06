unit InsuranceDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TInsuranceDetailForm = class(TForm)
    DocGB: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ReserveChB: TCheckBox;
    SerialEdit: TEdit;
    NumberEdit: TEdit;
    DocDP: TDateTimePicker;
    DateDocGB: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    BegDP: TDateTimePicker;
    EndDP: TDateTimePicker;
    PrimechGB: TGroupBox;
    BtnsPnl: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    CarGB: TGroupBox;
    PrimechMemo: TMemo;
    CarBtn: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ModelEdit: TEdit;
    RegSymbolEdit: TEdit;
    TypeEdit: TEdit;
    ColorEdit: TEdit;
    YearEdit: TEdit;
    procedure SerialEditKeyPress(Sender: TObject; var Key: Char);
    procedure CarBtnClick(Sender: TObject);
    procedure BegDPChange(Sender: TObject);
  private
    { Private declarations }
    FUID_Car: integer;
    procedure SetUID_Car(const Value: integer);
    procedure CorrDP();

    procedure setLimitSetting();
  public
    { Public declarations }

    constructor Create(Value: Shortint); overload;
  published
    property UID_Car: integer read FUID_Car write SetUID_Car default 0;
  end;

var
  InsuranceDetailForm: TInsuranceDetailForm;

implementation

uses Car, AppDM, DB, Globals;

{$R *.dfm}

procedure TInsuranceDetailForm.SerialEditKeyPress(Sender: TObject;
  var Key: Char);
begin
    case Key of
      '0'..'9': ;
      #8, #13: ;
    else
      Key := #0;
    end;

end;

procedure TInsuranceDetailForm.CarBtnClick(Sender: TObject);
var
    CarF: TCarForm;
begin
  CarF := TCarForm.Create(g_Corr);

  try
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

procedure TInsuranceDetailForm.SetUID_Car(const Value: integer);
begin
  FUID_Car := Value;
end;

procedure TInsuranceDetailForm.CorrDP;
begin
    if BegDP.Date > EndDP.Date then
      EndDP.Date := BegDP.Date;
end;

procedure TInsuranceDetailForm.BegDPChange(Sender: TObject);
begin
  CorrDP();
end;

constructor TInsuranceDetailForm.Create(Value: Shortint);
begin
  inherited Create(Application);

  case Value of
    g_New: ;
    g_Corr: ;
    g_View: setLimitSetting();
  end;
end;

procedure TInsuranceDetailForm.setLimitSetting;
begin
  try
    DocGB.Enabled := False;
    DateDocGB.Enabled := False;
    CarGB.Enabled := False;
    PrimechGB.Enabled := False;
    OkBtn.Enabled := False;
  except
      ShowMessage('������ ����������� �������� � ������!');
  end;
end;

end.
