unit ProductDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TProductDetailForm = class(TForm)
    ParametrsGB: TGroupBox;
    BtnsPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label1: TLabel;
    ArticulEdit: TEdit;
    Label2: TLabel;
    NameEdit: TEdit;
    Label3: TLabel;
    PriceEdit: TEdit;
    Label4: TLabel;
    NDSEdit: TEdit;
    Label5: TLabel;
    EdnIzmerEdit: TEdit;
    Label6: TLabel;
    WeightEdit: TEdit;
    Label7: TLabel;
    BalanceEdit: TEdit;
    GroupGB: TGroupBox;
    Label8: TLabel;
    TypeTovrEdit: TEdit;
    GrLbl: TLabel;
    AddGrBtn: TBitBtn;
    SubGr2Lbl: TLabel;
    AddGr1Btn: TBitBtn;
    SubGr3Lbl: TLabel;
    AddGr2Btn: TBitBtn;
    SubGr4Lbl: TLabel;
    AddGr3Btn: TBitBtn;
    SubGr5Lbl: TLabel;
    AddGr4Btn: TBitBtn;
    SubGr6Lbl: TLabel;
    AddGr5Btn: TBitBtn;
    Label15: TLabel;
    EdnVUpakEdit: TEdit;
    Group: TADODataSet;
    SubGroup2: TADODataSet;
    SubGroup3: TADODataSet;
    SubGroup4: TADODataSet;
    SubGroup5: TADODataSet;
    SubGroup6: TADODataSet;
    GroupCB: TComboBox;
    SubGroup2CB: TComboBox;
    SubGroup3CB: TComboBox;
    SubGroup4CB: TComboBox;
    SubGroup5CB: TComboBox;
    SubGroup6CB: TComboBox;
    procedure AddGrBtnClick(Sender: TObject);
    procedure AddGr1BtnClick(Sender: TObject);
    procedure AddGr2BtnClick(Sender: TObject);
    procedure AddGr3BtnClick(Sender: TObject);
    procedure AddGr4BtnClick(Sender: TObject);
    procedure AddGr5BtnClick(Sender: TObject);
    procedure GroupBeforeOpen(DataSet: TDataSet);
    procedure SubGroup2BeforeOpen(DataSet: TDataSet);
    procedure SubGroup3BeforeOpen(DataSet: TDataSet);
    procedure SubGroup4BeforeOpen(DataSet: TDataSet);
    procedure SubGroup5BeforeOpen(DataSet: TDataSet);
    procedure SubGroup6BeforeOpen(DataSet: TDataSet);
    procedure PriceEditKeyPress(Sender: TObject; var Key: Char);
    procedure WeightEditKeyPress(Sender: TObject; var Key: Char);
    procedure NDSEditKeyPress(Sender: TObject; var Key: Char);
    procedure BalanceEditKeyPress(Sender: TObject; var Key: Char);
    procedure EdnVUpakEditKeyPress(Sender: TObject; var Key: Char);
    procedure GroupAfterOpen(DataSet: TDataSet);
    procedure SubGroup2AfterOpen(DataSet: TDataSet);
    procedure SubGroup3AfterOpen(DataSet: TDataSet);
    procedure SubGroup4AfterOpen(DataSet: TDataSet);
    procedure SubGroup5AfterOpen(DataSet: TDataSet);
    procedure SubGroup6AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    function CreateNewGroup(Str, StrName: string; Combo: TComboBox): Boolean;
    procedure updateGroup(Combo: TComboBox; DataSet: TADODataSet);
    procedure setGroup();
  public
    { Public declarations }
    procedure GetProductDetail(Article: integer);
    procedure InsProduct();
    procedure CorrProduct(Article: integer);
    constructor Create(AOwner: TComponent); override;
  end;

var
  ProductDetailForm: TProductDetailForm;

implementation

uses AppDM, Globals, SConst, DateUtils, Math;

{$R *.dfm}

{ TProductDetailForm }

function TProductDetailForm.CreateNewGroup(Str, StrName: string; Combo: TComboBox): Boolean;
begin
  if InputQuery(StrName, 'Наименование', Str) then
  begin
    Str := Trim(Str);
    Result := (Length(Str) > 0) and (Combo.Items.IndexOf(Str) < 0);
    if Result then
    begin
      Combo.Items.Add(Str);
      Combo.ItemIndex := Combo.Items.IndexOf(Str);
//      Combo.OnCloseUp(nil);
    end;
  end;
end;

