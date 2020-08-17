unit DriverDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TDriverDetailDialog = class(TForm)
    DriverGB: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FamilyEdit: TEdit;
    NameEdit: TEdit;
    LastNameEdit: TEdit;
    Label4: TLabel;
    BirthDayDP: TDateTimePicker;
    PassportGB: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    PassSerialEdit: TEdit;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    PassGaveMemo: TMemo;
    BtnsPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DriverDetailDialog: TDriverDetailDialog;

implementation

{$R *.dfm}

end.
