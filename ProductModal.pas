unit ProductModal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrameProduct;

type
  TProductFrameModalForm = class(TForm)
    ProductFrame: TProductFrame;
    procedure ProductFrameProductsGridDblClick(Sender: TObject);
    procedure ProductFrameAddProdTBIClick(Sender: TObject);
  private
    FPrimechProd: Variant;
    FCountProd: Variant;
    FSumProdP: Variant;
    procedure SetCountProd(const Value: Variant);
    procedure SetPrimechProd(const Value: Variant);
    procedure SetSumProdP(const Value: Variant);
    { Private declarations }
  public
    { Public declarations }
  published
    property CountProd: Variant read FCountProd write SetCountProd;
    property SumProdP: Variant read FSumProdP write SetSumProdP;
    property PrimechProd: Variant read FPrimechProd write SetPrimechProd;
  end;

var
  ProductFrameModalForm: TProductFrameModalForm;

implementation

uses AppDM, Globals, SConst, ProductPrice;

{$R *.dfm}

procedure TProductFrameModalForm.ProductFrameProductsGridDblClick(
  Sender: TObject);
begin
if (AppData.Products.Active) and
     (not AppData.Products.IsEmpty) then
     Self.ModalResult := mrOk;
end;

procedure TProductFrameModalForm.ProductFrameAddProdTBIClick(
  Sender: TObject);
begin
  ProductFrame.AddProdActionExecute(Sender);
end;

procedure TProductFrameModalForm.SetCountProd(const Value: Variant);
begin
  FCountProd := Value;
end;

procedure TProductFrameModalForm.SetPrimechProd(const Value: Variant);
begin
  FPrimechProd := Value;
end;

procedure TProductFrameModalForm.SetSumProdP(const Value: Variant);
begin
  FSumProdP := Value;
end;

end.