procedure TProductDetailForm.AddGrBtnClick(Sender: TObject);
var
   Str: string;
   StrName: string;
begin
  StrName := GrLbl.Caption;
  Delete(StrName, Pos('&', StrName), 1);
  if CreateNewGroup(Str, StrName, GroupCB) then
    GroupCB.SetFocus();
end;

procedure TProductDetailForm.AddGr1BtnClick(Sender: TObject);
var
   Str: string;
   StrName: string;
begin
  StrName := SubGr2Lbl.Caption;
  Delete(StrName, Pos('&', StrName), 1);
  if CreateNewGroup(Str, StrName, SubGroup2CB) then
    SubGroup2CB.SetFocus();
end;

procedure TProductDetailForm.AddGr2BtnClick(Sender: TObject);
var
   Str: string;
   StrName: string;
begin
  StrName := SubGr3Lbl.Caption;
  Delete(StrName, Pos('&', StrName), 1);
  if CreateNewGroup(Str, StrName, SubGroup3CB) then
    SubGroup3CB.SetFocus();
end;

procedure TProductDetailForm.AddGr3BtnClick(Sender: TObject);
var
   Str: string;
   StrName: string;
begin
  StrName := SubGr4Lbl.Caption;
  Delete(StrName, Pos('&', StrName), 1);
  if CreateNewGroup(Str, StrName, SubGroup4CB) then
    SubGroup4CB.SetFocus();
end;

procedure TProductDetailForm.AddGr4BtnClick(Sender: TObject);
var
   Str: string;
begin
  if CreateNewGroup(Str, SubGr5Lbl.Caption, SubGroup5CB) then
    SubGroup5CB.SetFocus();
end;

procedure TProductDetailForm.AddGr5BtnClick(Sender: TObject);
var
   Str: string;
begin
  if CreateNewGroup(Str, SubGr6Lbl.Caption, SubGroup6CB) then
    SubGroup6CB.SetFocus();
end;

procedure TProductDetailForm.updateGroup(Combo: TComboBox; DataSet: TADODataSet);
var
   Str: string;
begin
  DataSet.Active := False;
  DataSet.Active := True;

  if DataSet.RecordCount > 0 then
    try
      Combo.Items.BeginUpdate;
      Combo.Items.Clear;

      while not DataSet.Eof do
        Begin
          Combo.Items.Add(DataSet.FieldByName('NGROUP_TVR').AsString);
          DataSet.Next;
        end;
    finally
    end;
end;

procedure TProductDetailForm.GroupBeforeOpen(DataSet: TDataSet);
begin
   Group.CommandText := SSQLGetGroup1;
end;

procedure TProductDetailForm.SubGroup2BeforeOpen(DataSet: TDataSet);
begin
   SubGroup2.CommandText := SSQLGetGroup2;
end;

procedure TProductDetailForm.SubGroup3BeforeOpen(DataSet: TDataSet);
begin
   SubGroup3.CommandText := SSQLGetGroup3;
end;

procedure TProductDetailForm.SubGroup4BeforeOpen(DataSet: TDataSet);
begin
  SubGroup4.CommandText := SSQLGetGroup4;
end;

procedure TProductDetailForm.SubGroup5BeforeOpen(DataSet: TDataSet);
begin
   SubGroup5.CommandText := SSQLGetGroup5;
end;

procedure TProductDetailForm.SubGroup6BeforeOpen(DataSet: TDataSet);
begin
   SubGroup6.CommandText := SSQLGetGroup6;
end;

constructor TProductDetailForm.Create(AOwner: TComponent);
begin
  inherited;
  setGroup();
end;

procedure TProductDetailForm.setGroup;
begin
    try
       {updateGroup(GroupCB, Group);
       updateGroup(SubGroup2CB, SubGroup2);
       updateGroup(SubGroup3CB, SubGroup3);
       updateGroup(SubGroup4CB, SubGroup4);
       updateGroup(SubGroup5CB, SubGroup5);
       updateGroup(SubGroup6CB, SubGroup6);    }

       Group.Active := False;
       Group.Active := True;

       SubGroup2.Active := False;
       SubGroup2.Active := True;

       SubGroup3.Active := False;
       SubGroup3.Active := True;
       
       SubGroup4.Active := False;
       SubGroup4.Active := True;

       SubGroup5.Active := False;
       SubGroup5.Active := True;
       
       SubGroup6.Active := False;
       SubGroup6.Active := True;
    except
      on err: Exception do
        MessageDlg('Ошибка получения групп!', mtError, [mbOK], 0);
    end;
end;

