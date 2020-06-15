unit Nakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, ToolWin, Grids, ActnList,
  ImgList;

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
    ProductSG: TStringGrid;
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
  private
    FUNICUM_NUM: integer;
    FiTypeF: Shortint;
    procedure SetiTypeF(const Value: Shortint);
    procedure SetUNICUM_NUM(const Value: integer);
    procedure SetFieldsSG();
    { Private declarations }

  protected
    property UNICUM_NUM: integer read FUNICUM_NUM write SetUNICUM_NUM;
    property iTypeF: Shortint read FiTypeF write SetiTypeF;
  public
    { Public declarations }
   // procedure SetSettingGrid(Value: Shortint);  // -- Принимает g_New, g_Corr, g_View
    // Блок настроек формы
    procedure NewNaklSetting();
    procedure CorrNaklSetting(UNICUM_NUM: integer);
    procedure ViewNaklSetting(UNICUM_NUM: integer);

    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(Unucim_Num, TypeF: integer); overload;
  end;

var
  NaklForm: TNaklForm;

implementation

uses AppDM, Globals, Products, SConst;

{$R *.dfm}

{ TNaklForm }

procedure TNaklForm.CorrNaklSetting(UNICUM_NUM: integer);
begin
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

constructor TNaklForm.Create(AOwner: TComponent);
begin
  inherited;
  DateDocDP.Date := Now();
  SetFieldsSG();
end;

constructor TNaklForm.Create(Unucim_Num, TypeF: integer);
begin
  inherited Create(Application);

  case TypeF of
    g_New: NewNaklSetting();
    g_Corr: CorrNaklSetting(AppData.fldUNICUM_NUM.AsInteger);
    g_View: ViewNaklSetting(AppData.fldUNICUM_NUM.AsInteger);
  end;
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
       ColCount := 6;
       FixedCols := 1;
       FixedCols := 1;

       Cols[0].Text := '№';
       Cols[1].Text := 'Артикул';
    finally

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
begin
  // Ограничения на сохранение и какие либо изменения документа

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
        ///
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

end.
