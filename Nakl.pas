unit Nakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, ToolWin, Grids, ActnList,
  ImgList, StrUtils, ComObj, Menus;

type
  TNaklForm = class(TForm)
    ParametrsGB: TGroupBox;
    ParamPanel: TPanel;
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
    MovePop: TPopupMenu;
    AddRowAction1: TMenuItem;
    DelRowAction1: TMenuItem;
    TypeDocAction: TAction;
    HelpAction: TAction;
    HelpBTI: TToolButton;
    procedure DriverActionExecute(Sender: TObject);
    procedure CarActionExecute(Sender: TObject);
    procedure DelRowActionExecute(Sender: TObject);
    procedure AddRowActionExecute(Sender: TObject);
    procedure FontActionExecute(Sender: TObject);
    procedure ProductSGKeyPress(Sender: TObject; var Key: Char);
    procedure ProductSGSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ProductSGSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure TypeDocActionExecute(Sender: TObject);
    procedure SaveNaklActionExecute(Sender: TObject);
    procedure CancelNaklActionExecute(Sender: TObject);
    procedure HelpActionExecute(Sender: TObject);
    procedure ProductSGDblClick(Sender: TObject);
    procedure DriverCBChange(Sender: TObject);
  private
    { Private declarations }
    FUNICUM_NUM: integer;
    FiTypeF: Shortint;
    FUID_Car: integer;
    procedure SetiTypeF(const Value: Shortint);
    procedure SetUNICUM_NUM(const Value: integer);
    procedure SetFieldsSG();
    procedure SetUID_Car(const Value: integer);
    procedure DeleteRow(StringGrid: TStringGrid; ARow: Integer);
    procedure SetNumSG(SG: TStringGrid; Value: integer);
    procedure SetCarInfo(Uid_Driver: integer);
    function GetSumDoc: Real;
    function SetSumProd(CountProd, PriceProd: real): Variant;
    function CheckFullNessDoc: Boolean;


  protected
    property UNICUM_NUM: integer read FUNICUM_NUM write SetUNICUM_NUM;
    property iTypeF: Shortint read FiTypeF write SetiTypeF;
    
  public
    { Public declarations }

    // ���� �������� �����
    procedure NewNaklSetting();
    procedure CorrNaklSetting(UNICUM_NUM: integer);
    procedure ViewNaklSetting(UNICUM_NUM: integer);
    
    procedure setDrivers(Name: string);
    procedure setTypeDocs(Name: string);


    constructor Create(Unucim_Num, TypeF: integer); overload;
   published
     property UID_Car: integer read FUID_Car write SetUID_Car;
     property SumDoc: Real read GetSumDoc;
  end;

var
  NaklForm: TNaklForm;

implementation

uses AppDM, Globals, Products, SConst, DB, CarStory, Math, ProductModal,
  ProductPrice, DriverDetail;

{$R *.dfm}

{ TNaklForm }

procedure TNaklForm.CorrNaklSetting(UNICUM_NUM: integer);
var
  i: integer;
