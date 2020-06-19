unit Nakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, ToolWin, Grids, ActnList,
  ImgList, StrUtils, ComObj;

type
  TNaklForm = class(TForm)
    ParametrsGB: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    NumDocEdit: TEdit;
    DateDocDP: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    DriverCB: TComboBox;
    AddDriverBtn: TBitBtn;
    CarPanel: TPanel;
    Label7: TLabel;
    ModelEdit: TEdit;
    CarBtn: TBitBtn;
    RegSymbolEdit: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    TypeEdit: TEdit;
    ColorEdit: TEdit;
    Label9: TLabel;
    YearEdit: TEdit;
    PrimechPanel: TPanel;
    PrimechGB: TGroupBox;
    PrimechMemo: TMemo;
    SB: TStatusBar;
    BottomTB: TToolBar;
    HeaderTB: TToolBar;
    AL: TActionList;
    IL: TImageList;
    SaveNaklAction: TAction;
    AddRowAction: TAction;
    CancelNaklAction: TAction;
    DelRowAction: TAction;
    SaveTBI: TToolButton;
    CancelTBI: TToolButton;
    AddRowTBI: TToolButton;
    DeleteTBI: TToolButton;
    PrintTBI: TToolButton;
    PrintAction: TAction;
    FontAction: TAction;
    FD: TFontDialog;
    FontTBI: TToolButton;
    DriverAction: TAction;
    CarAction: TAction;
    Label4: TLabel;
    TypeDocCB: TComboBox;
    AddTypeDocBtn: TBitBtn;
    ProductSG: TStringGrid;
    procedure DriverActionExecute(Sender: TObject);
    procedure CarActionExecute(Sender: TObject);
    procedure DelRowActionExecute(Sender: TObject);
    procedure AddRowActionExecute(Sender: TObject);
    procedure FontActionExecute(Sender: TObject);
    procedure ProductSGKeyPress(Sender: TObject; var Key: Char);
    procedure ProductSGSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    FUNICUM_NUM: integer;
    FiTypeF: Shortint;
    FUID_Car: integer;
    procedure SetiTypeF(const Value: Shortint);
    procedure SetUNICUM_NUM(const Value: integer);
    procedure SetFieldsSG();
    procedure SetUID_Car(const Value: integer);
    procedure DeleteRow(StringGrid: TStringGrid; ARow: Integer);
    procedure SetNumSG(SG: TStringGrid; Value: integer);
    function GetSumDoc: Real;
    { Private declarations }

  protected
    property UNICUM_NUM: integer read FUNICUM_NUM write SetUNICUM_NUM;
    property iTypeF: Shortint read FiTypeF write SetiTypeF;
  public
    { Public declarations }

    // Блок настроек формы
    procedure NewNaklSetting();
    procedure CorrNaklSetting(UNICUM_NUM: integer);
    procedure ViewNaklSetting(UNICUM_NUM: integer);

    constructor Create(Unucim_Num, TypeF: integer); overload;
   published
     property UID_Car: integer read FUID_Car write SetUID_Car;
     property SumDoc: Real read GetSumDoc;
  end;

var
  NaklForm: TNaklForm;

implementation

uses AppDM, Globals, Products, SConst, DB, CarStory, Math, ProductModal,
  ProductPrice;

{$R *.dfm}

{ TNaklForm }

