unit Drivers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, DB, ADODB;

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
    procedure DriversGridTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses AppDM, SConst, Globals;

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

end.