begin
  Self.Caption := Self.Caption + ' -> [������������� ���������]';

  AppData.Move.Active := False;
  AppData.Move.CommandText := Format(SSQLGetNaklDetail, [UNICUM_NUM,
                                                                  g_New]);
  AppData.Move.Active := True;

  // �������� ����� ���������
  NumDocEdit.Text := AppData.Nakl.FieldbyName('NUM_DOC').AsString;
  DateDocDP.Date := AppData.Nakl.FieldByName('DATE_DOC').AsDateTime;
  ModelEdit.Text := AppData.Nakl.FieldByName('MODEL').AsString;
  RegSymbolEdit.Text := AppData.Nakl.FieldByName('REG_SYMBOL').AsString;
  TypeEdit.Text := AppData.Nakl.FieldByName('TYPE_TC').AsString;
  ColorEdit.Text := AppData.Nakl.FieldByName('COLOR').AsString;
  YearEdit.Text := AppData.Nakl.FieldByName('MADEYEAR').AsString;
  PrimechMemo.Text := AppData.Nakl.FieldByName('PRIMECH').AsString;

  setDrivers(AppData.Nakl.FieldByName('Driver').AsString);
  setTypeDocs(AppData.Nakl.FieldByName('TYPE_DOC').AsString);


  // ���� ���������
  if (AppData.Move.Active) and
     (not AppData.Move.IsEmpty) then
      try
        ProductSG.RowCount := AppData.Move.RecordCount + 1;
        while not AppData.Move.Eof do
          Begin
            for i := 1 to ProductSG.RowCount - 1 do
              Begin
                with ProductSG do
                  Begin
                    Cells[1,i] := AppData.Move.FieldByName('NUM_PREDM').AsString;
                    Cells[2,i] := AppData.Move.FieldByName('NAME_PREDM').AsString;
                    Cells[3,i] := AppData.Move.FieldByName('SUM_PREDM').AsString;
                    Cells[4,i] := AppData.Move.FieldByName('KOLC_PREDM').AsString;
                    Cells[5,i] := AppData.Move.FieldByName('Res_Sum').AsString;
                    Cells[6,i] := AppData.Move.FieldByName('Primech').AsString;
                  end;
                  AppData.Move.Next;
              end;
          end;

          SetNumSG(ProductSG, ProductSG.RowCount);
      except
        on Err: Exception do
          MessageDlg('������ ��������� ���������� � ���������!' + #13 + '���������: ' + Err.Message, mtError, [mbOK], 0);
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
    g_Corr: CorrNaklSetting(Unucim_Num);
    g_View: ViewNaklSetting(Unucim_Num);
  end;

  SetNumSG(Self.ProductSG, Self.ProductSG.RowCount);
end;

procedure TNaklForm.NewNaklSetting;
begin
  DateDocDP.Date := Now();
  Self.Caption := Self.Caption + ' -> [����� ��������]';
  setTypeDocs(EmptyStr);
  setDrivers(EmptyStr);
end;

procedure TNaklForm.SetFieldsSG;
begin
   with ProductSG do
    try
       RowCount := 2;
       ColCount := 7;
       FixedCols := 1;
       FixedCols := 1;

       Cols[0].Text := '�';
       Cols[1].Text := '�������';
       Cols[2].Text := '������������';
       Cols[3].Text := '����';
       Cols[4].Text := '����������';
       Cols[5].Text := '�����';
       Cols[6].Text := '����������';

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
  // ����������� �� ���������� � ����� ���� ��������� ���������
  Self.Caption := Self.Caption + ' -> [�������� ���������]';

  AppData.Move.Active := False;
  AppData.Move.CommandText := Format(SSQLGetNaklDetail, [UNICUM_NUM,
                                                                  g_New]);
  AppData.Move.Active := True;

  // �������� ����� ���������
  NumDocEdit.Text := AppData.Nakl.FieldbyName('NUM_DOC').AsString;
  DateDocDP.Date := AppData.Nakl.FieldByName('DATE_DOC').AsDateTime;
  //DriverCB.ItemIndex := DriverCB.Items.IndexOf(AppData.Nakl.FieldByName('Driver').AsString);
  ModelEdit.Text := AppData.Nakl.FieldByName('MODEL').AsString;
  RegSymbolEdit.Text := AppData.Nakl.FieldByName('REG_SYMBOL').AsString;
  TypeEdit.Text := AppData.Nakl.FieldByName('TYPE_TC').AsString;
  ColorEdit.Text := AppData.Nakl.FieldByName('COLOR').AsString;
  YearEdit.Text := AppData.Nakl.FieldByName('MADEYEAR').AsString;
  PrimechMemo.Text := AppData.Nakl.FieldByName('PRIMECH').AsString;

  setDrivers(AppData.Nakl.FieldByName('Driver').AsString);
  setTypeDocs(AppData.Nakl.FieldByName('TYPE_DOC').AsString);


  // ���� ���������
  if (AppData.Move.Active) and
     (not AppData.Move.IsEmpty) then
      try
        ProductSG.RowCount := AppData.Move.RecordCount + 1;
        while not AppData.Move.Eof do
          Begin
            for i := 1 to ProductSG.RowCount - 1 do
              Begin
                with ProductSG do
                  Begin
                    Cells[1,i] := AppData.Move.FieldByName('NUM_PREDM').AsString;
                    Cells[2,i] := AppData.Move.FieldByName('NAME_PREDM').AsString;
                    Cells[3,i] := AppData.Move.FieldByName('SUM_PREDM').AsString;
                    Cells[4,i] := AppData.Move.FieldByName('KOLC_PREDM').AsString;
                    Cells[5,i] := AppData.Move.FieldByName('Res_Sum').AsString;
                    Cells[6,i] := AppData.Move.FieldByName('Primech').AsString;
                  end;
                  AppData.Move.Next;
              end;
          end;

          SetNumSG(ProductSG, ProductSG.RowCount);
      except
        on Err: Exception do
          MessageDlg('������ ��������� ���������� � ���������!' + #13 + '���������: ' + Err.Message, mtError, [mbOK], 0);
      end;

  // ������ �� �������������  
  NumDocEdit.ReadOnly := True;
  PrimechMemo.ReadOnly := True;

  ProductSG.Options := ProductSG.Options - [goEditing];
  DateDocDP.Enabled := False;
  DriverCB.Enabled := False;
  TypeDocCB.Enabled := False;

  // ������
  SaveTBI.Enabled := False;
  AddDriverBtn.Enabled := False;
  AddTypeDocBtn.Enabled := False;
  AddRowTBI.Enabled := False;
  DeleteTBI.Enabled := False;
  CarBtn.Enabled := False;

end;

procedure TNaklForm.DriverActionExecute(Sender: TObject);
var
//    Str: string;
    DriverD: TDriverDetailDialog;
begin
 // if InputQuery('��������', '���', Str) then
 // begin
 //   Str := Trim(Str);
 //   DriverCB.Items.Add(Str);
  //  DriverCB.ItemIndex := DriverCB.Items.IndexOf(Str);
 // end;

 DriverD := TDriverDetailDialog.Create(Application, g_New);

    with DriverD do
    try
      if ShowModal = mrOk then
        if (Length(Trim(FamilyEdit.Text)) > 0) and
           (Length(Trim(NameEdit.Text)) > 0) then
          try
             AppData.Command.CommandText := Format(SSQLInsDriver, [FamilyEdit.Text,
                                                                   NameEdit.Text,
                                                                   LastNameEdit.Text,
                                                                   FormatDateTime('yyyy-mm-dd', BirthDayDP.Date),
                                                                   PassSerialEdit.Text,
                                                                   PassNumEdit.Text,
                                                                   PassGaveMemo.Text,
                                                                   LicenseSerialEdit.Text,
                                                                   LicenseNumEdit.Text,
                                                                   FormatDateTime('yyyy-mm-dd', LicenseBegDP.Date),
                                                                   FormatDateTime('yyyy-mm-dd', LicenseEndDP.Date),
                                                                   LicenseGaveMemo.Text,
                                                                   LicenseCategoriesEdit.Text,
                                                                   AdressEdit.Text,
                                                                   UID_Car,
                                                                   FormatDateTime('yyyy-mm-dd', HiringDP.Date),
                                                                   Byte(DriverD.AvailableChB.Checked),
                                                                   PrimechMemo.Text]);
             AppData.Command.Execute;
             setDrivers(FamilyEdit.Text + ' ' + NameEdit.Text);
          except
             on ex: Exception do
               MessageDlg('������ ���������� ������ ��������!' + #13 + '���������: ' + ex.Message, mtError, [mbOK], 0);
          end;
    finally
       FreeAndNil(DriverD);
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
          MessageDlg('������ �������� ������!' + #13 + '���������: ' + Err.Message, mtError, [mbOK], 0);
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
        SG.Cells[0,i] := IntToStr(i);
    except
      on Err: Exception do
        MessageDlg('������ ��������� ���������!' + #13 + '���������: ' + Err.Message, mtError, [mbOK], 0);
    end;
end;

procedure TNaklForm.AddRowActionExecute(Sender: TObject);
var
    ProdF: TProductFrameModalForm;
    ProdP: TProductPriceForm;
begin
  if TypeDocCB.Text = EmptyStr then
    Begin
       MessageDlg('�� ������ ��� ���������.' + #13 + '�� ��������� ��������� ��������� ��������!', mtWarning, [mbOK], 0);
       if TypeDocCB.Items.IndexOf('������') = -1 then
         Begin
            TypeDocCB.Items.Add('������');
            TypeDocCB.ItemIndex := TypeDocCB.Items.IndexOf('������');
         end
       else
           TypeDocCB.ItemIndex := TypeDocCB.Items.IndexOf('������');
    end;

      ProdF := TProductFrameModalForm.Create(Application);

      try
        if ProdF.ShowModal = mrOk then
          Begin
            ProdP := TProductPriceForm.Create(TypeDocCB.Text);
            with ProdP do
              try
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
                    with Self.ProductSG do
                      Begin
                        if Cells[1,1] <> EmptyStr then
                            RowCount := RowCount + 1;
                        Cells[1, RowCount-1] := AppData.Products.FieldByName('COD_ARTIC').AsString;
                        Cells[2, RowCount-1] := AppData.Products.FieldByName('NAME_ARTIC').AsString;
                        Cells[3, RowCount-1] := AppData.Products.FieldByName('CENA_ARTC').AsString;
                        Cells[4, RowCount-1] := ProdP.CountEdit.Text;
                        Cells[5, RowCount-1] := ProdP.SumProd;
                        Cells[6, RowCount-1] := ProdP.PrimechMemo.Text;
                      end;
                  end;
              finally
                FreeAndNil(ProdP);
              end;
          end;
      finally
        SetNumSG(ProductSG, ProductSG.RowCount);
        FreeAndNil(ProdF);
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
       for i := 1 to Self.ProductSG.RowCount - 1 Do
          resSum := resSum + StrToFloat(Self.ProductSG.Cells[5,i]);
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
                        keybd_event(VK_LCONTROL, 0, 0, 0);               // ������� ������� Ctrl
                        keybd_event(Ord('Z'), 0, 0, 0);                  // ������� ������� Z
                        keybd_event(Ord('Z'), 0, KEYEVENTF_KEYUP, 0);    // ���������� ������� Ctrl
                        keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0); // ���������� ������� Z
                     end;
          else
             Key := #0;
        end;
      end
    else
      if Col = 6 then
        if Key in ['''', '"', '~', '`'] then
           Key := #0;
  end;
end;

procedure TNaklForm.ProductSGSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ACol in [4, 6] then
    ProductSG.Options := ProductSG.Options + [goEditing]
  else
    ProductSG.Options := ProductSG.Options - [goEditing];
end;

function TNaklForm.SetSumProd(CountProd, PriceProd: real): Variant;
begin
   Result := FloatToStr(CountProd * PriceProd);
end;

procedure TNaklForm.ProductSGSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  if ACol = 4 then
    ProductSG.Cells[5, ARow] := SetSumProd(StrToFloat(IfThen(ProductSG.Cells[4,ARow] = EmptyStr, '0', ProductSG.Cells[4, ARow])), StrToFloat(IfThen(ProductSG.Cells[3, ARow] = EmptyStr, '0', ProductSG.Cells[3, ARow])));
end;

procedure TNaklForm.TypeDocActionExecute(Sender: TObject);
var
    Str: string;
begin
  if InputQuery('��� ���������', '������������', Str) then
  begin
    Str := Trim(Str);
    TypeDocCB.Items.Add(Str);
    TypeDocCB.ItemIndex := TypeDocCB.Items.IndexOf(Str);
  end;
end;

procedure TNaklForm.SaveNaklActionExecute(Sender: TObject);
begin
  if CheckFullNessDoc then
    Self.ModalResult := mrOk
  else
    Begin
       if MessageDlg('��������� ��� ����!' + #13 +
                     '��� ��������� ������� ���������� ' + #13 +
                     '������� �� ������ ���������.' + #13 +
                     '���������� ���������� ���������?', mtInformation, [mbYes, mbNo], 0) = ID_NO then
         Self.ModalResult := mrCancel;
    end;
end;

procedure TNaklForm.CancelNaklActionExecute(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TNaklForm.setDrivers(Name: string);
begin
    AppData.DriversL.Active := False;
    AppData.DriversL.CommandText := Format(SSQLGetDriversL, [0]);
    AppData.DriversL.Active := True;

    if not AppData.DriversL.IsEmpty then
        try
          DriverCB.Items.BeginUpdate;
          DriverCB.Items.Clear;

          while not AppData.DriversL.Eof do
            Begin
               DriverCB.Items.Add(AppData.DriversL.FieldByName('Family').AsString + ' ' +
                                  AppData.DriversL.FieldByName('Name').AsString);
               AppData.DriversL.Next;
            end;
        finally
            DriverCB.Items.EndUpdate;
            if Trim(Name) <> EmptyStr then
              DriverCB.ItemIndex := DriverCB.Items.IndexOf(Name);
        end;       
end;

procedure TNaklForm.setTypeDocs(Name: string);
begin
    AppData.TypeDocs.Active := False;
    AppData.TypeDocs.CommandText := SSQLGetTypeDocs;
    AppData.TypeDocs.Active := True;

    if not AppData.TypeDocs.IsEmpty then
      try
        TypeDocCB.Items.BeginUpdate;
        TypeDocCB.Items.Clear;

        while not AppData.TypeDocs.Eof do
          Begin
            if AppData.TypeDocs.FieldByName('TYPE_DOC').AsString <> EmptyStr then
              TypeDocCB.Items.Add(AppData.TypeDocs.FieldByName('TYPE_DOC').AsString);
            AppData.TypeDocs.Next;
          end;
      finally
        TypeDocCB.Items.EndUpdate;
        AppData.TypeDocs.Active := False;
        if Length(Trim(Name)) > 0 then
          TypeDocCB.ItemIndex := TypeDocCB.Items.IndexOf(AppData.Nakl.FieldByName('TYPE_DOC').AsString);
      end;
end;

function TNaklForm.CheckFullNessDoc: Boolean;
begin
  if //(DriverCB.ItemIndex > -1) and
     (TypeDocCB.ItemIndex > -1) and
     //(UID_Car > 0)  and
     (ProductSG.Cells[1,1] <> EmptyStr) then
       Result := True
  else
       Result := False;  
end;

procedure TNaklForm.HelpActionExecute(Sender: TObject);
begin
  MessageBox(Handle, '��������� ���������� ����. �������: ' + #13 + '1. ������(��������) ��������.' + #13 +
                                                                    '2. ������ ��� ���������(������������ �������).' + #13 +
                                                                    '3. ������ ����������.' + #13 +
                                                                    '4. ��������, ��� ������� 1, �����.',
             '������ ���������� ���������', MB_ICONINFORMATION + MB_OK);
end;

procedure TNaklForm.ProductSGDblClick(Sender: TObject);
begin
  AddRowActionExecute(Self);
end;

procedure TNaklForm.DriverCBChange(Sender: TObject);
var
    family, name: string;
begin
  if DriverCB.ItemIndex > -1 then
    try
      family := DriverCB.Text;
      name := DriverCB.Text;

      Delete(family, 1, pos(' ', family));
      Delete(name, pos(' ', name), Length(name) - pos(' ', name) + 1);
    finally
      AppData.DriversL.Locate('Family;Name', VarArrayOf([family, name]), [loCaseInsensitive, loPartialKey]);
      SetCarInfo(AppData.DriversL.FieldByName('UID').AsInteger);
    end;
end;

procedure TNaklForm.SetCarInfo(Uid_Driver: integer);
begin
  if (Uid_Driver <> 0) and
     (DriverCB.ItemIndex <> -1) then
    try
      AppData.DriverCar.Active := False;
      AppData.DriverCar.CommandText := Format(SSQLGetDriverCar, [Uid_Driver]);
      AppData.DriverCar.Active := True;

      ModelEdit.Text := AppData.DriverCar.FieldByName('Model').AsString;
      RegSymbolEdit.Text := AppData.DriverCar.FieldByName('REG_SYMBOL').AsString;
      TypeEdit.Text := AppData.DriverCar.FieldByName('TYPE_TC').AsString;
      ColorEdit.Text := AppData.DriverCar.FieldByName('Color').AsString;
      YearEdit.Text := AppData.DriverCar.FieldByName('MADEYEAR').AsString;
      UID_Car := AppData.DriverCar.FieldByName('UID').AsInteger;
    finally 
    end;
end;

end.