procedure TNaklForm.CorrNaklSetting(UNICUM_NUM: integer);
begin
  Self.Caption := Self.Caption + ' -> [Корректировка документа]';
  AppData.ProductDetail.Active := False;
  AppData.ProductDetail.CommandText := Format(SSQLGetNaklDetail, [UNICUM_NUM,
                                                                  g_New]);
  AppData.ProductDetail.Active := True;

  // Головная часть документа
  NumDocEdit.Text := AppData.Nakl.FieldbyName('NUM_DOC').AsString;
  DateDocDP.Date := AppData.Nakl.FieldByName('DATE_DOC').AsDateTime;
  DriverCB.ItemIndex := DriverCB.Items.IndexOf(AppData.Nakl.FieldByName('Driver').AsString);
  ModelEdit.Text := AppData.Nakl.FieldByName('MODEL').AsString;
  RegSymbolEdit.Text := AppData.Nakl.FieldByName('REG_SYMBOL').AsString;
  TypeEdit.Text := AppData.Nakl.FieldByName('TYPE_DOC').AsString;
  ColorEdit.Text := AppData.Nakl.FieldByName('COLOR').AsString;
  YearEdit.Text := AppData.Nakl.FieldByName('MADEYEAR').AsString;
  PrimechMemo.Text := AppData.Nakl.FieldByName('PRIMECH').AsString;

  // Тело документа
  if (AppData.ProductDetail.Active) and
     (not AppData.ProductDetail.IsEmpty) then
      try

      except
        on Err: Exception do
          MessageDlg('Ошибка получения информации о документе!' + #13 + 'Сообщение: ' + Err.Message, mtError, [mbOK], 0);
      end;
end;

constructor TNaklForm.Create(Unucim_Num, TypeF: integer);
begin
  inherited Create(Application);
  Self.UNICUM_NUM := Unucim_Num;
  Self.iTypeF := TypeF;
  DateDocDP.Date := Now();
  SetFieldsSG();

  case TypeF of
    g_New: NewNaklSetting();
    g_Corr: CorrNaklSetting(AppData.fldUNICUM_NUM.AsInteger);
    g_View: ViewNaklSetting(AppData.fldUNICUM_NUM.AsInteger);
  end;

  SetNumSG(Self.ProductSG, Self.ProductSG.RowCount);
end;

procedure TNaklForm.NewNaklSetting;
begin
  DateDocDP.Date := Now();
  Self.Caption := Self.Caption + ' -> [Новый документ]';
end;

procedure TNaklForm.SetFieldsSG;
begin
   with ProductSG do
    try
       RowCount := 2;
       ColCount := 7;
       FixedCols := 1;
       FixedCols := 1;

       Cols[0].Text := '№';
       Cols[1].Text := 'Артикул';
       Cols[2].Text := 'Наименование';
       Cols[3].Text := 'Цена';
       Cols[4].Text := 'Количество';
       Cols[5].Text := 'Сумма';
       Cols[6].Text := 'Примечание';

       ColWidths[0] := 30;
       ColWidths[1] := 80;
       ColWidths[2] := 230;
       ColWidths[3] := 70;
       ColWidths[4] := 90;
       ColWidths[5] := 90;
       ColWidths[6] := 200;
    finally
        ProductSG.DefaultRowHeight := 20;
    end;
end;

procedure TNaklForm.SetiTypeF(const Value: Shortint);
begin
  FiTypeF := Value;
end;

procedure TNaklForm.SetUNICUM_NUM(const Value: integer);
begin
  FUNICUM_NUM := Value;
end;

procedure TNaklForm.ViewNaklSetting(UNICUM_NUM: integer);
var
   i: integer;
begin
  // Ограничения на сохранение и какие либо изменения документа
  Self.Caption := Self.Caption + ' -> [Просмотр документа]';

  AppData.ProductDetail.Active := False;
  AppData.ProductDetail.CommandText := Format(SSQLGetNaklDetail, [UNICUM_NUM,
                                                                  g_New]);
  AppData.ProductDetail.Active := True;

  // Головная часть документа
  NumDocEdit.Text := AppData.Nakl.FieldbyName('NUM_DOC').AsString;
  DateDocDP.Date := AppData.Nakl.FieldByName('DATE_DOC').AsDateTime;
  DriverCB.ItemIndex := DriverCB.Items.IndexOf(AppData.Nakl.FieldByName('Driver').AsString);
  ModelEdit.Text := AppData.Nakl.FieldByName('MODEL').AsString;
  RegSymbolEdit.Text := AppData.Nakl.FieldByName('REG_SYMBOL').AsString;
  TypeEdit.Text := AppData.Nakl.FieldByName('TYPE_DOC').AsString;
  ColorEdit.Text := AppData.Nakl.FieldByName('COLOR').AsString;
  YearEdit.Text := AppData.Nakl.FieldByName('MADEYEAR').AsString;
  PrimechMemo.Text := AppData.Nakl.FieldByName('PRIMECH').AsString;

  // Тело документа
  if (AppData.ProductDetail.Active) and
     (not AppData.ProductDetail.IsEmpty) then
      try
        while not AppData.Move.Eof do
          Begin
            with ProductSG do
              Begin
                Cols[0].Text := '1';
                Cols[1].Text := AppData.Move.FieldByName('COD_ARTIC').AsString;
                Cols[2].Text := AppData.Move.FieldByName('NAME_ARTIC').AsString;
                Cols[3].Text := AppData.Move.FieldByName('SUM_PREDM').AsString;
                Cols[4].Text := AppData.Move.FieldByName('KOLC_PREDM').AsString;
                Cols[5].Text := AppData.Move.FieldByName('Res_Sum').AsString;
                Cols[6].Text := AppData.Move.FieldByName('Primech').AsString;
              end;

            AppData.Move.Next;
          end;
      except
        on Err: Exception do
          MessageDlg('Ошибка получения информации о документе!' + #13 + 'Сообщение: ' + Err.Message, mtError, [mbOK], 0);
      end;

  // Запрет на корректировку  
  NumDocEdit.ReadOnly := True;
  PrimechMemo.ReadOnly := True;

  ProductSG.Options := ProductSG.Options - [goEditing];
  DateDocDP.Enabled := False;
  DriverCB.Enabled := False;

  // Кнопки
  SaveTBI.Enabled := False;
  AddDriverBtn.Enabled := False;
  AddRowTBI.Enabled := False;
  DeleteTBI.Enabled := False;
  CarBtn.Enabled := False;

end;

procedure TNaklForm.DriverActionExecute(Sender: TObject);
var
    Str: string;
begin
  if InputQuery('Водитель', 'ФИО', Str) then
  begin
    Str := Trim(Str);
    DriverCB.Items.Add(Str);
    DriverCB.ItemIndex := DriverCB.Items.IndexOf(Str);
  end;
end;

procedure TNaklForm.CarActionExecute(Sender: TObject);
var
    CarF: TCarStoryForm;
begin
  CarF :=  TCarStoryForm.Create(g_New, g_New);

   if CarF.ShowModal = mrOk then
   try
      ModelEdit.Text := AppData.Cars.FieldByName('Model').AsString;
      RegSymbolEdit.Text := AppData.Cars.FieldByName('REG_SYMBOL').AsString;
      TypeEdit.Text := AppData.Cars.FieldByName('TYPE_TC').AsString;
      ColorEdit.Text := AppData.Cars.FieldByName('Color').AsString;
      YearEdit.Text := AppData.Cars.FieldByName('MADEYEAR').AsString;
      UID_Car := AppData.Cars.FieldByName('UID').AsInteger;
    finally
      FreeAndNil(CarF);
    end;
end;

procedure TNaklForm.SetUID_Car(const Value: integer);
begin
  FUID_Car := Value;
end;

procedure TNaklForm.DeleteRow(StringGrid: TStringGrid; ARow: Integer);
var i, j: Integer;
begin
  if (ProductSG.ColCount > 1) and
     (ProductSG.Row <> 1) then
   try
      with StringGrid do
      try
        for i:=ARow+1 to RowCount-1 do
          for j:=0 to ColCount-1 do
            Cells[j, i-1]:=Cells[j, i];
        for i:=1 to ColCount-1 do
          Cells[i, RowCount-1]:='';
        RowCount:=RowCount-1;
      except
        on Err: Exception do
          MessageDlg('Ошибка удаления строки!' + #13 + 'Сообщение: ' + Err.Message, mtError, [mbOK], 0);
      end;

      if ProductSG.RowCount = 1 then
         ProductSG.RowCount := ProductSG.RowCount + 1; 
   finally
     SetNumSG(ProductSG, ProductSG.RowCount);
   end;
end;

procedure TNaklForm.DelRowActionExecute(Sender: TObject);
begin
  DeleteRow(Self.ProductSG, Self.ProductSG.Row);
end;

procedure TNaklForm.SetNumSG(SG: TStringGrid; Value: integer);
var
  i: integer;
begin

  if Value > 0 then
    try
      for i := 1 to Value do
        SG.Rows[i].Text := IntToStr(i);
    except
      on Err: Exception do
        MessageDlg('Ошибка привоения нумерации!' + #13 + 'Сообщение: ' + Err.Message, mtError, [mbOK], 0);
    end;
end;

procedure TNaklForm.AddRowActionExecute(Sender: TObject);
var
    ProdF: TProductFrameModalForm;
    ProdP: TProductPriceForm;
begin
  ProdF := TProductFrameModalForm.Create(Application);

  try
    if ProdF.ShowModal = mrOk then
      Begin
        ProdP := TProductPriceForm.Create(Application);
        with ProdP do
          Begin
            NameEdit.Text := AppData.Products.FieldByName('NAME_ARTIC').AsString;
            ArticulEdit.Text := AppData.Products.FieldByName('COD_ARTIC').AsString;
            EdnIzmerEdit.Text := AppData.Products.FieldByName('EDIN_IZMER').AsString;
            TypeTovrEdit.Text := AppData.Products.FieldByName('TYPE_TOVR').AsString;
            WeightEdit.Text := AppData.Products.FieldByName('VES_EDINIC').AsString;
            PowerEdit.Text := AppData.Products.FieldByName('KON_KOLCH').AsString;
            PriceEdit.Text := AppData.Products.FieldByName('CENA_ARTC').AsString;
            EdnVUpakEdit.Text := AppData.Products.FieldByName('EDN_V_UPAK').AsString;

            if ProdP.ShowModal = mrOk then
              Begin
                with ProductSG do
                  Begin
                    if Cells[1,1] <> EmptyStr then
                        RowCount := RowCount + 1;
                    Cells[1, RowCount-1] := AppData.Products.FieldByName('COD_ARTIC').AsString;
                    Cells[2, RowCount-1] := AppData.Products.FieldByName('NAME_ARTIC').AsString;
                    Cells[3, RowCount-1] := AppData.Products.FieldByName('CENA_ARTC').AsString;
                    Cells[4, RowCount-1] := IntToStr(ProdP.CountEdit.Value);
                    Cells[5, RowCount-1] := ProdP.SumProd;
                    Cells[6, RowCount-1] := ProdP.PrimechMemo.Text;
                  end;
              end;
          end;
      end;
  finally
    SetNumSG(ProductSG, ProductSG.RowCount);
    FreeAndNil(ProdF);
    FreeAndNil(ProdP);
  end;
end;

function TNaklForm.GetSumDoc: Real;
var
    i: integer;
    resSum: real;
begin
  resSum := 0;

  if Self.ProductSG.RowCount > 1 then
    try
      for i := 1 to Self.ProductSG.RowCount Do
        resSum := resSum + StrToFloat(Self.ProductSG.Cols[5].Text);
    finally
      Result := resSum;
    end;

end;

procedure TNaklForm.FontActionExecute(Sender: TObject);
begin
    If FD.Execute then
      ProductSG.Font := FD.Font; 
end;

procedure TNaklForm.ProductSGKeyPress(Sender: TObject; var Key: Char);
begin
  with (Sender as TStringGrid) do
  Begin
    if (Col = 4) then
      Begin
        case Key of
          '0'..'9', #8, #13, #26: ;
          ',', '.': Begin
                       if Key <> DecimalSeparator then
                          Key := DecimalSeparator;

                       if Pos(DecimalSeparator, Cells[Col, Row]) > 0 then Key := #0;
                     end;
          #27:       Begin
                        keybd_event(VK_LCONTROL, 0, 0, 0);               // Нажатие клавищи Ctrl
                        keybd_event(Ord('Z'), 0, 0, 0);                  // Нажатие клавищи Z
                        keybd_event(Ord('Z'), 0, KEYEVENTF_KEYUP, 0);    // Отпускание клавищи Ctrl
                        keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0); // Отпускание клавищи Z
                     end;
          else
             Key := #0;
        end;
      end;
  end;
end;

procedure TNaklForm.ProductSGSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ACol = 4 then
    ProductSG.Options := ProductSG.Options + [goEditing]
  else
    ProductSG.Options := ProductSG.Options - [goEditing];
end;

end.
