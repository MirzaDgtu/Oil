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
var
    ProdF: TProductPriceForm;
begin
  if (AppData.Products.Active) and
     (not AppData.Products.IsEmpty) then
    try
      ProdF := TProductPriceForm.Create(Application);

      with ProdF do
        Begin
           NameEdit.Text := AppData.Products.FieldByName('NAME_ARTIC').AsString;
           ArticulEdit.Text := AppData.Products.FieldByName('COD_ARTIC').AsString;
           EdnIzmerEdit.Text := AppData.Products.FieldByName('EDIN_IZMER').AsString;
           TypeTovrEdit.Text := AppData.Products.FieldByName('TYPE_TOVR').AsString;
           WeightEdit.Text := AppData.Products.FieldByName('VES_EDINIC').AsString;
           PowerEdit.Text := AppData.Products.FieldByName('KON_KOLCH').AsString;
           PriceEdit.Text := AppData.Products.FieldByName('CENA_ARTC').AsString;
           EdnVUpakEdit.Text := AppData.Products.FieldByName('EDN_V_UPAK').AsString;

          if ShowModal = mrok then
            Begin
              CountProd := IntToStr(CountEdit.Value);
              SumProdP := SumProd;
              PrimechProd := PrimechMemo.Text;
              Self.ModalResult := mrOk;
            end;
        end;
    finally
      FreeAndNil(ProdF);
    end;
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
