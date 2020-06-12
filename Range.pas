unit Range;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TRangeForm = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    BegDP: TDateTimePicker;
    EndDP: TDateTimePicker;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    procedure BegDPChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure CorrectDate();
  public
    { Public declarations }
  end;

var
  RangeForm: TRangeForm;

implementation

{$R *.dfm}

{ TRangeForm }

procedure TRangeForm.CorrectDate;
begin
  if BegDP.Date > EndDP.Date then
      EndDP.Date := BegDP.Date;
end;

procedure TRangeForm.BegDPChange(Sender: TObject);
begin
  CorrectDate();
end;

procedure TRangeForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close();
end;

end.
