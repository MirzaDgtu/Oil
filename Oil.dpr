program Oil;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  SConst in 'SConst.pas',
  Globals in 'Globals.pas',
  AppDM in 'AppDM.pas' {AppData: TDataModule},
  Car in 'Car.pas' {CarForm},
  CarDetail in 'CarDetail.pas' {CarDetailForm},
  Insurance in 'Insurance.pas' {InsuranceForm},
  InsuranceDetail in 'InsuranceDetail.pas' {InsuranceDetailForm},
  Range in 'Range.pas' {RangeForm},
  Products in 'Products.pas' {ProductsForm},
  Child in 'Child.pas' {ChildForm},
  ProductDetail in 'ProductDetail.pas' {ProductDetailForm};

{$R *.res}

{$R WindowsXP.res}

begin
  Application.Initialize;
  Application.CreateForm(TAppData, AppData);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
