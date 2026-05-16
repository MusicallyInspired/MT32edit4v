{$ifdef FPC_VERSION}
{$MODE DELPHI}
{$endif}
library MT32edit4v;

uses
  Windows,
  SysUtils,
  Dyn_mt32edit,
  Classes,
  {$ifdef FPC_VERSION}
  interfaces,
  {$endif }
  editor in 'editor.pas' {EditorForm};

{$R *.RES}

function mt32edit_create_context(report_handler: mt32edit_report_handler_i; wndHandle: THandle; instance_data: pointer): mt32edit_context; cdecl; export;
var
  EditorForm: TEditorForm;
begin
  EditorForm := TEditorForm.Create(nil);
  EditorForm.PHandlerInterface_v1 := report_handler.v1;
  EditorForm.MuntVSTiHwndHandle := wndHandle;
  EditorForm.MuntVSTiInstance := instance_data;
  {$IFDEF WIN64}
  SetWindowLongPtr(EditorForm.Handle, GWLP_HWNDPARENT, wndHandle);
  {$ELSE}
  SetWindowLong(EditorForm.Handle, GWL_HWNDPARENT, wndHandle);
  {$ENDIF}

  EditorForm.Show;
  EditorForm.LoadAllDataFromMunt;
  EditorForm.RefreshVisibleControls;
  result := Pointer(EditorForm);
end;

procedure mt32edit_free_context(context: mt32edit_context); cdecl; export;
begin
  if assigned(context) then
  begin
    TEditorForm(context).Close;
    TEditorForm(context).Free;
  end;
end;

exports
  mt32edit_create_context name 'mt32edit_create_context',
  mt32edit_free_context name 'mt32edit_free_context';

begin
end.

