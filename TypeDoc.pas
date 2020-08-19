unit TypeDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus,
  ImgList, ActnList;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TypeDocForm: TTypeDocForm;

implementation

uses AppDM, Globals, SConst, TypeDocDetail, DB;

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
  AppData.TypeDocs.Active := False;
  AppData.TypeDocs.CommandText := Format(SSQLGetTypeDocs, [Byte(ResevrChB.Checked)]);
  AppData.TypeDocs.Active := True;
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
                                                                          DescriptionEdit.Text,
                                                                          NameEdit.Text,
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
                                                                               0]);
              1:  AppData.Command.CommandText := Format(SSQLTransferTypeDoc, [AppData.TypeDocs.FieldByName('UID').AsInteger,
                                                                               1]);
           end;

          AppData.Command.Execute;
        finally
          RefreshActionExecute(Self);
        end;
end;

end.
