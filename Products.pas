unit Products;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, ActnList, Menus,
  ImgList, Buttons, ADODB, ToolWin, Globals, StrUtils, IniFiles;


type
  TProductsForm = class(TForm)
    SB: TStatusBar;
    GroupTV: TTreeView;
    GroupGB: TGroupBox;
    ProductsGB: TGroupBox;
    ProductsGrid: TDBGrid;
    AL: TActionList;
    IL: TImageList;
    Menu: TMainMenu;
    ProductsPM: TPopupMenu;
    GroupPop: TPopupMenu;
    AddGroupAction: TAction;
    CorrGroupAction: TAction;
    DelGroupAction: TAction;
    RefreshGroupAction: TAction;
    AddProdAction: TAction;
    CorrProdAction: TAction;
    DelProdAction: TAction;
    RefreshProdAction: TAction;
    FindAction: TAction;
    OpenAllTreeAction: TAction;
    CloseAllTreeAction: TAction;
    CorrCategoriesProdAction: TAction;
    CorrPriceProdAction: TAction;
    FD: TFontDialog;
    FontSettingGroupAction: TAction;
    PanelSplitter: TSplitter;
    FontProdAction: TAction;
    AddIP: TMenuItem;
    CorrIP: TMenuItem;
    DelIP: TMenuItem;
    RefreshIP: TMenuItem;
    AddGrIP: TMenuItem;
    DelGrIP: TMenuItem;
    RefreshGrIP: TMenuItem;
    OpenAllTreeIP: TMenuItem;
    CloseAllTreeIP: TMenuItem;
    GroupBottomTB: TToolBar;
    AddGrTBI: TToolButton;
    CorrGrTBI: TToolButton;
    FontGrTBI: TToolButton;
    OpenAllNodeGrTBI: TToolButton;
    CloseAllNodeGrTBI: TToolButton;
    refreshGrTBI: TToolButton;
    ProductBottomTB: TToolBar;
    ProdSB: TStatusBar;
    Images: TImageList;
    AddProdTBI: TToolButton;
    CorrProdTBI: TToolButton;
    DelProdTBI: TToolButton;
    RefreshProdTBI: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    TypeTorvCB: TComboBox;
    Bevel1: TBevel;
    Label2: TLabel;
    FieldCB: TComboBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    Bevel2: TBevel;
    FontProdTBI: TToolButton;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FontSettingGroupActionExecute(Sender: TObject);
    procedure ProductsGridTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OpenAllTreeActionExecute(Sender: TObject);
    procedure CloseAllTreeActionExecute(Sender: TObject);
    procedure AddProdActionExecute(Sender: TObject);
    procedure RefreshGroupActionExecute(Sender: TObject);
    procedure RefreshProdActionExecute(Sender: TObject);
    procedure CorrProdActionExecute(Sender: TObject);
    procedure DelProdActionExecute(Sender: TObject);
    procedure GroupTVGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure GroupTVGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure FindEditChange(Sender: TObject);
    procedure FindEditKeyPress(Sender: TObject; var Key: Char);
    procedure FindBtnClick(Sender: TObject);
    procedure SBDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure ProdSBDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure GroupTVExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure GroupTVExpanded(Sender: TObject; Node: TTreeNode);
    procedure FontProdActionExecute(Sender: TObject);
  private
    { Private declarations }
    FGroup: array [0..PRODUCT_CATEGORIES-1] of String[30];

    function GetGroupStr: Variant;
    procedure ClearGroup();
    procedure GetGroups();
    procedure GetTypeTorv();
    procedure FindProduct(Index: integer; FindStr: string);
    procedure GetGroupInfoSB();
    procedure SetFontParam(PointName: string);
  public
    { Public declarations }
    procedure SetTreeNodes(Tree: TTreeView);
    procedure GetFontParam(PointName: string);

    constructor Create(AOwner: TComponent); override;

  published
    property GroupStr: Variant read GetGroupStr;
  end;


const
  fsBoldMask      = 8;                { Constants Used to Determine Font Style }
  fsItalicMask    = 4;
  fsUnderlineMask = 2;
  fsStrikeOutMask = 1;
  fsNormal        = 0;

