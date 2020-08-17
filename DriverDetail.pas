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
    PassNumEdit: TEdit;
    PassGaveGB: TGroupBox;
    PassGaveMemo: TMemo;
    BtnsPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    AvailableChB: TCheckBox;
    CarGB: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    CarBtn: TBitBtn;
    ModelEdit: TEdit;
    RegSymbolEdit: TEdit;
    TypeEdit: TEdit;
    ColorEdit: TEdit;
    YearEdit: TEdit;
    PrimechGB: TGroupBox;
    PrimechMemo: TMemo;
    LicenseGB: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    LicenseGaveGB: TGroupBox;
    LicenseGaveMemo: TMemo;
    LicenseSerialEdit: TEdit;
    LicenseNumEdit: TEdit;
    LicenseCategoriesEdit: TEdit;
    LicenseBegDP: TDateTimePicker;
    LicenseEndDP: TDateTimePicker;
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