procedure TProductDetailForm.PriceEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    ',','.': Begin
               if Key <> DecimalSeparator then
                Key := DecimalSeparator;

               if Pos(DecimalSeparator, PriceEdit.Text) > 0 then
                 Key := #0;
             end;
    #8: ;
    #13: ;
    else
        Key := #0;
  end;

end;

procedure TProductDetailForm.WeightEditKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9': ;
    ',','.': Begin
               if Key <> DecimalSeparator then
                Key := DecimalSeparator;

               if Pos(DecimalSeparator, WeightEdit.Text) > 0 then
                 Key := #0;
             end;
    #8: ;
    #13: ;
    else
        Key := #0;
  end;
end;

procedure TProductDetailForm.NDSEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    ',','.': Begin
               if Key <> DecimalSeparator then
                Key := DecimalSeparator;

               if Pos(DecimalSeparator, NDSEdit.Text) > 0 then
                 Key := #0;
             end;
    #8: ;
    #13: ;
    else
        Key := #0;
  end;
end;

procedure TProductDetailForm.BalanceEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    ',','.': Begin
               if Key <> DecimalSeparator then
                Key := DecimalSeparator;

               if Pos(DecimalSeparator, NDSEdit.Text) > 0 then
                 Key := #0;
             end;
    #8: ;
    #13: ;
    else
        Key := #0;
  end;
end;

procedure TProductDetailForm.EdnVUpakEditKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: ;
    #13: ;
    else
        Key := #0;
  end;
end;

procedure TProductDetailForm.InsProduct;
begin
  if Length(Trim(NameEdit.Text)) > 0 then
    try
      AppData.Command.CommandText := Format(SSQLInsProduct, [Trim(NameEdit.Text),
                                                             PriceEdit.Text,
                                                             NDSEdit.Text,
                                                             EdnIzmerEdit.Text,
                                                             BalanceEdit.Text,
                                                             WeightEdit.Text,
                                                             EdnVUpakEdit.Text,
                                                             GroupCB.Text,
                                                             SubGroup2CB.Text,
                                                             SubGroup3CB.Text,
                                                             SubGroup4CB.Text,
                                                             SubGroup5CB.Text,
                                                             SubGroup6CB.Text,
                                                             Trim(TypeTovrEdit.Text),
                                                             g_User]);
      AppData.Command.Execute;
    except
      on Err: Exception do
        MessageDlg('Ошибка сохранения нового товара', mtError, [mbOK], 0);
    end;
end;

procedure TProductDetailForm.CorrProduct(Article: integer);
begin
  if Article <> 0 then
    try
      AppData.Command.CommandText := Format(SSQLCorrProduct,[Article,
                                                             Trim(NameEdit.Text),
                                                             PriceEdit.Text,
                                                             NDSEdit.Text,
                                                             EdnIzmerEdit.Text,
                                                             BalanceEdit.Text,
                                                             WeightEdit.Text,
                                                             EdnVUpakEdit.Text,
                                                             GroupCB.Text,
                                                             SubGroup2CB.Text,
                                                             SubGroup3CB.Text,
                                                             SubGroup4CB.Text,
                                                             SubGroup5CB.Text,
                                                             SubGroup6CB.Text,
                                                             Trim(TypeTovrEdit.Text),
                                                             g_User]);
      AppData.Command.Execute;
    except
      on Err: Exception do
        MessageDlg('Ошибка сохранения нового товара', mtError, [mbOK], 0);
    end;
end;

