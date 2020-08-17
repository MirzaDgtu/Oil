unit DriversF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Drivers;

type
  TDriversForm = class(TForm)
    DriversFrame1: TDriversFrame;
  private
    { Private declarations }
  public
    { Public declarations }

    constructor Create(AOwner: TComponent); override;
  end;

var
  DriversForm: TDriversForm;

implementation

{$R *.dfm}

{ TDriversForm }

constructor TDriversForm.Create(AOwner: TComponent);
begin
  inherited;
    DriversFrame1.RefreshActionExecute(Self);
end;
end.
