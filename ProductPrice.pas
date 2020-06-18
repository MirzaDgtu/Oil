unit ProductPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, Buttons;

type
  TProductPriceForm = class(TForm)
    ParamertGB: TGroupBox;
    Label1: TLabel;
    NameEdit: TEdit;
    Label2: TLabel;
    ArticulEdit: TEdit;
    Label3: TLabel;
    EdnIzmerEdit: TEdit;
    Label4: TLabel;
    TypeTovrEdit: TEdit;
    Label5: TLabel;
    WeightEdit: TEdit;
    CountProdGB: TGroupBox;
    BtnsPanel: TPanel;
    Label6: TLabel;
    PowerEdit: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    PriceEdit: TEdit;
    Label9: TLabel;
    SummEdit: TEdit;
    CountEdit: TSpinEdit;
    Label10: TLabel;
    EdnVUpakEdit: TEdit;
    ResultLabel: TLabel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    PrimechGB: TGroupBox;
    PrimechMemo: TMemo;
    procedure CountEditChange(Sender: TObject);
  private
    { Private declarations }
    FSumProd: Variant;
    procedure SetSumProd(const Value: Variant);
    procedure SetSummProduct(Count, Price: real);

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

  published
    property SumProd: Variant read FSumProd write SetSumProd;
  end;

var
  ProductPriceForm: TProductPriceForm;

implementation

uses SConst;

{$R *.dfm}

{ TProductPriceForm }

constructor TProductPriceForm.Create(AOwner: TComponent);
begin
  inherited;
  
end;

procedure TProductPriceForm.SetSummProduct(Count, Price: real);
begin
  try
    ResultLabel.Caption := Format(SSumProd, [FloatToStr(Count),
                                             FloatToStr(Price),
                                             FloatToStr(Count * Price)]);
    SumProd := FloatToStr(Count * Price);
  finally
    SummEdit.Text := SumProd;
  end;
end;

procedure TProductPriceForm.SetSumProd(const Value: Variant);
begin
  FSumProd := Value;
end;

procedure TProductPriceForm.CountEditChange(Sender: TObject);
var
   fCount: string;
begin
  fCount := IntToStr(CountEdit.Value);
  SetSummProduct(StrToFloat(fCount), StrToFloat(PriceEdit.Text));
end;

end.
