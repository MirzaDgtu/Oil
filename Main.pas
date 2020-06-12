unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, ComCtrls, Buttons, StdCtrls, Spin, Globals,
  UCustomFlexCelReport, UFlexCelReport, UExcelAdapter, OLEAdapter, DB,
  DBClient, Menus, ActnList, ImgList, DBGrids, DateUtils, ADODB;

type
  TMainForm = class(TForm)
    StatusBar1: TStatusBar;
    Data: TClientDataSet;
    Adapter: TOLEAdapter;
    Report: TFlexCelReport;
    MainMenu: TMainMenu;
    N1: TMenuItem;
    CarItemMenu: TMenuItem;
    InsuranceItemMenu: TMenuItem;
    PC: TPageControl;
    ReestrNaklPC: TTabSheet;
    Report1PC: TTabSheet;
    OilSheet: TStringGrid;
    ToolPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    NextBtn: TSpeedButton;
    PrevBtn: TSpeedButton;
    Bevel2: TBevel;
    RefreshBtn: TSpeedButton;
    ExcelBtn: TSpeedButton;
    YearEdit: TSpinEdit;
    MonthCombo: TComboBox;
    HeaderPanel: TPanel;
    BottomPanel: TPanel;
    SB: TStatusBar;
    AL: TActionList;
    CarsAction: TAction;
    InsuranceAction: TAction;
    IL: TImageList;
    NaklGrid: TDBGrid;
    MoveGrid: TDBGrid;
    Splitter1: TSplitter;
    PrintGB: TGroupBox;
    PrintReestrBtn: TBitBtn;
    PrintDocBtn: TBitBtn;
    PrintReestrAction: TAction;
    PrintDocAction: TAction;
    RangeGB: TGroupBox;
    RangeLbl: TLabel;
    RefreshReestrBtn: TBitBtn;
    NewNaklAction: TAction;
    CorrNaklAction: TAction;
    DelNaklAction: TAction;
    RefreshNaklAction: TAction;
    CheckNaklAction: TAction;
    UnCheckNaklAction: TAction;
    RangeAction: TAction;
    ArchiveChB: TCheckBox;
    NaklPop: TPopupMenu;
    AddNaklPop: TMenuItem;
    CorrNaklPop: TMenuItem;
    DelNaklPop: TMenuItem;
    CheckNaklPop: TMenuItem;
    RangePop: TMenuItem;
    RefreshPop: TMenuItem;
    DocGB: TGroupBox;
    NewNaklBtn: TBitBtn;
    CorrNaklBtn: TBitBtn;
    DelNaklBtn: TBitBtn;
    CheckNaklBtn: TBitBtn;
    UnCheckNaklBtn: TBitBtn;
    UnCheckNaklPop: TMenuItem;
    ProductAction: TAction;
    ProdItemMenu: TMenuItem;
    NaklAction: TAction;
    ReestrtemMenu: TMenuItem;
    procedure NextBtnClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure DrawSheetCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure RefreshSheet(Sender: TObject);
    procedure ExcelBtnClick(Sender: TObject);
    procedure CarsActionExecute(Sender: TObject);
    procedure InsuranceActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RangeActionExecute(Sender: TObject);
    procedure RefreshNaklActionExecute(Sender: TObject);
    procedure RangeLblClick(Sender: TObject);
    procedure CheckNaklActionExecute(Sender: TObject);
    procedure UnCheckNaklActionExecute(Sender: TObject);
    procedure NewNaklActionExecute(Sender: TObject);
    procedure DelNaklActionExecute(Sender: TObject);
    procedure CorrNaklActionExecute(Sender: TObject);
    procedure ProductActionExecute(Sender: TObject);
    procedure NaklGridTitleClick(Column: TColumn);
    procedure MoveGridTitleClick(Column: TColumn);
  private
    FDayCount: Integer;
    FItems: TList;
    FBegDate: TDateTime;
    FEndDate: TDateTime;
    procedure BuildSheet;
    procedure FreeItems;
    procedure OpenDatasets;
    procedure MakeSheetList;
    procedure LoadItem(Item: TSheetItem);
    procedure RangeChanged;
    procedure MakeDataset;
    procedure LoadDataset;
    procedure SetRangeDate(BegD, EndD: TDateTime);

    function GetYearMonth: Variant;
    procedure SetBegDate(const Value: TDateTime);
    procedure SetEndDate(const Value: TDateTime);

    procedure CreateChild(FormClass: TFormClass; var Ref);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property YearMonth: Variant read GetYearMonth;
    property BegDate: TDateTime read FBegDate write SetBegDate;
    property EndDate: TDateTime read FEndDate write SetEndDate;
  end;

