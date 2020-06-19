unit ProductPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, Buttons, StrUtils;

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
    Label10: TLabel;
    EdnVUpakEdit: TEdit;
    ResultLabel: TLabel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    PrimechGB: TGroupBox;
    PrimechMemo: TMemo;
    CountEdit: TEdit;
    procedure CountEditChange(Sender: TObject);
    procedure CountEditKeyPress(Sender: TObject; var Key: Char);
    procedure PrimechMemoKeyPress(Sender: TObject; var Key: Char);
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
begin
  if Length(Trim(CountEdit.Text)) = 0 then
     CountEdit.Text := '0';
  SetSummProduct(StrToFloat(IfThen(CountEdit.Text = EmptyStr, '0', Trim(CountEdit.Text))), StrToFloat(PriceEdit.Text));
end;

procedure TProductPriceForm.CountEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9', #8, #13: ;
    ',', '.': Begin
                if Key <> DecimalSeparator then
                  Key := DecimalSeparator;

                if Pos(DecimalSeparator, CountEdit.Text) > 0 then
                    Key := #0;
              end;
    else
          Key := #0;
  end;
end;

procedure TProductPriceForm.PrimechMemoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key in ['''', '"', '~', '`'] then
      Key := #0;
end;

end.
