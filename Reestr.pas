unit Reestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus,
  ImgList, ActnList, ADODB, DB, UExcelAdapter, OLEAdapter,
  UCustomFlexCelReport, UFlexCelReport;

type
  TReestrForm = class(TForm)
    SB: TStatusBar;
    HeaderPanel: TPanel;
    PrintGB: TGroupBox;
    PrintReestrBtn: TBitBtn;
    PrintDocBtn: TBitBtn;
    ArchiveChB: TCheckBox;
    NewNaklBtn: TBitBtn;
    CorrNaklBtn: TBitBtn;
    DelNaklBtn: TBitBtn;
    CheckNaklBtn: TBitBtn;
    UnCheckNaklBtn: TBitBtn;
    RefreshReestrBtn: TBitBtn;
    NaklGrid: TDBGrid;
    MoveGrid: TDBGrid;
    AL: TActionList;
    IL: TImageList;
    NaklPopMenu: TPopupMenu;
    MovePopMenu: TPopupMenu;
    DocReestrGB: TGroupBox;
    BtnsRightPanel: TPanel;
    MoveGB: TGroupBox;
    Splitter1: TSplitter;
    Bevel1: TBevel;
    RangeGB: TGroupBox;
    RangeLbl: TLabel;
    RangeBtn: TBitBtn;
    NewNaklAction: TAction;
    CorrNaklAction: TAction;
    DelNaklAction: TAction;
    RefreshNaklAction: TAction;
    CheckNaklAction: TAction;
    UnCheckNaklAction: TAction;
    RangeAction: TAction;
    FindGB: TGroupBox;
    FindCB: TComboBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    FindAction: TAction;
    Report: TFlexCelReport;
    Adapter: TOLEAdapter;
    PrintReestrAction: TAction;
    PrintDocAction: TAction;
    procedure NaklGridTitleClick(Column: TColumn);
    procedure MoveGridTitleClick(Column: TColumn);
    procedure RangeActionExecute(Sender: TObject);
    procedure RefreshNaklActionExecute(Sender: TObject);
    procedure DelNaklActionExecute(Sender: TObject);
    procedure FindEditKeyPress(Sender: TObject; var Key: Char);
    procedure FindBtnClick(Sender: TObject);
    procedure PrintReestrActionExecute(Sender: TObject);
    procedure PrintDocActionExecute(Sender: TObject);
    procedure FindEditChange(Sender: TObject);
  private
  { Private declarations }
    FBegD: TDateTime;
    FEndD: TDateTime;
    procedure SetBegD(const Value: TDateTime);
    procedure SetEndD(const Value: TDateTime);
    procedure SetRangeCaprion(BegD, EndD: TDateTime);

    function GetNumDoc: Variant;
    function GetDateDoc: Variant;

    procedure Find(Index: integer; FindStr: string);

  protected

  public
    { Public declarations }

    constructor Create(AOwner: TComponent); override;
  published
    property BegD: TDateTime read FBegD write SetBegD;
    property EndD: TDateTime read FEndD write SetEndD;
    property NumDoc: Variant read GetNumDoc;
    property DateDoc: Variant read GetDateDoc;
  end;

var
  ReestrForm: TReestrForm;

implementation

uses Range, AppDM, Globals, SConst;

{$R *.dfm}

procedure TReestrForm.NaklGridTitleClick(Column: TColumn);
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

procedure TReestrForm.MoveGridTitleClick(Column: TColumn);
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

procedure TReestrForm.RangeActionExecute(Sender: TObject);
var
    RangeF: TRangeForm;
begin
  RangeF := TRangeForm.Create(Application);

  try
    RangeF.BegDP.Date := BegD;
    RangeF.EndDP.Date := EndD;

    if RangeF.ShowModal = mrOk then
     Begin
      BegD := RangeF.BegDP.Date;
      EndD := RangeF.EndDP.Date;
     end;
  finally
    FreeAndNil(RangeF);
    RefreshNaklActionExecute(Self);
  end;
end;

constructor TReestrForm.Create(AOwner: TComponent);
begin
  inherited;
  BegD := Now();
  EndD := BegD + 1;
  RefreshNaklActionExecute(Self);
end;

procedure TReestrForm.SetBegD(const Value: TDateTime);
begin
  FBegD := Value;
end;

procedure TReestrForm.SetEndD(const Value: TDateTime);
begin
  FEndD := Value;
end;

