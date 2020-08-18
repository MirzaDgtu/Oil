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
    AvailableAction: TAction;
    BitBtn1: TBitBtn;
    procedure DriversGridTitleClick(Column: TColumn);
    procedure RefreshActionExecute(Sender: TObject);
    procedure AddActionExecute(Sender: TObject);
    procedure CorrActionExecute(Sender: TObject);
    procedure DelActionExecute(Sender: TObject);
    procedure AvailableActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SetInfoSB(KolDriver, KolAvailableDriver: integer);
  public
    { Public declarations }
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
             AppData.Command.Execute;
          except
             on ex: Exception do
               MessageDlg('Ошибка добавления нового водителя!' + #13 + 'Сообщение: ' + ex.Message, mtError, [mbOK], 0);
          end;
    finally
       FreeAndNil(DriverD);
       RefreshActionExecute(Sender);
    end;
end;

procedure TDriversFrame.CorrActionExecute(Sender: TObject);
var
    DriverD: TDriverDetailDialog;
begin
   DriverD := TDriverDetailDialog.Create(Application, g_Corr);

   with DriverD do
   try
       if DriverD.ShowModal = mrOk then
         try
             AppData.Command.CommandText := Format(SSQLCorrDriver, [AppData.DriversL.FieldByName('UID').AsInteger,
                                                                    FamilyEdit.Text,
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
             AppData.Command.Execute;
          except
             on ex: Exception do
               MessageDlg('Ошибка изменения информации водителя!' + #13 + 'Сообщение: ' + ex.Message, mtError, [mbOK], 0);
          end;
   finally
      FreeAndNil(DriverD);   
      RefreshActionExecute(Sender);
   end;
end;

procedure TDriversFrame.DelActionExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Вы действительно желаете удалить водителя?', 'Удаление водителя', MB_ICONWARNING+MB_YESNO) = ID_YES then
    try
       AppData.Command.CommandText := Format(SSQLDelDriver, [AppData.DriversL.FieldByName('UID').AsInteger]);
       AppData.Command.Execute;
    finally
      RefreshActionExecute(Sender);
    end;
end;

procedure TDriversFrame.AvailableActionExecute(Sender: TObject);
begin
   try
    case Byte(AppData.DriversL.FieldByName('Available').AsBoolean) of
      0: if MessageBox(Handle, 'Вы действительно желаете уволить водителя?', 'Увольнение', MB_ICONWARNING+MB_YESNO) = ID_YES then
           AppData.Command.CommandText := Format(SSQLTransferDriver, [AppData.DriversL.FieldByName('UID').AsInteger,
                                                                      1]);
      1:   AppData.Command.CommandText := Format(SSQLTransferDriver, [AppData.DriversL.FieldByName('UID').AsInteger,
                                                                      0]);
    end;

    AppData.Command.Execute();
   finally
     RefreshActionExecute(Sender);
   end;
end;

end.
