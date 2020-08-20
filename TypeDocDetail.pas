unit TypeDocDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TTypeDocDetailForm = class(TForm)
    typeDocDetailGB: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DescriptionEdit: TEdit;
    NameEdit: TEdit;
    ReserveChB: TCheckBox;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Bevel1: TBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TypeDocDetailForm: TTypeDocDetailForm;

implementation

{$R *.dfm}

end.