var
  ProductsForm: TProductsForm;

implementation

uses AppDM, SConst, DateUtils, DB, ProductDetail, TypInfo;

{$R *.dfm}

{ TProductsForm }

procedure TProductsForm.SetTreeNodes(Tree: TTreeView);
var
    { ������ ������������ ��������� }
  Categories: array[0..PRODUCT_CATEGORIES - 1] of TCategoryName;
  { ������ ����� ������ (0 - ������ ������) }
  Nodes:      array[0..PRODUCT_CATEGORIES] of TTreeNode;
  { ����, � �������� ���� ��������� �������� }
  Root, Node: TTreeNode;
  { �������� ����������� ����� (���������) � ���������� ���������� }
  Flds, Match, I: Integer;

  procedure ReadCategories;
  var
    i: integer;
    Str: string;
    bOk: Boolean;
  Begin
    Flds := 0;
    Match := 0;
     bOK := True;

    for i := 0 to PRODUCT_CATEGORIES - 1 do
      Begin
        Str := AppData.GroupsProduct.Fields[i].AsString;
        if Str <>  EmptyStr then
          Begin
           Inc(Flds);
           bOk := bOk and (AnsiCompareText(Categories[i], Str) = 0);
           if bOk then Inc(Match);
          end;
          Categories[i] := Str;
      end;
  end;

begin
   AppData.GroupsProduct.Active := False;
   AppData.GroupsProduct.CommandText := SSQLGetProdCategories;
   AppData.GroupsProduct.Active := True;

   with Tree do
    Begin
      Items.BeginUpdate();

      try
        Items.Clear;
        Root := Items.AddChildFirst(nil, SAllCategories);
        Nodes[0] := Root;

        for i := 1 to PRODUCT_CATEGORIES do
          Nodes[i] := nil;

          with AppData.GroupsProduct do
            Begin
              if Active then
                Requery()
              else
                Active := True;

                while not Eof do
                  Begin
                    { ��� ������� ������ ��������� ���� �����,
                      ������� ���������� �������� ����� �
                      ���������� ���������� � ���������� }
                    ReadCategories();

                    { ��������� � ������, ����������������
                      ���������� ���������� (����������� �� ������) }
                    Node := Nodes[Match];
                    if not Assigned(Node) then
                      Node := Root;

                    { ��������� ������ � ��� ������, ����
                      ���������� ����������� ����� ������
                      ���������� ����������� ����� }
                    for I := Match to Flds - 1 do
                    begin
                      Nodes[I + 1] := Tree.Items.AddChild(Node, Categories[I]);
                      Node := Nodes[I + 1];
                    end;

                    { ��������� ������ }
                    Next();
                  end;

            end;
      finally
        AppData.GroupsProduct.Active := False;
        Root.Expanded := True;
        Items.EndUpdate;
      end
    end;
end;

procedure TProductsForm.FontSettingGroupActionExecute(Sender: TObject);
var
    iniFile: TIniFile;
begin
{  if FD.Execute then
    try
      iniFile := TIniFile.Create(ExtractFilePath(Application.ExeName)+ '\Setting.ini');
      with iniFile do
        Begin
          WriteString('FontTreeGroup', 'Name', FD.Font.Name);
          WriteInteger('FontTreeGroup', 'Color', FD.Font.Color);
          WriteInteger('FontTreeGroup', 'Size', FD.Font.Size);
        end;
    finally
      GroupTV.Font := FD.Font;
    end;     }

    SetFontParam('FontTreeGroup');
end;

procedure TProductsForm.ProductsGridTitleClick(Column: TColumn);
var
  Str: string;
begin
  if Assigned(Column) and Assigned(Column.Field) and
    (Column.Field.FieldKind = fkData) then
    with TADODataset(Column.Grid.DataSource.Dataset) do
    begin
      Str := Column.FieldName;
      if Pos(Str, IndexFieldNames) = 0 then
        IndexFieldNames := Str
      else
        if Pos('DESC', IndexFieldNames) > 0 then
          IndexFieldNames := Str
        else
          IndexFieldNames := Str + ' DESC';
    end;
end;