var
  MainForm: TMainForm;

implementation

uses
   SConst, AppDM, Car, Insurance, Range, Products, Child;

{$R *.dfm}

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited;
  GetMonthList(MonthCombo.Items);
  FItems := TList.Create;
  MakeDataset();
  RangeChanged();
end;

destructor TMainForm.Destroy;
begin
  inherited;
  FreeItems();
  FItems.Free();
end;

procedure TMainForm.NextBtnClick(Sender: TObject);
begin
  NextMonth(g_Year, g_Month);
  RangeChanged();
end;

procedure TMainForm.PrevBtnClick(Sender: TObject);
begin
  PrevMonth(g_Year, g_Month);
  RangeChanged();
end;

procedure TMainForm.OpenDatasets;
begin
  with AppData do
  begin
    Subjects.Active := False;
    Subjects.Active := True;
    Consumptions.Active := False;
    Consumptions.Active := True;
  end;
end;

procedure TMainForm.FreeItems;
var
  Item: TSheetItem;
begin
  while FItems.Count > 0 do
  begin
    Item := TSheetItem(FItems.Last);
    FItems.Remove(Item);
    Item.Free();
    Item := nil;
  end;
end;

procedure TMainForm.BuildSheet;
var
  I: Integer;
begin
  Screen.Cursor := crHourGlass;
  LockWindowUpdate(OilSheet.Handle);
  OilSheet.OnDrawCell := nil;
  OilSheet.ColCount := 2;
  OilSheet.RowCount := 2;
  FDayCount := DaysInAMonth(g_Year, g_Month);
  try
    OpenDatasets();
    MakeSheetList();
    with OilSheet do
    begin
      ColCount := FDayCount + 2;
      RowCount := AppData.Subjects.RecordCount + 1;
      ColWidths[0] := 150;
      for I := 1 to FDayCount do ColWidths[I] := 30;
      ColWidths[FDayCount + 1] := 75;
    end;
  finally
    OilSheet.OnDrawCell := DrawSheetCell;
    Screen.Cursor := crDefault;
    LockWindowUpdate(0);
  end;
end;

procedure TMainForm.LoadItem(Item: TSheetItem);
var
  D: Integer;
begin
  AppData.Consumptions.Filtered := False;
  AppData.Consumptions.Filter := Format('Customer=''%s''', [Item.FUID]);
  AppData.Consumptions.Filtered := True;
  while not AppData.Consumptions.Eof do
  begin;
    D := AppData.fldDayNo.AsInteger;
    Item.FValues[D] := AppData.fldConsumption.AsInteger;
    Item.FTotal := Item.FTotal + Item.FValues[D];
    AppData.Consumptions.Next();
  end;
end;

procedure TMainForm.MakeSheetList;
var
  Item: TSheetItem;
begin
  FreeItems();
  while not AppData.Subjects.Eof do
  begin
    Item := TSheetItem.Create(AppData.Subjects.Fields[0].AsString,
      AppData.Subjects.Fields[1].AsString);
    FItems.Add(Item);
    LoadItem(Item);
    AppData.Subjects.Next();
  end;
end;

procedure TMainForm.RangeChanged;
begin
  MonthCombo.ItemIndex := g_Month - 1;
  YearEdit.Value := g_Year;
  BuildSheet();
end;

procedure TMainForm.DrawSheetCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
const
  Flags: Cardinal = DT_CENTER or DT_VCENTER or DT_SINGLELINE;
var
  S: string;
  dt: TDateTime;
  R: TRect;
  Item: TSheetItem;