procedure TReestrForm.RefreshNaklActionExecute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
     AppData.Nakl.DisableControls;
     AppData.Nakl.Active := False;
     AppData.Nakl.CommandText := Format(SSQLGetNakl, [FormatDateTime('yyyy-mm-dd', BegD),
                                                      FormatDateTime('yyyy-mm-dd', EndD),
                                                      Byte(ArchiveChB.Checked)]);
     AppData.Nakl.Active := True;
  finally
     Screen.Cursor := crDefault;
     AppData.Nakl.EnableControls;
     SetRangeCaprion(BegD, EndD);
  end;
end;

procedure TReestrForm.SetRangeCaprion(BegD, EndD: TDateTime);
begin
    RangeLbl.Caption := Format(SRangeT, [FormatDateTime('yyyy-mm-dd', BegD),
                                         FormatDateTime('yyyy-mm-dd', EndD)]);
end;

procedure TReestrForm.DelNaklActionExecute(Sender: TObject);
begin
  if (AppData.Nakl.Active) and (not AppData.Nakl.IsEmpty) then
    Begin
      if MessageBox(Handle, 'Вы действительно хотите удалить документ?',  'Удаление документа', MB_ICONWARNING+MB_YESNO) = ID_YES then
        try
            Screen.Cursor := crSQLWait;
            AppData.Nakl.DisableControls;

            AppData.Command.CommandText := Format(SSQLDelNakl, [AppData.Nakl.FieldByName('UNICUM_NUM').AsInteger]);
            AppData.Command.Execute;
        finally
          RefreshNaklActionExecute(Self);
          Screen.Cursor := crDefault;
          AppData.Nakl.EnableControls;
        end;
    end;
end;

procedure TReestrForm.FindEditKeyPress(Sender: TObject; var Key: Char);
begin
  if FindCB.ItemIndex = 0 then
    if not (Key in ['0'..'9', #8, #13]) then Key := #0;
end;

procedure TReestrForm.Find(Index: integer; FindStr: string);
var
    Str: string;
begin
  if (AppData.Nakl.Active) and
     (not AppData.Nakl.IsEmpty) and
     (Length(Trim(FindStr))> 0)  then
      try
         Case Index of
           0: Str := ' UNICUM_NUM = ' + FindStr;
           1: Str := ' REG_SYMBOL LIKE ' + QuotedStr('%' + FindStr + '%');
           2: Str := ' VIN LIKE ' + QuotedStr('%' + FindStr + '%');
           3: Str := ' MODEL LIKE ' + QuotedStr('%' + FindStr + '%');
         end;
      finally
        if Length(Str) > 0 then
          try
             AppData.Nakl.Filtered := False;
             AppData.Nakl.Filter := Str;
             AppData.Nakl.Filtered := True;
          except
             on Err: Exception do
               MessageDlg('Ошибка при попытке поиска документа', mtError, [mbOK], 0);
          end;
      end;
end;

procedure TReestrForm.FindBtnClick(Sender: TObject);
begin
  Find(FindCB.ItemIndex, FindEdit.Text);
end;

procedure TReestrForm.PrintReestrActionExecute(Sender: TObject);
var
    sUN: integer;
begin
  if (AppData.Nakl.Active) and
     (not AppData.Nakl.IsEmpty) then
     try
       sUN := AppData.fldUNICUM_NUM.AsInteger;
       AppData.Nakl.DisableControls;
       Screen.Cursor := crSQLWait;

       Report.Template := SReestr;
       Report.Run;
     finally
       AppData.Nakl.Locate('UNICUM_NUM', sUN, [loCaseInsensitive, loPartialKey]);
       AppData.Nakl.EnableControls;
       Screen.Cursor := crDefault;
     end;
end;

procedure TReestrForm.PrintDocActionExecute(Sender: TObject);
begin
  if (AppData.Nakl.Active) and
     (not AppData.Nakl.IsEmpty) then
      try
        Screen.Cursor := crSQLWait;
        AppData.Nakl.DisableControls;

        Report.Template := SNakl;
        Report.Run;
      finally
         Screen.Cursor := crDefault;
         AppData.Nakl.EnableControls;
      end;
end;

procedure TReestrForm.FindEditChange(Sender: TObject);
begin
  if Length(Trim(FindEdit.Text)) = 0 then
      AppData.Nakl.Filtered := False;
end;

function TReestrForm.GetDateDoc: Variant;
begin
  if (AppData.Nakl.Active) and
     (not AppData.Nakl.IsEmpty) then
    Result := AppData.fldUNICUM_NUM.AsString
  elsed
    Result := 0;
end;

function TReestrForm.GetNumDoc: Variant;
begin                               
  if (AppData.Nakl.Active) and
     (not AppData.Nakl.IsEmpty) then
      Result := AppData.Nakl.FieldByName('DATE_DOC').AsDateTime;
end;

end.
