unit Globals;

interface

uses
  Windows, Classes;

var
  g_User: string;
  g_Server: string;

  g_Year: Integer;
  g_Month: Integer;

const
   g_New = 0;
   g_Corr = 1;
   g_View = 2;


type
  { Группа товаров}
  TCategoryName = string[30];

const
  PRODUCT_CATEGORIES = 6;

const
  SShortMonthNames: array[1..12] of string = (
    'Янв',
    'Фев',
    'Мар',
    'Апр',
    'Май',
    'Июн',
    'Июл',
    'Авг',
    'Сен',
    'Окт',
    'Ноя',
    'Дек'
  );

  SLongMonthNames: array[1..12] of string = (
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  );

const
  fsBoldMask      = 8;                { Constants Used to Determine Font Style }
  fsItalicMask    = 4;
  fsUnderlineMask = 2;
  fsStrikeOutMask = 1;
  fsNormal        = 0;  

procedure GetMonthList(const List: TStrings);
procedure NextMonth(var Y, M: Integer);
procedure PrevMonth(var Y, M: Integer);

function ComputerName: string;

type
  TSheetItem = class
  public
    FUID: string;
    FName: string;
    FTotal: Integer;
    FValues: array[1..31] of Integer;
    constructor Create(const Id, Name: string);
  end;


implementation

uses
  SysUtils, Registry, SConst;

{ TSheetItem }

constructor TSheetItem.Create(const Id, Name: string);
begin
  FUID := Id;
  FName := Name;
end;

{ Year-Month Utilities }

procedure GetMonthList(const List: TStrings);
var
  I: Integer;
begin
  List.BeginUpdate();
  try
    List.Clear();
    for I := 1 to 12 do
      List.Add(SLongMonthNames[I]);
  finally
    List.EndUpdate();
  end;
end;

procedure NextMonth(var Y, M: Integer);
begin
  if M < 12 then
    Inc(M)
  else
  begin
    Inc(Y);
    M := 1;
  end;
end;

procedure PrevMonth(var Y, M: Integer);
begin
  if M > 1 then
    Dec(M)
  else
  begin
    Dec(Y);
    M := 12;
  end;
end;

{ Miscellaneous }

function CurrentUser: string;
var
  Buf: array[0..255] of AnsiChar;
  Size: Cardinal;
begin
  Size := SizeOf(Buf);
  if GetUserName(@Buf, Size) then
    Result := Buf
  else
    Size := GetLastError();
end;

function DefaultServer: string;
var
  Buf: array[0..255] of AnsiChar;
  Res, Size: Cardinal;
begin
  Size := SizeOf(Buf);
  Res := GetEnvironmentVariable('LOGONSERVER', @Buf, Size);
  if Res >= 3 then
    Result := System.Copy(Buf, 3, Res - 2)
  else
    Result := EmptyStr;
end;

function ComputerName: string;
var
  Buf: array[0..MAX_COMPUTERNAME_LENGTH] of AnsiChar;
  Size: Cardinal;
begin
  if GetComputerName(@Buf, Size) then
    Result := Buf;
end;

procedure ReadParams;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create();
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(SRegEastTrade, True) then
    begin
      g_Server := Reg.ReadString(SRegServerName);
      Reg.CloseKey();
    end;
    if Reg.OpenKey(SRegAppKey, True) then
    begin
      g_Year := Reg.ReadInteger(SRegYear);
      g_Month := Reg.ReadInteger(SRegMonth);
      Reg.CloseKey();
    end;
  finally
    Reg.Free;
  end;
end;

procedure WriteParams;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create();
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(SRegEastTrade, True) then
    begin
      Reg.WriteString(SRegServerName, g_Server);
      Reg.CloseKey();
    end;
    if Reg.OpenKey(SRegAppKey, True) then
    begin
      Reg.WriteInteger(SRegYear, g_Year);
      Reg.WriteInteger(SRegMonth, g_Month);
      Reg.CloseKey();
    end;
  finally
    Reg.Free;
  end;
end;

function CheckActive: Boolean;
var
  hMutex: THandle;
begin
  hMutex := CreateMutex(nil, True, '$EAST_OIL$');
  Result := (hMutex = 0) or (GetLastError() = ERROR_ALREADY_EXISTS);
end;

var
  D, M, Y: Word;

initialization
  if not CheckActive() then
  begin
    g_User := CurrentUser();
    ReadParams();
    if g_Server = EmptyStr then g_Server := DefaultServer();
  end else
  begin
    MessageBox(0, PChar(SAlreadyRunning), 'Сообщение', MB_OK or MB_ICONEXCLAMATION);
    ExitProcess(0);
  end;

  if (g_Year = 0) or (g_Month = 0) then
  begin
    DecodeDate(Date(), Y, M, D);
    g_Year := Y; g_Month := M;
  end;

finalization
  WriteParams();

end.
