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
    procedure CountEditExit(Sender: TObject);
  private
    { Private declarations }
    FSumProd: Variant;
    FtypeDoc: string;
    procedure SetSumProd(const Value: Variant);
    procedure SetSummProduct(Count, Price: real);
    procedure SettypeDoc(const Value: string);

  protected
    property typeDoc: string read FtypeDoc write SettypeDoc;

  public
    { Public declarations }
    constructor Create(TypeDoc: string); overload;

  published
    property SumProd: Variant read FSumProd write SetSumProd;
  end;

var
  ProductPriceForm: TProductPriceForm;

implementation

uses SConst;

{$R *.dfm}

{ TProductPriceForm }

constructor TProductPriceForm.Create(TypeDoc: string);
begin
  inherited Create(Application);
     Self.typeDoc := TypeDoc;
end;

procedure TProductPriceForm.SetSummProduct(Count, Price: real);
var
    valD: Double;
begin
  SumProd := '0';
  try
    if TryStrToFloat (CountEdit.Text, valD) then
      Begin
        ResultLabel.Caption := Format(SSumProd, [FloatToStr(Count),
                                                 FloatToStr(Price),
                                                 FloatToStr(Count * Price)]);
        SumProd := FloatToStr(Count * Price);
      End;
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

  if (Length(Trim(CountEdit.Text)) > 0) then
    Begin
      if (StrToFloat(Trim(IfThen((CountEdit.Text = EmptyStr) or (CountEdit.Text = '-'), '0', CountEdit.Text))) > StrToFloat(Trim(PowerEdit.Text))) and
         (Self.typeDoc <> 'Приходный документ') and
         (Self.typeDoc <> 'Ревизия') and
         (Self.typeDoc <> 'Чек') then
           CountEdit.Text := PowerEdit.Text;
    end;
end;

procedure TProductPriceForm.CountEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9', #8: ;
    #13: SetSummProduct(StrToFloat(IfThen((CountEdit.Text = EmptyStr) or (CountEdit.Text = '-'), '0', Trim(CountEdit.Text))), StrToFloat(PriceEdit.Text));
    ',', '.': Begin
                if Key <> DecimalSeparator then
                  Key := DecimalSeparator;

                if Pos(DecimalSeparator, CountEdit.Text) > 0 then
                    Key := #0;
              end;
    '-':      Begin
                if Self.typeDoc <> 'Ревизия' then
                  Key := #0;

                if Pos ('-', CountEdit.Text) > 0 then
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

procedure TProductPriceForm.SettypeDoc(const Value: string);
begin
  FtypeDoc := Value;
end;

procedure TProductPriceForm.CountEditExit(Sender: TObject);
begin
  SetSummProduct(StrToFloat(IfThen((CountEdit.Text = EmptyStr) or (CountEdit.Text = '-'), '0', Trim(CountEdit.Text))), StrToFloat(PriceEdit.Text));
end;

end.
