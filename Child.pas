unit Child;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TChildForm = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  protected
    procedure CreateForm; virtual;
    procedure DestroyForm; virtual;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  ChildForm: TChildForm;

implementation

uses Main, Globals, SConst, AppDM;

{$R *.dfm}

{ TChildForm }

constructor TChildForm.Create(AOwner: TComponent);
begin
  inherited;
  CreateForm();
end;

destructor TChildForm.Destroy;
begin
  DestroyForm();
  inherited;
end;

procedure TChildForm.CreateForm;
begin      
end;


procedure TChildForm.DestroyForm;
begin
end;

procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TChildForm.FormCreate(Sender: TObject);
begin
  if Assigned(MainForm) and (MainForm.MDIChildCount > 1) then
    WindowState := MainForm.MDIChildren[MainForm.MDIChildCount - 1].WindowState
  else
    WindowState := wsMaximized;
end;

end.
