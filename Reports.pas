unit Reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ActnList, ToolWin, ImgList, StdCtrls,
  Buttons, ReportProduct;

type
  TReportsForm = class(TForm)
    SB: TStatusBar;
    AL: TActionList;
    HeadPanel: TPanel;
    GroupPanel: TPanel;
    GroupTB: TToolBar;
    GroupTV: TTreeView;
    ReportsPC: TPageControl;
    IL: TImageList;
    RefreshGroupAction: TAction;
    ToolButton1: TToolButton;
    ProductReport: TTabSheet;
    Images: TImageList;
    RangeBtn: TBitBtn;
    RangeAction: TAction;
    RangeLbl: TLabel;
    Bevel1: TBevel;
    ReportProductFrame1: TReportProductFrame;
    procedure GroupTVGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure GroupTVGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure RefreshGroupActionExecute(Sender: TObject);
    procedure RangeActionExecute(Sender: TObject);
  private
      { Private declarations }
    FDateE: TDateTime;
    FDateB: TDateTime;
    procedure SetDateB(const Value: TDateTime);
    procedure SetDateE(const Value: TDateTime);
    procedure setActualDate();

  protected
    property DateB: TDateTime read FDateB write SetDateB;
    property DateE: TDateTime read FDateE write SetDateE;
  public
    { Public declarations }
    procedure SetTreeNodes(Tree: TTreeView);

    constructor Create(AOwner: TComponent); override;
  published

  end;

var
  ReportsForm: TReportsForm;

implementation

uses AppDM, Globals, SConst, Range, Math;

{$R *.dfm}

procedure TReportsForm.GroupTVGetImageIndex(Sender: TObject;
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

procedure TReportsForm.GroupTVGetSelectedIndex(Sender: TObject;
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

procedure TReportsForm.SetTreeNodes(Tree: TTreeView);
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

procedure TReportsForm.RefreshGroupActionExecute(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  try
    SetTreeNodes(GroupTV);
  finally
    Screen.Cursor := crDefault;
  end;
end;

constructor TReportsForm.Create(AOwner: TComponent);
begin
  inherited;
  SetTreeNodes(GroupTV);
  DateB := Now();
  DateE := DateB + 1;
  setActualDate();
end;

procedure TReportsForm.RangeActionExecute(Sender: TObject);
var
    rangeF: TRangeForm;
begin
    rangeF := TRangeForm.Create(Application);

    try
      rangeF.BegDP.Date := DateB;
      rangeF.EndDP.Date := DateE;

      If rangeF.ShowModal = mrOk then
        Begin
          DateB := rangeF.BegDP.Date;
          DateE := rangeF.EndDP.Date;
        end;
    finally
      FreeAndNil(rangeF);
      setActualDate();

      AppData.gBegD := DateB;
      AppData.gEndD := DateE;
    end;
end;

procedure TReportsForm.SetDateB(const Value: TDateTime);
begin
  FDateB := Value;
end;

procedure TReportsForm.SetDateE(const Value: TDateTime);
begin
  FDateE := Value;
end;

procedure TReportsForm.setActualDate;
begin
  RangeLbl.Caption := Format('[%s] - [%s]', [FormatDateTime('dd-mm-yyyy', DateB),
                                             FormatDateTime('dd-mm-yyyy', DateE)]);
end;

end.
