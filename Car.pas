unit Car;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ExtCtrls, ComCtrls, ActnList, ToolWin, StdCtrls,
  Buttons, Menus, Grids, DBGrids, ADODB, DB, StrUtils;

type
  TCarForm = class(TForm)
    AL: TActionList;
    AddAction: TAction;
    CorrAction: TAction;
    DelAction: TAction;
    RefreshAction: TAction;
    TransferAction: TAction;
    SB: TStatusBar;
    HeaderPanel: TPanel;
    IL: TImageList;
    BtnsPanel: TPanel;
    Bevel1: TBevel;
    AddBtn: TBitBtn;
    CorrBtn: TBitBtn;
    DelBtn: TBitBtn;
    TransferBtn: TBitBtn;
    RefreshBtn: TBitBtn;
    ResevrChB: TCheckBox;
    FindGB: TGroupBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    FindAction: TAction;
    FindCB: TComboBox;
    PopMenu: TPopupMenu;
    AddItemPop: TMenuItem;
    CorItemPop: TMenuItem;
    DelItemPop: TMenuItem;
    TransferItemPop: TMenuItem;
    RefreshItemPop: TMenuItem;
    GridsGB: TGroupBox;
    CarGrid: TDBGrid;
    Splitter1: TSplitter;
    DetailGB: TGroupBox;
    PassportGB: TGroupBox;
    Label1: TLabel;
    PasNumLbl: TLabel;
    Label2: TLabel;
    PasSerNum: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MasMaxLbl: TLabel;
    MassLoudOutLbl: TLabel;
    InsuranceGB: TGroupBox;
    Label5: TLabel;
    InsSerLbl: TLabel;
    Label7: TLabel;
    InsNumLbl: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BeginDateLbl: TLabel;
    EndDateLbl: TLabel;
    DocumentGB: TGroupBox;
    Label6: TLabel;
    DocSerLbl: TLabel;
    Label11: TLabel;
    DocNumLbl: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    ShassisLbl: TLabel;
    StateLbl: TLabel;
    PrimechGB: TGroupBox;
    PrimechMemo: TMemo;
    SetInsDetailBtn: TBitBtn;
    RangeAction: TAction;
    RangeBtn: TBitBtn;
    N1: TMenuItem;
    StoryBtn: TBitBtn;
    StoryAction: TAction;
    procedure CarGridTitleClick(Column: TColumn);
    procedure AddActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure CarGridDblClick(Sender: TObject);
    procedure CarGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CorrActionExecute(Sender: TObject);
    procedure FindActionExecute(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure RangeActionExecute(Sender: TObject);
    procedure TransferActionExecute(Sender: TObject);
    procedure DelActionExecute(Sender: TObject);
    procedure StoryActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FBegD: TDateTime;
    FEndD: TDateTime;
    FiTypeF: Shortint;
    { Private declarations }
    procedure setLimitSettingModule();
    procedure setStorySetting(UID: integer);
    procedure SetBegD(const Value: TDateTime);
    procedure SetEndD(const Value: TDateTime);
    procedure SetiTypeF(const Value: Shortint);

    procedure CreateForm();

  protected
    property iTypeF: Shortint read FiTypeF write SetiTypeF;
  public
    { Public declarations }
    procedure SetCarDetail();

    constructor Create(Value: Shortint);
    //constructor Create(AOwner: TComponent); overload; override;

  published
    property BegD: TDateTime read FBegD write SetBegD;
    property EndD: TDateTime read FEndD write SetEndD;
  end;

var
  CarForm: TCarForm;

implementation

uses AppDM, SConst, CarDetail, Globals, Range, DateUtils;

{$R *.dfm}

procedure TCarForm.CarGridTitleClick(Column: TColumn);
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

procedure TCarForm.AddActionExecute(Sender: TObject);
var
    CarD: TCarDetailForm;
begin
   CarD := TCarDetailForm.Create(Application);

   try
      if CarD.ShowModal = mrOk then
        with CarD do
        try
          AppData.Command.CommandText := Format(SSQLInsCar, [Trim(IfThen(RegSymbolEdit.Text = EmptyStr, '0', RegSymbolEdit.Text)),
                                                             Trim(VinEdit.Text),
                                                             Trim(ModelEdit.Text),
                                                             Trim(TypeEdit.Text),
                                                             CategoryCB.Text,
                                                             YearEdit.Value,
                                                             Trim(CarcassEdit.Text),
                                                             Trim(ColorEdit.Text),
                                                             PowerEdit.Text,
                                                             Trim(EcologyEdit.Text),
                                                             Byte(CarD.ReservChB.Checked),
                                                             g_User,

                                                             StrToInt(IfThen(PasSerialEdit.Text = EmptyStr, '0', PasSerialEdit.Text)),
                                                             StrToInt(IfThen(PasNumEdit.Text = EmptyStr, '0', PasNumEdit.Text)),
                                                             MassMaxEdit.Text,
                                                             MassLoadOutEdit.Text,
                                                             UID_Insurance,
                                                             Trim(ShassisEdit.Text),
                                                             StateCB.Text,
                                                             StrToInt(IfThen(DocSerialEdit.Text = EmptyStr, '0', DocSerialEdit.Text)),
                                                             StrToInt(IfThen(DocNumEdit.Text = EmptyStr, '0', DocNumEdit.Text)),
                                                             Trim(CarD.PrimechMemo.Text)]);
       // ShowMessage(AppData.Command.CommandText);
        AppData.Command.Execute;
        except
          on Err: Exception do
            ShowMessage('������ ���������� ������ ����������!' + #13 + '���������: ' + Err.Message);
        end;
   finally
      FreeAndNil(CarD);
      RefreshActionExecute(Self);
   end;

end;

procedure TCarForm.SetCarDetail;
begin
    if not AppData.CarDetail.IsEmpty then
      try
          PasSerNum.Caption := AppData.CarDetail.FieldByName('PASSPORT_SERIAL').AsString;
          PasNumLbl.Caption := AppData.CarDetail.FieldByName('PASSPORT_NUM').AsString;
          MasMaxLbl.Caption := AppData.CarDetail.FieldByName('MASS_MAX').AsString;
          MassLoudOutLbl.Caption := AppData.CarDetail.FieldByName('MASS_LOADOUT').AsString;
          InsSerLbl.Caption := AppData.CarDetail.FieldByName('INS_SERIAL').AsString;
          InsNumLbl.Caption := AppData.CarDetail.FieldByName('INS_NUM').AsString;
          BeginDateLbl.Caption := AppData.CarDetail.FieldByName('BEG_DATE').AsString;
          EndDateLbl.Caption := AppData.CarDetail.FieldByName('END_DATE').AsString;
          DocSerLbl.Caption := AppData.CarDetail.FieldByName('DOC_SERIAL').AsString;
          DocNumLbl.Caption := AppData.CarDetail.FieldByName('DOC_NUM').AsString;
          ShassisLbl.Caption := AppData.CarDetail.FieldByName('SHASSIS').AsString;
          StateLbl.Caption := AppData.CarDetail.FieldByName('WORKSTATE').AsString;
          PrimechMemo.Text := AppData.CarDetail.FieldByName('PRIMECH').AsString;
      except
        on Err: Exception do
          ShowMessage('������ ��������� ���������� ���������� ������.' + #13 + '���������: ' + Err.Message);
      end;
end;

procedure TCarForm.RefreshActionExecute(Sender: TObject);
begin
    AppData.Cars.Active := False;
    AppData.Cars.CommandText := Format(SSQLGetCars, [Byte(ResevrChB.Checked),
                                                     FormatDateTime('yyyy-mm-dd', BegD),
                                                     FormatDateTime('yyyy-mm-dd', EndD)]);
    AppData.Cars.Active := True;
end;

procedure TCarForm.CarGridDblClick(Sender: TObject);
begin
    SetCarDetail();
end;

procedure TCarForm.CarGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if AppData.Cars.FieldByName('Reserve').AsBoolean = True then
    CarGrid.Canvas.Brush.Color := clRed;
  if AppData.Cars.FieldByName('Archive').AsString = '*' then
      CarGrid.Canvas.Brush.Color := clScrollBar;

    CarGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TCarForm.CorrActionExecute(Sender: TObject);
var
    CarD: TCarDetailForm;
    UID_Car: integer;
begin
  if (AppData.Cars.Active) and
     (not AppData.Cars.IsEmpty) then
   try
    if (AppData.Cars.FieldByName('Archive').AsString = EmptyStr) then
       CarD := TCarDetailForm.Create(g_Corr)
    else
       CarD := TCarDetailForm.Create(g_View);
       
      with CarD do
        Begin
           RegSymbolEdit.Text := AppData.Cars.FieldByName('REG_SYMBOL').AsString;
           VinEdit.Text := AppData.Cars.FieldByName('VIN').AsString;
           ModelEdit.Text := AppData.Cars.FieldByName('MODEL').AsString;
           TypeEdit.Text := AppData.Cars.FieldByName('TYPE_TC').AsString;
           CategoryCB.ItemIndex := CategoryCB.Items.IndexOf(AppData.Cars.FieldByName('CATEGORY').AsString);
           YearEdit.Value := AppData.Cars.FieldByName('MadeYear').AsInteger;
           ShassisEdit.Text := AppData.CarDetail.FieldByName('SHASSIS').AsString;
           CarcassEdit.Text := AppData.Cars.FieldByName('CARCASS').AsString;
           ColorEdit.Text := AppData.Cars.FieldByName('COLOR').AsString;
           PowerEdit.Text := AppData.Cars.FieldByName('MOTOR_POWER').AsString;
           EcologyEdit.Text := AppData.Cars.FieldByName('ECOLOGY').AsString;
           StateCB.ItemIndex := StateCB.Items.IndexOf(AppData.CarDetail.FieldByName('WORKSTATE').AsString);
           CarD.ReservChB.Checked := AppData.Cars.FieldByName('Reserve').AsBoolean;
           PasSerialEdit.Text := AppData.CarDetail.FieldByName('PASSPORT_SERIAL').AsString;
           PasNumEdit.Text := AppData.CarDetail.FieldByName('PASSPORT_NUM').AsString;
           MassMaxEdit.Text := AppData.CarDetail.FieldByName('MASS_MAX').AsString;
           MassLoadOutEdit.Text := AppData.CarDetail.FieldByName('MASS_LOADOUT').AsString;
           InsSerialEdit.Text := AppData.CarDetail.FieldByName('INS_SERIAL').AsString;
           InsNumEdit.Text := AppData.CarDetail.FieldByName('INS_NUM').AsString;
           DateBegPicker.Date := AppData.CarDetail.FieldByName('BEG_DATE').AsDateTime;
           DateEndPicker.Date := AppData.CarDetail.FieldByName('END_DATE').AsDateTime;
           DocSerialEdit.Text := AppData.CarDetail.FieldByName('DOC_SERIAL').AsString;
           DocNumEdit.Text := AppData.CarDetail.FieldByName('DOC_NUM').AsString;
           PrimechMemo.Text := AppData.CarDetail.FieldByName('PRIMECH').AsString;
           UID_Insurance :=    AppData.CarDetail.FieldByName('INS_UID').AsInteger;

           if ShowModal = mrOk then
            try
              AppData.Command.CommandText := Format(SSQLCorrCar, [AppData.Cars.FieldByName('UID').AsInteger,
                                                                  Trim(IfThen(RegSymbolEdit.Text = EmptyStr, '0', RegSymbolEdit.Text)),
                                                                  Trim(VinEdit.Text),
                                                                  Trim(ModelEdit.Text),
                                                                  Trim(TypeEdit.Text),
                                                                  CategoryCB.Text,
                                                                  YearEdit.Value,
                                                                  Trim(CarcassEdit.Text),
                                                                  Trim(ColorEdit.Text),
                                                                  PowerEdit.Text,
                                                                  Trim(EcologyEdit.Text),
                                                                  Byte(CarD.ReservChB.Checked),
                                                                  g_User,

                                                                  StrToInt(IfThen(PasSerialEdit.Text = EmptyStr, '0', PasSerialEdit.Text)),
                                                                  StrToInt(IfThen(PasNumEdit.Text = EmptyStr, '0', PasNumEdit.Text)),
                                                                  MassMaxEdit.Text,
                                                                  MassLoadOutEdit.Text,
                                                                  UID_Insurance,
                                                                  Trim(ShassisEdit.Text),
                                                                  StateCB.Text,
                                                                  StrToInt(IfThen(DocSerialEdit.Text = EmptyStr, '0', DocSerialEdit.Text)),
                                                                  StrToInt(IfThen(DocNumEdit.Text = EmptyStr, '0', DocNumEdit.Text)),
                                                                  Trim(CarD.PrimechMemo.Text)]);
              AppData.Command.Execute;
            except
              on Err: Exception do
                ShowMessage('������ ������������� ����������!' + #13 + '���������: ' + Err.Message);
            end;
        end;
   finally
      FreeAndNil(CarD);
      if iTypeF = g_New then
        Begin
          RefreshActionExecute(Self);
          AppData.Cars.Locate('UID', UID_Car, [loCaseInsensitive, loPartialKey]);
        end;
   end;
end;

procedure TCarForm.setLimitSettingModule;
begin

    AppData.Cars.Active := False;
    AppData.Cars.CommandText := Format(SSQLGetCars, [0,
                                                     FormatDateTime('yyyy-mm-dd', BegD),
                                                     FormatDateTime('yyyy-mm-dd', EndD)]);
    AppData.Cars.Active := True;

   try
       AddBtn.Enabled := False;
       CorrBtn.Enabled := False;
       DelBtn.Enabled := False;
       TransferBtn.Enabled := False;
       ResevrChB.Enabled := False;
       PrimechGB.Visible := False;

       with CarGrid do
        Begin
          Columns[12].Visible := False;
          Columns[14].Visible := False;
          Columns[15].Visible := False;
          Columns[17].Visible := False;
          Columns[18].Visible := False;
        end;

       with SetInsDetailBtn do
        Begin
          Left := TransferBtn.Left;
          Top := TransferBtn.Top;
          Visible := True;
          ModalResult := mrOk;
        end;

       Self.Height := 554;
       Self.Width := 1040;
   finally
   end;
end;

procedure TCarForm.FindActionExecute(Sender: TObject);
var
    strFilter: string;
begin
    case FindCB.ItemIndex of
      0: strFilter := 'REG_SYMBOL LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');
      1: strFilter := 'VIN LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');
      2: strFilter := 'MODEL LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');
      3: strFilter := 'CARCASS LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');
    end;


    if (Length(Trim(FindEdit.Text)) > 0) and
       (Length(Trim(strFilter)) > 0) then
      Begin
        AppData.Cars.Filtered := False;
        AppData.Cars.Filter := strFilter;
        AppData.Cars.Filtered := True;
      end;