procedure TProductsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TProductsForm.OpenAllTreeActionExecute(Sender: TObject);
begin
 GroupTV.FullExpand;
end;

procedure TProductsForm.CloseAllTreeActionExecute(Sender: TObject);
begin
 GroupTV.FullCollapse;
end;

procedure TProductsForm.AddProdActionExecute(Sender: TObject);
var
    ProdDetF: TProductDetailForm;
begin
  ProdDetF := TProductDetailForm.Create(Application);

  try
    if ProdDetF.ShowModal() = mrOk then
      ProdDetF.InsProduct();
  finally
    FreeAndNil(ProdDetF);
    RefreshProdActionExecute(Self);
    RefreshGroupActionExecute(Self);
  end;
end;

procedure TProductsForm.RefreshGroupActionExecute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    SetTreeNodes(GroupTV);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TProductsForm.RefreshProdActionExecute(Sender: TObject);
begin
  try
    GetGroups();
    AppData.Products.DisableControls;
    Screen.Cursor := crSQLWait;

    AppData.Products.Active := False;
    AppData.Products.CommandText := Format(SSQLGetProducts, [FGroup[0],
                                                             FGroup[1],
                                                             FGroup[2],
                                                             FGroup[3],
                                                             FGroup[4],
                                                             FGroup[5],
                                                             IfThen(TypeTorvCB.ItemIndex = 0, EmptyStr, TypeTorvCB.Text)]);
    AppData.Products.Active := True;
    
  finally
    AppData.SetInfoToSB(AppData.Products,  ProdSB);
    GetGroupInfoSB();
    Screen.Cursor := crDefault;
    AppData.Products.EnableControls;

  end;
end;

procedure TProductsForm.CorrProdActionExecute(Sender: TObject);
var
    ProdDetF: TProductDetailForm;
    Articul: string;
begin
  if not AppData.Products.IsEmpty then
    try
      ProdDetF := TProductDetailForm.Create(Application);

      Articul := AppData.Products.FieldbyName('COD_ARTIC').AsString;
      ProdDetF.GetProductDetail(AppData.Products.FieldbyName('COD_ARTIC').AsInteger);

      if ProdDetF.ShowModal = mrok then
        ProdDetF.CorrProduct(AppData.Products.FieldbyName('COD_ARTIC').AsInteger);
    finally
      FreeAndNil(ProdDetF);
      RefreshProdActionExecute(Self);
      RefreshGroupActionExecute(Self);
      AppData.Products.Locate('COD_ARTIC', Articul, [loCaseInsensitive, loPartialKey]);
    end;
end;

procedure TProductsForm.DelProdActionExecute(Sender: TObject);
begin
   if (AppData.Products.Active) and
      (not AppData.Products.IsEmpty) then
        Begin
            if MessageBox(Handle, '�� ������������� ������� ������� ������ �����?', '�������� ������', MB_ICONQUESTION+MB_YESNO) = ID_YES then
              try
                 AppData.Command.CommandText := Format(SSQLDelProduct, [AppData.Products.FieldByName('COD_ARTIC').AsInteger]);
                 AppData.Command.Execute;
              finally
                RefreshProdActionExecute(Self);
              end;
        end;
end;

procedure TProductsForm.GroupTVGetImageIndex(Sender: TObject;
  Node: TTreeNode);
var
  Idx: Integer;
begin
  if Assigned(Node) then
  begin
    if Node.HasChildren then
      Idx := 0
    else
      Idx := 1;
    Node.ImageIndex := Idx;
    Node.SelectedIndex := Idx;
  end;
end;

procedure TProductsForm.GroupTVGetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
var
  Idx: Integer;
begin
  if Assigned(Node) then
  begin
    if Node.HasChildren then
      Idx := 0
    else
      Idx := 1;
    Node.ImageIndex := Idx;
    Node.SelectedIndex := Idx;
  end;
end;

function TProductsForm.GetGroupStr: Variant;
var
    Item: TTreeNode;
    Str: String;
begin
  Item := GroupTV.Selected;
  if ( not Assigned(Item)) and (Item.Level = 0) then
    Result := SAllCategories
  else
    Begin
      Str := Item.Text;

      while Item.Level > 1 do
        Begin
          Item := Item.Parent;
          Str := Item.Text + ' - ' +  Str;
        end;
        Result := Str;
    end;