begin
  with OilSheet do
  begin
    InflateRect(Rect, -1, -1);
    if (ARow = 0) or (ACol = 0) then
    begin
      Canvas.Brush.Color := $00F8E3D1;
      Canvas.Font.Style := [fsBold];
      Canvas.Font.Color := clNavy;
      Canvas.FillRect(Rect);
      if ARow = 0 then
      begin
        if ACol = 0 then
          S := EmptyStr
        else
        if ACol <= FDayCount then
          S := IntToStr(ACol)
        else
          S := STotal;
      end else
        if ACol = 0 then
          S := TSheetItem(FItems[ARow - 1]).FName;
      DrawText(Canvas.Handle, PChar(S), Length(S), Rect, Flags);
    end
    else
    begin
      Item := TSheetItem(FItems[ARow - 1]);
      S := EmptyStr;
      if (ACol <= FDayCount) then
      begin
        Canvas.Brush.Color := clWindow;
        Canvas.Font.Color := clWindowText;
        if (TSheetItem(FItems[ARow - 1]).FValues[ACol] > 0) then
          S := IntToStr(Item.FValues[ACol]);
        dt := EncodeDate(g_Year, g_Month, ACol);
        { Выходные дни }
        if DayOfWeek(dt) = 1 then
          Canvas.Brush.Color := $00F8E3D1
        else
          if S <> EmptyStr then
            Canvas.Brush.Color := $00B9CFFF;

        Canvas.Font.Style := [fsBold];

        Canvas.FillRect(Rect);
        DrawText(Canvas.Handle, PChar(S), Length(S), Rect, Flags);
      end
      else
      begin
        if Item.FTotal > 0 then
        begin
          S := IntToStr(Item.FTotal);
          Canvas.Brush.Color := $006FFF6F;
          Canvas.Font.Color := clWindowText;
          Canvas.Font.Style := [fsBold];
        end;
        Canvas.FillRect(Rect);
        DrawText(Canvas.Handle, PChar(S), Length(S), Rect, Flags);
      end;
    end;
  end;
end;

procedure TMainForm.RefreshSheet(Sender: TObject);
begin
  RangeChanged();
end;

procedure TMainForm.MakeDataset;
var
  I: Integer;
  fldName: string;
begin
  for I := 1 to 31 do
  begin
    fldName := IntToStr(I);
    if Length(fldName) = 1 then
      fldName := 'F0' + fldName
    else
      fldName := 'F' + fldName;
    with Data.FieldDefs.AddFieldDef do
    begin
      DataType := ftInteger;
      Name := fldName;
    end;
  end;
  with Data.FieldDefs.AddFieldDef do
  begin
    DataType := ftInteger;
    Name := 'Total';
  end;
  Data.CreateDataset;
end;

procedure TMainForm.LoadDataset;
var
  I, No, Val: Integer;
begin
  Data.EmptyDataSet();
  if AppData.Subjects.IsEmpty then Exit;
  AppData.Subjects.First();
  No := 0;
  while not AppData.Subjects.Eof do
  begin
    Data.Append();
    Data.Fields[0].AsString := AppData.Subjects.Fields[1].AsString;
    for I := 1 to FDayCount do
    begin
      Val := TSheetItem(FItems[No]).FValues[I];
      if Val > 0 then
        Data.Fields[I].AsInteger := TSheetItem(FItems[No]).FValues[I];
    end;
    Data.Post();
    AppData.Subjects.Next();
    Inc(No);
  end;
end;

procedure TMainForm.ExcelBtnClick(Sender: TObject);
begin
  LoadDataset();
  if Data.IsEmpty then Exit;
  Data.First();
  Report.Run();
end;

function TMainForm.GetYearMonth: Variant;
begin
  Result := Format('%s, %d', [SLongMonthNames[g_Month], g_Year]);
end;

procedure TMainForm.CarsActionExecute(Sender: TObject);
begin
   CreateChild(TCarForm, CarForm);
end;

procedure TMainForm.InsuranceActionExecute(Sender: TObject);
begin                                                       
   CreateChild(TInsuranceForm, InsuranceForm);
end;

procedure TMainForm.SetRangeDate(BegD, EndD: TDateTime);
begin
    BegDate := BegD;
    EndDate := EndD;

    RangeLbl.Caption := Format(SRange, [FormatDateTime('dd-mm-yyyy', BegDate),
                                        FormatDateTime('dd-mm-yyyy', EndDate)]);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SetRangeDate(Now(), Now()+1);
end;

procedure TMainForm.SetBegDate(const Value: TDateTime);
begin
  FBegDate := Value;
end;

procedure TMainForm.SetEndDate(const Value: TDateTime);
begin
  FEndDate := Value;
end;

procedure TMainForm.RangeActionExecute(Sender: TObject);
var
  rangeF: TRangeForm;
begin
  rangeF := TRangeForm.Create(Application);

  try
    with rangeF do
      Begin
        BegDP.Date := BegDate;
        EndDP.Date := EndDate;

        if ShowModal = mrOk then
          SetRangeDate(BegDP.Date, EndDP.Date);
      end;
  finally
    FreeAndNil(rangeF);
  end;
