unit CarDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TCarDetailForm = class(TForm)
    TechPropGB: TGroupBox;
    InsuranceGB: TGroupBox;
    BtnsPnl: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DocGB: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DocumentGB: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    RegSymbolEdit: TEdit;
    VinEdit: TEdit;
    ModelEdit: TEdit;
    TypeEdit: TEdit;
    CategoryCB: TComboBox;
    YearEdit: TSpinEdit;
    ShassisEdit: TEdit;
    CarcassEdit: TEdit;
    ColorEdit: TEdit;
    PowerEdit: TEdit;
    EcologyEdit: TEdit;
    PasNumEdit: TEdit;
    PasSerialEdit: TEdit;
    MassMaxEdit: TEdit;
    MassLoadOutEdit: TEdit;
    InsNumEdit: TEdit;
    InsSerialEdit: TEdit;
    DateBegPicker: TDateTimePicker;
    DateEndPicker: TDateTimePicker;
    DocNumEdit: TEdit;
    DocSerialEdit: TEdit;
    ReservChB: TCheckBox;
    Label22: TLabel;
    StateCB: TComboBox;
    PrimechBG: TGroupBox;
    PrimechMemo: TMemo;
    InsBtn: TBitBtn;
    procedure MassMaxEditKeyPress(Sender: TObject; var Key: Char);
    procedure MassLoadOutEditKeyPress(Sender: TObject; var Key: Char);
    procedure PasSerialEditKeyPress(Sender: TObject; var Key: Char);
    procedure PowerEditKeyPress(Sender: TObject; var Key: Char);
    procedure InsBtnClick(Sender: TObject);
  private
    FUID_Insurance: integer;
    procedure SetUID_Insurance(const Value: integer);
    procedure setLimitSetting();
    { Private declarations}
  public
    { Public declarations }
    constructor Create(Value: Shortint); overload;
    
  published
    property UID_Insurance: integer read FUID_Insurance write SetUID_Insurance default 0;
  end;

var
  CarDetailForm: TCarDetailForm;

implementation

uses AppDM, Insurance, SConst, DB, Globals, InsuranceStory;

{$R *.dfm}

procedure TCarDetailForm.MassMaxEditKeyPress(Sender: TObject;
  var Key: Char);
begin
    case Key of
      '0'..'9': ;
      ',','.': Begin
                 if Key <> DecimalSeparator then
                    Key := DecimalSeparator;

                 if Pos(DecimalSeparator, MassMaxEdit.Text) > 0 then Key := #0;
               end;
      #13: ;
      #8: ;
      else
            Key := #0;
      end;
end;

procedure TCarDetailForm.MassLoadOutEditKeyPress(Sender: TObject;
  var Key: Char);
begin

    case Key of
      '0'..'9': ;
      ',','.': Begin
                 if Key <> DecimalSeparator then
                    Key := DecimalSeparator;

                 if Pos(DecimalSeparator, MassLoadOutEdit.Text) > 0 then Key := #0;
               end;
      #13: ;
      #8: ;
      else
            Key := #0;
      end;
end;

procedure TCarDetailForm.PasSerialEditKeyPress(Sender: TObject;
  var Key: Char);
begin
    case Key of
      '0'..'9': ;
      #13: ;
      #8: ;
    else
      Key := #0;
    end;
end;

procedure TCarDetailForm.PowerEditKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
      '0'..'9': ;
      ',','.': Begin
                 if Key <> DecimalSeparator then
                    Key := DecimalSeparator;

                 if Pos(DecimalSeparator, PowerEdit.Text) > 0 then Key := #0;
               end;
      #13: ;
      #8: ;
      else
            Key := #0;
      end;
end;

procedure TCarDetailForm.SetUID_Insurance(const Value: integer);
begin
  FUID_Insurance := Value;
end;

procedure TCarDetailForm.InsBtnClick(Sender: TObject);
var
    InsF: TIsnuranceStoryForm;
begin
    InsF := TIsnuranceStoryForm.Create(g_New, 0);

    try
      with InsF do
        Begin
          if ShowModal = mrok then
            Begin
              if AppData.Insurance.FieldByName('ValidDay').AsInteger > 0 then
              try
                InsSerialEdit.Text := AppData.Insurance.FieldByName('SERIAL').AsString;
                InsNumEdit.Text := AppData.Insurance.FieldByName('NUMBER').AsString;
                DateBegPicker.Date := AppData.Insurance.FieldByName('BEG_DATE').AsDateTime;
                DateEndPicker.Date := AppData.Insurance.FieldByName('End_DATE').AsDateTime;
                UID_Insurance := AppData.Insurance.FieldByName('UID').AsInteger;
              except
                on Err: Exception do
                  MessageDlg('Ошибка получения информации' + #13 + 'о страховом документе!' + #13 + 'Сообщение: ' + Err.Message, mtError, [mbOK], 0);
              end;
            end;
        end;
    finally
       FreeAndNil(InsF);
    end;
end;

constructor TCarDetailForm.Create(Value: Shortint);
begin
    inherited Create(Application);

    case Value of
      g_New: ;
      g_Corr: ;
      g_View: setLimitSetting();
    end;
end;

procedure TCarDetailForm.setLimitSetting;
begin
     try
       TechPropGB.Enabled := False;
       DocGB.Enabled := False;
       InsuranceGB.Enabled := False;
       DocumentGB.Enabled := False;
       PrimechBG.Enabled := False;
       OkBtn.Enabled := False;
     finally
        CancelBtn.Enabled := True;
     end;
end;

end.
