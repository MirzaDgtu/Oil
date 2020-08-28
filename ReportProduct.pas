unit ReportProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, Grids, DBGrids, Menus;

type
  TReportProductFrame = class(TFrame)
    SB: TStatusBar;
    PopMenu: TPopupMenu;
    ProductReportGrid: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses AppDM, Globals, SConst;

{$R *.dfm}

end.