end;

procedure TMainForm.RefreshNaklActionExecute(Sender: TObject);
begin
  try
    Screen.Cursor := crSQLWait;

    AppData.Nakl.Active := False;
    AppData.Nakl.CommandText := Format(SSQLGetNakl, [FormatDateTime('yyyy-mm-dd', BegDate),
                                                     FormatDateTime('yyyy-mm-dd', EndDate),
                                                     Byte(ArchiveChB.Checked)]);
    AppData.Nakl.Active := True;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.RangeLblClick(Sender: TObject);
begin
  RangeActionExecute(Self);
end;

procedure TMainForm.CheckNaklActionExecute(Sender: TObject);
var
    sUnicum_Num: string;
begin
   if not AppData.Nakl.IsEmpty then
    Begin
      sUnicum_Num := AppData.Nakl.FieldByName('UNICUM_NUM').AsString;
      if AppData.Nakl.FieldByName('Archive').AsString = EmptyStr then
        Begin
          if MessageBox(Handle, 'Вы действительно желаете выставить отметку?', 'Отметка документа', MB_ICONWARNING + MB_YESNO) = ID_YES then
            try
              AppData.Command.CommandText := Format(SSQLTrancferNakl, [AppData.Nakl.FieldByName('UNICUM_NUM').AsInteger,
                                                                       1,
                                                                       g_User]);
              AppData.Command.Execute;
            finally
              RefreshNaklActionExecute(Self);
              AppData.Nakl.Locate('UNICUM_NUM', sUnicum_Num,  [loCaseInsensitive, loPartialKey]);
            end;
        end;
    end;
end;

procedure TMainForm.UnCheckNaklActionExecute(Sender: TObject);
var
    sUnicum_Num: string;
begin
   if not AppData.Nakl.IsEmpty then
    Begin
      sUnicum_Num := AppData.Nakl.FieldByName('UNICUM_NUM').AsString;
      if AppData.Nakl.FieldByName('Archive').AsString = '*' then
        try
          AppData.Command.CommandText := Format(SSQLTrancferNakl, [AppData.Nakl.FieldByName('UNICUM_NUM').AsInteger,
                                                                   0,
                                                                   g_User]);
          AppData.Command.Execute;
        finally
          RefreshNaklActionExecute(Self);
          AppData.Nakl.Locate('UNICUM_NUM', sUnicum_Num,  [loCaseInsensitive, loPartialKey]);
        end;
    end;
end;

procedure TMainForm.NewNaklActionExecute(Sender: TObject);
begin
  ShowMessage('Модуль в разработке');
end;

procedure TMainForm.DelNaklActionExecute(Sender: TObject);
begin
  if (AppData.Nakl.Active) and (not AppData.Nakl.IsEmpty) then
    Begin
      if MessageBox(Handle, 'Вы действительно хотите удалить данный документ?', 'Удаление документа', MB_ICONQUESTION+MB_YESNO) = ID_YES then
        try
            AppData.Command.CommandText := Format(SSQLDelNakl, [AppData.Nakl.FieldByName('UNICUM_NUM').AsInteger]);
            AppData.Command.Execute;
        finally
           RefreshNaklActionExecute(Self);
        end;
    end;
end;

procedure TMainForm.CorrNaklActionExecute(Sender: TObject);
begin
  ShowMessage('Модуль в разработке');
end;

procedure TMainForm.ProductActionExecute(Sender: TObject);
//var
 //   ProdF: TProductsForm;
begin
  //  ProdF := TProductsForm.Create(0);

  //  try
   //   PC.Visible := False;
    //  ProdF.Show();
    //finally
     // PC.Visible := True;
   // end;
   CreateChild(TProductsForm, ProductsForm);
end;

procedure TMainForm.NaklGridTitleClick(Column: TColumn);
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

procedure TMainForm.MoveGridTitleClick(Column: TColumn);
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

procedure TMainForm.CreateChild(FormClass: TFormClass; var Ref);
begin
   if Assigned(TChildForm(Ref)) then
  begin
    if TChildForm(Ref).WindowState = wsMinimized then
      TChildForm(Ref).Perform(WM_SYSCOMMAND, SC_RESTORE, 0);
    TChildForm(Ref).BringToFront();
  end else
    Application.CreateForm(FormClass, Ref);
end;

end.