end;

procedure TProductsForm.ClearGroup;
var
  i: integer;
begin
  for i := 0 to PRODUCT_CATEGORIES - 1 DO
    FGroup[I] := EmptyStr;
end;

procedure TProductsForm.GetGroups;
var
  Node: TTreeNode;
begin
   ClearGroup();
   Node := GroupTV.Selected;
   if Assigned(Node) then
    Begin
     while (Assigned(Node) and (Node.Level > 0)) do
      Begin
        FGroup[Node.Level - 1] := Node.Text;
        Node := Node.Parent;
      end;
    end;
end;

procedure TProductsForm.GetTypeTorv;
begin
  AppData.TypeTovr.Active := False;
  AppData.TypeTovr.Active := True;

  if not AppData.TypeTovr.IsEmpty then
    try
       TypeTorvCB.Items.BeginUpdate;
       TypeTorvCB.Items.Clear;
       TypeTorvCB.Items.Add('[�������]');

       AppData.TypeTovr.First;
       while not AppData.TypeTovr.Eof do
        Begin
          TypeTorvCB.Items.Add(AppData.TypeTovr.FieldByName('TYPE_TOVR').AsString);
          AppData.TypeTovr.Next;
        end;

    finally
        TypeTorvCB.Items.EndUpdate;
        TypeTorvCB.ItemIndex := 0;
        AppData.TypeTovr.Active := False;
    end;
end;

constructor TProductsForm.Create(AOwner: TComponent);
begin
  inherited;
  GetTypeTorv();
  SetTreeNodes(GroupTV);
  GetFontParam('FontTreeGroup');
  GetFontParam('FontProducts');
end;

procedure TProductsForm.FindProduct(Index: integer; FindStr: string);
var
    str : string;
begin
  str := EmptyStr;

  if (Length(Trim(FindStr)) > 0) and
      (AppData.Products.Active) and
      (not AppData.Products.IsEmpty) then
    try
      case Index of
         0: Str := ' COD_ARTIC = ' + Trim(FindStr);
         1: Str := ' NAME_ARTIC LIKE ' + QuotedStr('%' + Trim(FindStr) + '%');
         2: Str := ' NGROUP_TVR LIKE ' + QuotedStr('%' + Trim(FindStr) + '%');
         3: Str := ' NGROUP_TV2 LIKE ' + QuotedStr('%' + Trim(FindStr) + '%');
         4: Str := ' NGROUP_TV3 LIKE ' + QuotedStr('%' + Trim(FindStr) + '%');
         5: Str := ' NGROUP_TV4 LIKE ' + QuotedStr('%' + Trim(FindStr) + '%');
         6: Str := ' NGROUP_TV5 LIKE ' + QuotedStr('%' + Trim(FindStr) + '%');
         7: Str := ' NGROUP_TV6 LIKE ' + QuotedStr('%' + Trim(FindStr) + '%');
         8: Str := ' TYPE_TOVR LIKE '  + QuotedStr('%' + Trim(FindStr) + '%');
      end;
    finally
      if Length(Trim(Str)) > 0 then
      begin
        AppData.Products.Filtered := false;
        AppData.Products.Filter := Str;
        AppData.Products.Filtered := true;
      end;
    end;
end;

procedure TProductsForm.FindEditChange(Sender: TObject);
begin
  if Length(Trim(FindEdit.Text)) = 0 then
    AppData.Products.Filtered := False;
end;