end;

procedure TCarForm.FindEditChange(Sender: TObject);
begin
  if Length(Trim(FindEdit.Text)) = 0 then
    Begin
      AppData.Cars.Filtered := False;
      FindEdit.Enabled := False;
    end
  else
      FindEdit.Enabled := True;
end;

procedure TCarForm.SetBegD(const Value: TDateTime);
begin
  FBegD := Value;
end;

procedure TCarForm.SetEndD(const Value: TDateTime);
begin
  FEndD := Value;
end;

procedure TCarForm.RangeActionExecute(Sender: TObject);
var
  rangeF: TRangeForm;
begin
  rangeF := TRangeForm.Create(Application);

  try
    rangeF.BegDP.Date := BegD;
    rangeF.EndDP.Date := EndD;
    
    if rangeF.ShowModal =  mrOk then
      Begin
        BegD := rangeF.BegDP.Date;
        EndD := rangeF.EndDP.Date;
      end;
  finally
    FreeAndNil(rangeF);
    RefreshActionExecute(Self);
  end;
end;

procedure TCarForm.TransferActionExecute(Sender: TObject);
var
    UID_Car: integer;
begin
    if (AppData.Cars.Active) and
       (not AppData.Cars.IsEmpty) AND
       (AppData.Cars.FieldByName('Archive').AsString = EmptyStr) then
      try
         UID_Car := AppData.Cars.FieldByName('UID').AsInteger;
         if AppData.Cars.FieldByName('Reserve').AsBoolean = False then
          Begin
            if MessageBox(Handle, '�� ������������� ������� ��������� ���������� � ������?', '������� ���������� �/�� ������(�)', MB_ICONWARNING + MB_YESNO) = ID_YES  then
              Begin
                AppData.Command.CommandText := Format(SSQLTrancferCars, [AppData.Cars.FieldByName('UID').AsInteger,
                                                                         1,
                                                                         g_User]);
                AppData.Command.Execute;
              end;
          end
         else
          begin
                AppData.Command.CommandText := Format(SSQLTrancferCars, [AppData.Cars.FieldByName('UID').AsInteger,
                                                                         0,
                                                                         g_User]);
                AppData.Command.Execute;
          end;

      finally
        RefreshActionExecute(Self);
        AppData.Cars.Locate('UID', IntToStr(UID_Car), [loCaseInsensitive, loPartialKey]);
      end;
