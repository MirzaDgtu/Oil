unit Drivers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, DB, ADODB,
  ActnList, ImgList;

type
  TDriversFrame = class(TFrame)
    SB: TStatusBar;
    BtnsPanel: TPanel;
    Bevel1: TBevel;
    NewNaklBtn: TBitBtn;
    CorrNaklBtn: TBitBtn;
    ViewBtn: TBitBtn;
    DelNaklBtn: TBitBtn;
    RefreshReestrBtn: TBitBtn;
    AvailableChB: TCheckBox;
    FindGB: TGroupBox;
    FindCB: TComboBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    HeaderPanel: TPanel;
    DriversGrid: TDBGrid;
    DriverInfoPanel: TPanel;
    PassGB: TGroupBox;
    LicenseGB: TGroupBox;
    CarGB: TGroupBox;
    PrimechGB: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    PassSerialLbl: TLabel;
    PassNumLbl: TLabel;
    PassGaveGB: TGroupBox;
    PassGaveMemo: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    LicenseNumLbl: TLabel;
    LicenseSerialLbl: TLabel;
    Label5: TLabel;
    LicenseCategoriesLbl: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LicenseBegDatelbl: TLabel;
    LicenseEndDateLbl: TLabel;
    LicenseGaveGB: TGroupBox;
    LicenseGaveMemo: TMemo;
    PrimechMemo: TMemo;
    Label8: TLabel;
    ModelEdit: TEdit;
    Label9: TLabel;
    RegSymbolEdit: TEdit;
    Label10: TLabel;
    TypeEdit: TEdit;
    Label11: TLabel;
    ColorEdit: TEdit;
    Label12: TLabel;
    YearEdit: TEdit;
    AL: TActionList;
    AddAction: TAction;
    CorrAction: TAction;
    ViewAction: TAction;
    DelAction: TAction;
    RefreshAction: TAction;
    FindAction: TAction;
    IL: TImageList;
    procedure DriversGridTitleClick(Column: TColumn);
    procedure RefreshActionExecute(Sender: TObject);
    procedure AddActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SetInfoSB(KolDriver, KolAvailableDriver: integer);
  public
    { Public declarations }
    class procedure SetDriverDetail();
  end;

var
  DriversF: TDriversFrame;

implementation

uses AppDM, SConst, Globals, DriverDetail;

{$R *.dfm}

procedure TDriversFrame.DriversGridTitleClick(Column: TColumn);
var
  Str: string;
begin
  if Assigned(Column) and Assigned(Column.Field) and
    (Column.Field.FieldKind = fkData) then
    with TADODataset(Column.Grid.DataSource.Dataset) do
    begin
      Str := Column.FieldName;
      if Pos(Str, IndexFieldNames) = 0 then
        IndexFieldNames := Str
      else
        if Pos('DESC', IndexFieldNames) > 0 then
          IndexFieldNames := Str
        else
          IndexFieldNames := Str + ' DESC';
    end;
end;

class procedure TDriversFrame.SetDriverDetail;
begin
  if AppData.DriversL.Active = True then
    try
      with DriversF do
        Begin
          // Паспорт
          PassSerialLbl.Caption := AppData.DriversL.FieldByName('Pass_Serial').AsString;
          PassNumLbl.Caption := AppData.DriversL.FieldByName('Pass_Num').AsString;
          PassGaveMemo.Lines.Add(AppData.DriversL.FieldByName('Pass_Gave').AsString);

          // Водительское удостоверение
          LicenseSerialLbl.Caption := AppData.DriversL.FieldByName('License_Serial').AsString;
          LicenseNumLbl.Caption := AppData.DriversL.FieldByName('License_Num').AsString;
          LicenseCategoriesLbl.Caption := AppData.DriversL.FieldByName('License_Access').AsString;
          LicenseBegDatelbl.Caption := AppData.DriversL.FieldByName('License_BegDate').AsString;
          LicenseEndDateLbl.Caption := AppData.DriversL.FieldByName('License_EndDate').AsString;
          LicenseGaveMemo.Lines.Add(AppData.DriversL.FieldByName('License_Gave').AsString);

          // Автомобиль
          ModelEdit.Text := AppData.DriversL.FieldByName('MODEL').AsString;
          RegSymbolEdit.Text := AppData.DriversL.FieldByName('REG_SYMBOL').AsString;
          TypeEdit.Text := AppData.DriversL.FieldByName('TYPE_TC').AsString;
          ColorEdit.Text := AppData.DriversL.FieldByName('COLOR').AsString;
          YearEdit.Text := AppData.DriversL.FieldByName('MADEYEAR').AsString;

          // Примечание
          PrimechMemo.Text := AppData.DriversL.FieldByName('Primech').AsString;
        end;
    except
      on Ex: Exception do
        MessageDlg('Ошибка получения детализации водителя!' + #13 + 'Сообщение: ' + Ex.Message, mtError, [mbOK], 0);
    end;
end;

procedure TDriversFrame.RefreshActionExecute(Sender: TObject);
var
   CountAvai, i: integer;
begin
  CountAvai := 0;

  try
    AppData.DriversL.Active := False;
    AppData.DriversL.CommandText := Format(SSQLGetDriversL, [Byte(AvailableChB.Checked)]);
    AppData.DriversL.Active := True;

    for i := 0 to AppData.DriversL.RecordCount - 1 do
      Inc(CountAvai);
  finally
    SetInfoSB(AppData.DriversL.RecordCount, CountAvai);
  end;
end;

procedure TDriversFrame.SetInfoSB(KolDriver, KolAvailableDriver: integer);
begin
  SB.Panels[0].Text := Format('Водителей: %d', [KolDriver]);
  SB.Panels[1].Text := Format('Уволенных: %d', [KolAvailableDriver]);
end;

procedure TDriversFrame.AddActionExecute(Sender: TObject);
var
    DriverD: TDriverDetailDialog;
begin
    DriverD := TDriverDetailDialog.Create(Application, g_New);

    with DriverD do
    try
       if ShowModal = mrOk then
          try
             AppData.Command.CommandText := Format(SSQLInsDriver, [FamilyEdit.Text,
                                                                   NameEdit.Text,
                                                                   LastNameEdit.Text,
                                                                   FormatDateTime('yyyy-mm-dd', BirthDayDP.Date),
                                                                   PassSerialEdit.Text,
                                                                   PassNumEdit.Text,
                                                                   PassGaveMemo.Text,
                                                                   LicenseSerialEdit.Text,
                                                                   LicenseNumEdit.Text,
                                                                   FormatDateTime('yyyy-mm-dd', LicenseBegDP.Date),
                                                                   FormatDateTime('yyyy-mm-dd', LicenseEndDP.Date),
                                                                   LicenseGaveMemo.Text,
                                                                   LicenseCategoriesEdit.Text,
                                                                   AdressEdit.Text,
                                                                   UID_Car,
                                                                   FormatDateTime('yyyy-mm-dd', HiringDP.Date),
                                                                   Byte(DriverD.AvailableChB.Checked),
                                                                   PrimechMemo.Text]);
             ShowMessage(AppData.Command.CommandText);
             AppData.Command.Execute;
          except
             on ex: Exception do
               MessageDlg('Ошибка добавления нового пользователя!' + #13 + 'Сообщение: ' + ex.Message, mtError, [mbOK], 0);
          end;
    finally
       FreeAndNil(DriverD);
       RefreshActionExecute(Sender);
    end;
end;

end.
