unit Reestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus,
  ImgList, ActnList;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReestrForm: TReestrForm;

implementation

{$R *.dfm}

end.
