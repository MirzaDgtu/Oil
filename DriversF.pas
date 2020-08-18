unit DriversF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Drivers;

type
  TDriversForm = class(TForm)
    DriversFrame1: TDriversFrame;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure SetDriverDetail();

    constructor Create(AOwner: TComponent); override;
  end;

var
  DriversForm: TDriversForm;

implementation

uses AppDM;

{$R *.dfm}

{ TDriversForm }

constructor TDriversForm.Create(AOwner: TComponent);
begin
  inherited;
    DriversFrame1.RefreshActionExecute(Self);
end;


class procedure TDriversForm.SetDriverDetail;
begin
  if AppData.DriversL.Active = True then
    try
      with DriversForm.DriversFrame1 do
        Begin
          // Паспорт
          PassSerialLbl.Caption := AppData.DriversL.FieldByName('Pass_Serial').AsString;
          PassNumLbl.Caption := AppData.DriversL.FieldByName('Pass_Num').AsString;
          PassGaveMemo.Lines.Text := AppData.DriversL.FieldByName('Pass_Gave').AsString;

          // Водительское удостоверение
          LicenseSerialLbl.Caption := AppData.DriversL.FieldByName('License_Serial').AsString;
          LicenseNumLbl.Caption := AppData.DriversL.FieldByName('License_Num').AsString;
          LicenseCategoriesLbl.Caption := AppData.DriversL.FieldByName('License_Access').AsString;
          LicenseBegDatelbl.Caption := AppData.DriversL.FieldByName('License_BegDate').AsString;
          LicenseEndDateLbl.Caption := AppData.DriversL.FieldByName('License_EndDate').AsString;
          LicenseGaveMemo.Lines.Text := AppData.DriversL.FieldByName('License_Gave').AsString;

          // Автомобиль
          ModelEdit.Text := AppData.DriversL.FieldByName('MODEL').AsString;
          RegSymbolEdit.Text := AppData.DriversL.FieldByName('REG_SYMBOL').AsString;
          TypeEdit.Text := AppData.DriversL.FieldByName('TYPE_TC').AsString;
          ColorEdit.Text := AppData.DriversL.FieldByName('COLOR').AsString;
          YearEdit.Text := AppData.DriversL.FieldByName('MADEYEAR').AsString;

          // Примечание
          PrimechMemo.Text := AppData.DriversL.FieldByName('Primech').AsString;
        end;
    except
      on Ex: Exception do
        MessageDlg('Ошибка получения детализации водителя!' + #13 + 'Сообщение: ' + Ex.Message, mtError, [mbOK], 0);
    end;
end;
end.
