unit Insurance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, ExtCtrls, Menus, ActnList, StdCtrls,
  Buttons, ImgList, ADODB, DB, StrUtils;

type
  TInsuranceForm = class(TForm)
    SB: TStatusBar;
    BtnsPanel: TPanel;
    InsuranceGrid: TDBGrid;
    Bevel1: TBevel;
    AddBtn: TBitBtn;
    CorrBtn: TBitBtn;
    DelBtn: TBitBtn;
    TransferBtn: TBitBtn;
    RefreshBtn: TBitBtn;
    ReserveChB: TCheckBox;
    FindGB: TGroupBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    AL: TActionList;
    PMenu: TPopupMenu;
    AddAction: TAction;
    CorrAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    TransferAction: TAction;
    IL: TImageList;
    AddPop: TMenuItem;
    CorrPop: TMenuItem;
    TransferPop: TMenuItem;
    DelPop: TMenuItem;
    RefreshPop: TMenuItem;
    FindAction: TAction;
    FindCB: TComboBox;
    SetInsDetailBtn: TBitBtn;
    RangeBtn: TBitBtn;
    RangeAction: TAction;
    StoryBtn: TBitBtn;
    StoryAction: TAction;
    procedure InsuranceGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure AddActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure CorrActionExecute(Sender: TObject);
    procedure TransferActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure FindActionExecute(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
    procedure FindEditKeyPress(Sender: TObject; var Key: Char);
    procedure RangeActionExecute(Sender: TObject);
    procedure InsuranceGridTitleClick(Column: TColumn);
    procedure StoryActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FBegDate: TDateTime;
    FEndDate: TDateTime;
    FiTypeF: Shortint;
    procedure setInfoSB();
    procedure SetBegDate(const Value: TDateTime);
    procedure SetEndDate(const Value: TDateTime);
    procedure SetiTypeF(const Value: Shortint);

  protected
    property iTypeF: Shortint read FiTypeF write SetiTypeF;
  public
    { Public declarations }

    constructor Create(AOwner: TComponent); override;
  published
    property BegDate: TDateTime read FBegDate write SetBegDate;
    property EndDate: TDateTime read FEndDate write SetEndDate;   
  end;

var
  InsuranceForm: TInsuranceForm;

implementation

uses AppDM, Globals, SConst, InsuranceDetail, Range, InsuranceStory;

{$R *.dfm}

procedure TInsuranceForm.InsuranceGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (AppData.Insurance.Active) and (not AppData.Insurance.IsEmpty) then
    try
      if AppData.Insurance.FieldByName('Reserve').AsBoolean = True then
        InsuranceGrid.Canvas.Brush.Color := clRed;
      if AppData.Insurance.FieldByName('Archive').AsString = '*' then
        InsuranceGrid.Canvas.Brush.Color := clScrollBar;

      if (Column.FieldName = 'ValidDay') and
         (AppData.Insurance.FieldByName('Archive').AsString = EmptyStr) then
          Begin
           if (Column.Field.AsInteger > 5) then
                 InsuranceGrid.Canvas.Brush.Color := clLime
           else
            if (Column.Field.AsInteger <= 5) and
               (Column.Field.AsInteger > 0)  then
                 InsuranceGrid.Canvas.Brush.Color := clOlive
           else
            if (Column.Field.AsInteger <= 0) then
                 InsuranceGrid.Canvas.Brush.Color := clRed;
          end;
      finally
        InsuranceGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
end;

procedure TInsuranceForm.AddActionExecute(Sender: TObject);
var
  InsD: TInsuranceDetailForm;
begin
  InsD := TInsuranceDetailForm.Create(Application);

  with InsD do
  try
    DocDP.Date := Now();
    BegDP.Date := Now();
    EndDP.Date := Now();

    if ShowModal = mrOk then
    try
        AppData.Command.CommandText := Format(SSQLInsInsurance, [StrToInt(IfThen(SerialEdit.Text = EmptyStr, '0', SerialEdit.Text)),
                                                                 StrToInt(IfThen(NumberEdit.Text = EmptyStr, '0', NumberEdit.Text)),
                                                                 FormatDateTime('yyyy-mm-dd', BegDP.Date),
                                                                 FormatDateTime('yyyy-mm-dd', EndDP.Date),
                                                                 FormatDateTime('yyyy-mm-dd', DocDP.Date),
                                                                 UID_Car,
                                                                 g_User,
                                                                 Byte(InsD.ReserveChB.Checked),
                                                                 PrimechMemo.Text]);
        AppData.Command.Execute;
    except
      on Err: Exception do
        ShowMessage('Ошибка добавления страхового документа!' + #13 + 'Сообщение: ' + Err.Message);
    end;

  finally
    FreeAndNil(InsD);
    RefreshActionExecute(Self);
  end;
end;

procedure TInsuranceForm.RefreshActionExecute(Sender: TObject);
begin
   try
     Screen.Cursor := crSQLWait;
     AppData.Insurance.Active := False;
     AppData.Insurance.CommandText := Format(SSQLGetInsurance, [Byte(ReserveChB.Checked),
                                                                FormatDateTime('yyyy-mm-dd', BegDate),
                                                                FormatDateTime('yyyy-mm-dd', EndDate)]);
     AppData.Insurance.Active := True;
     setInfoSB();
   finally
     TAppData.SetInfoSB(AppData.Insurance, SB);
     Screen.Cursor := crDefault;
   end;
end;

procedure TInsuranceForm.CorrActionExecute(Sender: TObject);
var
    InsD: TInsuranceDetailForm;
    UID_Ins: integer;
begin

    try
      if (AppData.Insurance.Active) and
         (not AppData.Insurance.IsEmpty) then
        try
            if (AppData.Insurance.FieldByName('Archive').AsString = EmptyStr) then
              insD := TInsuranceDetailForm.Create(Application)
            else
              InsD := TInsuranceDetailForm.Create(g_View);

            AppData.InsuranceDetail.Active := False;
            AppData.InsuranceDetail.CommandText := Format(SSQLGetInsuranceDetail, [AppData.Insurance.FieldByName('UID').AsInteger]);
            AppData.InsuranceDetail.Active := True;

            if not AppData.InsuranceDetail.IsEmpty then
              with InsD do
                Begin
                  SerialEdit.Text := AppData.InsuranceDetail.FieldByName('SERIAL').AsString;
                  NumberEdit.Text := AppData.InsuranceDetail.FieldByName('NUMBER').AsString;
                  DocDP.Date      := AppData.InsuranceDetail.FieldByName('DOC_DATE').AsDateTime;
                  InsD.ReserveChB.Checked := AppData.InsuranceDetail.FieldByName('RESERVE').AsBoolean;
                  BegDP.Date      := AppData.InsuranceDetail.FieldByName('BEG_DATE').AsDateTime;
                  EndDP.Date      := AppData.InsuranceDetail.FieldByName('END_DATE').AsDateTime;
                  ModelEdit.Text := AppData.InsuranceDetail.FieldByName('MODEL').AsString;
                  RegSymbolEdit.Text := AppData.InsuranceDetail.FieldByName('REG_SYMBOL').AsString;
                  TypeEdit.Text := AppData.InsuranceDetail.FieldByName('TYPE_TC').AsString;
                  ColorEdit.Text := AppData.InsuranceDetail.FieldByName('COLOR').AsString;
                  YearEdit.Text := AppData.InsuranceDetail.FieldByName('MADEYEAR').AsString;
                  PrimechMemo.Text := AppData.InsuranceDetail.FieldByName('PRIMECH').AsString;

                  UID_Car := AppData.InsuranceDetail.FieldByName('UID_CAR').AsInteger;
                  UID_Ins := AppData.InsuranceDetail.FieldByName('UID').AsInteger;

                  if  ShowModal = mrOk then
                    try
                      AppData.Command.CommandText := Format(SSQLCorrInsurance, [AppData.Insurance.FieldByName('UID').AsInteger,
                                                                                StrToInt(IfThen(SerialEdit.Text = EmptyStr, '0', SerialEdit.Text)),
                                                                                StrToInt(IfThen(NumberEdit.Text = EmptyStr, '0', NumberEdit.Text)),
                                                                                FormatDateTime('yyyy-mm-dd', BegDP.Date),
                                                                                FormatDateTime('yyyy-mm-dd', EndDP.Date),
                                                                                FormatDateTime('yyyy-mm-dd', DocDP.Date),
                                                                                UID_Car,
                                                                                g_User,
                                                                                Byte(InsD.ReserveChB.Checked),
                                                                                PrimechMemo.Text]);
                      AppData.Command.Execute;
                    except
                    on Err: Exception do
                        ShowMessage('Ошибка сохранения изменений страхового документа!' + #13 + 'Сообщение: ' + Err.Message);
                    end;
                end;
        except
          on Err: Exception do
            ShowMessage('Ошибка изменения страхового документа!' + #13 + 'Сообщение: ' + Err.Message);
        end;
    finally
      FreeAndNil(insD);
      if iTypeF = g_New then
        Begin
          RefreshActionExecute(Self);
          AppData.Insurance.Locate('UID', IntToStr(UID_Ins), [loCaseInsensitive, loPartialKey]);
        end;
    end;
end;

procedure TInsuranceForm.TransferActionExecute(Sender: TObject);
var
    UID_Ins: integer;
begin
    if (AppData.Insurance.Active) and
       (not AppData.Insurance.IsEmpty) then
      try
         UID_Ins := AppData.Insurance.FieldByName('UID').AsInteger;
         if AppData.Insurance.FieldByName('Reserve').AsBoolean = False then
           Begin
            if MessageBox(Handle, 'Вы действительно желаете перевести документ в резерв?', 'Перевод документа в/из резерв(а)', MB_ICONWARNING + MB_YESNO) = ID_YES  then
                AppData.Command.CommandText := Format(SSQLTrancferInsurance, [AppData.Insurance.FieldByName('UID').AsInteger,
                                                                              1,
                                                                              g_User]);
           end
         else
                AppData.Command.CommandText := Format(SSQLTrancferInsurance, [AppData.Insurance.FieldByName('UID').AsInteger,
                                                                              0,
                                                                              g_User]);
         AppData.Command.Execute;

      finally
        RefreshActionExecute(Self);
        AppData.Insurance.Locate('UID', IntToStr(UID_Ins), [loCaseInsensitive, loPartialKey]);
      end;
end;

procedure TInsuranceForm.DeleteActionExecute(Sender: TObject);
begin
    if (AppData.Insurance.Active) and
    (not AppData.Insurance.IsEmpty) and
    (AppData.Insurance.FieldByName('Archive').AsString = EmptyStr) then
    try
       if MessageBox(Handle, 'Вы действительно желаете удалить выбранный документ?', 'Удаление документа', MB_ICONSTOP+MB_YESNO) = ID_YES then
        try
            AppData.Command.CommandText := Format(SSQLDelInsurance, [AppData.Insurance.FieldByName('UID').AsInteger]);
            AppData.Command.Execute;
        except
          on Err: Exception do
            MessageDlg('Ошибка удаления документа!' + #13 + 'Сообщение: ' + Err.Message, mtError, [mbOK],0);
        end;
    finally
      RefreshActionExecute(Self);
    end;
end;

procedure TInsuranceForm.FindActionExecute(Sender: TObject);
var
    strFilter: string;
begin
  case FindCB.ItemIndex of
    0: strFilter := ' SERIAL = ' + Trim(FindEdit.Text);
    1: strFilter := ' NUMBER = ' + Trim(FindEdit.Text);
    2: strFilter := ' InsConcat LIKE ' + QuotedStr('%' + Trim(FindEdit.Text) + '%');
  end;

  if (Length(Trim(FindEdit.Text)) > 0) and
     (Length(Trim(strFilter)) > 0) then
    Begin
      AppData.Insurance.Filtered := False; 
      AppData.Insurance.Filter := strFilter;
      AppData.Insurance.Filtered := True;
    end;
end;

procedure TInsuranceForm.FindEditChange(Sender: TObject);
begin
  if Length(Trim(FindEdit.Text)) = 0 then
    Begin
      AppData.Insurance.Filtered := False;
      AppData.Insurance.Filter := EmptyStr;
      FindBtn.Enabled := False;
    end
  else
      FindBtn.Enabled := True;
end;

procedure TInsuranceForm.FindEditKeyPress(Sender: TObject; var Key: Char);
begin
    case FindCB.ItemIndex of
      0, 1: begin
             case Key of
                '0'..'9': ;
                #13: ;
                #8: ;
             else
                Key := #0;
             end;
           end;
      2:   begin
             case Key of
                '0'..'9': ;
                #13: ;
                #8: ;
                #32: ;
             else
                Key := #0;
             end;
           end;
      end;
end;

procedure TInsuranceForm.setInfoSB;
var
    iRes: Smallint;
    iArc: Smallint;
begin
  iRes := 0;
  iArc := 0;


  if AppData.Insurance.Active then
    try
      case Byte(ReserveChB.Checked) of
        0:   SB.Panels[0].Text := 'Всего документов: ' + IntToStr(AppData.Insurance.RecordCount);
        1: Begin
              SB.Panels[0].Text := 'Всего документов: ' + IntToStr(AppData.Insurance.RecordCount);
              AppData.Insurance.First;
              while not AppData.Insurance.Eof do
                Begin
                   if (AppData.Insurance.FieldByName('Reserve').AsBoolean = True) and
                      (AppData.Insurance.FieldByName('Archive').AsString = EmptyStr) then
                       iRes := iRes +1;
                   AppData.Insurance.Next;
                end;
                 SB.Panels[1].Text := 'В резерве: ' + IntToStr(iRes);
           end;
      end;


     AppData.Insurance.First;
     while not AppData.Insurance.Eof do
      Begin
         if AppData.Insurance.FieldByName('Archive').AsString = '*' then
           iArc := iArc + 1;
         AppData.Insurance.Next;
      end;

      SB.Panels[2].Text := 'Архивных документов: ' + IntToStr(iArc);
    finally
       AppData.Insurance.First;
    end;
end;

procedure TInsuranceForm.SetBegDate(const Value: TDateTime);
begin
  FBegDate := Value;
end;

procedure TInsuranceForm.SetEndDate(const Value: TDateTime);
begin
  FEndDate := Value;
end;

procedure TInsuranceForm.RangeActionExecute(Sender: TObject);
var
    RangeF: TRangeForm;
begin
    RangeF := TRangeForm.Create(Application);

    try
      RangeF.BegDP.Date := BegDate;
      RangeF.EndDP.Date := EndDate;
      If RangeF.ShowModal = mrOk then
        Begin
          BegDate := RangeF.BegDP.Date;
          EndDate := RangeF.EndDP.Date;
        end;
    finally
      FreeAndNil(RangeF);
      RefreshActionExecute(Self);
      
      AppData.gBegD := BegDate;
      AppData.gEndD := EndDate;
    end;
end;

procedure TInsuranceForm.InsuranceGridTitleClick(Column: TColumn);
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

procedure TInsuranceForm.StoryActionExecute(Sender: TObject);
var
    InsF: TIsnuranceStoryForm;
    UID_Ins: integer;
begin
  if (AppData.Insurance.Active) and
     (not AppData.Insurance.IsEmpty) then
      try
        UID_Ins := AppData.Insurance.FieldByName('UID').AsInteger;
        InsF := TIsnuranceStoryForm.Create(g_View, AppData.Insurance.FieldbyName('UID').AsInteger);
        AppData.SetInfoToSB(AppData.InsuranceStory, SB, True, True, 'Archive', 'RESERVE');
        InsF.ShowModal();
      finally
        FreeAndNil(InsF);
        RefreshActionExecute(Self);
        AppData.Insurance.Locate('UID', IntToStr(UID_Ins), [loCaseInsensitive, loPartialKey]);
      end;
end;

procedure TInsuranceForm.SetiTypeF(const Value: Shortint);
begin
  FiTypeF := Value;
end;

procedure TInsuranceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

constructor TInsuranceForm.Create(AOwner: TComponent);
begin
  inherited;
  BegDate := Now();
  EndDate := BegDate + 1;

  AppData.gBegD := BegDate;
  AppData.gEndD := EndDate;
end;

end.
