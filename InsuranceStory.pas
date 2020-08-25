unit InsuranceStory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, Menus, ActnList, Grids, DBGrids, ComCtrls,
  StdCtrls, Buttons, ADODB, DB;

type
  TIsnuranceStoryForm = class(TForm)
    SB: TStatusBar;
    InsuranceGrid: TDBGrid;
    AL: TActionList;
    AddAction: TAction;
    CorrAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    TransferAction: TAction;
    FindAction: TAction;
    RangeAction: TAction;
    StoryAction: TAction;
    PMenu: TPopupMenu;
    AddPop: TMenuItem;
    CorrPop: TMenuItem;
    DelPop: TMenuItem;
    TransferPop: TMenuItem;
    RefreshPop: TMenuItem;
    IL: TImageList;
    HeaderPanel: TPanel;
    RangeBtn: TBitBtn;
    RefreshBtn: TBitBtn;
    SelectBtn: TBitBtn;
    procedure RangeBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure InsuranceGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure InsuranceGridTitleClick(Column: TColumn);
  private
    FlocUID: integer;
    FTypeF: Shortint;
    FBegD: TDateTime;
    FEndD: TDateTime;
    procedure SetlocUID(const Value: integer);
    procedure SetTypeF(const Value: Shortint);
    procedure SetBegD(const Value: TDateTime);
    procedure SetEndD(const Value: TDateTime);
    { Private declarations }
  protected
    property TypeF: Shortint read FTypeF write SetTypeF;
    property locUID: integer read FlocUID write SetlocUID;

  public
    { Public declarations }
    constructor Create(Value: Shortint; UID: integer); overload;

  published
    property BegD: TDateTime read FBegD write SetBegD;
    property EndD: TDateTime read FEndD write SetEndD;
  end;

var
  IsnuranceStoryForm: TIsnuranceStoryForm;

implementation

uses AppDM, Globals, Range, SConst, DateUtils;

{$R *.dfm}

{ TIsnuranceStoryForm }

constructor TIsnuranceStoryForm.Create(Value: Shortint; UID: integer);
begin
  inherited Create(Application);

  TypeF := Value;
  locUID := UID;
  BegD := Now();
  EndD := BegD + 1;

  case Value of
    g_New:  Begin
              SelectBtn.Visible := True;
              InsuranceGrid.DataSource := AppData.DS_Insurance;
              AppData.Insurance.Active := False;
              AppData.Insurance.CommandText := Format(SSQLGetInsurance, [0,
                                                                         FormatDateTime('yyyy-mm-dd', BegD),
                                                                         FormatDateTime('yyyy-mm-dd', EndD)]);
              AppData.Insurance.Active := True;
            end;
    g_Corr: ;
    g_View: Begin
               InsuranceGrid.DataSource := AppData.DS_InsuranceStory;
               AppData.InsuranceStory.Active := False;
               AppData.InsuranceStory.CommandText := Format(SSQLGetIsnuranceArc, [UID]);
               AppData.InsuranceStory.Active := True;
            end;
  end;

end;

procedure TIsnuranceStoryForm.SetBegD(const Value: TDateTime);
begin
  FBegD := Value;
end;

procedure TIsnuranceStoryForm.SetEndD(const Value: TDateTime);
begin
  FEndD := Value;
end;

procedure TIsnuranceStoryForm.SetlocUID(const Value: integer);
begin
  FlocUID := Value;
end;

procedure TIsnuranceStoryForm.SetTypeF(const Value: Shortint);
begin
  FTypeF := Value;
end;

procedure TIsnuranceStoryForm.RangeBtnClick(Sender: TObject);
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
      RefreshBtnClick(Self);
    end;
end;

procedure TIsnuranceStoryForm.RefreshBtnClick(Sender: TObject);
begin
  try
    case TypeF of
      g_New:  Begin
                SelectBtn.Visible := True;
                InsuranceGrid.DataSource := AppData.DS_Insurance;
                AppData.Insurance.Active := False;
                AppData.Insurance.CommandText := Format(SSQLGetInsurance, [0,
                                                                           FormatDateTime('yyyy-mm-dd', BegD),
                                                                           FormatDateTime('yyyy-mm-dd', EndD)]);
                AppData.Insurance.Active := True;
              end;
      g_Corr: ;
      g_View: Begin
                 InsuranceGrid.DataSource := AppData.DS_InsuranceStory;
                 AppData.InsuranceStory.Active := False;
                 AppData.InsuranceStory.CommandText := Format(SSQLGetIsnuranceArc, [locUID]);
                 AppData.InsuranceStory.Active := True;
              end;
    end;
  finally
     AppData.SetInfoToSB(AppData.InsuranceStory, SB, True, True, 'Archive', 'RESERVE');
  end;
end;

procedure TIsnuranceStoryForm.InsuranceGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if InsuranceGrid.DataSource.DataSet.Name = 'Insurance' then
    Begin
      if (AppData.Insurance.Active) and (not AppData.Insurance.IsEmpty) then
        Begin
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
        end;
    end
  else
      Begin
        if  AppData.InsuranceStory.FieldByName('Archive').AsString = '*' then
            InsuranceGrid.Canvas.Brush.Color := clScrollBar;
      end;

   InsuranceGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TIsnuranceStoryForm.InsuranceGridTitleClick(Column: TColumn);
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

end.
