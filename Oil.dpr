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
  ProductDetail in 'ProductDetail.pas' {ProductDetailForm},
  CarStory in 'CarStory.pas' {CarStoryForm},
  InsuranceStory in 'InsuranceStory.pas' {IsnuranceStoryForm},
  Reestr in 'Reestr.pas' {ReestrForm},
  Login in '..\..\Common\Login.pas' {LoginDlg},
  Nakl in 'Nakl.pas' {NaklForm},
  FrameProduct in 'FrameProduct.pas' {ProductFrame: TFrame},
  ProductModal in 'ProductModal.pas' {ProductFrameModalForm},
  ProductPrice in 'ProductPrice.pas' {ProductPriceForm},
  Drivers in 'Drivers.pas' {DriversFrame: TFrame},
  DriversF in 'DriversF.pas' {DriversForm},
  DriverDetail in 'DriverDetail.pas' {DriverDetailDialog},
  TypeDoc in 'TypeDoc.pas' {TypeDocForm},
  TypeDocDetail in 'TypeDocDetail.pas' {TypeDocDetailForm};

{$R *.res}

{$R WindowsXP.res}

begin
  Application.Initialize;
  Application.CreateForm(TAppData, AppData);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TTypeDocDetailForm, TypeDocDetailForm);
  Application.Run;
end.
