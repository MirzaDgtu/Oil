unit TypeDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus,
  ImgList, ActnList;

type
  TTypeDocForm = class(TForm)
    SB: TStatusBar;
    BtnsPanel: TPanel;
    Bevel1: TBevel;
    AddBtn: TBitBtn;
    CorrBtn: TBitBtn;
    DelBtn: TBitBtn;
    TransferBtn: TBitBtn;
    RefreshBtn: TBitBtn;
    ResevrChB: TCheckBox;
    TypeDocGrid: TDBGrid;
    AL: TActionList;
    IL: TImageList;
    PopMenu: TPopupMenu;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TypeDocForm: TTypeDocForm;

implementation

uses AppDM, Globals, SConst;

{$R *.dfm}

end.