procedure TProductsForm.FindEditKeyPress(Sender: TObject; var Key: Char);
begin
  if FieldCB.ItemIndex = 0 then
    if not (Key in ['0'..'9', #8, #13]) then Key := #0;
end;

procedure TProductsForm.FindBtnClick(Sender: TObject);
begin
  FindProduct(FieldCB.ItemIndex,  Trim(FindEdit.Text));
end;

procedure TProductsForm.SBDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  with StatusBar.Canvas do
    Begin
      Font.Style := Font.Style + [fsBold];
      Font.Color := clNavy;
      TextOut(Rect.Left, Rect.Top, Panel.Text);
    end;
end;

procedure TProductsForm.GetGroupInfoSB;
var
    strGroup: string;
begin
   strGroup := EmptyStr;
   GetGroups();
    try
       if FGroup[0] <> EmptyStr then strGroup := strGroup + FGroup[0];
       if FGroup[1] <> EmptyStr then strGroup := strGroup + '->' + FGroup[1];
       if FGroup[2] <> EmptyStr then strGroup := strGroup + '->' + FGroup[2];
       if FGroup[3] <> EmptyStr then strGroup := strGroup + '->' + FGroup[3];
       if FGroup[4] <> EmptyStr then strGroup := strGroup + '->' + FGroup[4];
       if FGroup[5] <> EmptyStr then strGroup := strGroup + '->' + FGroup[5];
    finally
      SB.Panels[0].Text := strGroup;
    end;
end;

procedure TProductsForm.ProdSBDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin  
  with StatusBar.Canvas do
    Begin
      Font.Style := Font.Style + [fsBold];
      Font.Color := clGreen;
      TextOut(Rect.Left, Rect.Top, Panel.Text);
    end;
end;

procedure TProductsForm.GroupTVExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  GetGroupInfoSB();
end;

procedure TProductsForm.GroupTVExpanded(Sender: TObject; Node: TTreeNode);
begin
  GetGroupInfoSB();   
end;

procedure TProductsForm.GetFontParam(PointName: string);
var
    iniFile: TIniFile;
    StyleBits: Byte;
    BoldStyle: Boolean;
begin
     iniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\Setting.ini');
     BoldStyle := True;

     try
        with FD.Font do
          Begin
             Name := iniFile.ReadString(PointName, 'Name', 'MS Sans Serif');
             Color := iniFile.ReadInteger(PointName, 'Color', clWindowText);
             Size := iniFile.ReadInteger(PointName, 'Size', 8);
             if BoldStyle then
                StyleBits := iniFile.ReadInteger( PointName, 'Style', Ord( fsBold ) )
             else
                StyleBits := iniFile.ReadInteger( PointName, 'Style', Ord( fsNormal ) );
              Style := [];
             if StyleBits and fsBoldMask = fsBoldMask then
                Style := Style + [ fsBold ];
             if StyleBits and fsItalicMask = fsItalicMask then
                Style := Style + [ fsItalic ];
             if StyleBits and fsUnderlineMask = fsUnderlineMask then
                Style := Style + [ fsUnderline ];
             if StyleBits and fsStrikeOutMask = fsStrikeOutMask then
                Style := Style + [ fsStrikeOut ];
          end;
     finally
        if PointName = 'FontTreeGroup' then GroupTV.Font := FD.Font;
        if PointName = 'FontProducts' then
          Begin
            ProductsGrid.Font := FD.Font;
            ProductsGrid.TitleFont :=FD.Font;
          end;
     end;
end;

procedure TProductsForm.SetFontParam(PointName: string);
var
    iniFile: TIniFile;
    StyleBits: Byte;
begin
     StyleBits := 0;
  if FD.Execute then
    Begin
     iniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\Setting.ini');

     with iniFile do
     try
       with FD.Font do
        Begin
          WriteString(PointName, 'Name', FD.Font.Name);
          WriteInteger(PointName, 'Color', FD.Font.Color);
          WriteInteger(PointName, 'Size', FD.Font.Size);
          if fsBold in Style then
            StyleBits := fsBoldMask;
          if fsItalic in Style then
            StyleBits := StyleBits + fsItalicMask;
          if fsUnderline in Style then
            StyleBits := StyleBits + fsUnderlineMask;
          if fsStrikeOut in Style then
            StyleBits := StyleBits + fsStrikeOutMask;
          WriteInteger(PointName, 'Style', StyleBits );
        end;
     finally
        if PointName = 'FontTreeGroup' then GroupTV.Font := FD.Font;
        if PointName = 'FontProducts' then
          Begin
            ProductsGrid.Font := FD.Font;
            ProductsGrid.TitleFont := FD.Font;
          end;
     end;
    end;
end;

procedure TProductsForm.FontProdActionExecute(Sender: TObject);
begin
  SetFontParam('FontProducts');
end;

end.
