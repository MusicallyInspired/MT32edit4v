unit PatchUxTheme;
{$EXCESSPRECISION OFF}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IMPORTEDDATA OFF}
{$O+}

interface

implementation

uses
Messages,
UxTheme,
Themes,
Sysutils,
Windows;

type
  TJumpOfs = Integer;
  PPointer = ^Pointer;

  PXRedirCode = ^TXRedirCode;
  TXRedirCode = packed record
    Jump: Byte;
    Offset: TJumpOfs;
  end;

  PAbsoluteIndirectJmp = ^TAbsoluteIndirectJmp;
  TAbsoluteIndirectJmp = packed record
    OpCode: Word;
    Addr: PPointer;
  end;

var
 UseThemesBackup: TXRedirCode;

function GetActualAddr(Proc: Pointer): Pointer;
begin
  if Proc <> nil then
  begin
    if (Win32Platform = VER_PLATFORM_WIN32_NT) and (PAbsoluteIndirectJmp(Proc).OpCode = $25FF) then
      Result := PAbsoluteIndirectJmp(Proc).Addr^
    else
      Result := Proc;
  end
  else
    Result := nil;
end;


procedure HookProc(Proc, Dest: Pointer; var BackupCode: TXRedirCode);
var
  n: NativeUint;
  Code: TXRedirCode;
begin
  Proc := GetActualAddr(Proc);
  Assert(Proc <> nil);
  if ReadProcessMemory(GetCurrentProcess, Proc, @BackupCode, SizeOf(BackupCode), n) then
  begin
    Code.Jump := $E9;
    Code.Offset := PAnsiChar(Dest) - PAnsiChar(Proc) - SizeOf(Code);
    WriteProcessMemory(GetCurrentProcess, Proc, @Code, SizeOf(Code), n);
  end;
end;

procedure UnhookProc(Proc: Pointer; var BackupCode: TXRedirCode);
var
 n: NativeUint;
begin
  if (BackupCode.Jump <> 0) and (Proc <> nil) then
  begin
    Proc := GetActualAddr(Proc);
    Assert(Proc <> nil);
    WriteProcessMemory(GetCurrentProcess, Proc, @BackupCode, SizeOf(BackupCode), n);
    BackupCode.Jump := 0;
  end;
end;

function UseThemesH:Boolean;
Var
 Flag : DWORD;
begin
  Flag:=GetThemeAppProperties;
  if ( (@IsAppThemed<>nil) and (@IsThemeActive<>nil) ) then
    Result := IsAppThemed and IsThemeActive and ((Flag and STAP_ALLOW_CONTROLS)<>0)
  else
    Result := False;
end;

procedure HookUseThemes;
begin
if ((Win32MajorVersion > 5) or ((Win32MajorVersion = 5) and (Win32MinorVersion >= 1))) then
  HookProc(@UxTheme.UseThemes, @UseThemesH, UseThemesBackup);
end;

procedure UnHookUseThemes;
begin
if ((Win32MajorVersion > 5) or ((Win32MajorVersion = 5) and (Win32MinorVersion >= 1))) then
  UnhookProc(@UxTheme.UseThemes, UseThemesBackup);
end;

initialization
 InitThemeLibrary;
 HookUseThemes;
finalization
 UnHookUseThemes;
end.

