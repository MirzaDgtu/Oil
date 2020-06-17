unit CarStory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ActnList, StdCtrls, Grids, DBGrids, ExtCtrls,
  ComCtrls, Buttons, DB, ADODB;

type
  TCarStoryForm = class(TForm)
    Splitter1: TSplitter;
    SB: TStatusBar;
    HeaderPanel: TPanel;
    GridsGB: TGroupBox;
    CarGrid: TDBGrid;
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
    AL: TActionList;
    AddAction: TAction;
    CorrAction: TAction;
    DelAction: TAction;
    RefreshAction: TAction;
    TransferAction: TAction;
    FindAction: TAction;
    RangeAction: TAction;
    StoryAction: TAction;
    IL: TImageList;
    PopMenu: TPopupMenu;
    AddItemPop: TMenuItem;
    CorItemPop: TMenuItem;
    DelItemPop: TMenuItem;
    TransferItemPop: TMenuItem;
    N1: TMenuItem;
    RefreshItemPop: TMenuItem;
    RefreshBtn: TBitBtn;
    RangeBtn: TBitBtn;
    SelectBtn: TBitBtn;
    procedure RefreshBtnClick(Sender: TObject);
    procedure RangeBtnClick(Sender: TObject);
    procedure CarGridDblClick(Sender: TObject);
    procedure CarGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CarGridTitleClick(Column: TColumn);
  private
    FBegD: TDateTime;
    FEndD: TDateTime;
    FTypeF: Shortint;
    FlocUID: integer;
    procedure SetBegD(const Value: TDateTime);
    procedure SetEndD(const Value: TDateTime);
    procedure SetTypeF(const Value: Shortint);
    procedure SetlocUID(const Value: integer);
    procedure SetCarDetail();
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Value: Shortint; UID: integer); overload;

  protected
    property TypeF: Shortint read FTypeF write SetTypeF;
    property locUID: integer read FlocUID write SetlocUID;

  published
    property BegD: TDateTime read FBegD write SetBegD;
    property EndD: TDateTime read FEndD write SetEndD;
  end;

var
  CarStoryForm: TCarStoryForm;

implementation

uses AppDM, Globals, SConst, Range;

{$R *.dfm}

{ TCarStoryForm }

constructor TCarStoryForm.Create(Value: Shortint; UID: integer);
begin
  inherited Create(Application);

  try
    TypeF := Value;
    locUID := UID;
    BegD := Now();
    EndD := BegD + 1;


     case Value of
        g_New:  Begin
                 SelectBtn.Visible := True;
                 Self.CarGrid.DataSource := AppData.DS_Cars;
                end;

        g_View: Self.CarGrid.DataSource := AppData.DS_CarStory;
     end;
  finally
     RefreshBtnClick(Self);
  end;
end;

procedure TCarStoryForm.SetBegD(const Value: TDateTime);
begin
  FBegD := Value;
end;

procedure TCarStoryForm.SetEndD(const Value: TDateTime);
begin
  FEndD := Value;
end;

procedure TCarStoryForm.SetTypeF(const Value: Shortint);
begin
  FTypeF := Value;
end;

procedure TCarStoryForm.RefreshBtnClick(Sender: TObject);
begin

    case TypeF of
      g_New: Begin
               AppData.Cars.Active := False;
               AppData.Cars.CommandText := Format(SSQLGetCars,     [g_New,
                                                                    FormatDateTime('yyyy-mm-dd', BegD),
                                                                    FormatDateTime('yyyy-mm-dd', EndD)]);
               AppData.Cars.Active := True;
             end;
      g_Corr: ;
      g_View: Begin
                AppData.CarStory.Active := False;
                AppData.CarStory.CommandText := Format(SSQLGetCarArc, [locUID]);
                AppData.CarStory.Active := True;
              end;
    end;

    TAppData.SetInfoSB(TADODataSet(CarGrid.DataSource.DataSet), SB);
end;

procedure TCarStoryForm.SetlocUID(const Value: integer);
begin
  FlocUID := Value;
end;

procedure TCarStoryForm.RangeBtnClick(Sender: TObject);
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

procedure TCarStoryForm.SetCarDetail;
begin
    AppData.CarDetail.Active := False;
    AppData.CarDetail.Active := True;

      if (AppData.CarDetail.Active) and
         (not AppData.CarDetail.IsEmpty) then
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
            ShowMessage('Ошибка получения информации параметров машины.' + #13 + 'Сообщение: ' + Err.Message);
        end;
end;

procedure TCarStoryForm.CarGridDblClick(Sender: TObject);
begin
  SetCarDetail();
end;

procedure TCarStoryForm.CarGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (TypeF = g_New) and
     (AppData.Cars.Active) and
     (not AppData.Cars.IsEmpty) then
    Begin
     if AppData.Cars.FieldByName('Reserve').AsBoolean = True then
        CarGrid.Canvas.Brush.Color := clRed;
    end;


  if (TypeF = g_View) and
     (AppData.CarStory.Active) and
     (not AppData.CarStory.IsEmpty) then
      Begin
        if AppData.CarStory.FieldByName('Archive').AsString = '*' then
            CarGrid.Canvas.Brush.Color := clScrollBar;
      end;

    CarGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TCarStoryForm.CarGridTitleClick(Column: TColumn);
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