procedure TProductDetailForm.GetProductDetail(Article: integer);
begin
    if Article <> 0 then
      Begin
        try
           AppData.ProductDetail.Active := False;
           AppData.ProductDetail.CommandText := Format(SSQLGetProductDetail, [Article]);
           AppData.ProductDetail.Active := True;

           if not AppData.ProductDetail.IsEmpty then
            Begin
              ArticulEdit.Text := AppData.ProductDetail.FieldByName('COD_ARTIC').AsString;
              NameEdit.Text := AppData.ProductDetail.FieldByName('NAME_ARTIC').AsString;
              TypeTovrEdit.Text := AppData.ProductDetail.FieldByName('TYPE_TOVR').AsString;

              PriceEdit.Text := AppData.ProductDetail.FieldByName('CENA_ARTC').AsString;
              EdnIzmerEdit.Text := AppData.ProductDetail.FieldByName('EDIN_IZMER').AsString;
              WeightEdit.Text := AppData.ProductDetail.FieldByName('VES_EDINIC').AsString;

              NDSEdit.Text := AppData.ProductDetail.FieldByName('NDS_ARTIC').AsString;
              BalanceEdit.Text := AppData.ProductDetail.FieldByName('KON_KOLCH').AsString;
              EdnVUpakEdit.Text := AppData.ProductDetail.FieldByName('EDN_V_UPAK').AsString;

              GroupCB.ItemIndex := GroupCB.Items.IndexOf(AppData.ProductDetail.FieldByName('NGROUP_TVR').AsString);
              SubGroup2CB.ItemIndex := SubGroup2CB.Items.IndexOf(AppData.ProductDetail.FieldByName('NGROUP_TV2').AsString);
              SubGroup3CB.ItemIndex := SubGroup3CB.Items.IndexOf(AppData.ProductDetail.FieldByName('NGROUP_TV3').AsString);
              SubGroup4CB.ItemIndex := SubGroup4CB.Items.IndexOf(AppData.ProductDetail.FieldByName('NGROUP_TV4').AsString);
              SubGroup5CB.ItemIndex := SubGroup5CB.Items.IndexOf(AppData.ProductDetail.FieldByName('NGROUP_TV5').AsString);
              SubGroup6CB.ItemIndex := SubGroup6CB.Items.IndexOf(AppData.ProductDetail.FieldByName('NGROUP_TV6').AsString);
            end;
        finally
        end;
      end;
end;

procedure TProductDetailForm.GroupAfterOpen(DataSet: TDataSet);
begin
    if not Group.IsEmpty then
      try
        GroupCB.Items.BeginUpdate;
        GroupCB.Items.Clear;

        while not Group.Eof do
          Begin
            GroupCB.Items.Add(Group.FieldbyName('NGROUP_TVR').AsString);
            Group.Next;
          end;
      finally
        GroupCB.Items.EndUpdate;
      end;
end;

procedure TProductDetailForm.SubGroup2AfterOpen(DataSet: TDataSet);
begin
    if not SubGroup2.IsEmpty then
      try
        SubGroup2CB.Items.BeginUpdate;
        SubGroup2CB.Items.Clear;

        while not SubGroup2.Eof do
          Begin
            SubGroup2CB.Items.Add(SubGroup2.FieldbyName('NGROUP_TVR').AsString);
            SubGroup2.Next;
          end;
      finally
        SubGroup2CB.Items.EndUpdate;
      end;
end;

procedure TProductDetailForm.SubGroup3AfterOpen(DataSet: TDataSet);
begin
    if not SubGroup3.IsEmpty then
      try
        SubGroup3CB.Items.BeginUpdate;
        SubGroup3CB.Items.Clear;

        while not SubGroup3.Eof do
          Begin
            SubGroup3CB.Items.Add(SubGroup3.FieldbyName('NGROUP_TVR').AsString);
            SubGroup3.Next;
          end;
      finally
        SubGroup3CB.Items.EndUpdate;
      end;
end;

procedure TProductDetailForm.SubGroup4AfterOpen(DataSet: TDataSet);
begin
    if not SubGroup4.IsEmpty then
      try
        SubGroup4CB.Items.BeginUpdate;
        SubGroup4CB.Items.Clear;

        while not SubGroup4.Eof do
          Begin
            SubGroup4CB.Items.Add(SubGroup4.FieldbyName('NGROUP_TVR').AsString);
            SubGroup4.Next;
          end;
      finally
        SubGroup4CB.Items.EndUpdate;
      end;
end;

procedure TProductDetailForm.SubGroup5AfterOpen(DataSet: TDataSet);
begin
    if not SubGroup5.IsEmpty then
      try
        SubGroup5CB.Items.BeginUpdate;
        SubGroup5CB.Items.Clear;

        while not SubGroup5.Eof do
          Begin
            SubGroup5CB.Items.Add(SubGroup5.FieldbyName('NGROUP_TVR').AsString);
            SubGroup5.Next;
          end;
      finally
        SubGroup5CB.Items.EndUpdate;
      end;
end;

procedure TProductDetailForm.SubGroup6AfterOpen(DataSet: TDataSet);
begin
    if not SubGroup6.IsEmpty then
      try
        SubGroup6CB.Items.BeginUpdate;
        SubGroup6CB.Items.Clear;

        while not SubGroup6.Eof do
          Begin
            SubGroup6CB.Items.Add(SubGroup6.FieldbyName('NGROUP_TVR').AsString);
            SubGroup6.Next;
          end;
      finally
        SubGroup6CB.Items.EndUpdate;
      end;
end;

end.
