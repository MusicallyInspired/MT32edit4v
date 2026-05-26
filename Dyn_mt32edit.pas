unit Dyn_mt32edit;

interface

uses windows, SysUtils;

const
  editor_library_name='mt32edit4v.dll';
  synth_both = 3;

  res_ok = 0;
  res_fail = -1;

type
  PLongint = ^Longint;
  PSmallInt = ^SmallInt;
  PByte = ^Byte;
  PWord = ^Word;
  PDWord = ^DWord;
  PDouble = ^Double;
  size_t = DWORD;

  mt32edit_bit32u = dword;
  mt32edit_bit32s = longint;
  mt32edit_bit16u = word;
  mt32edit_bit16s = smallint;
  mt32edit_bit8u = byte;
  mt32edit_bit8s = shortint; //char?
  mt32edit_boolean = Boolean;
  mt32edit_return_code = Longint;

  mt32edit_data = integer; //Dummy !!

type
  Pmt32edit_bit16s = ^mt32edit_bit16s;
  Pmt32edit_bit16u = ^mt32edit_bit16u;
  Pmt32edit_bit32s = ^mt32edit_bit32s;
  Pmt32edit_bit32u = ^mt32edit_bit32u;
  Pmt32edit_bit8s = ^mt32edit_bit8s;
  Pmt32edit_bit8u = ^mt32edit_bit8u;
  Pmt32edit_boolean = ^mt32edit_boolean;
  Pmt32edit_const_context = ^mt32edit_const_context;
  Pmt32edit_context = ^mt32edit_context;
  Pmt32edit_data = ^mt32edit_data;

  Psingle = ^single;

  mt32edit_context = Pmt32edit_data;
  mt32edit_const_context = Pmt32edit_data;

const
  mt32edit_BOOL_FALSE = 0;
  mt32edit_BOOL_TRUE = 1;
  mt32edit_RC_OK = 0;
  mt32edit_RC_FAILED = -(100);

type

  Pmt32edit_report_handler_i = ^mt32edit_report_handler_i;
  mt32edit_report_handler_i = record
          v1 : Pointer; //Pmt32edit_report_handler_i_v0;
     end;

  mt32edit_report_handler_version =  Longint;

  Pmt32edit_report_handler_i_v1 = ^mt32edit_report_handler_i_v1;
  mt32edit_report_handler_i_v1 = record
        getVersionID: function(i: mt32edit_report_handler_i): mt32edit_report_handler_version; cdecl;
        sendSysExMessage: function(instance_data: TObject; msg: pointer; len: mt32edit_bit32u; synthNum: mt32edit_bit8u = synth_both): mt32edit_bit32s; cdecl;
        sendShortMessage: function(instance_data: TObject; msg: mt32edit_bit32u): mt32edit_bit32s; cdecl;
        readMemory: function(instance_data: TObject; addr: mt32edit_bit32u; len: mt32edit_bit32u; data: pointer; synthNum: mt32edit_bit8u = 1): mt32edit_bit32s; cdecl;
        onClose: procedure(instance_data: TObject); cdecl;
        isDualSynthMode: function(instance_data: TObject): mt32edit_boolean; cdecl;
        isReverbOverridden: function(instance_data: TObject): mt32edit_boolean; cdecl;
   end; 


var
  mt32edit_Handle: Thandle = 0;
  //Main handle
 
  mt32edit_create_context: function(report_handler: mt32edit_report_handler_i; wndHandle: THandle; instance_data: pointer): mt32edit_context; cdecl;

  mt32edit_free_context: procedure(context: mt32edit_context); cdecl;


  Function Load_MT32EDIT (const dllfilename : String) :boolean;
  Procedure Unload_MT32EDIT;

implementation

Function Load_MT32EDIT (const dllfilename : String) :boolean;
var
  oldmode:integer;
begin
 if mt32edit_Handle <> 0 then
  Result:= true {is it already there ?}
 else
  begin
  (*go & load the dll*)
    oldmode := SetErrorMode($8001);
   {$IFDEF UNICODE}
     mt32edit_Handle:= LoadLibraryW(PWideChar(dllfilename));
   {$ELSE}
     mt32edit_Handle:= LoadLibraryA(PansiChar(dllfilename));
   {$ENDIF}
     SetErrorMode(oldmode);
    if mt32edit_Handle <> 0 then
     begin {now we tie the functions to the VARs from above}
      
      @mt32edit_create_context := GetProcAddress(mt32edit_Handle, PansiChar('mt32edit_create_context'));
      @mt32edit_free_context := GetProcAddress(mt32edit_Handle, PansiChar('mt32edit_free_context'));
      
      {now check if everything is linked in correctly}
   if (@mt32edit_create_context  = nil) or
      (@mt32edit_free_context  = nil) then

      begin {if something went wrong during linking, free library & reset handle}
       FreeLibrary(mt32edit_Handle);
       mt32edit_Handle := 0;
      end;
     end;
    Result:= (mt32edit_Handle <> 0);
  end;
end;

Procedure Unload_mt32edit;
var
  st1: array[0..MAX_PATH] of Char;
begin
 if mt32edit_Handle <> 0 then
  begin
   GetModuleFileName(0, @st1[0], MAX_PATH);
   if Pos('midiplayer.exe', Lowercase(ExtractFileName(st1))) = 0 then
   begin
    SLEEP(5);
    FreeLibrary(mt32edit_Handle);
    SLEEP(5);
    mt32edit_Handle:=0;
   end;
  end;
end;


end.

