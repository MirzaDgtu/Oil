unit FrameProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Menus, ImgList, ActnList, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, ComCtrls, ToolWin, Globals, StrUtils, DB, ADODB;

type
  TProductFrame = class(TFrame)
    PanelSplitter: TSplitter;
    SB: TStatusBar;
    GroupGB: TGroupBox;
    GroupTV: TTreeView;
    GroupBottomTB: TToolBar;
    AddGrTBI: TToolButton;
    CorrGrTBI: TToolButton;
    FontGrTBI: TToolButton;
    OpenAllNodeGrTBI: TToolButton;
    CloseAllNodeGrTBI: TToolButton;
    refreshGrTBI: TToolButton;
    ProductsGB: TGroupBox;
    ProductsGrid: TDBGrid;
    ProductBottomTB: TToolBar;
    AddProdTBI: TToolButton;
    CorrProdTBI: TToolButton;
    DelProdTBI: TToolButton;
    RefreshProdTBI: TToolButton;
    FontProdTBI: TToolButton;
    ProdSB: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Bevel2: TBevel;
    TypeTorvCB: TComboBox;
    FieldCB: TComboBox;
    FindEdit: TEdit;
    FindBtn: TBitBtn;
    AL: TActionList;
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
    FontSettingGroupAction: TAction;
    FontProdAction: TAction;
    IL: TImageList;
    Menu: TMainMenu;
    ProductsPM: TPopupMenu;
    AddIP: TMenuItem;
    CorrIP: TMenuItem;
    DelIP: TMenuItem;
    RefreshIP: TMenuItem;
    GroupPop: TPopupMenu;
    AddGrIP: TMenuItem;
    DelGrIP: TMenuItem;
    OpenAllTreeIP: TMenuItem;
    CloseAllTreeIP: TMenuItem;
    RefreshGrIP: TMenuItem;
    ProdFD: TFontDialog;
    Images: TImageList;
    GroupFD: TFontDialog;
    procedure FindEditChange(Sender: TObject);
    procedure FindEditKeyPress(Sender: TObject; var Key: Char);
    procedure FindBtnClick(Sender: TObject);
    procedure GroupTVGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure GroupTVGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure DelProdActionExecute(Sender: TObject);
    procedure CorrProdActionExecute(Sender: TObject);
    procedure RefreshProdActionExecute(Sender: TObject);
    procedure RefreshGroupActionExecute(Sender: TObject);
    procedure AddProdActionExecute(Sender: TObject);
    procedure OpenAllTreeActionExecute(Sender: TObject);
    procedure CloseAllTreeActionExecute(Sender: TObject);
    procedure FontSettingGroupActionExecute(Sender: TObject);
    procedure ProductsGridTitleClick(Column: TColumn);
  private
    { Private declarations }
    FGroup: array [0..PRODUCT_CATEGORIES-1] of String[30];

    function GetGroupStr: Variant;
    procedure ClearGroup();
    procedure GetGroups();
    procedure GetTypeTorv();
    procedure FindProduct(Index: integer; FindStr: string);
  public
    { Public declarations }
    procedure SetTreeNodes(Tree: TTreeView);

    constructor Create(AOwner: TComponent); override;

  published
    property GroupStr: Variant read GetGroupStr;
  end;

implementation

uses AppDM, SConst, ProductDetail, ProductPrice;

{$R *.dfm}

{ TProductFrame }

procedure TProductFrame.ClearGroup;
var
  i: integer;
begin
  for i := 0 to PRODUCT_CATEGORIES - 1 DO
    FGroup[I] := EmptyStr;
end;

constructor TProductFrame.Create(AOwner: TComponent);
begin
  inherited;
  GetTypeTorv();
  SetTreeNodes(GroupTV);
end;

procedure TProductFrame.FindProduct(Index: integer; FindStr: string);
var
    str : string;
begin
  str := EmptyStr;

  if (Length(Trim(FindStr)) > 0) and
      (AppData.Products.Active) and
      (AppData.Products.IsEmpty) then
    try
      case Index of
         0: Str := ' COD_ARTIC = ' + FindStr;
         1: Str := ' NAME_ARTIC LIKE ' + QuotedStr('%' + FindStr + '%');
         2: Str := ' NGROUP_TVR LIKE ' + QuotedStr('%' + FindStr + '%');
         3: Str := ' NGROUP_TV2 LIKE ' + QuotedStr('%' + FindStr + '%');
         4: Str := ' NGROUP_TV3 LIKE ' + QuotedStr('%' + FindStr + '%');
         5: Str := ' NGROUP_TV4 LIKE ' + QuotedStr('%' + FindStr + '%');
         6: Str := ' NGROUP_TV5 LIKE ' + QuotedStr('%' + FindStr + '%');
         7: Str := ' NGROUP_TV6 LIKE ' + QuotedStr('%' + FindStr + '%');
         8: Str := ' TYPE_TOVR LIKE ' + QuotedStr('%' + FindStr + '%');
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