end;

procedure TCarForm.DelActionExecute(Sender: TObject);
begin
if (AppData.Cars.Active) and
   (not AppData.Cars.IsEmpty) and
   (AppData.Cars.FieldByName('Archive').AsString = EmptyStr) then
    try
       if MessageBox(Handle, '�� ������������� ������� ������� ��������� �����������?', '�������� ����������', MB_ICONSTOP+MB_YESNO) = ID_YES then
        try
            AppData.Command.CommandText := Format(SSQLDeleteCars, [AppData.Cars.FieldByName('UID').AsInteger]);
            AppData.Command.Execute;
        except
          on Err: Exception do
            MessageDlg('������ �������� ���������!' + #13 + '���������: ' + Err.Message, mtError, [mbOK],0);
        end;
    finally
      RefreshActionExecute(Self);
    end;
end;

procedure TCarForm.SetiTypeF(const Value: Shortint);
begin
  FiTypeF := Value;
end;

procedure TCarForm.setStorySetting(UID: integer);
var
    i: integer;
begin
    AppData.CarStory.Active := False;
    AppData.CarStory.CommandText := Format(SSQLGetCarArc, [UID]);
    AppData.CarStory.Active := True;

   try
       AddBtn.Enabled := False;
       DelBtn.Enabled := False;
       TransferBtn.Enabled := False;
       RangeBtn.Enabled := False;
       ResevrChB.Enabled := False;

       with CarGrid do
        Begin
           for i := 0 to Columns.Count - 1 do
            Columns[i].Visible := True;
        end;  
   finally
   end;
end;

procedure TCarForm.StoryActionExecute(Sender: TObject);
var
    CarF: TCarForm;
    UID_Car: integer;
begin
  if (AppData.Cars.Active) and
     (not AppData.Cars.IsEmpty) then
      try
        UID_Car := AppData.Cars.FieldbyName('UID').AsInteger;

        CarF := TCarForm.Create(g_View);

        CarF.ShowModal();
      finally
         FreeAndNil(CarF);
         RefreshActionExecute(Self);
         AppData.Cars.Locate('UID', IntToStr(UID_Car), [loCaseInsensitive, loPartialKey]);
      end;
end;

procedure TCarForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

{
constructor TCarForm.Create(AOwner: TComponent);
begin
  inherited;


  try
  //

    case Value of
      g_New: ;                            // ���������� ������ ������
      g_Corr: setLimitSettingModule();    // ����� ������ �� ������ ��������� ����������
      g_View: setStorySetting(AppData.Cars.FieldByName('UID').AsInteger);
    end;
    finally
    end;
end;}

constructor TCarForm.Create(Value: Shortint);
begin
  inherited Create(Application);

  BegD := Now();
  EndD := BegD + 1;
  iTypeF := Value;

  try
    case Value of
      g_New: ;                            // ���������� ������ ������
      g_Corr: setLimitSettingModule();    // ����� ������ �� ������ ��������� ����������
      g_View: setStorySetting(AppData.Cars.FieldByName('UID').AsInteger);
    end;
  finally
  end;
end;

procedure TCarForm.CreateForm;
begin
    Visible := False;
    FormStyle :=  fsNormal;
    BorderStyle := bsSizeToolWin;
    WindowState := wsNormal;
    CarGrid.DataSource := AppData.DS_CarStory;
end;

end.



