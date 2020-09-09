unit TypeDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus,
  ImgList, ActnList, DB, ADODB;

type
  TTypeDocForm = class(TForm)
    SB: TStatusBar;
    BtnsPanel: TPanel;
    Bevel1: TBevel;
    AddBtn: TBitBtn;
    CorrBtn: TBitBtn;
    DelBtn: TBitBtn;
    TransferBtn: TBitBtn;
    RefreshBtn: TBitBtn;
    ResevrChB: TCheckBox;
    TypeDocGrid: TDBGrid;
    AL: TActionList;
    IL: TImageList;
    PopMenu: TPopupMenu;
    AddAction: TAction;
    CorrAction: TAction;
    DelAction: TAction;
    TransferAction: TAction;
    RefreshAction: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure AddActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure CorrActionExecute(Sender: TObject);
    procedure DelActionExecute(Sender: TObject);
    procedure TransferActionExecute(Sender: TObject);
    procedure TypeDocGridTitleClick(Column: TColumn);
    procedure TypeDocGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SBDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TypeDocForm: TTypeDocForm;

implementation

uses AppDM, Globals, SConst, TypeDocDetail;

{$R *.dfm}

procedure TTypeDocForm.AddActionExecute(Sender: TObject);
var
    typeDetail: TTypeDocDetailForm;
begin
    typeDetail := TTypeDocDetailForm.Create(Application);

    try
      if typeDetail.ShowModal = mrOk then
        if (Length(Trim(typeDetail.DescriptionEdit.Text)) > 0) and
           (Length(Trim(typeDetail.NameEdit.Text)) > 0) then
        try
          AppData.Command.CommandText := Format(SSQLInsTypeDocs, [Trim(typeDetail.NameEdit.Text),
                                                                  Trim(typeDetail.DescriptionEdit.Text),
                                                                  Byte(typeDetail.ReserveChB.Checked)]);
          AppData.Command.Execute;
        except
          on Ex: Exception do
            MessageDlg('Ошибка добавления нового типа документа' + #13 + 'Сообщение: ' + ex.Message, mtError, [mbOK], 0);
        end;
    finally
      FreeAndNil(typeDetail);
      RefreshActionExecute(Self);
    end;
end;

procedure TTypeDocForm.RefreshActionExecute(Sender: TObject);
begin
  try
    AppData.TypeDocs.Active := False;
    AppData.TypeDocs.CommandText := Format(SSQLGetTypeDocs, [Byte(ResevrChB.Checked)]);
    AppData.TypeDocs.Active := True;
  finally
    AppData.SetInfoToSB(AppData.TypeDocs, SB, False, True, EmptyStr, 'Reserve');
  end;
end;

procedure TTypeDocForm.CorrActionExecute(Sender: TObject);
var
    typeDetail: TTypeDocDetailForm;
begin
    typeDetail := TTypeDocDetailForm.Create(Application);

    if (AppData.TypeDocs.Active) and
       (AppData.TypeDocs.RecordCount > 0) then
          with typeDetail do
            try
              DescriptionEdit.Text := AppData.TypeDocs.FieldbyName('TYPE_DOC').AsString;
              NameEdit.Text := AppData.TypeDocs.FieldbyName('Name').AsString;
              ReserveChB.Checked := AppData.TypeDocs.FieldbyName('Reserve').AsBoolean;

              if ShowModal = mrOk then
                try
                  AppData.Command.CommandText := Format(SSQLCorrTypeDoc, [AppData.TypeDocs.FieldByName('UID').AsInteger,
                                                                          Trim(NameEdit.Text),
                                                                          Trim(DescriptionEdit.Text),
                                                                          Byte(ReserveChB.Checked)]);
                  AppData.Command.Execute;
                except
                  on ex: Exception do
                    MessageDlg('Ошибка изменения типа документа!' + #13 + 'Сообщение: ' + ex.Message, mtError, [mbOK], 0);
                end;
            finally
              FreeAndNil(typeDetail);
              RefreshActionExecute(Self);
            end;
end;

procedure TTypeDocForm.DelActionExecute(Sender: TObject);
begin
    if (AppData.TypeDocs.Active) and
       (AppData.TypeDocs.RecordCount > 0) then
       try
         if MessageBox(Handle, 'Вы действительно хотите удалить данный тип документа?', 'Удалить', MB_ICONWARNING+MB_YESNO) = ID_YES then
          try
             AppData.Command.CommandText := Format(SSQLDelTypeDocs, [AppData.TypeDocs.FieldByName('UID').AsInteger]);
             AppData.Command.Execute;
          except
            on ex: Exception do
              MessageDlg('Ошибка удаления типа документа!' + #13 + 'Сообщение: ' + ex.Message, mtError, [mbOK], 0);
          end;
       finally
           RefreshActionExecute(Self);
       end;
end;

procedure TTypeDocForm.TransferActionExecute(Sender: TObject);
begin
      if (AppData.TypeDocs.Active) and
       (AppData.TypeDocs.RecordCount > 0) then
        try
           case Byte(AppData.TypeDocs.FieldByName('Reserve').AsBoolean) of
              0: if MessageBox(Handle, 'Вы действительно желаете перевести тип документ в резерв?', 'Перевод в резерв', MB_ICONWARNING+MB_YESNO) = ID_YES then
                  AppData.Command.CommandText := Format(SSQLTransferTypeDoc, [AppData.TypeDocs.FieldByName('UID').AsInteger,
                                                                              1]);
              1:  AppData.Command.CommandText := Format(SSQLTransferTypeDoc, [AppData.TypeDocs.FieldByName('UID').AsInteger,
                                                                              0]);
           end;

          AppData.Command.Execute;
        finally
          RefreshActionExecute(Self);
        end;
end;

procedure TTypeDocForm.TypeDocGridTitleClick(Column: TColumn);
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

procedure TTypeDocForm.TypeDocGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (AppData.TypeDocs.Active) and
     (not AppData.TypeDocs.IsEmpty) then
         if AppData.TypeDocs.FieldByName('Reserve').AsBoolean = True then
             TypeDocGrid.Canvas.Brush.Color := clRed;

  TypeDocGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TTypeDocForm.SBDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
    with StatusBar.Canvas do
      try
         Brush.Color := clSkyBlue;
         FillRect(Rect);
         Font.Style := Font.Style + [fsBold];
         if Panel = SB.Panels[0] then
            Font.Color := clGreen;
         if Panel = SB.Panels[1] then
            Font.Color :=  clRed;
      finally
         TextOut(Rect.Left, Rect.Top, Panel.Text);
      end;
end;

end.