procedure TProductFrame.GetGroups;
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

function TProductFrame.GetGroupStr: Variant;
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

procedure TProductFrame.GetTypeTorv;
begin
  AppData.TypeTovr.Active := False;
  AppData.TypeTovr.Active := True;

  if not AppData.TypeTovr.IsEmpty then
    try
       TypeTorvCB.Items.BeginUpdate;
       TypeTorvCB.Items.Clear;
       TypeTorvCB.Items.Add('[¬ыбрать]');

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

procedure TProductFrame.SetTreeNodes(Tree: TTreeView);
var
    { ћассив наименований категорий }
  Categories: array[0..PRODUCT_CATEGORIES - 1] of TCategoryName;
  { ћассив узлов дерева (0 - всегда корень) }
  Nodes:      array[0..PRODUCT_CATEGORIES] of TTreeNode;
  { ”зел, с которого надо добавл€ть дочерние }
  Root, Node: TTreeNode;
  { —четчики заполненных полей (категорий) и количества совпадений }
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
                    { ƒл€ текущей записи считываем пол€ групп,
                      считаем количество непустых полей и
                      количество совпадений с предыдущей }
                    ReadCategories();

                    { ƒобавл€ем с уровн€, соответствующего
                      количеству совпадений (поднимаемс€ по дереву) }
                    Node := Nodes[Match];
                    if not Assigned(Node) then
                      Node := Root;

                    { ƒобавл€ем только в том случае, если
                      количество совпадающих полей меньше
                      количества заполненных полей }
                    for I := Match to Flds - 1 do
                    begin
                      Nodes[I + 1] := Tree.Items.AddChild(Node, Categories[I]);
                      Node := Nodes[I + 1];
                    end;

                    { —ледующа€ запись }
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

procedure TProductFrame.FindEditChange(Sender: TObject);
begin
  if Length(Trim(FindEdit.Text)) = 0 then
    AppData.Products.Filtered := False;
end;

procedure TProductFrame.FindEditKeyPress(Sender: TObject; var Key: Char);
begin
  if FieldCB.ItemIndex = 0 then
    if not (Key in ['0'..'9', #8, #13]) then Key := #0;
end;

procedure TProductFrame.FindBtnClick(Sender: TObject);
begin
  FindProduct(FieldCB.ItemIndex,  Trim(FindEdit.Text));
end;

procedure TProductFrame.GroupTVGetImageIndex(Sender: TObject;
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

procedure TProductFrame.GroupTVGetSelectedIndex(Sender: TObject;
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

procedure TProductFrame.DelProdActionExecute(Sender: TObject);
begin
   if (AppData.Products.Active) and
      (not AppData.Products.IsEmpty) then
        Begin
            if MessageBox(Handle, '¬ы действительно желаете удалить данный товар?', '”даление товара', MB_ICONQUESTION+MB_YESNO) = ID_YES then
              try
                 AppData.Command.CommandText := Format(SSQLDelProduct, [AppData.Products.FieldByName('COD_ARTIC').AsInteger]);
                 AppData.Command.Execute;
              finally
                RefreshProdActionExecute(Self);
              end;
        end;
end;

procedure TProductFrame.CorrProdActionExecute(Sender: TObject);
var
    ProdDetF: TProductDetailForm;
    Articul: integer;
begin
  if not AppData.Products.IsEmpty then
    try
      ProdDetF := TProductDetailForm.Create(Application);

      Articul := AppData.Products.FieldbyName('COD_ARTIC').AsInteger;
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

procedure TProductFrame.RefreshProdActionExecute(Sender: TObject);
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
    Screen.Cursor := crDefault;
    AppData.Products.EnableControls;
  end;
end;

procedure TProductFrame.RefreshGroupActionExecute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    SetTreeNodes(GroupTV);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TProductFrame.AddProdActionExecute(Sender: TObject);
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

procedure TProductFrame.OpenAllTreeActionExecute(Sender: TObject);
begin
  GroupTV.FullExpand;
end;

procedure TProductFrame.CloseAllTreeActionExecute(Sender: TObject);
begin
  GroupTV.FullCollapse;
end;

procedure TProductFrame.FontSettingGroupActionExecute(Sender: TObject);
begin
  if GroupFD.Execute then
     GroupTV.Font := GroupFD.Font;
end;

procedure TProductFrame.ProductsGridTitleClick(Column: TColumn);
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

end.
