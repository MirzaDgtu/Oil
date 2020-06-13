unit Reestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus,
  ImgList, ActnList, ADODB, DB;

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
    AddAction: TAction;
    CorrAction: TAction;
    procedure NaklGridTitleClick(Column: TColumn);
    procedure MoveGridTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReestrForm: TReestrForm;

implementation

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

end.
