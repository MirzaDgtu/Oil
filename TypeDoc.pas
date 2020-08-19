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
        if Length(Trim(typeDetail.DescriptionEdit.Text)) > 0 and
           Length(Trim(typeDetail.NameEdit.Text)) > 0 then
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
    end;
end;

procedure TTypeDocForm.RefreshActionExecute(Sender: TObject);
begin
  AppData.TypeDocs.Active := False;
  AppData.TypeDocs.CommandText := Format(SSQLGetTypeDocs, [Byte(ResevrChB.Checked)]);
end;

end.
