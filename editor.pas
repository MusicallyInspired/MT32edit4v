unit editor;
{$EXCESSPRECISION OFF}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IMPORTEDDATA OFF}
{$O+}

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, Dyn_mt32edit, UITypes,
  StdCtrls, Controls, ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.Dialogs,
  Vcl.Graphics, Math, Types, IOUtils, Vcl.Samples.Spin, SynthSlider, KnobControl, PatchUxTheme;

const
  SysExHeader: array[0..4] of Byte = (
    $F0, $41, $10, $16, $12
  );
  InitTimbre: array[0..245] of Byte = (
    $69, $6E, $69, $74, $20, $20, $20, $20, $20, $20, $00, $00, $01, $00, $24,
    $32, $0B, $01, $00, $00, $00, $07, $00, $00, $00, $00, $00, $00, $00, $32,
    $32, $32, $32, $32, $00, $00, $00, $32, $00, $03, $00, $07, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $64, $32, $00, $0C, $00,
    $0C, $00, $00, $05, $00, $00, $00, $0F, $64, $64, $64, $64, $24, $32, $0B,
    $01, $00, $00, $00, $07, $00, $00, $00, $00, $00, $00, $00, $32, $32, $32,
    $32, $32, $00, $00, $00, $32, $00, $03, $00, $07, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $00, $00, $64, $32, $00, $0C, $00, $0C, $00,
    $00, $05, $00, $00, $00, $0F, $64, $64, $64, $64, $24, $32, $0B, $01, $00,
    $00, $00, $07, $00, $00, $00, $00, $00, $00, $00, $32, $32, $32, $32, $32,
    $00, $00, $00, $32, $00, $03, $00, $07, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $00, $00, $64, $32, $00, $0C, $00, $0C, $00, $00, $05,
    $00, $00, $00, $0F, $64, $64, $64, $64, $24, $32, $0B, $01, $00, $00, $00,
    $07, $00, $00, $00, $00, $00, $00, $00, $32, $32, $32, $32, $32, $00, $00,
    $00, $32, $00, $03, $00, $07, $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $00, $00, $00, $64, $32, $00, $0C, $00, $0C, $00, $00, $05, $00, $00,
    $00, $0F, $64, $64, $64, $64
  );
  GroupA_Names: array[0..63] of String = (
    'AcouPiano1','AcouPiano2','AcouPiano3','ElecPiano1',
    'ElecPiano2','ElecPiano3','ElecPiano4','Honkytonk ',
    'Elec Org 1','Elec Org 2','Elec Org 3','Elec Org 4',
    'Pipe Org 1','Pipe Org 2','Pipe Org 3','Accordion ',
    'Harpsi 1  ','Harpsi 2  ','Harpsi 3  ','Clavi 1   ',
    'Clavi 2   ','Clavi 3   ','Celesta 1 ','Celesta 2 ',
    'Syn Brass1','Syn Brass2','Syn Brass3','Syn Brass4',
    'Syn Bass 1','Syn Bass 2','Syn Bass 3','Syn Bass 4',
    'Fantasy   ','Harmo Pan ','Chorale   ','Glasses   ',
    'Soundtrack','Atmosphere','Warm Bell ','Funny Vox ',
    'Echo Bell ','Ice Rain  ','Oboe 2001 ','Echo Pan  ',
    'DoctorSolo','Schooldaze','Bellsinger','SquareWave',
    'Str Sect 1','Str Sect 2','Str Sect 3','Pizzicato ',
    'Violin 1  ','Violin 2  ','Cello 1   ','Cello 2   ',
    'Contrabass','Harp 1    ','Harp 2    ','Guitar 1  ',
    'Guitar 2  ','Elec Gtr 1','Elec Gtr 2','Sitar     '
  );
  GroupB_Names: array[0..63] of String = (
    'Acou Bass1','Acou Bass2','Elec Bass1','Elec Bass2',
    'Slap Bass1','Slap Bass2','Fretless 1','Fretless 2',
    'Flute 1   ','Flute 2   ','Piccolo 1 ','Piccolo 2 ',
    'Recorder  ','Pan Pipes ','Sax 1     ','Sax 2     ',
    'Sax 3     ','Sax 4     ','Clarinet 1','Clarinet 2',
    'Oboe 2001 ','Engl Horn ','Bassoon   ','Harmonica ',
    'Trumpet 1 ','Trumpet 2 ','Trombone 1','Trombone 2',
    'Fr Horn 1 ','Fr Horn 2 ','Tuba      ','Brs Sect 1',
    'Brs Sect 2','Vibe 1    ','Vibe 2    ','Syn Mallet',
    'Windbell  ','Glock     ','Tube Bell ','Xylophone ',
    'Marimba   ','Koto      ','Sho       ','Shakuhachi',
    'Whistle 1 ','Whistle 2 ','Bottleblow','Breathpipe',
    'Timpani   ','MelodicTom','Deep Snare','Elec Perc1',
    'Elec Perc2','Taiko     ','Taiko  Rim','Cymbal    ',
    'Castanets ','Triangle  ','Orche Hit ','Telephone ',
    'Bird Tweet','OneNoteJam','WaterBells','JungleTune'
  );
  GroupRhy_Names: array[0..63] of String = (
    'Acou BD   ','Acou SD   ','Acou HiTom','AcouMidTom',
    'AcouLowTom','Elec SD   ','Clsd HiHat','OpenHiHat1',
    'Crash Cym ','Ride Cym  ','Rim Shot  ','Hand Clap ',
    'Cowbell   ','Mt HiConga','High Conga','Low Conga ',
    'Hi Timbale','LowTimbale','High Bongo','Low Bongo ',
    'High Agogo','Low Agogo ','Tambourine','Claves    ',
    'Maracas   ','SmbaWhis L','SmbaWhis S','Cabasa    ',
    'Quijada   ','OpenHiHat2','Acou BD   ','Acou SD   ',
    'Acou HiTom','AcouMidTom','AcouLowTom','Elec SD   ',
    'Clsd HiHat','OpenHiHat1','Crash Cym ','Ride Cym  ',
    'Rim Shot  ','Hand Clap ','Cowbell   ','Mt HiConga',
    'High Conga','Low Conga ','Hi Timbale','LowTimbale',
    'High Bongo','Low Bongo ','High Agogo','Low Agogo ',
    'Tambourine','Claves    ','Maracas   ','SmbaWhis L',
    'SmbaWhis S','Cabasa    ','Quijada   ','OpenHiHat2',
    '[none]    ','[none]    ','[none]    ','[none]    '
  );
  GroupRhyCM_Names: array[0..63] of String = (
    'Acou BD   ','Acou SD   ','Acou HiTom','AcouMidTom',
    'AcouLowTom','Elec SD   ','Clsd HiHat','OpenHiHat1',
    'Crash Cym ','Ride Cym  ','Rim Shot  ','Hand Clap ',
    'Cowbell   ','Mt HiConga','High Conga','Low Conga ',
    'Hi Timbale','LowTimbale','High Bongo','Low Bongo ',
    'High Agogo','Low Agogo ','Tambourine','Claves    ',
    'Maracas   ','SmbaWhis L','SmbaWhis S','Cabasa    ',
    'Quijada   ','OpenHiHat2','Laughing  ','Screaming ',
    'Punch     ','Heartbeat ','Footsteps1','Footsteps2',
    'Applause  ','Creaking  ','Door      ','Scratch   ',
    'Windchime ','Engine    ','Car-stop  ','Car-pass  ',
    'Crash     ','Siren     ','Train     ','Jet       ',
    'Helicotper','Starship  ','Pistol    ','Machinegun',
    'Lasergun  ','Explosion ','Dog       ','Horse     ',
    'Birds     ','Rain      ','Thunder   ','Wind      ',
    'Waves     ','Stream    ','Bubble    ','[none]    '
  );
  AdPatchTemp: NativeUInt = $C000;
  AdPatchTemp1: NativeUInt = $C000;
  AdPatchTemp2: NativeUInt = $C010;
  AdPatchTemp3: NativeUInt = $C020;
  AdPatchTemp4: NativeUInt = $C030;
  AdPatchTemp5: NativeUInt = $C040;
  AdPatchTemp6: NativeUInt = $C050;
  AdPatchTemp7: NativeUInt = $C060;
  AdPatchTemp8: NativeUInt = $C070;
  AdPatchTempR: NativeUInt = $C080;
  AdRhythmSetup: NativeUInt = $C090;
  AdTimbreTemp: NativeUInt = $10000;
  AdTimbreTemp1: NativeUInt = $10000;
  AdTimbreTemp2: NativeUInt = $100F6;
  AdTimbreTemp3: NativeUInt = $101EC;
  AdTimbreTemp4: NativeUInt = $102E2;
  AdTimbreTemp5: NativeUInt = $103D8;
  AdTimbreTemp6: NativeUInt = $104CE;
  AdTimbreTemp7: NativeUInt = $105C4;
  AdTimbreTemp8: NativeUInt = $106BA;
  AdPatchMem: NativeUInt = $14000;
  AdTimbreMem: NativeUInt = $20000;
  AdSystem: NativeUInt = $40000;
  AdDisplay: NativeUInt = $80000;

type

  TWaveGen = record
    PitchCoarse: Byte;
    PitchFine: ShortInt;
    KeyFollow: ShortInt;
    PitchBend: Boolean;
    Shape: Byte;
    PCMSample: Byte;
    PulseWidth: Byte;
    VelSens: ShortInt;
  end;

  TPEnv = record
    Depth: Byte;
    VelSens: Byte;
    TimeKeyFollow: Byte;
    Time1: Byte;
    Time2: Byte;
    Time3: Byte;
    Time4: Byte;
    Level0: ShortInt;
    Level1: ShortInt;
    Level2: ShortInt;
    Sustain: ShortInt;
    EndLevel: ShortInt;
    LFORate: Byte;
    LFODepth: Byte;
    LFOModSens: Byte;
  end;

  TTVF = record
    Cutoff: Byte;
    Resonance: Byte;
    KeyFollow: Byte;
    BiasPoint: Byte;
    BiasLevel: ShortInt;
    Depth: Byte;
    VelSens: Byte;
    DepthKeyFollow: Byte;
    TimeKeyFollow: Byte;
    Time1: Byte;
    Time2: Byte;
    Time3: Byte;
    Time4: Byte;
    Time5: Byte;
    Level1: Byte;
    Level2: Byte;
    Level3: Byte;
    Sustain: Byte;
  end;

  TTVA = record
    Amplifier: Byte;
    VelSens: ShortInt;
    BiasPoint1: Byte;
    BiasLevel1: ShortInt;
    BiasPoint2: Byte;
    BiasLevel2: ShortInt;
    TimeKeyFollow: Byte;
    VelKeyFollow: Byte;
    Time1: Byte;
    Time2: Byte;
    Time3: Byte;
    Time4: Byte;
    Time5: Byte;
    Level1: Byte;
    Level2: Byte;
    Level3: Byte;
    Sustain: Byte;
  end;

  TGroupMem = array[0..63] of String;

  TPartial = record
    Mute: Boolean;
    WaveGen: TWaveGen;
    PitchEnv: TPEnv;
    TVF: TTVF;
    TVA: TTVA;
  end;

  TPart = record
    Name: String;
    Struct1: Byte;
    Struct2: Byte;
    SustainOn: Boolean;
    Partial: array[0..3] of TPartial;
  end;

  TPatch = record
    TmbGroup: Byte;
    TmbNumber: Byte;
    KeyShift: ShortInt;
    FineTune: ShortInt;
    BendRange: Byte;
    PolyMode: Byte;
    Reverb: Boolean;
    Output: Byte;
    Pan: ShortInt;
  end;

  TRhythm = record
    Timbre: Byte;
    Output: Byte;
    Pan: ShortInt;
    Reverb: Boolean;
  end;

  TSystem = record
    MasterTune: Byte;
    ReverbMode: Byte;
    ReverbTime: Byte;
    ReverbLevel: Byte;
    PtlReserve: array[0..8] of Byte;
    MidiChannel: array[0..8] of Byte;
    MasterVolume: Byte;
    ReserveSum: Integer;
  end;

  TPatchMem = record
    TmbGroup: Byte;
    TmbNumber: Byte;
    KeyShift: ShortInt;
    FineTune: ShortInt;
    BendRange: Byte;
    PolyMode: Byte;
    Reverb: Boolean;
  end;

  TSynth = record
    Patch: array[0..8] of TPatch;
    Rhythm: array[0..63] of TRhythm;
    Part: array[0..7] of TPart;
    PatchMem: array[0..127] of TPatchMem;
    TimbreMem: array[0..63] of TPart;
    System: TSystem;
    GroupMem: TGroupMem;
  end;

  TSysExAddr = array[0..2] of Byte;
  TPartialKind = (pkSynth, pkPCM);

  TFixedTrackBar = class(TTrackBar)
  public
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseWheelHandler(var Message: TMessagE); override;
  end;

  { TEditorForm }

  TEditorForm = class(TForm)
    Button1: TButton;
    Timer1: TTimer;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PageControl1: TPageControl;
    Debug: TTabSheet;
    TimbreTempArea: TTabSheet;
    PitchEnvGroup: TGroupBox;
    TVFGroup: TGroupBox;
    TVAGroup: TGroupBox;
    PEnvLevel0_label: TLabel;
    PEnvLevel1_label: TLabel;
    PEnvLevel2_label: TLabel;
    PEnvSus_label: TLabel;
    PEnvEnd_label: TLabel;
    PEnvPlot: TPaintBox;
    PEnvLevel1_value: TEdit;
    PEnvLevel2_value: TEdit;
    PEnvSustain_value: TEdit;
    PEnvEnd_value: TEdit;
    TVFLevel0_label: TLabel;
    TVFLevel2_label: TLabel;
    TVFLevel3_label: TLabel;
    TVFSustain_label: TLabel;
    TVFKeyFollow_label: TLabel;
    TVFPlot: TPaintBox;
    TVFLevel2_value: TEdit;
    TVFLevel3_value: TEdit;
    TVFSustain_value: TEdit;
    TVFKeyFollow_value: TEdit;
    TVALevel1_label: TLabel;
    TVALevel2_label: TLabel;
    TVALevel3_label: TLabel;
    TVASustain_label: TLabel;
    TVAPlot: TPaintBox;
    TVALevel2_value: TEdit;
    TVALevel3_value: TEdit;
    TVASustain_value: TEdit;
    TVAAmplifier_value: TEdit;
    TVFLevel1_value: TEdit;
    TVALevel1_value: TEdit;
    PEnvTime1_value: TEdit;
    PEnvTime2_value: TEdit;
    PEnvTime3_value: TEdit;
    PEnvTime4_value: TEdit;
    PEnvDepth_value: TEdit;
    PEnvLevel0_value: TEdit;
    PEnvVelSens_value: TEdit;
    PEnvDepth_label: TLabel;
    PEnvVelSens_label: TLabel;
    PEnvTimeKeyFollow_value: TEdit;
    PEnvTimeKeyFollow_label: TLabel;
    PEnvLFORate_label: TLabel;
    PEnvLFORate_value: TEdit;
    PEnvLFODepth_label: TLabel;
    PEnvLFODepth_value: TEdit;
    PEnvLFOModSens_label: TLabel;
    PEnvLFOModSens_value: TEdit;
    PEnvTime1_label: TLabel;
    PEnvTime2_label: TLabel;
    PEnvTime3_label: TLabel;
    PEnvLFORate: TKnobControl;
    PEnvLFODepth: TKnobControl;
    PEnvLFOModSens: TKnobControl;
    PEnvTime4_label: TLabel;
    TVFTime1_label: TLabel;
    TVFTime1_value: TEdit;
    TVFTime2_label: TLabel;
    TVFTime2_value: TEdit;
    TVFTime3_label: TLabel;
    TVFTime3_value: TEdit;
    TVFTime4_label: TLabel;
    TVFTime4_value: TEdit;
    TVFTime1: TKnobControl;
    TVFTime2: TKnobControl;
    TVFTime3: TKnobControl;
    TVFTime4: TKnobControl;
    TVFTime5: TKnobControl;
    TVFTime5_value: TEdit;
    TVFTime5_label: TLabel;
    PEnvTime1: TKnobControl;
    PEnvTime2: TKnobControl;
    PEnvTime3: TKnobControl;
    PEnvTime4: TKnobControl;
    PEnvLFOGroup: TGroupBox;
    TVFDepth_value: TEdit;
    TVFDepth_label: TLabel;
    TVFVelSens_label: TLabel;
    TVFVelSens_value: TEdit;
    TVFTimeKeyFollow_label: TLabel;
    TVFTimeKeyFollow_value: TEdit;
    TVFDepthKeyFollow_label: TLabel;
    TVFDepthKeyFollow_value: TEdit;
    TVFBiasLevel_label: TLabel;
    TVFBiasLevel_value: TEdit;
    TVFBiasPoint: TComboBox;
    TVFBiasPoint_label: TLabel;
    TVFFilterGroup: TGroupBox;
    TVFResonance_label: TLabel;
    TVFCutoff_label: TLabel;
    TVFResonance_value: TEdit;
    TVFCutoff_value: TEdit;
    TVFFilterPlot: TPaintBox;
    TVATime1_label: TLabel;
    TVATime2_label: TLabel;
    TVATime3_label: TLabel;
    TVATime4_label: TLabel;
    TVATime5_label: TLabel;
    TVATime1_value: TEdit;
    TVATime2_value: TEdit;
    TVATime3_value: TEdit;
    TVATime4_value: TEdit;
    TVATime1: TKnobControl;
    TVATime2: TKnobControl;
    TVATime3: TKnobControl;
    TVATime4: TKnobControl;
    TVATime5: TKnobControl;
    TVATime5_value: TEdit;
    TVAVelSens_value: TEdit;
    TVAVelSens_label: TLabel;
    TVATimeKeyFollow_label: TLabel;
    TVATimeKeyFollow_value: TEdit;
    TVAVelKeyFollow_label: TLabel;
    TVAVelKeyFollow_value: TEdit;
    TVABiasPoint1_label: TLabel;
    TVABiasPoint1: TComboBox;
    TVABiasLevel1_label: TLabel;
    TVABiasLevel1_value: TEdit;
    TVAAmpGroup: TGroupBox;
    TVAAmplifier_label: TLabel;
    TVABiasPoint2_label: TLabel;
    TVABiasPoint2: TComboBox;
    TVABiasLevel2_label: TLabel;
    TVABiasLevel2_value: TEdit;
    Memo1: TMemo;
    TimbreName_label: TLabel;
    EnvMode: TSpeedButton;
    TimbreName: TEdit;
    InitTimbreButton: TButton;
    OpenSyxButton: TButton;
    SaveSyxButton: TButton;
    PatchTempArea: TTabSheet;
    MasterVolume_label: TLabel;
    SyncTimbreButton: TButton;
    SyncAllButton: TBitBtn;
    RhythmSetup: TTabSheet;
    SystemArea: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    WaveGenGroup: TGroupBox;
    WGPulseWidth_label: TLabel;
    WGVelSens_label: TLabel;
    WGPitchBend: TSpeedButton;
    WGCoarse_label: TLabel;
    WGFine_label: TLabel;
    WGKeyFollow_label: TLabel;
    WGSample_label: TLabel;
    WGKeyFollowType: TLabel;
    WGCoarseType: TLabel;
    WGShape: TRadioGroup;
    WGPulseWidth_value: TEdit;
    WGVelSens_value: TEdit;
    WGCoarse_value: TEdit;
    WGFine_value: TEdit;
    WGKeyFollow_value: TEdit;
    PartialGroup: TGroupBox;
    PartialMute_label: TLabel;
    PartialStruct_label: TLabel;
    PartialMute1: TCheckBox;
    PartialMute2: TCheckBox;
    PartialMute3: TCheckBox;
    PartialMute4: TCheckBox;
    PartialStruct1: TComboBox;
    PartialStruct2: TComboBox;
    PartControlsGroup: TGroupBox;
    CurPart_label: TLabel;
    PartMidiChan_label: TLabel;
    PtRevButton: TSpeedButton;
    PtPitchBend_label: TLabel;
    CurPart: TComboBox;
    PartMidiChan: TComboBox;
    SelPartial1Button: TSpeedButton;
    SelPartial2Button: TSpeedButton;
    SelPartial3Button: TSpeedButton;
    SelPartial4Button: TSpeedButton;
    Partials_label: TLabel;
    PartialSelect_label: TLabel;
    PtBendRange: TSpinEdit;
    Pt1MixPanel: TPanel;
    Pt1Reverb: TSpeedButton;
    Pt1Output_label: TLabel;
    Pt1Pan_label: TLabel;
    Pt1Chan_label: TLabel;
    Pt1Enable: TSpeedButton;
    Pt1Bend_label: TLabel;
    Pt1Pan: TKnobControl;
    Pt1Pan_value: TSpinEdit;
    Pt1Chan: TSpinEdit;
    Pt1Output_value: TSpinEdit;
    Pt1Bend_value: TSpinEdit;
    Pt1Bend: TKnobControl;
    Pt1AdvPanel: TPanel;
    Pt1Bank_label: TLabel;
    Pt1Key_label: TLabel;
    Pt1Fine_label: TLabel;
    Pt1PtlReserve_label: TLabel;
    Pt1Poly_label: TLabel;
    Pt1Bank: TComboBox;
    Pt1Fine: TKnobControl;
    Pt1Fine_value: TSpinEdit;
    Pt1Key: TKnobControl;
    Pt1Key_value: TSpinEdit;
    Pt1Timbre: TComboBox;
    Pt1Poly: TComboBox;
    Pt1PtlReserve: TSpinEdit;
    Pt2MixPanel: TPanel;
    Pt2Reverb: TSpeedButton;
    Pt2Output_label: TLabel;
    Pt2Pan_label: TLabel;
    Pt2Chan_label: TLabel;
    Pt2Enable: TSpeedButton;
    Pt2Bend_label: TLabel;
    Pt2Pan: TKnobControl;
    Pt2Pan_value: TSpinEdit;
    Pt2Chan: TSpinEdit;
    Pt2Output_value: TSpinEdit;
    Pt2Bend_value: TSpinEdit;
    Pt2Bend: TKnobControl;
    Pt2AdvPanel: TPanel;
    Pt2Bank_label: TLabel;
    Pt2Key_label: TLabel;
    Pt2Fine_label: TLabel;
    Pt2PtlReserve_label: TLabel;
    Pt2Poly_label: TLabel;
    Pt2Bank: TComboBox;
    Pt2Fine: TKnobControl;
    Pt2Fine_value: TSpinEdit;
    Pt2Key: TKnobControl;
    Pt2Key_value: TSpinEdit;
    Pt2Timbre: TComboBox;
    Pt2Poly: TComboBox;
    Pt2PtlReserve: TSpinEdit;
    Pt3MixPanel: TPanel;
    Pt3Reverb: TSpeedButton;
    Pt3Output_label: TLabel;
    Pt3Pan_label: TLabel;
    Pt3Chan_label: TLabel;
    Pt3Enable: TSpeedButton;
    Pt3Bend_label: TLabel;
    Pt3Pan: TKnobControl;
    Pt3Pan_value: TSpinEdit;
    Pt3Chan: TSpinEdit;
    Pt3Output_value: TSpinEdit;
    Pt3Bend_value: TSpinEdit;
    Pt3Bend: TKnobControl;
    Pt3AdvPanel: TPanel;
    Pt3Bank_label: TLabel;
    Pt3Key_label: TLabel;
    Pt3Fine_label: TLabel;
    Pt3PtlReserve_label: TLabel;
    Pt3Poly_label: TLabel;
    Pt3Bank: TComboBox;
    Pt3Fine: TKnobControl;
    Pt3Fine_value: TSpinEdit;
    Pt3Key: TKnobControl;
    Pt3Key_value: TSpinEdit;
    Pt3Timbre: TComboBox;
    Pt3Poly: TComboBox;
    Pt3PtlReserve: TSpinEdit;
    Pt4MixPanel: TPanel;
    Pt4Reverb: TSpeedButton;
    Pt4Output_label: TLabel;
    Pt4Pan_label: TLabel;
    Pt4Chan_label: TLabel;
    Pt4Enable: TSpeedButton;
    Pt4Bend_label: TLabel;
    Pt4Pan: TKnobControl;
    Pt4Pan_value: TSpinEdit;
    Pt4Chan: TSpinEdit;
    Pt4Output_value: TSpinEdit;
    Pt4Bend_value: TSpinEdit;
    Pt4Bend: TKnobControl;
    Pt4AdvPanel: TPanel;
    Pt4Bank_label: TLabel;
    Pt4Key_label: TLabel;
    Pt4Fine_label: TLabel;
    Pt4PtlReserve_label: TLabel;
    Pt4Poly_label: TLabel;
    Pt4Bank: TComboBox;
    Pt4Fine: TKnobControl;
    Pt4Fine_value: TSpinEdit;
    Pt4Key: TKnobControl;
    Pt4Key_value: TSpinEdit;
    Pt4Timbre: TComboBox;
    Pt4Poly: TComboBox;
    Pt4PtlReserve: TSpinEdit;
    Pt5MixPanel: TPanel;
    Pt5Reverb: TSpeedButton;
    Pt5Output_label: TLabel;
    Pt5Pan_label: TLabel;
    Pt5Chan_label: TLabel;
    Pt5Enable: TSpeedButton;
    Pt5Bend_label: TLabel;
    Pt5Pan: TKnobControl;
    Pt5Pan_value: TSpinEdit;
    Pt5Chan: TSpinEdit;
    Pt5Output_value: TSpinEdit;
    Pt5Bend_value: TSpinEdit;
    Pt5Bend: TKnobControl;
    Pt5AdvPanel: TPanel;
    Pt5Bank_label: TLabel;
    Pt5Key_label: TLabel;
    Pt5Fine_label: TLabel;
    Pt5PtlReserve_label: TLabel;
    Pt5Poly_label: TLabel;
    Pt5Bank: TComboBox;
    Pt5Fine: TKnobControl;
    Pt5Fine_value: TSpinEdit;
    Pt5Key: TKnobControl;
    Pt5Key_value: TSpinEdit;
    Pt5Timbre: TComboBox;
    Pt5Poly: TComboBox;
    Pt5PtlReserve: TSpinEdit;
    Pt6MixPanel: TPanel;
    Pt6Reverb: TSpeedButton;
    Pt6Output_label: TLabel;
    Pt6Pan_label: TLabel;
    Pt6Chan_label: TLabel;
    Pt6Enable: TSpeedButton;
    Pt6Bend_label: TLabel;
    Pt6Pan: TKnobControl;
    Pt6Pan_value: TSpinEdit;
    Pt6Chan: TSpinEdit;
    Pt6Output_value: TSpinEdit;
    Pt6Bend_value: TSpinEdit;
    Pt6Bend: TKnobControl;
    Pt6AdvPanel: TPanel;
    Pt6Bank_label: TLabel;
    Pt6Key_label: TLabel;
    Pt6Fine_label: TLabel;
    Pt6PtlReserve_label: TLabel;
    Pt6Poly_label: TLabel;
    Pt6Bank: TComboBox;
    Pt6Fine: TKnobControl;
    Pt6Fine_value: TSpinEdit;
    Pt6Key: TKnobControl;
    Pt6Key_value: TSpinEdit;
    Pt6Timbre: TComboBox;
    Pt6Poly: TComboBox;
    Pt6PtlReserve: TSpinEdit;
    Pt7MixPanel: TPanel;
    Pt7Reverb: TSpeedButton;
    Pt7Output_label: TLabel;
    Pt7Pan_label: TLabel;
    Pt7Chan_label: TLabel;
    Pt7Enable: TSpeedButton;
    Pt7Bend_label: TLabel;
    Pt7Pan: TKnobControl;
    Pt7Pan_value: TSpinEdit;
    Pt7Chan: TSpinEdit;
    Pt7Output_value: TSpinEdit;
    Pt7Bend_value: TSpinEdit;
    Pt7Bend: TKnobControl;
    Pt7AdvPanel: TPanel;
    Pt7Bank_label: TLabel;
    Pt7Key_label: TLabel;
    Pt7Fine_label: TLabel;
    Pt7PtlReserve_label: TLabel;
    Pt7Poly_label: TLabel;
    Pt7Bank: TComboBox;
    Pt7Fine: TKnobControl;
    Pt7Fine_value: TSpinEdit;
    Pt7Key: TKnobControl;
    Pt7Key_value: TSpinEdit;
    Pt7Timbre: TComboBox;
    Pt7Poly: TComboBox;
    Pt7PtlReserve: TSpinEdit;
    Pt8MixPanel: TPanel;
    Pt8Reverb: TSpeedButton;
    Pt8Output_label: TLabel;
    Pt8Pan_label: TLabel;
    Pt8Chan_label: TLabel;
    Pt8Enable: TSpeedButton;
    Pt8Bend_label: TLabel;
    Pt8Pan: TKnobControl;
    Pt8Pan_value: TSpinEdit;
    Pt8Chan: TSpinEdit;
    Pt8Output_value: TSpinEdit;
    Pt8Bend_value: TSpinEdit;
    Pt8Bend: TKnobControl;
    Pt8AdvPanel: TPanel;
    Pt8Bank_label: TLabel;
    Pt8Key_label: TLabel;
    Pt8Fine_label: TLabel;
    Pt8PtlReserve_label: TLabel;
    Pt8Poly_label: TLabel;
    Pt8Bank: TComboBox;
    Pt8Fine: TKnobControl;
    Pt8Fine_value: TSpinEdit;
    Pt8Key: TKnobControl;
    Pt8Key_value: TSpinEdit;
    Pt8Timbre: TComboBox;
    Pt8Poly: TComboBox;
    Pt8PtlReserve: TSpinEdit;
    PtRMixPanel: TPanel;
    PtROutput_label: TLabel;
    PtRChan_label: TLabel;
    PtREnable: TSpeedButton;
    PtRBend_label: TLabel;
    PtRChan: TSpinEdit;
    PtROutput_value: TSpinEdit;
    PtRBend_value: TSpinEdit;
    PtRBend: TKnobControl;
    PtRAdvPanel: TPanel;
    PtRKey_label: TLabel;
    PtRFine_label: TLabel;
    PtRPtlReserve_label: TLabel;
    PtRPoly_label: TLabel;
    PtRFine: TKnobControl;
    PtRFine_value: TSpinEdit;
    PtRKey: TKnobControl;
    PtRKey_value: TSpinEdit;
    PtRPoly: TComboBox;
    PtRPtlReserve: TSpinEdit;
    Synth1Toggle: TSpeedButton;
    Synth2Toggle: TSpeedButton;
    WGSample: TListBox;
    MixAdvanceToggle: TSpeedButton;
    MasterVolume_value: TSpinEdit;
    Pt1Output: TSynthSlider;
    MasterVolume: TSynthSlider;
    WGPulseWidth: TSynthSlider;
    WGVelSens: TSynthSlider;
    WGCoarse: TSynthSlider;
    WGFine: TSynthSlider;
    WGKeyFollow: TSynthSlider;
    PEnvLevel0: TSynthSlider;
    PEnvLevel1: TSynthSlider;
    PEnvLevel2: TSynthSlider;
    PEnvSustain: TSynthSlider;
    PEnvEnd: TSynthSlider;
    TVFLevel1: TSynthSlider;
    TVFLevel3: TSynthSlider;
    TVFLevel2: TSynthSlider;
    TVFSustain: TSynthSlider;
    TVFKeyFollow: TSynthSlider;
    PEnvDepth: TSynthSlider;
    PEnvTimeKeyFollow: TSynthSlider;
    PEnvVelSens: TSynthSlider;
    TVFCutoff: TSynthSlider;
    TVFResonance: TSynthSlider;
    TVFDepth: TSynthSlider;
    TVFDepthKeyFollow: TSynthSlider;
    TVFVelSens: TSynthSlider;
    TVFTimeKeyFollow: TSynthSlider;
    TVFBiasLevel: TSynthSlider;
    TVALevel1: TSynthSlider;
    TVALevel2: TSynthSlider;
    TVALevel3: TSynthSlider;
    TVASustain: TSynthSlider;
    TVAAmplifier: TSynthSlider;
    TVAVelSens: TSynthSlider;
    TVATimeKeyFollow: TSynthSlider;
    TVAVelKeyFollow: TSynthSlider;
    TVABiasLevel1: TSynthSlider;
    TVABiasLevel2: TSynthSlider;
    Pt2Output: TSynthSlider;
    Pt3Output: TSynthSlider;
    Pt4Output: TSynthSlider;
    Pt5Output: TSynthSlider;
    Pt6Output: TSynthSlider;
    Pt7Output: TSynthSlider;
    Pt8Output: TSynthSlider;
    PtROutput: TSynthSlider;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SendCurrentSysEx;

    procedure LoadAllDataFromMunt;
    procedure RefreshTimbre;
    procedure DecodeSystem(const Buf: array of Byte; var Dest: TSystem);
    procedure DecodePatch(const Buf: array of Byte; var Dest: TPatch);
    procedure DecodeRhythm(const Buf: array of Byte; var Dest: TRhythm);
    procedure DecodeTimbrePart(const Buf: array of Byte; var Dest: TPart);
    procedure DecodePartial(const Buf: array of Byte; Offset: Integer; var Dest: TPartial);
    procedure DecodePatchMem(const Buf: array of Byte; var Dest: TPatchMem);
    procedure RefreshVisibleControls;
    procedure RefreshPartControls;
    procedure RefreshPartialControls;
    procedure RefreshStructs;
    procedure RefreshEnvelopePlots;
    procedure RefreshPatchControls;
    procedure RefreshAllGroupMemCombos;
    procedure SetSynthColors;

    procedure SetWGSynth;
    procedure SetWGPCM;
    procedure EnableTVF;
    procedure DisableTVF;

    procedure DrawTVFFilterGraph(PaintBox: TPaintBox);

    function AllowSignedNumericKey(Edit: TEdit; var Key: Char): Boolean;
    procedure PressedKey(Sender: TObject; var Key: Char);

    procedure CurPartChange(Sender: TObject);
    procedure PartMidiChanChange(Sender: TObject);

    procedure PartialMute1Click(Sender: TObject);
    procedure PartialMute2Click(Sender: TObject);
    procedure PartialMute3Click(Sender: TObject);
    procedure PartialMute4Click(Sender: TObject);
    procedure PartialStruct1Change(Sender: TObject);
    procedure PartialStruct2Change(Sender: TObject);
    procedure TimbreNameExit(Sender: TObject);
    procedure TimbreNameKeyPress(Sender: TObject; var Key: Char);
    procedure EnvModeClick(Sender: TObject);
    procedure PtRevButtonClick(Sender: TObject);
    procedure PtBendRangeChange(Sender: TObject);
    procedure PtBendRangeKeyPress(Sender: TObject; var Key: Char);

    procedure OpenSyxButtonClick(Sender: TObject);
    procedure SaveSyxButtonClick(Sender: TObject);
    procedure SyncTimbreButtonClick(Sender: TObject);
    procedure InitTimbreButtonClick(Sender: TObject);

    procedure SelPartial1ButtonClick(Sender: TObject);
    procedure SelPartial2ButtonClick(Sender: TObject);
    procedure SelPartial3ButtonClick(Sender: TObject);
    procedure SelPartial4ButtonClick(Sender: TObject);

    procedure WGShapeClick(Sender: TObject);
    procedure WGPitchBendClick(Sender: TObject);
    procedure WGFine_valueKeyPress(Sender: TObject; var Key: Char);
    procedure WGVelSens_valueKeyPress(Sender: TObject; var Key: Char);
    procedure WGPulseWidth_valueKeyPress(Sender: TObject; var Key: Char);
    procedure WGKeyFollow_valueKeyPress(Sender: TObject; var Key: Char);
    procedure WGCoarse_valueKeyPress(Sender: TObject; var Key: Char);
    procedure WGSampleClick(Sender: TObject);
    procedure WGPulseWidthChange(Sender: TObject);
    procedure WGVelSensChange(Sender: TObject);
    procedure WGCoarseChange(Sender: TObject);
    procedure WGFineChange(Sender: TObject);
    procedure WGKeyFollowChange(Sender: TObject);
    procedure WGCoarse_valueExit(Sender: TObject);
    procedure WGKeyFollow_valueExit(Sender: TObject);
    procedure WGFine_valueExit(Sender: TObject);
    procedure WGPulseWidth_valueExit(Sender: TObject);
    procedure WGVelSens_valueExit(Sender: TObject);

    procedure PEnvLevel1Change(Sender: TObject);
    procedure PEnvLevel2Change(Sender: TObject);
    procedure PEnvSustainChange(Sender: TObject);
    procedure PEnvEndChange(Sender: TObject);
    procedure PEnvLevel0_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvLevel1_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvLevel2_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvSustain_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvEnd_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvTime1Change(Sender: TObject);
    procedure PEnvTime2Change(Sender: TObject);
    procedure PEnvTime3Change(Sender: TObject);
    procedure PEnvTime4Change(Sender: TObject);
    procedure PEnvTime1_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvTime2_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvTime3_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvTime4_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvVelSens_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvDepth_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvPlotPaint(Sender: TObject);
    procedure PEnvTimeKeyFollow_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvLFORateChange(Sender: TObject);
    procedure PEnvLFODepthChange(Sender: TObject);
    procedure PEnvLFOModSensChange(Sender: TObject);
    procedure PEnvLFORate_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvLFODepth_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvLFOModSens_valueKeyPress(Sender: TObject; var Key: Char);
    procedure PEnvDepth_valueExit(Sender: TObject);
    procedure PEnvLevel0_valueExit(Sender: TObject);
    procedure PEnvLevel1_valueExit(Sender: TObject);
    procedure PEnvEnd_valueExit(Sender: TObject);
    procedure PEnvLFODepth_valueExit(Sender: TObject);
    procedure PEnvLFORate_valueExit(Sender: TObject);
    procedure PEnvLFOModSens_valueExit(Sender: TObject);
    procedure PEnvLevel2_valueExit(Sender: TObject);
    procedure PEnvSustain_valueExit(Sender: TObject);
    procedure PEnvTime1_valueExit(Sender: TObject);
    procedure PEnvTimeKeyFollow_valueExit(Sender: TObject);
    procedure PEnvVelSens_valueExit(Sender: TObject);
    procedure PEnvDepthChange(Sender: TObject);
    procedure PEnvTimeKeyFollowChange(Sender: TObject);
    procedure PEnvVelSensChange(Sender: TObject);

    procedure TVFLevel1_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFLevel1_valueExit(Sender: TObject);
    procedure TVFLevel2_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFLevel2_valueExit(Sender: TObject);
    procedure TVFLevel3_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFSustain_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFKeyFollow_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFPlotPaint(Sender: TObject);
    procedure TVFCutoff_valueExit(Sender: TObject);
    procedure TVFCutoff_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFResonance_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFFilterPlotPaint(Sender: TObject);
    procedure TVFKeyFollow_valueExit(Sender: TObject);
    procedure TVFLevel3_valueExit(Sender: TObject);
    procedure TVFResonance_valueExit(Sender: TObject);
    procedure TVFSustain_valueExit(Sender: TObject);
    procedure TVFTime1Change(Sender: TObject);
    procedure TVFTime1_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFTime1_valueExit(Sender: TObject);
    procedure TVFTime2Change(Sender: TObject);
    procedure TVFTime2_valueExit(Sender: TObject);
    procedure TVFTime2_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFTime3Change(Sender: TObject);
    procedure TVFTime4Change(Sender: TObject);
    procedure TVFTime5Change(Sender: TObject);
    procedure TVFTime3_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFTime4_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFTime5_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFTime3_valueExit(Sender: TObject);
    procedure TVFTime4_valueExit(Sender: TObject);
    procedure TVFTime5_valueExit(Sender: TObject);
    procedure TVFDepth_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFDepth_valueExit(Sender: TObject);
    procedure TVFVelSens_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFVelSens_valueExit(Sender: TObject);
    procedure TVFTimeKeyFollow_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFTimeKeyFollow_valueExit(Sender: TObject);
    procedure TVFBiasPointChange(Sender: TObject);
    procedure TVFBiasLevel_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFBiasLevel_valueExit(Sender: TObject);
    procedure TVFDepthKeyFollow_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVFDepthKeyFollow_valueExit(Sender: TObject);
    procedure TVFLevel1Change(Sender: TObject);
    procedure TVFLevel2Change(Sender: TObject);
    procedure TVFLevel3Change(Sender: TObject);
    procedure TVFSustainChange(Sender: TObject);
    procedure TVFKeyFollowChange(Sender: TObject);
    procedure TVFCutoffChange(Sender: TObject);
    procedure TVFResonanceChange(Sender: TObject);
    procedure TVFDepthChange(Sender: TObject);
    procedure TVFDepthKeyFollowChange(Sender: TObject);
    procedure TVFVelSensChange(Sender: TObject);
    procedure TVFTimeKeyFollowChange(Sender: TObject);
    procedure TVFBiasLevelChange(Sender: TObject);

    procedure TVATime1Change(Sender: TObject);
    procedure TVATime1_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVATime2Change(Sender: TObject);
    procedure TVATime2_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVATime3Change(Sender: TObject);
    procedure TVATime3_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVATime4Change(Sender: TObject);
    procedure TVATime4_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVATime5Change(Sender: TObject);
    procedure TVATime5_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVABiasPoint1Change(Sender: TObject);
    procedure TVABiasPoint2Change(Sender: TObject);
    procedure TVALevel1Change(Sender: TObject);
    procedure TVALevel1_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVALevel2Change(Sender: TObject);
    procedure TVALevel2_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVALevel3Change(Sender: TObject);
    procedure TVALevel3_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVASustainChange(Sender: TObject);
    procedure TVASustain_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVAAmplifierChange(Sender: TObject);
    procedure TVAAmplifier_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVAVelSensChange(Sender: TObject);
    procedure TVAVelSens_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVATimeKeyFollowChange(Sender: TObject);
    procedure TVATimeKeyFollow_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVAVelKeyFollowChange(Sender: TObject);
    procedure TVAVelKeyFollow_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVABiasLevel1Change(Sender: TObject);
    procedure TVABiasLevel1_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVABiasLevel2Change(Sender: TObject);
    procedure TVABiasLevel2_valueKeyPress(Sender: TObject; var Key: Char);
    procedure TVALevel1_valueExit(Sender: TObject);
    procedure TVALevel2_valueExit(Sender: TObject);
    procedure TVALevel3_valueExit(Sender: TObject);
    procedure TVASustain_valueExit(Sender: TObject);
    procedure TVAAmplifier_valueExit(Sender: TObject);
    procedure TVATime1_valueExit(Sender: TObject);
    procedure TVATime2_valueExit(Sender: TObject);
    procedure TVATime3_valueExit(Sender: TObject);
    procedure TVATime4_valueExit(Sender: TObject);
    procedure TVATime5_valueExit(Sender: TObject);
    procedure TVAVelSens_valueExit(Sender: TObject);
    procedure TVATimeKeyFollow_valueExit(Sender: TObject);
    procedure TVAVelKeyFollow_valueExit(Sender: TObject);
    procedure TVABiasLevel1_valueExit(Sender: TObject);
    procedure TVABiasLevel2_valueExit(Sender: TObject);
    procedure TVAPlotPaint(Sender: TObject);

    procedure MixAdvanceToggleClick(Sender: TObject);

    procedure Pt1ReverbClick(Sender: TObject);
    procedure Pt1EnableClick(Sender: TObject);
    procedure Pt1ChanChange(Sender: TObject);
    procedure Pt1PolyChange(Sender: TObject);
    procedure Pt1PtlReserveChange(Sender: TObject);
    procedure Pt1BankChange(Sender: TObject);
    procedure Pt1TimbreChange(Sender: TObject);
    procedure Pt1KeyChange(Sender: TObject);
    procedure Pt1Key_valueChange(Sender: TObject);
    procedure Pt1FineChange(Sender: TObject);
    procedure Pt1Fine_valueChange(Sender: TObject);
    procedure Pt1BendChange(Sender: TObject);
    procedure Pt1Bend_valueChange(Sender: TObject);
    procedure Pt1PanChange(Sender: TObject);
    procedure Pt1Pan_valueChange(Sender: TObject);
    procedure Pt1OutputChange(Sender: TObject);
    procedure Pt1Output_valueChange(Sender: TObject);

    procedure Pt2EnableClick(Sender: TObject);
    procedure Pt2ReverbClick(Sender: TObject);
    procedure Pt2ChanChange(Sender: TObject);
    procedure Pt2PolyChange(Sender: TObject);
    procedure Pt2PtlReserveChange(Sender: TObject);
    procedure Pt2BankChange(Sender: TObject);
    procedure Pt2TimbreChange(Sender: TObject);
    procedure Pt2KeyChange(Sender: TObject);
    procedure Pt2FineChange(Sender: TObject);
    procedure Pt2Key_valueChange(Sender: TObject);
    procedure Pt2Fine_valueChange(Sender: TObject);
    procedure Pt2BendChange(Sender: TObject);
    procedure Pt2Bend_valueChange(Sender: TObject);
    procedure Pt2PanChange(Sender: TObject);
    procedure Pt2Pan_valueChange(Sender: TObject);
    procedure Pt2OutputChange(Sender: TObject);
    procedure Pt2Output_valueChange(Sender: TObject);

    procedure Pt3EnableClick(Sender: TObject);
    procedure Pt3ReverbClick(Sender: TObject);
    procedure Pt3ChanChange(Sender: TObject);
    procedure Pt3PolyChange(Sender: TObject);
    procedure Pt3PtlReserveChange(Sender: TObject);
    procedure Pt3BankChange(Sender: TObject);
    procedure Pt3TimbreChange(Sender: TObject);
    procedure Pt3KeyChange(Sender: TObject);
    procedure Pt3FineChange(Sender: TObject);
    procedure Pt3Key_valueChange(Sender: TObject);
    procedure Pt3Fine_valueChange(Sender: TObject);
    procedure Pt3BendChange(Sender: TObject);
    procedure Pt3Bend_valueChange(Sender: TObject);
    procedure Pt3PanChange(Sender: TObject);
    procedure Pt3Pan_valueChange(Sender: TObject);
    procedure Pt3OutputChange(Sender: TObject);
    procedure Pt3Output_valueChange(Sender: TObject);

    procedure Pt4ReverbClick(Sender: TObject);
    procedure Pt4EnableClick(Sender: TObject);
    procedure Pt4ChanChange(Sender: TObject);
    procedure Pt4PolyChange(Sender: TObject);
    procedure Pt4PtlReserveChange(Sender: TObject);
    procedure Pt4BankChange(Sender: TObject);
    procedure Pt4TimbreChange(Sender: TObject);
    procedure Pt4KeyChange(Sender: TObject);
    procedure Pt4Key_valueChange(Sender: TObject);
    procedure Pt4FineChange(Sender: TObject);
    procedure Pt4Fine_valueChange(Sender: TObject);
    procedure Pt4BendChange(Sender: TObject);
    procedure Pt4Bend_valueChange(Sender: TObject);
    procedure Pt4PanChange(Sender: TObject);
    procedure Pt4Pan_valueChange(Sender: TObject);
    procedure Pt4OutputChange(Sender: TObject);
    procedure Pt4Output_valueChange(Sender: TObject);

    procedure Pt5EnableClick(Sender: TObject);
    procedure Pt5ReverbClick(Sender: TObject);
    procedure Pt5ChanChange(Sender: TObject);
    procedure Pt5PolyChange(Sender: TObject);
    procedure Pt5PtlReserveChange(Sender: TObject);
    procedure Pt5BankChange(Sender: TObject);
    procedure Pt5TimbreChange(Sender: TObject);
    procedure Pt5KeyChange(Sender: TObject);
    procedure Pt5FineChange(Sender: TObject);
    procedure Pt5Key_valueChange(Sender: TObject);
    procedure Pt5Fine_valueChange(Sender: TObject);
    procedure Pt5BendChange(Sender: TObject);
    procedure Pt5Bend_valueChange(Sender: TObject);
    procedure Pt5PanChange(Sender: TObject);
    procedure Pt5Pan_valueChange(Sender: TObject);
    procedure Pt5OutputChange(Sender: TObject);
    procedure Pt5Output_valueChange(Sender: TObject);

    procedure Pt6EnableClick(Sender: TObject);
    procedure Pt6ReverbClick(Sender: TObject);
    procedure Pt6ChanChange(Sender: TObject);
    procedure Pt6PolyChange(Sender: TObject);
    procedure Pt6PtlReserveChange(Sender: TObject);
    procedure Pt6BankChange(Sender: TObject);
    procedure Pt6TimbreChange(Sender: TObject);
    procedure Pt6KeyChange(Sender: TObject);
    procedure Pt6FineChange(Sender: TObject);
    procedure Pt6Key_valueChange(Sender: TObject);
    procedure Pt6Fine_valueChange(Sender: TObject);
    procedure Pt6BendChange(Sender: TObject);
    procedure Pt6Bend_valueChange(Sender: TObject);
    procedure Pt6PanChange(Sender: TObject);
    procedure Pt6Pan_valueChange(Sender: TObject);
    procedure Pt6OutputChange(Sender: TObject);
    procedure Pt6Output_valueChange(Sender: TObject);

    procedure Pt7EnableClick(Sender: TObject);
    procedure Pt7ReverbClick(Sender: TObject);
    procedure Pt7ChanChange(Sender: TObject);
    procedure Pt7PolyChange(Sender: TObject);
    procedure Pt7PtlReserveChange(Sender: TObject);
    procedure Pt7BankChange(Sender: TObject);
    procedure Pt7TimbreChange(Sender: TObject);
    procedure Pt7KeyChange(Sender: TObject);
    procedure Pt7FineChange(Sender: TObject);
    procedure Pt7Key_valueChange(Sender: TObject);
    procedure Pt7Fine_valueChange(Sender: TObject);
    procedure Pt7BendChange(Sender: TObject);
    procedure Pt7Bend_valueChange(Sender: TObject);
    procedure Pt7PanChange(Sender: TObject);
    procedure Pt7Pan_valueChange(Sender: TObject);
    procedure Pt7OutputChange(Sender: TObject);
    procedure Pt7Output_valueChange(Sender: TObject);

    procedure Pt8EnableClick(Sender: TObject);
    procedure Pt8ReverbClick(Sender: TObject);
    procedure Pt8ChanChange(Sender: TObject);
    procedure Pt8PolyChange(Sender: TObject);
    procedure Pt8PtlReserveChange(Sender: TObject);
    procedure Pt8BankChange(Sender: TObject);
    procedure Pt8TimbreChange(Sender: TObject);
    procedure Pt8KeyChange(Sender: TObject);
    procedure Pt8FineChange(Sender: TObject);
    procedure Pt8Key_valueChange(Sender: TObject);
    procedure Pt8Fine_valueChange(Sender: TObject);
    procedure Pt8BendChange(Sender: TObject);
    procedure Pt8Bend_valueChange(Sender: TObject);
    procedure Pt8PanChange(Sender: TObject);
    procedure Pt8Pan_valueChange(Sender: TObject);
    procedure Pt8OutputChange(Sender: TObject);
    procedure Pt8Output_valueChange(Sender: TObject);

    procedure PtREnableClick(Sender: TObject);
    procedure PtRChanChange(Sender: TObject);
    procedure PtRPolyChange(Sender: TObject);
    procedure PtRPtlReserveChange(Sender: TObject);
    procedure PtRKeyChange(Sender: TObject);
    procedure PtRFineChange(Sender: TObject);
    procedure PtRKey_valueChange(Sender: TObject);
    procedure PtRFine_valueChange(Sender: TObject);
    procedure PtRBendChange(Sender: TObject);
    procedure PtRBend_valueChange(Sender: TObject);
    procedure PtROutputChange(Sender: TObject);
    procedure PtROutput_valueChange(Sender: TObject);

    procedure SyncAllButtonClick(Sender: TObject);
    procedure Synth1ToggleClick(Sender: TObject);
    procedure Synth2ToggleClick(Sender: TObject);
    procedure MasterVolume_valueChange(Sender: TObject);
    procedure MasterVolumeChange(Sender: TObject);

  private
    { Private declarations }
    SysExAddress: TSysExAddr;
    SysExData: TBytes;
    UpdatingControls: Boolean;

    Synth: array[0..1] of TSynth;

    CurSyn: Byte;
    CurPt: Byte;
    CurPtl: Byte;
    CurPtc: Byte;

    clSynthText: TColor;
    clSliderThumb: TColor;
    clSliderFill: TColor;

    function BuildSysEx: TBytes;
    function MuntReady: Boolean;
    function GetByte(Addr: Cardinal; Synth: Integer): Byte;{ overload;
    function GetByte(Addr: Cardinal): Byte; overload;       }
    procedure GetData(Addr: Cardinal; Size: Cardinal; Data: Pointer; Synth: Integer); {overload;
    procedure GetData(Addr: Cardinal; Size: Cardinal; Data: Pointer); overload;        }
    function BytesToStr(const Buf: array of Byte; Offset, Count: Integer): string;
    function StrToBytes(const S: string): TBytes;
    procedure BuildMuteByte;
    function LinearAddrToBytes(Addr: NativeUInt): TSysExAddr;

    procedure LoadTimbreNames(BankCombo: TComboBox; TimbreCombo: TComboBox);
    procedure ResolvePartialStructure;
    function IsPartialPCM(const StructValue: Byte; const PairIndex: Integer): Boolean;
    function BuildMT32StructValue(
      UIShape1: TPartialKind;
      UIShape2: TPartialKind;
      UIStruct: Integer;
      out ForcedShape1: TPartialKind;
      out ForcedShape2: TPartialKind
    ): Byte;
    procedure ApplyPartialStructState(APair: Integer);

  public
    { Public declarations }
    MuntVSTiHwndHandle: Thandle;
    MuntVSTiInstance: Pointer;
    PHandlerInterface_v1: Pmt32edit_report_handler_i_v1;
  end;

var
  editorForm: TEditorForm;

implementation

{$R *.DFM}

procedure TFixedTrackBar.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_LEFT, VK_DOWN:
      begin
        Position := Position - LineSize;
        Key := 0;
      end;

    VK_RIGHT, VK_UP:
      begin
        Position := Position + LineSize;
        Key := 0;
      end;
  else
    inherited;
  end;
end;

procedure TFixedTrackBar.MouseWheelHandler(var Message: TMessage);
var
  Delta: SmallInt;
begin
  Delta := SmallInt(HiWord(Message.WParam));

  if Delta > 0 then
    Position := Position + LineSize
  else
    Position := Position - LineSize;

  Message.Result := 1;
end;

procedure TEditorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MuntReady then
    PHandlerInterface_v1.onClose(MuntVSTiInstance);

  Action := caFree;
end;

procedure TEditorForm.FormCreate(Sender: TObject);
begin
  PEnvPlot.controlstyle := PEnvPlot.controlstyle + [csopaque];
  TVFPlot.controlstyle := TVFPlot.controlstyle + [csopaque];
  TVFFilterPlot.controlstyle := TVFFilterPlot.controlstyle + [csopaque];
  TVAPlot.controlstyle := TVAPlot.controlstyle + [csopaque];
end;

procedure TEditorForm.FormShow(Sender: TObject);
{var
  i: Integer; }
begin
  UpdatingControls := True;
  CurPt := Byte(CurPart.ItemIndex);
  CurPtl := 0;
  CurPtc := 0;
  CurSyn := 0;
  SelPartial1Button.Down := True;

  // Initialize GroupMem with blank 64 10-character names
  {for i := 0 to 63 do
  begin
    Synth[0].GroupMem[i] := StringOfChar(' ', 10);
    Synth[1].GroupMem[i] := StringOfChar(' ', 10);
  end;}

  {ComboBox2.Items.Clear;
  for i := Low(GroupA_Names) to High(GroupA_Names) do
    ComboBox2.Items.Add(GroupA_Names[i]);
  }
  UpdatingControls := False;
end;


{ SysEx Building Procedures }

function TEditorForm.BuildSysEx: TBytes;
var
  i, idx, sum: Integer;
begin
  SetLength(Result,
    Length(SysExHeader) +
    Length(SysExAddress) +
    Length(SysExData) +
    2 // checksum + F7
  );

  idx := 0;

  for i := 0 to High(SysExHeader) do
  begin
    Result[idx] := SysExHeader[i];
    Inc(idx);
  end;

  for i := 0 to 2 do
  begin
    Result[idx] := SysExAddress[i];
    Inc(idx);
  end;

  for i := 0 to High(SysExData) do
  begin
    Result[idx] := SysExData[i];
    Inc(idx);
  end;

  sum := 0;

  for i := 0 to 2 do
      sum := sum + SysExAddress[i];

  for i := 0 to High(SysExData) do
      sum := sum + SysExData[i];

  sum := sum mod 128;

  Result[idx] := (128 - sum) mod 128;
  Inc(idx);

  Result[idx] := $F7;

end;

procedure TEditorForm.SendCurrentSysEx;
var
{  j: Integer;
  de: string;}
  msg: TBytes;
begin
  if not MuntReady then
    Exit;

  msg := BuildSysEx;

{  for j := 0 to High(msg) do
  begin
    de := de + IntToHex(msg[j],2) + ' ';
  end;
  ShowMessage(de);}

  PHandlerInterface_v1.sendSysExMessage(
    MuntVSTiInstance,
    @msg[0],
    Length(msg),
    CurSyn+1
  );
end;

function TEditorForm.MuntReady: Boolean;
begin
  Result := (PHandlerInterface_v1 <> nil) and (MuntVSTiInstance <> nil);
end;
{
function TEditorForm.GetByte(Addr: Cardinal): Byte;
begin
  Result := 0;

  if not MuntReady then Exit;

  PHandlerInterface_v1.readMemory(
    MuntVSTiInstance,
    Addr,
    1,
    @Result
  );
end;
}
function TEditorForm.GetByte(Addr: Cardinal; Synth: Integer): Byte;
begin
  Result := 0;

  if not MuntReady then Exit;

  PHandlerInterface_v1.readMemory(
    MuntVSTiInstance,
    Addr,
    1,
    @Result,
    Synth+1
  );
end;

procedure TEditorForm.GetData(Addr: Cardinal; Size: Cardinal; Data: Pointer; Synth: Integer);
begin
  if not MuntReady then Exit;
  PHandlerInterface_v1.readMemory(
    MuntVSTiInstance,
    Addr,
    Size,
    Data,
    Synth+1
  );
end;
{
procedure TEditorForm.GetData(Addr: Cardinal; Size: Cardinal; Data: Pointer);
begin
  if not MuntReady then Exit;
  PHandlerInterface_v1.readMemory(
    MuntVSTiInstance,
    Addr,
    Size,
    Data
  );
end;
}

function TEditorForm.BytesToStr(const Buf: array of Byte; Offset, Count: Integer): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Count - 1 do
    Result := Result + Char(Buf[Offset + i]);

  Result := TrimRight(Result);
end;

function TEditorForm.StrToBytes(const S: string): TBytes;
var
  i: Integer;
  FixedName: string;
begin
  FixedName := Copy(S + StringOfChar(' ',10), 1, 10);

  SetLength(Result, 10);

  for i := 1 to 10 do
    Result[i - 1] := Byte(Ord(FixedName[i]));
end;

function TEditorForm.LinearAddrToBytes(Addr: NativeUInt): TSysExAddr;
begin
  Result[0] := Byte((Addr div $4000) and $7F);
  Result[1] := Byte((Addr div $80) and $7F);
  Result[2] := Byte(Addr and $7F);
end;

procedure TEditorForm.SyncAllButtonClick(Sender: TObject);
begin
  LoadAllDataFromMunt;
  UpdatingControls := True;
  RefreshVisibleControls;
  MasterVolume.Position := Synth[CurSyn].System.MasterVolume;
  MasterVolume_value.Text := IntToStr(Synth[CurSyn].System.MasterVolume);
  UpdatingControls := False;

  ActiveControl := nil;
end;

procedure TEditorForm.SyncTimbreButtonClick(Sender: TObject);
begin
  RefreshTimbre;
end;

procedure TEditorForm.Synth1ToggleClick(Sender: TObject);
begin
  if not MuntReady then Exit;

  if CurSyn <> 0 then CurSyn := 0;
  Synth1Toggle.Font.Style := [fsBold];
  Synth2Toggle.Font.Style := [];
  RefreshVisibleControls;
end;

procedure TEditorForm.Synth2ToggleClick(Sender: TObject);
begin
  if not MuntReady then Exit;
  
  if CurSyn <> 1 then CurSyn := 1;
  Synth2Toggle.Font.Style := [fsBold];
  Synth1Toggle.Font.Style := [];
  RefreshVisibleControls;
end;

procedure TEditorForm.InitTimbreButtonClick(Sender: TObject);
begin
  if MessageDlg(
      'Really clear all current Timbre settings? (WARNING: Cannot be undone!)',
      mtConfirmation,
      [mbOK, mbCancel],
      0
      ) = mrOK then
  begin
    SysExAddress := LinearAddrToBytes(
      AdTimbreTemp +
      (CurPt * $F6)
    );
    SetLength(SysExData, $F6);
    Move(InitTimbre[0], SysExData[0], Length(InitTimbre));
    SendCurrentSysEx;
    Sleep(400);
    RefreshTimbre;
  end;
end;

function TEditorForm.IsPartialPCM(const StructValue: Byte; const PairIndex: Integer): Boolean;
begin
  // PairIndex: 0 = first partial in pair, 1 = second partial in pair

  case StructValue of
    // P1 + S2 forms
    2, 3, 10:
      Result := PairIndex = 0;

    // S1 + P2 forms
    4, 11:
      Result := PairIndex = 1;

    // P1 + P2 forms
    5, 6, 8, 12:
      Result := True;

  else
    Result := False;
  end;
end;

function TEditorForm.BuildMT32StructValue(
  UIShape1: TPartialKind;
  UIShape2: TPartialKind;
  UIStruct: Integer;
  out ForcedShape1: TPartialKind;
  out ForcedShape2: TPartialKind
): Byte;
begin
  ForcedShape1 := UIShape1;
  ForcedShape2 := UIShape2;

  case UIStruct of

    // 0: (P1 + P2)
    0:
      begin
        if (UIShape1 = pkSynth) and (UIShape2 = pkSynth) then
          Result := 0                         // S1 + S2
        else if (UIShape1 = pkPCM) and (UIShape2 = pkSynth) then
          Result := 2                         // P1 + S2
        else if (UIShape1 = pkPCM) and (UIShape2 = pkPCM) then
          Result := 5                         // P1 + P2
        else
        begin
          // S1 + P2 does not exist for this structure.
          // Force both to Synth.
          ForcedShape1 := pkSynth;
          ForcedShape2 := pkSynth;
          Result := 0;
        end;
      end;

    // 1: (P1 + P2 -> R) + P1
    1:
      begin
        if (UIShape1 = pkSynth) and (UIShape2 = pkSynth) then
          Result := 1
        else if (UIShape1 = pkPCM) and (UIShape2 = pkSynth) then
          Result := 3
        else if (UIShape1 = pkSynth) and (UIShape2 = pkPCM) then
          Result := 4
        else
          Result := 6;
      end;

    // 2: (P1 + P2) -> R
    2:
      begin
        if (UIShape1 = pkSynth) and (UIShape2 = pkSynth) then
          Result := 9
        else if (UIShape1 = pkPCM) and (UIShape2 = pkSynth) then
          Result := 10
        else if (UIShape1 = pkSynth) and (UIShape2 = pkPCM) then
          Result := 11
        else
          Result := 12;
      end;

    // 3: Stereo Synth
    3:
      begin
        ForcedShape1 := pkSynth;
        ForcedShape2 := pkSynth;
        Result := 7;
      end;

    // 4: Stereo PCM
    4:
      begin
        ForcedShape1 := pkPCM;
        ForcedShape2 := pkPCM;
        Result := 8;
      end;

  else
    Result := 0;
  end;
end;

procedure TEditorForm.LoadTimbreNames(BankCombo: TComboBox; TimbreCombo: TComboBox);
var
  I, OldIndex: Integer;
  WasUpdatingControls: Boolean;
begin
  OldIndex := TimbreCombo.ItemIndex;

  TimbreCombo.Items.BeginUpdate;
  try
    TimbreCombo.Items.Clear;
    case BankCombo.ItemIndex of
      0:
        for I := 0 to 63 do
          TimbreCombo.Items.Add(GroupA_Names[I]);
      1:
        for I := 0 to 63 do
          TimbreCombo.Items.Add(GroupB_Names[I]);
      2:
        for I := 0 to 63 do
          TimbreCombo.Items.Add(Synth[CurSyn].GroupMem[I]);
      3:
        for I := 0 to 63 do
          TimbreCombo.Items.Add(GroupRhy_Names[I]);
    end;

    WasUpdatingControls := UpdatingControls;
    UpdatingControls := True;
    try
      if OldIndex in [0..TimbreCombo.Items.Count - 1] then
        TimbreCombo.ItemIndex := OldIndex
      else
        TimbreCombo.ItemIndex := 0;
    finally
      UpdatingControls := WasUpdatingControls;
    end;
  finally
    TimbreCombo.Items.EndUpdate;
  end;
end;

procedure TEDitorForm.ResolvePartialStructure;
var
  StructCombo: TComboBox;
  StructPtr: ^Byte;
  StructAddrOffset: NativeUInt;

  PairFirstPartial: Integer;
  PairLocalIndex: Integer;

  Shape1: TPartialKind;
  Shape2: TPartialKind;
  ForcedShape1: TPartialKind;
  ForcedShape2: TPartialKind;

  NewStructValue: Byte;
begin
  // CurPtl is assumed to be 0..3.

  if CurPtl < 2 then
  begin
    StructCombo := PartialStruct1;
    StructPtr := @Synth[CurSyn].Part[CurPt].Struct1;
    StructAddrOffset := $0A;
    PairFirstPartial := 0;
  end
  else
  begin
    StructCombo := PartialStruct2;
    StructPtr := @Synth[CurSyn].Part[CurPt].Struct2;
    StructAddrOffset := $0B; // Change this if your Struct2 address is different.
    PairFirstPartial := 2;
  end;

  PairLocalIndex := CurPtl - PairFirstPartial;

  // Read current Synth/PCM state from the existing MT-32 structure value.
  if IsPartialPCM(StructPtr^, 0) then
    Shape1 := pkPCM
  else
    Shape1 := pkSynth;

  if IsPartialPCM(StructPtr^, 1) then
    Shape2 := pkPCM
  else
    Shape2 := pkSynth;

  // Apply the user's newly selected WGShape to the current partial.
  case WGShape.ItemIndex of
    0, 1:
      begin
        if PairLocalIndex = 0 then
          Shape1 := pkSynth
        else
          Shape2 := pkSynth;

        // Only Synth shapes are real WaveGen.Shape model values.
        Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.Shape := WGShape.ItemIndex;
      end;

    2:
      begin
        if PairLocalIndex = 0 then
          Shape1 := pkPCM
        else
          Shape2 := pkPCM;

        // Do NOT alter WaveGen.Shape when choosing PCM.
      end;
  end;

  NewStructValue := BuildMT32StructValue(
    Shape1,
    Shape2,
    StructCombo.ItemIndex,
    ForcedShape1,
    ForcedShape2
  );

  StructPtr^ := NewStructValue;

  // If the chosen combination forced Synth/PCM state, update visible WGShape
  // if the currently edited partial was affected.
  if PairLocalIndex = 0 then
  begin
    if ForcedShape1 = pkPCM then
      WGShape.ItemIndex := 2
    else
      WGShape.ItemIndex := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.Shape;
  end
  else
  begin
    if ForcedShape2 = pkPCM then
      WGShape.ItemIndex := 2
    else
      WGShape.ItemIndex := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.Shape;
  end;

  // Enable/Disable appropriate controls depending on Structure setting
  RefreshStructs;
  // Refresh TVF envelope plot
  RefreshEnvelopePlots;

  // Build SysEx data for Struct1 or Struct2.
  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (NativeUInt(CurPt) * $F6) +
    StructAddrOffset
  );

  SetLength(SysExData, 1);
  SysExData[0] := StructPtr^;
  SendCurrentSysEx;
end;

procedure TEditorForm.ApplyPartialStructState(APair: Integer);
var
  OldCurPtl: Integer;
begin
  OldCurPtl := CurPtl;

  try
    // Force the resolver to operate on the selected pair.
    case APair of
      0: CurPtl := 0; // partials 1 & 2
      1: CurPtl := 2; // partials 3 & 4
    else
      Exit;
    end;

    ResolvePartialStructure;

  finally
    CurPtl := OldCurPtl;
  end;
end;

{ Model Backend Updating (read memory from MUNT) }

procedure TEditorForm.LoadAllDataFromMunt;
var
  i: Integer;
  p: Integer;
  PtcTmpBuf: array[0..$0F] of Byte;
  RhyBuf: array[0..3] of Byte;
  PtBuf: array[0..$F5] of Byte;
  PtcMemBuf: array[0..7] of Byte;
  TmbMemBuf: array[0..$FF] of Byte;
  SysBuf: array[0..$16] of Byte;
  Addr: Cardinal;
begin
  if not MuntReady then Exit;

  for i := 0 to 1 do //Integer(PHandlerInterface_v1.isDualSynthMode(MuntVSTiInstance)) do
  begin
    // Get System data
    GetData(AdSystem, SizeOf(SysBuf), @SysBuf, i);
    DecodeSystem(SysBuf, Synth[i].System);
    // Get Patch Temp data
    for p := 0 to 8 do
    begin
      Addr := AdPatchTemp + (NativeUInt(p) * $10);
      GetData(Addr, SizeOf(PtcTmpBuf), @PtcTmpBuf, i);
      DecodePatch(PtcTmpBuf, Synth[i].Patch[p]);
    end;
    // Get Rhythm Setup Data
    for p := 0 to 63 do
    begin
      Addr := AdRhythmSetup + (NativeUInt(p) * $04);
      GetData(Addr, SizeOf(RhyBuf), @RhyBuf, i);
      DecodeRhythm(RhyBuf, Synth[i].Rhythm[p]);
    end;
    // Get Timbre Temp data
    for p := 0 to 7 do
    begin
      Addr := AdTimbreTemp + (NativeUInt(p) * $F6);
      GetData(Addr, SizeOf(PtBuf), @PtBuf, i);
      DecodeTimbrePart(PtBuf, Synth[i].Part[p]);
    end;
    // Get Patch Memory data
    for p := 0 to 127 do
    begin
      Addr := AdPatchMem + (NativeUInt(p) * $08);
      GetData(Addr, SizeOf(PtcMemBuf), @PtcMemBuf, i);
      DecodePatchMem(PtcMemBuf, Synth[i].PatchMem[p]);
    end;
    // Get Timbre Memory data
    for p := 0 to 63 do
    begin
      Addr := AdTimbreMem + (NativeUInt(p) * $100);
      GetData(Addr, SizeOf(TmbMemBuf), @TmbMemBuf, i);
      DecodeTimbrePart(TmbMemBuf, Synth[i].TimbreMem[p]);
      Synth[i].GroupMem[p] := BytesToStr(TmbMemBuf, 0, 10);
    end;
  end;
end;

procedure TEditorForm.RefreshTimbre;
var
  Buf: array[0..$F5] of Byte;
  Addr: Cardinal;
begin
  if not MuntReady then Exit;

  Addr := AdSystem + $0D + CurPt;
  Synth[CurSyn].System.MidiChannel[CurPt] := GetByte(Addr,CurSyn);
  Addr := AdPatchTemp + $06 + (CurPt * $10);
  Synth[CurSyn].Patch[CurPt].Reverb := GetByte(Addr,CurSyn) = 1;
  Addr := AdPatchTemp + $04 + (CurPt * $10);
  Synth[CurSyn].Patch[CurPt].BendRange := GetByte(Addr,CurSyn);

  Addr := AdTimbreTemp + (CurPt * $F6);
  GetData(Addr, SizeOf(Buf), @Buf, CurSyn);
  DecodeTimbrePart(Buf, Synth[CurSyn].Part[CurPt]);

  RefreshVisibleControls;
end;

procedure TEditorForm.DecodeSystem(const Buf: array of Byte; var Dest: TSystem);
var
  p: Integer;
begin
  Dest.MasterTune := Buf[$00];
  Dest.ReverbMode := Buf[$01];
  Dest.ReverbTime := Buf[$02];
  Dest.ReverbLevel := Buf[$03];
  for p := 0 to 8 do
  begin
    Dest.PtlReserve[p] := Buf[$04 + p];
    Dest.MidiChannel[p] := Buf[$0D + p];
  end;
  Dest.MasterVolume := Buf[$16];
end;

procedure TEditorForm.DecodePatch(const Buf: array of Byte; var Dest: TPatch);
begin
  Dest.TmbGroup := Buf[$00];
  Dest.TmbNumber := Buf[$01];
  Dest.KeyShift := Buf[$02] - 24;
  Dest.FineTune := Buf[$03] - 50;
  Dest.BendRange := Buf[$04];
  Dest.PolyMode := Buf[$05];
  Dest.Reverb := Buf[$06] = 1;
  Dest.Output := Buf[$08];
  Dest.Pan := Buf[$09] - 7;
end;

procedure TEditorForm.DecodeRhythm(const Buf: array of Byte; var Dest: TRhythm);
begin
  Dest.Timbre := Buf[$00];
  Dest.Output := Buf[$01];
  Dest.Pan := Buf[$02] - 7;
  Dest.Reverb := Buf[$03] = 1;
end;

procedure TEditorForm.DecodePatchMem(const Buf: array of Byte; var Dest: TPatchMem);
begin
  Dest.TmbGroup := Buf[$00];
  Dest.TmbNumber := Buf[$01];
  Dest.KeyShift := Buf[$02];
  Dest.FineTune := Buf[$03];
  Dest.BendRange := Buf[$04];
  Dest.PolyMode := Buf[$05];
  Dest.Reverb := Buf[$06] = 1;
end;

procedure TEditorForm.DecodeTimbrePart(const Buf: array of Byte; var Dest: TPart);
var
  q: Integer;
  Offset: Integer;
begin
    Dest.Name := BytesToStr(Buf, 0, 10);
    Dest.SustainOn := Buf[$0D] = 0;
    Dest.Struct1 := Buf[$0A];
    Dest.Struct2 := Buf[$0B];

    for q := 0 to 3 do
    begin
      Dest.Partial[q].Mute :=
        (Buf[$0C] and (1 shl q)) <> 0;
      Offset := $0E + (q * $3A);
      DecodePartial(Buf, Offset, Dest.Partial[q]);
    end;
end;

procedure TEditorForm.DecodePartial(const Buf: array of Byte; Offset: Integer; var Dest: TPartial);
begin
  { Decode Wave Generator SysEx Data }
  Dest.WaveGen.PitchCoarse := Buf[$00 + Offset];
  Dest.WaveGen.PitchFine := Buf[$01 + Offset] - 50;
  Dest.WaveGen.KeyFollow := Buf[$02 + Offset] - 3;
  Dest.WaveGen.PitchBend := Buf[$03 + Offset] <> 0;
  Dest.WaveGen.Shape := Buf[$04 + Offset];
  Dest.WaveGen.PCMSample := Buf[$05 + Offset];
  Dest.WaveGen.PulseWidth := Buf[$06 + Offset];
  Dest.WaveGen.VelSens := Buf[$07 + Offset] - 7;
  { Decode Pitch Envelope SysEx Data }
  Dest.PitchEnv.Depth := Buf[$08 + Offset];
  Dest.PitchEnv.VelSens := Buf[$09 + Offset];
  Dest.PitchEnv.TimeKeyFollow := Buf[$0A + Offset];
  Dest.PitchEnv.Time1 := Buf[$0B + Offset];
  Dest.PitchEnv.Time2 := Buf[$0C + Offset];
  Dest.PitchEnv.Time3 := Buf[$0D + Offset];
  Dest.PitchEnv.Time4 := Buf[$0E + Offset];
  Dest.PitchEnv.Level0 := (Buf[$0F + Offset]) - 50;
  Dest.PitchEnv.Level1 := (Buf[$10 + Offset]) - 50;
  Dest.PitchEnv.Level2 := (Buf[$11 + Offset]) - 50;
  Dest.PitchEnv.Sustain := (Buf[$12 + Offset]) - 50;
  Dest.PitchEnv.EndLevel := (Buf[$13 + Offset]) - 50;
  Dest.PitchEnv.LFORate := Buf[$14 + Offset];
  Dest.PitchEnv.LFODepth := Buf[$15 + Offset];
  Dest.PitchEnv.LFOModSens := Buf[$16 + Offset];
  { Decode TVF (Time Variant Filter) SysEx Data }
  Dest.TVF.Cutoff := (Buf[$17 + Offset]);
  Dest.TVF.Resonance := (Buf[$18 + Offset]);
  Dest.TVF.KeyFollow := (Buf[$19 + Offset]);
  Dest.TVF.BiasPoint := Buf[$1A + Offset];
  Dest.TVF.BiasLevel := Buf[$1B + Offset] - 7;
  Dest.TVF.Depth := Buf[$1C + Offset];
  Dest.TVF.VelSens := Buf[$1D + Offset];
  Dest.TVF.DepthKeyFollow := Buf[$1E + Offset];
  Dest.TVF.TimeKeyFollow := Buf[$1F + Offset];
  Dest.TVF.Time1 := Buf[$20 + Offset];
  Dest.TVF.Time2 := Buf[$21 + Offset];
  Dest.TVF.Time3 := Buf[$22 + Offset];
  Dest.TVF.Time4 := Buf[$23 + Offset];
  Dest.TVF.Time5 := Buf[$24 + Offset];
  Dest.TVF.Level1 := Buf[$25 + Offset];
  Dest.TVF.Level2 := Buf[$26 + Offset];
  Dest.TVF.Level3 := Buf[$27 + Offset];
  Dest.TVF.Sustain := Buf[$28 + Offset];
  { Decode TVA (Time Variant Amplifier) SysEx Data }
  Dest.TVA.Amplifier := Buf[$29 + Offset];
  Dest.TVA.VelSens := Buf[$2A + Offset] - 50;
  Dest.TVA.BiasPoint1 := Buf[$2B + Offset];
  Dest.TVA.BiasLevel1 := Buf[$2C + Offset] - 12;
  Dest.TVA.BiasPoint2 := Buf[$2D + Offset];
  Dest.TVA.BiasLevel2 := Buf[$2E + Offset] - 12;
  Dest.TVA.TimeKeyFollow := Buf[$2F + Offset];
  Dest.TVA.VelKeyFollow := Buf[$30 + Offset];
  Dest.TVA.Time1 := Buf[$31 + Offset];
  Dest.TVA.Time2 := Buf[$32 + Offset];
  Dest.TVA.Time3 := Buf[$33 + Offset];
  Dest.TVA.Time4 := Buf[$34 + Offset];
  Dest.TVA.Time5 := Buf[$35 + Offset];
  Dest.TVA.Level1 := Buf[$36 + Offset];
  Dest.TVA.Level2 := Buf[$37 + Offset];
  Dest.TVA.Level3 := Buf[$38 + Offset];
  Dest.TVA.Sustain := Buf[$39 + Offset];
end;

procedure TEditorForm.RefreshVisibleControls;
begin
  UpdatingControls := True;
  try
    RefreshPartControls;
    RefreshPartialControls;
    RefreshPatchControls;
    //RefreshSystemControls;
    MasterVolume.Position := Synth[CurSyn].System.MasterVolume;
    MasterVolume_value.Value := Synth[CurSyn].System.MasterVolume;

    SetSynthColors;
  finally
    UpdatingControls := False;
  end;
end;

procedure TEditorForm.RefreshPartControls;
begin
  TimbreName.Text := Synth[CurSyn].Part[CurPt].Name;
  case Synth[CurSyn].Part[CurPt].Struct1 of
    0, 2, 5:
      PartialStruct1.ItemIndex := 0;
    1, 3, 4, 6:
      PartialStruct1.ItemIndex := 1;
    9, 10, 11, 12:
      PartialStruct1.ItemIndex := 2;
    7:
      PartialStruct1.ItemIndex := 3;
    8:
      PartialStruct1.ItemIndex := 4;
  end;
  //PartialStruct1.ItemIndex := Part[CurPt].Struct1;
  case Synth[CurSyn].Part[CurPt].Struct2 of
    0, 2, 5:
      PartialStruct2.ItemIndex := 0;
    1, 3, 4, 6:
      PartialStruct2.ItemIndex := 1;
    9, 10, 11, 12:
      PartialStruct2.ItemIndex := 2;
    7:
      PartialStruct2.ItemIndex := 3;
    8:
      PartialStruct2.ItemIndex := 4;
  end;
  //PartialStruct2.ItemIndex := Part[CurPt].Struct2;
  PartialMute1.Checked := Synth[CurSyn].Part[CurPt].Partial[0].Mute;
  PartialMute2.Checked := Synth[CurSyn].Part[CurPt].Partial[1].Mute;
  PartialMute3.Checked := Synth[CurSyn].Part[CurPt].Partial[2].Mute;
  PartialMute4.Checked := Synth[CurSyn].Part[CurPt].Partial[3].Mute;
  EnvMode.Down := Synth[CurSyn].Part[CurPt].SustainOn;
  PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[CurPt];
  PtRevButton.Down := Synth[CurSyn].Patch[CurPt].Reverb;
  PtBendRange.Value := Synth[CurSyn].Patch[CurPt].BendRange;
end;

procedure TEditorForm.RefreshPartialControls;
begin
  { Refresh Wave Generator Controls }
  WGCoarse.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchCoarse;
  WGCoarse_value.Text := IntToStr(WGCoarse.Position);
  WGFine.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchFine;
  WGFine_value.Text := IntToStr(WGFine.Position);
  WGKeyFollow.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.KeyFollow;
  WGKeyFollow_value.Text := IntToStr(WGKeyFollow.Position);
  WGPitchBend.Down := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchBend;
  case CurPtl of
    0:
      case Synth[CurSyn].Part[CurPt].Struct1 of
        2, 3, 5, 6, 8, 10, 12:
          WGShape.ItemIndex := 2;
      else
        WGShape.ItemIndex := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.Shape;
      end;
    1:
      case Synth[CurSyn].Part[CurPt].Struct1 of
        4, 5, 6, 8, 11, 12:
          WGShape.ItemIndex := 2;
      else
        WGShape.ItemIndex := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.Shape;
      end;
    2:
      case Synth[CurSyn].Part[CurPt].Struct2 of
        2, 3, 5, 6, 8, 10, 12:
          WGShape.ItemIndex := 2;
      else
        WGShape.ItemIndex := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.Shape;
      end;
    3:
      case Synth[CurSyn].Part[CurPt].Struct2 of
        4, 5, 6, 8, 11, 12:
          WGShape.ItemIndex := 2;
      else
        WGShape.ItemIndex := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.Shape;
      end;
  end;
  WGSample.ItemIndex := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PCMSample;
  WGPulseWidth.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PulseWidth;
  WGPulseWidth_value.Text := IntToStr(WGPulseWidth.Position);
  WGVelSens.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.VelSens;
  WGVelSens_value.Text := IntToStr(WGVelSens.Position);
  { Refresh Pitch Envelope Controls }
  PEnvDepth.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Depth;
  PEnvDepth_value.Text := IntToStr(PEnvDepth.Position);
  PEnvVelSens.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.VelSens;
  PEnvVelSens_value.Text := IntToStr(PEnvVelSens.Position);
  PEnvTimeKeyFollow.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.TimeKeyFollow;
  PEnvTimeKeyFollow_value.Text := IntToStr(PEnvTimeKeyFollow.Position);
  PEnvTime1.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time1;
  PEnvTime1_value.Text := IntToStr(PEnvTime1.Value);
  PEnvTime2.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time2;
  PEnvTime2_value.Text := IntToStr(PEnvTime2.Value);
  PEnvTime3.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time3;
  PEnvTime3_value.Text := IntToStr(PEnvTime3.Value);
  PEnvTime4.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time4;
  PEnvTime4_value.Text := IntToStr(PEnvTime4.Value);
  PEnvLevel0.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level0;
  PEnvLevel0_value.Text := IntToStr(PEnvLevel0.Position);
  PEnvLevel1.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level1;
  PEnvLevel1_value.Text := IntToStr(PEnvLevel1.Position);
  PEnvLevel2.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level2;
  PEnvLevel2_value.Text := IntToStr(PEnvLevel2.Position);
  PEnvSustain.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Sustain;
  PEnvSustain_value.Text := IntToStr(PEnvSustain.Position);
  PEnvEnd.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.EndLevel;
  PEnvEnd_value.Text := IntToStr(PEnvEnd.Position);
  PEnvLFORate.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFORate;
  PEnvLFORate_value.Text := IntToStr(PEnvLFORate.Value);
  PEnvLFODepth.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFODepth;
  PEnvLFODepth_value.Text := IntToStr(PEnvLFODEpth.Value);
  PEnvLFOModSens.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFOModSens;
  PEnvLFOModSens_value.Text := IntToStr(PEnvLFOModSens.Value);
  { Refresh TVF (Time Variant Filter) Controls }
  TVFCutoff.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Cutoff;
  TVFCutoff_value.Text := IntToStr(TVFCutoff.Position);
  TVFResonance.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Resonance;
  TVFResonance_value.Text := IntToStr(TVFResonance.Position);
  TVFKeyFollow.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.KeyFollow;
  TVFKeyFollow_value.Text := IntToStr(TVFKeyFollow.Position);
  TVFBiasPoint.ItemIndex := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.BiasPoint;
  TVFBiasLevel.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.BiasLevel;
  TVFBiasLevel_value.Text := IntToStr(TVFBiasLevel.Position);
  TVFDepth.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Depth;
  TVFDepth_value.Text := IntToStr(TVFDepth.Position);
  TVFVelSens.Position := -Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.VelSens;
  TVFVelSens_value.Text := IntToStr(TVFVelSens.Position);
  TVFDepthKeyFollow.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.DepthKeyFollow;
  TVFDepthKeyFollow_value.Text := IntToStr(TVFDepthKeyFollow.Position);
  TVFTimeKeyFollow.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.TimeKeyFollow;
  TVFTimeKeyFollow_value.Text := IntToStr(TVFTimeKeyFollow.Position);
  TVFTime1.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time1;
  TVFTime1_value.Text := IntToStr(TVFTime1.Value);
  TVFTime2.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time2;
  TVFTime2_value.Text := IntToStr(TVFTime2.Value);
  TVFTime3.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time3;
  TVFTime3_value.Text := IntToStr(TVFTime3.Value);
  TVFTime4.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time4;
  TVFTime4_value.Text := IntToStr(TVFTime4.Value);
  TVFTime5.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time5;
  TVFTime5_value.Text := IntToStr(TVFTime5.Value);
  TVFLevel1.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level1;
  TVFLevel1_value.Text := IntToStr(TVFLevel1.Position);
  TVFLevel2.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level2;
  TVFLevel2_value.Text := IntToStr(TVFLevel2.Position);
  TVFLevel3.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level3;
  TVFLevel3_value.Text := IntToStr(TVFLevel3.Position);
  TVFSustain.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Sustain;
  TVFSustain_value.Text := IntToStr(TVFSustain.Position);
  { Refresh TVA (Time Variant Amplifier) Controls }
  TVAAmplifier.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Amplifier;
  TVAAmplifier_value.Text := IntToStr(TVAAmplifier.Position);
  TVAVelSens.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelSens;
  TVAVelSens_value.Text := IntToStr(TVAVelSens.Position);
  TVABiasPoint1.ItemIndex := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasPoint1;
  TVABiasLevel1.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel1;
  TVABiasLevel1_value.Text := IntToStr(TVABiasLevel1.Position);
  TVABiasPoint2.ItemIndex := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasPoint2;
  TVABiasLevel2.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel2;
  TVABiasLevel2_value.Text := IntToStr(TVABiasLevel2.Position);
  TVATimeKeyFollow.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.TimeKeyFollow;
  TVATimeKeyFollow_value.Text := IntToStr(TVATimeKeyFollow.Position);
  TVAVelKeyFollow.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelKeyFollow;
  TVAVelKeyFollow_value.Text := IntToStr(TVAVelKeyFollow.Position);
  TVATime1.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time1;
  TVATime1_value.Text := IntToStr(TVATime1.Value);
  TVATime2.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time2;
  TVATime2_value.Text := IntToStr(TVATime2.Value);
  TVATime3.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time3;
  TVATime3_value.Text := IntToStr(TVATime3.Value);
  TVATime4.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time4;
  TVATime4_value.Text := IntToStr(TVATime4.Value);
  TVATime5.Value := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time5;
  TVATime5_value.Text := IntToStr(TVATime5.Value);
  TVALevel1.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level1;
  TVALevel1_value.Text := IntToStr(TVALevel1.Position);
  TVALevel2.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level2;
  TVALevel2_value.Text := IntToStr(TVALevel2.Position);
  TVALevel3.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level3;
  TVALevel3_value.Text := IntToStr(TVALevel3.Position);
  TVASustain.Position := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Sustain;
  TVASustain_value.Text := IntToStr(TVASustain.Position);

  RefreshStructs;
  RefreshEnvelopePlots;
end;

procedure TEditorForm.RefreshEnvelopePlots;
begin
  PEnvPlot.Invalidate;
  TVFPlot.Invalidate;
  TVFFilterPlot.Invalidate;
  TVAPlot.Invalidate;
end;

procedure TEditorForm.RefreshStructs;
begin
  if WGShape.ItemIndex <> 2 then
  begin
    SetWGSynth;
    EnableTVF;
  end
  else
  begin
    SetWGPCM;
    DisableTVF;
  end;
end;

procedure TEditorForm.RefreshPatchControls;
begin
  RefreshAllGroupMemCombos;
  Pt1Enable.Down := Synth[CurSyn].System.MidiChannel[0] <> 16;
  Pt1Reverb.Down := Synth[CurSyn].Patch[0].Reverb;
  if Synth[CurSyn].System.MidiChannel[0] < 16 then
  begin
    Pt1Chan.Value := Synth[CurSyn].System.MidiChannel[0]+1;
    Pt1Chan.Enabled := True;
  end
  else Pt1Chan.Enabled := False;
  Pt1Poly.ItemIndex := Synth[CurSyn].Patch[0].PolyMode;
  Pt1PtlReserve.Value := Synth[CurSyn].System.PtlReserve[0];
  Pt1Bank.ItemIndex := Synth[CurSyn].Patch[0].TmbGroup;
  Pt1Timbre.ItemIndex := Synth[CurSyn].Patch[0].TmbNumber;
  Pt1Key.Value := Synth[CurSyn].Patch[0].KeyShift;
  Pt1Key_value.Value := Pt1Key.Value;
  Pt1Fine.Value := Synth[CurSyn].Patch[0].FineTune;
  Pt1Fine_value.Value := Pt1Fine.Value;
  Pt1Bend.Value := Synth[CurSyn].Patch[0].BendRange;
  Pt1Bend_value.Value := Pt1Bend.Value;
  Pt1Pan.Value := Synth[CurSyn].Patch[0].Pan;
  Pt1Pan_value.Value := Pt1Pan.Value;
  Pt1Output.Position := Synth[CurSyn].Patch[0].Output;
  Pt1Output_value.Value := Pt1Output.Position;

  Pt2Enable.Down := Synth[CurSyn].System.MidiChannel[1] <> 16;
  Pt2Reverb.Down := Synth[CurSyn].Patch[1].Reverb;
  if Synth[CurSyn].System.MidiChannel[1] < 16 then
  begin
    Pt2Chan.Value := Synth[CurSyn].System.MidiChannel[1]+1;
    Pt2Chan.Enabled := True;
  end
  else Pt2Chan.Enabled := False;
  Pt2Poly.ItemIndex := Synth[CurSyn].Patch[1].PolyMode;
  Pt2PtlReserve.Value := Synth[CurSyn].System.PtlReserve[1];
  Pt2Bank.ItemIndex := Synth[CurSyn].Patch[1].TmbGroup;
  Pt2Timbre.ItemIndex := Synth[CurSyn].Patch[1].TmbNumber;
  Pt2Key.Value := Synth[CurSyn].Patch[1].KeyShift;
  Pt2Key_value.Value := Pt2Key.Value;
  Pt2Fine.Value := Synth[CurSyn].Patch[1].FineTune;
  Pt2Fine_value.Value := Pt2Fine.Value;
  Pt2Bend.Value := Synth[CurSyn].Patch[1].BendRange;
  Pt2Bend_value.Value := Pt2Bend.Value;
  Pt2Pan.Value := Synth[CurSyn].Patch[1].Pan;
  Pt2Pan_value.Value := Pt2Pan.Value;
  Pt2Output.Position := Synth[CurSyn].Patch[1].Output;
  Pt2Output_value.Value := Pt2Output.Position;

  Pt3Enable.Down := Synth[CurSyn].System.MidiChannel[2] <> 16;
  Pt3Reverb.Down := Synth[CurSyn].Patch[2].Reverb;
  if Synth[CurSyn].System.MidiChannel[2] < 16 then
  begin
    Pt3Chan.Value := Synth[CurSyn].System.MidiChannel[2]+1;
    Pt3Chan.Enabled := True;
  end
  else Pt3Chan.Enabled := False;
  Pt3Poly.ItemIndex := Synth[CurSyn].Patch[2].PolyMode;
  Pt3PtlReserve.Value := Synth[CurSyn].System.PtlReserve[2];
  Pt3Bank.ItemIndex := Synth[CurSyn].Patch[2].TmbGroup;
  Pt3Timbre.ItemIndex := Synth[CurSyn].Patch[2].TmbNumber;
  Pt3Key.Value := Synth[CurSyn].Patch[2].KeyShift;
  Pt3Key_value.Value := Pt2Key.Value;
  Pt3Fine.Value := Synth[CurSyn].Patch[2].FineTune;
  Pt3Fine_value.Value := Pt2Fine.Value;
  Pt3Bend.Value := Synth[CurSyn].Patch[2].BendRange;
  Pt3Bend_value.Value := Pt2Bend.Value;
  Pt3Pan.Value := Synth[CurSyn].Patch[2].Pan;
  Pt3Pan_value.Value := Pt3Pan.Value;
  Pt3Output.Position := Synth[CurSyn].Patch[2].Output;
  Pt3Output_value.Value := Pt2Output.Position;

  Pt4Enable.Down := Synth[CurSyn].System.MidiChannel[3] <> 16;
  Pt4Reverb.Down := Synth[CurSyn].Patch[3].Reverb;
  if Synth[CurSyn].System.MidiChannel[3] < 16 then
  begin
    Pt4Chan.Value := Synth[CurSyn].System.MidiChannel[3]+1;
    Pt4Chan.Enabled := True;
  end
  else Pt4Chan.Enabled := False;
  Pt4Poly.ItemIndex := Synth[CurSyn].Patch[3].PolyMode;
  Pt4PtlReserve.Value := Synth[CurSyn].System.PtlReserve[3];
  Pt4Bank.ItemIndex := Synth[CurSyn].Patch[3].TmbGroup;
  Pt4Timbre.ItemIndex := Synth[CurSyn].Patch[3].TmbNumber;
  Pt4Key.Value := Synth[CurSyn].Patch[3].KeyShift;
  Pt4Key_value.Value := Pt2Key.Value;
  Pt4Fine.Value := Synth[CurSyn].Patch[3].FineTune;
  Pt4Fine_value.Value := Pt2Fine.Value;
  Pt4Bend.Value := Synth[CurSyn].Patch[3].BendRange;
  Pt4Bend_value.Value := Pt2Bend.Value;
  Pt4Pan.Value := Synth[CurSyn].Patch[3].Pan;
  Pt4Pan_value.Value := Pt4Pan.Value;
  Pt4Output.Position := Synth[CurSyn].Patch[3].Output;
  Pt4Output_value.Value := Pt2Output.Position;

  Pt5Enable.Down := Synth[CurSyn].System.MidiChannel[4] <> 16;
  Pt5Reverb.Down := Synth[CurSyn].Patch[4].Reverb;
  if Synth[CurSyn].System.MidiChannel[4] < 16 then
  begin
    Pt5Chan.Value := Synth[CurSyn].System.MidiChannel[4]+1;
    Pt5Chan.Enabled := True;
  end
  else Pt5Chan.Enabled := False;
  Pt5Poly.ItemIndex := Synth[CurSyn].Patch[4].PolyMode;
  Pt5PtlReserve.Value := Synth[CurSyn].System.PtlReserve[4];
  Pt5Bank.ItemIndex := Synth[CurSyn].Patch[4].TmbGroup;
  Pt5Timbre.ItemIndex := Synth[CurSyn].Patch[4].TmbNumber;
  Pt5Key.Value := Synth[CurSyn].Patch[4].KeyShift;
  Pt5Key_value.Value := Pt2Key.Value;
  Pt5Fine.Value := Synth[CurSyn].Patch[4].FineTune;
  Pt5Fine_value.Value := Pt2Fine.Value;
  Pt5Bend.Value := Synth[CurSyn].Patch[4].BendRange;
  Pt5Bend_value.Value := Pt2Bend.Value;
  Pt5Pan.Value := Synth[CurSyn].Patch[4].Pan;
  Pt5Pan_value.Value := Pt5Pan.Value;
  Pt5Output.Position := Synth[CurSyn].Patch[4].Output;
  Pt5Output_value.Value := Pt2Output.Position;

  Pt6Enable.Down := Synth[CurSyn].System.MidiChannel[5] <> 16;
  Pt6Reverb.Down := Synth[CurSyn].Patch[5].Reverb;
  if Synth[CurSyn].System.MidiChannel[5] < 16 then
  begin
    Pt6Chan.Value := Synth[CurSyn].System.MidiChannel[5]+1;
    Pt6Chan.Enabled := True;
  end
  else Pt6Chan.Enabled := False;
  Pt6Poly.ItemIndex := Synth[CurSyn].Patch[5].PolyMode;
  Pt6PtlReserve.Value := Synth[CurSyn].System.PtlReserve[5];
  Pt6Bank.ItemIndex := Synth[CurSyn].Patch[5].TmbGroup;
  Pt6Timbre.ItemIndex := Synth[CurSyn].Patch[5].TmbNumber;
  Pt6Key.Value := Synth[CurSyn].Patch[5].KeyShift;
  Pt6Key_value.Value := Pt6Key.Value;
  Pt6Fine.Value := Synth[CurSyn].Patch[5].FineTune;
  Pt6Fine_value.Value := Pt6Fine.Value;
  Pt6Bend.Value := Synth[CurSyn].Patch[5].BendRange;
  Pt6Bend_value.Value := Pt6Bend.Value;
  Pt6Pan.Value := Synth[CurSyn].Patch[5].Pan;
  Pt6Pan_value.Value := Pt6Pan.Value;
  Pt6Output.Position := Synth[CurSyn].Patch[5].Output;
  Pt6Output_value.Value := Pt6Output.Position;

  Pt7Enable.Down := Synth[CurSyn].System.MidiChannel[6] <> 16;
  Pt7Reverb.Down := Synth[CurSyn].Patch[6].Reverb;
  if Synth[CurSyn].System.MidiChannel[6] < 16 then
  begin
    Pt7Chan.Value := Synth[CurSyn].System.MidiChannel[6]+1;
    Pt7Chan.Enabled := True;
  end
  else Pt7Chan.Enabled := False;
  Pt7Poly.ItemIndex := Synth[CurSyn].Patch[6].PolyMode;
  Pt7PtlReserve.Value := Synth[CurSyn].System.PtlReserve[6];
  Pt7Bank.ItemIndex := Synth[CurSyn].Patch[6].TmbGroup;
  Pt7Timbre.ItemIndex := Synth[CurSyn].Patch[6].TmbNumber;
  Pt7Key.Value := Synth[CurSyn].Patch[6].KeyShift;
  Pt7Key_value.Value := Pt7Key.Value;
  Pt7Fine.Value := Synth[CurSyn].Patch[6].FineTune;
  Pt7Fine_value.Value := Pt7Fine.Value;
  Pt7Bend.Value := Synth[CurSyn].Patch[6].BendRange;
  Pt7Bend_value.Value := Pt7Bend.Value;
  Pt7Pan.Value := Synth[CurSyn].Patch[6].Pan;
  Pt7Pan_value.Value := Pt7Pan.Value;
  Pt7Output.Position := Synth[CurSyn].Patch[6].Output;
  Pt7Output_value.Value := Pt7Output.Position;

  Pt8Enable.Down := Synth[CurSyn].System.MidiChannel[7] <> 16;
  Pt8Reverb.Down := Synth[CurSyn].Patch[7].Reverb;
  if Synth[CurSyn].System.MidiChannel[7] < 16 then
  begin
    Pt8Chan.Value := Synth[CurSyn].System.MidiChannel[7]+1;
    Pt8Chan.Enabled := True;
  end
  else Pt8Chan.Enabled := False;
  Pt8Poly.ItemIndex := Synth[CurSyn].Patch[7].PolyMode;
  Pt8PtlReserve.Value := Synth[CurSyn].System.PtlReserve[7];
  Pt8Bank.ItemIndex := Synth[CurSyn].Patch[7].TmbGroup;
  Pt8Timbre.ItemIndex := Synth[CurSyn].Patch[7].TmbNumber;
  Pt8Key.Value := Synth[CurSyn].Patch[7].KeyShift;
  Pt8Key_value.Value := Pt8Key.Value;
  Pt8Fine.Value := Synth[CurSyn].Patch[7].FineTune;
  Pt8Fine_value.Value := Pt8Fine.Value;
  Pt8Bend.Value := Synth[CurSyn].Patch[7].BendRange;
  Pt8Bend_value.Value := Pt8Bend.Value;
  Pt8Pan.Value := Synth[CurSyn].Patch[7].Pan;
  Pt8Pan_value.Value := Pt8Pan.Value;
  Pt8Output.Position := Synth[CurSyn].Patch[7].Output;
  Pt8Output_value.Value := Pt8Output.Position;

  PtREnable.Down := Synth[CurSyn].System.MidiChannel[8] <> 16;
  if Synth[CurSyn].System.MidiChannel[8] < 16 then
  begin
    PtRChan.Value := Synth[CurSyn].System.MidiChannel[8]+1;
    PtRChan.Enabled := True;
  end
  else PtRChan.Enabled := False;
  PtRPoly.ItemIndex := Synth[CurSyn].Patch[8].PolyMode;
  PtRPtlReserve.Value := Synth[CurSyn].System.PtlReserve[8];
  PtRKey.Value := Synth[CurSyn].Patch[8].KeyShift;
  PtRKey_value.Value := PtRKey.Value;
  PtRFine.Value := Synth[CurSyn].Patch[8].FineTune;
  PtRFine_value.Value := PtRFine.Value;
  PtRBend.Value := Synth[CurSyn].Patch[8].BendRange;
  PtRBend_value.Value := PtRBend.Value;
  PtROutput.Position := Synth[CurSyn].Patch[8].Output;
  PtROutput_value.Value := PtROutput.Position;
end;

procedure TEditorForm.RefreshAllGroupMemCombos;
begin
  LoadTimbreNames(Pt1Bank, Pt1Timbre);
  LoadTimbreNames(Pt2Bank, Pt2Timbre);
  LoadTimbreNames(Pt3Bank, Pt3Timbre);
  LoadTimbreNames(Pt4Bank, Pt4Timbre);
  LoadTimbreNames(Pt5Bank, Pt5Timbre);
  LoadTimbreNames(Pt6Bank, Pt6Timbre);
  LoadTimbreNames(Pt7Bank, Pt7Timbre);
  LoadTimbreNames(Pt8Bank, Pt8Timbre);
end;

procedure TEditorForm.SetSynthColors;
begin
  case CurSyn of
      0:
      begin
        clSynthText := $00B75200;
        clSliderThumb := $00D77800;
        clSliderFill := $00FF9A11;
      end;
      1:
      begin
        clSynthText := clGreen;
        clSliderThumb := $00228B22;
        clSliderFill := $008FBC8F;
      end;
    end;
    MasterVolume_label.Font.Color := clSynthText;
    MasterVolume.FillColor := clSliderFill;
    MasterVolume.ThumbColor := clSliderThumb;
    PartControlsGroup.Font.Color := clSynthText;
    CurPart_label.Font.Color := clSynthText;
    Partials_label.Font.Color := clSynthText;
    PartialSelect_label.Font.Color := clSynthText;
    SelPartial1Button.Font.Color := clSynthText;
    SelPartial2Button.Font.Color := clSynthText;
    SelPartial3Button.Font.Color := clSynthText;
    SelPartial4Button.Font.Color := clSynthText;
    WaveGenGroup.Font.Color := clSynthText;
    WGPulseWidth.FillColor := clSliderFill;
    WGPulseWidth.ThumbColor := clSliderThumb;
    WGVelSens.FillColor := clSliderFill;
    WGVelSens.ThumbColor := clSliderThumb;
    WGCoarse.FillColor := clSliderFill;
    WGCoarse.ThumbColor := clSliderThumb;
    WGFine.FillColor := clSliderFill;
    WGFine.ThumbColor := clSliderThumb;
    WGKeyFollow.FillColor := clSliderFill;
    WGKeyFollow.ThumbColor := clSliderThumb;
    PitchEnvGroup.Font.Color :=clSynthText;
    PEnvLevel0.FillColor := clSliderFill;
    PEnvLevel0.ThumbColor := clSliderThumb;
    PEnvLevel1.FillColor := clSliderFill;
    PEnvLevel1.Thumbcolor := clSliderThumb;
    PEnvLevel2.FillColor := clSliderFill;
    PEnvLevel2.Thumbcolor := clSliderThumb;
    PEnvSustain.FillColor := clSliderFill;
    PEnvSustain.Thumbcolor := clSliderThumb;
    PEnvEnd.FillColor := clSliderFill;
    PEnvEnd.Thumbcolor := clSliderThumb;
    PEnvLFORate.IndColor := clSliderThumb;
    PEnvLFODepth.IndColor := clSliderThumb;
    PEnvLFOModSens.IndColor := clSliderThumb;
    PEnvTime1.IndColor := clSliderThumb;
    PEnvTime2.IndColor := clSliderThumb;
    PEnvTime3.IndColor := clSliderThumb;
    PEnvTime4.IndColor := clSliderThumb;
    PEnvDepth.FillColor := clSliderFill;
    PEnvDepth.ThumbColor := clSliderThumb;
    PEnvTimeKeyFollow.FillColor := clSliderFill;
    PEnvTimeKeyFollow.ThumbColor := clSliderThumb;
    PEnvVelSens.FillColor := clSliderFill;
    PEnvVelSens.ThumbColor := clSliderThumb;
    PEnvLFOGroup.Font.Color := clSynthText;
    TVFGroup.Font.Color := clSynthText;
    TVFLevel1.FillColor := clSliderFill;
    TVFLevel1.ThumbColor := clSliderThumb;
    TVFLevel2.FillColor := clSliderFill;
    TVFLevel2.ThumbColor := clSliderThumb;
    TVFLevel3.FillColor := clSliderFill;
    TVFLevel3.ThumbColor := clSliderThumb;
    TVFSustain.FillColor := clSliderFill;
    TVFSustain.ThumbColor := clSliderThumb;
    TVFKeyFollow.FillColor := clSliderFill;
    TVFKeyFollow.ThumbColor := clSliderThumb;
    TVFCutoff.FillColor := clSliderFill;
    TVFCutoff.ThumbColor := clSliderThumb;
    TVFResonance.FillColor := clSliderFill;
    TVFResonance.ThumbColor := clSliderThumb;
    TVFTime1.IndColor := clSliderThumb;
    TVFTime2.IndColor := clSliderThumb;
    TVFTime3.IndColor := clSliderThumb;
    TVFTime4.IndColor := clSliderThumb;
    TVFTime5.IndColor := clSliderThumb;
    TVFDepth.FillColor := clSliderFill;
    TVFDepth.ThumbColor := clSliderThumb;
    TVFDepthKeyFollow.FillColor := clSliderFill;
    TVFDepthKeyFollow.Thumbcolor := clSliderThumb;
    TVFVelSens.FillColor := clSliderFill;
    TVFVelSens.ThumBColor := clSliderThumb;
    TVFTimeKeyFollow.FillColor := clSliderFill;
    TVFTimeKeyFollow.ThumbColor := clSliderThumb;
    TVFBiasLevel.FillColor := clSliderFill;
    TVFBiasLevel.ThumbColor := clSliderThumb;
    TVAGroup.Font.Color := clSynthText;
    TVALevel1.FillColor := clSliderFill;
    TVALevel1.ThumbColor := clSliderThumb;
    TVALevel2.FillColor := clSliderFill;
    TVALevel2.ThumbColor := clSliderThumb;
    TVALevel3.FillColor := clSliderFill;
    TVALevel3.ThumbColor := clSliderThumb;
    TVASustain.FillColor := clSliderFill;
    TVASustain.ThumbColor := clSliderThumb;
    TVAAmplifier.FillColor := clSliderFill;
    TVAAmplifier.ThumbColor := clSliderThumb;
    TVATime1.IndColor := clSliderThumb;
    TVATime2.IndColor := clSliderThumb;
    TVATime3.IndColor := clSliderThumb;
    TVATime4.IndColor := clSliderThumb;
    TVATime5.IndColor := clSliderThumb;
    TVAVelSens.FillColor := clSliderFill;
    TVAVelSens.ThumbColor := clSliderThumb;
    TVATimeKeyFollow.FillColor := clSliderFill;
    TVATimeKeyFollow.ThumbColor := clSliderThumb;
    TVAVelKeyFollow.FillColor := clSliderFill;
    TVAVelKeyFollow.ThumbColor := clSliderThumb;
    TVABiasLevel1.FillColor := clSliderFill;
    TVABiasLevel1.ThumbColor := clSliderThumb;
    TVABiasLevel2.FillColor := clSliderFill;
    TVABiasLevel2.ThumbColor := clSliderThumb;
    Pt1MixPanel.Font.Color := clSynthText;
    Pt1Key.IndColor := clSliderThumb;
    Pt1Fine.IndColor := clSliderThumb;
    Pt1Bend.IndColor := clSliderThumb;
    Pt1Pan.IndColor := clSliderThumb;
    Pt1Output.FillColor := clSliderFill;
    Pt1Output.ThumbColor := clSliderThumb;
    Pt2MixPanel.Font.Color := clSynthText;
    Pt2Key.IndColor := clSliderThumb;
    Pt2Fine.IndColor := clSliderThumb;
    Pt2Bend.IndColor := clSliderThumb;
    Pt2Pan.IndColor := clSliderThumb;
    Pt2Output.FillColor := clSliderFill;
    Pt2Output.ThumbColor := clSliderThumb;
    Pt3MixPanel.Font.Color := clSynthText;
    Pt3Key.IndColor := clSliderThumb;
    Pt3Fine.IndColor := clSliderThumb;
    Pt3Bend.IndColor := clSliderThumb;
    Pt3Pan.IndColor := clSliderThumb;
    Pt3Output.FillColor := clSliderFill;
    Pt3Output.ThumbColor := clSliderThumb;
    Pt4MixPanel.Font.Color := clSynthText;
    Pt4Key.IndColor := clSliderThumb;
    Pt4Fine.IndColor := clSliderThumb;
    Pt4Bend.IndColor := clSliderThumb;
    Pt4Pan.IndColor := clSliderThumb;
    Pt4Output.FillColor := clSliderFill;
    Pt4Output.ThumbColor := clSliderThumb;
    Pt5MixPanel.Font.Color := clSynthText;
    Pt5Key.IndColor := clSliderThumb;
    Pt5Fine.IndColor := clSliderThumb;
    Pt5Bend.IndColor := clSliderThumb;
    Pt5Pan.IndColor := clSliderThumb;
    Pt5Output.FillColor := clSliderFill;
    Pt5Output.ThumbColor := clSliderThumb;
    Pt6MixPanel.Font.Color := clSynthText;
    Pt6Key.IndColor := clSliderThumb;
    Pt6Fine.IndColor := clSliderThumb;
    Pt6Bend.IndColor := clSliderThumb;
    Pt6Pan.IndColor := clSliderThumb;
    Pt6Output.FillColor := clSliderFill;
    Pt6Output.ThumbColor := clSliderThumb;
    Pt7MixPanel.Font.Color := clSynthText;
    Pt7Key.IndColor := clSliderThumb;
    Pt7Fine.IndColor := clSliderThumb;
    Pt7Bend.IndColor := clSliderThumb;
    Pt7Pan.IndColor := clSliderThumb;
    Pt7Output.FillColor := clSliderFill;
    Pt7Output.ThumbColor := clSliderThumb;
    Pt8MixPanel.Font.Color := clSynthText;
    Pt8Key.IndColor := clSliderThumb;
    Pt8Fine.IndColor := clSliderThumb;
    Pt8Bend.IndColor := clSliderThumb;
    Pt8Pan.IndColor := clSliderThumb;
    Pt8Output.FillColor := clSliderFill;
    Pt8Output.ThumbColor := clSliderThumb;
    PtRMixPanel.Font.Color := clSynthText;
    PtRKey.IndColor := clSliderThumb;
    PtRFine.IndColor := clSliderThumb;
    PtRBend.IndColor := clSliderThumb;
    PtROutput.FillColor := clSliderFill;
    PtROutput.ThumbColor := clSliderThumb;
end;

procedure TEditorForm.BuildMuteByte;
var
  q: Integer;
  MuteByte: Byte;
begin
  MuteByte := 0;

  for q := 0 to 3 do
  begin
    if Synth[CurSyn].Part[CurPt].Partial[q].Mute then
      MuteByte := MuteByte or (1 shl q);
  end;

  SysExAddress := LinearAddrToBytes(AdTimbreTemp +
    (CurPt * $F6) +
    $0C
  );
  SetLength(SysExData,1);
  SysExData[0] := MuteByte;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1BankChange(Sender: TObject);
begin
  LoadTimbreNames(Pt1Bank, Pt1Timbre);

  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].TmbGroup := Pt1Bank.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $00
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[0].TmbGroup;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1BendChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].BendRange := Pt1Bend.Value;
  UpdatingControls := True;
  Pt1Bend_value.Value := Synth[CurSyn].Patch[0].BendRange;
  if CurPt = 0 then
    PtBendRange.Value := Synth[CurSyn].Patch[0].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[0].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1Bend_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].BendRange := Pt1Bend_value.Value;
  UpdatingControls := True;
  Pt1Bend.Value := Synth[CurSyn].Patch[0].BendRange;
  if CurPt = 0 then
    PtBendRange.Value := Synth[CurSyn].Patch[0].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[0].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1ChanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].System.MidiChannel[0] := Pt1Chan.Value - 1;
  UpdatingControls := True;
  PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[0];
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $00 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[0];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1EnableClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  if Pt1Enable.Down then
  begin
    Synth[CurSyn].System.MidiChannel[0] := Pt1Chan.Value - 1;
    Pt1Chan.Enabled := True;
    if CurPt = 0 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[0];
      UpdatingControls := False;
    end;
  end
  else
  begin
    Synth[CurSyn].System.MidiChannel[0] := 16;
    Pt1Chan.Enabled := False;
    if CurPt = 0 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[0];
      UpdatingControls := False;
    end;
  end;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $00 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[0];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1FineChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].FineTune := Pt1Fine.Value;
  UpdatingControls := True;
  Pt1Fine_value.Value := Synth[CurSyn].Patch[0].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[0].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1Fine_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].FineTune := Pt1Fine_value.Value;
  UpdatingControls := True;
  Pt1Key.Value := Synth[CurSyn].Patch[0].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[0].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1KeyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].KeyShift := Pt1Key.Value;
  UpdatingControls := True;
  Pt1Key_value.Value := Synth[CurSyn].Patch[0].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[0].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1Key_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].KeyShift := Pt1Key_value.Value;
  UpdatingControls := True;
  Pt1Key.Value := Synth[CurSyn].Patch[0].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[0].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1OutputChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].Output := Pt1Output.Position;
  UpdatingControls := True;
  Pt1Output_value.Value := Synth[CurSyn].Patch[0].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[0].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1Output_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].Output := Pt1Output_value.Value;
  UpdatingControls := True;
  Pt1Output.Position := Synth[CurSyn].Patch[0].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[0].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1PanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].Pan := Pt1Pan.Value;
  UpdatingControls := True;
  Pt1Pan_value.Value := Synth[CurSyn].Patch[0].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[0].Pan + 7;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1Pan_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].Pan := Pt1Pan_value.Value;
  UpdatingControls := True;
  Pt1Pan.Value := Synth[CurSyn].Patch[0].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[0].Pan + 7;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1PolyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].PolyMode := Pt1Poly.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $05
  );
  SetLength(SysExData,1);
  SysExData[0] := Pt1Poly.ItemIndex;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1PtlReserveChange(Sender: TObject);
var
  NewSum: Integer;
begin
  if UpdatingControls then Exit;

  NewSum := Pt1PtlReserve.Value +
            Pt2PtlReserve.Value +
            Pt3PtlReserve.Value +
            Pt4PtlReserve.Value +
            Pt5PtlReserve.Value +
            Pt6PtlReserve.Value +
            Pt7PtlReserve.Value +
            Pt8PtlReserve.Value +
            PtRPtlReserve.Value;
  if NewSum > 32 then
  begin
    MessageBeep(MB_ICONERROR);
    ShowMessage('Sum of all Parts'' partial reserves must not exdeed 32');
    UpdatingControls := True;
    Pt1PtlReserve.Value := Pt1PtlReserve.Value - (NewSum - 32);
    UpdatingControls := False;
  end;
  if Synth[CurSyn].System.PtlReserve[0] <> Pt1PtlReserve.Value then
  begin
    Synth[CurSyn].System.PtlReserve[0] := Pt1PtlReserve.Value;
    SysExAddress := LinearAddrToBytes(
      AdSystem +
      $00 +
      $04
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].System.PtlReserve[0];
  end;
end;

procedure TEditorForm.Pt1ReverbClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].Reverb := Pt1Reverb.Down;
  if CurPt = 0 then
  begin
    UpdatingControls := True;
    PtRevButton.Down := Synth[CurSyn].Patch[0].Reverb;
    UpdatingControls := False;
  end;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $06
  );
  SetLength(SysExData,1);
  SysExData[0] := Byte(Synth[CurSyn].Patch[0].Reverb);
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt1TimbreChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[0].TmbNumber := Pt1Timbre.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (0 * $10) +
    $01
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[0].TmbNumber;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2BankChange(Sender: TObject);
begin
  LoadTimbreNames(Pt2Bank, Pt2Timbre);

  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].TmbGroup := Pt2Bank.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $00
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[1].TmbGroup;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2BendChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].BendRange := Pt2Bend.Value;
  UpdatingControls := True;
  Pt2Bend_value.Value := Synth[CurSyn].Patch[1].BendRange;
  if CurPt = 1 then
    PtBendRange.Value := Synth[CurSyn].Patch[1].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[1].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2Bend_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].BendRange := Pt2Bend_value.Value;
  UpdatingControls := True;
  Pt2Bend.Value := Synth[CurSyn].Patch[1].BendRange;
  if CurPt = 1 then
    PtBendRange.Value := Synth[CurSyn].Patch[1].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[1].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2ChanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].System.MidiChannel[1] := Pt2Chan.Value - 1;
  UpdatingControls := True;
  PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[1];
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $01 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[1];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2EnableClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  if Pt2Enable.Down then
  begin
    Synth[CurSyn].System.MidiChannel[1] := Pt2Chan.Value - 1;
    Pt2Chan.Enabled := True;
    if CurPt = 1 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[1];
      UpdatingControls := False;
    end;
  end
  else
  begin
    Synth[CurSyn].System.MidiChannel[1] := 16;
    Pt2Chan.Enabled := False;
    if CurPt = 1 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[1];
      UpdatingControls := False;
    end;
  end;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $01 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[1];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2FineChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].FineTune := Pt2Fine.Value;
  UpdatingControls := True;
  Pt2Fine_value.Value := Synth[CurSyn].Patch[1].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[1].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2Fine_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].FineTune := Pt2Fine_value.Value;
  UpdatingControls := True;
  Pt2Key.Value := Synth[CurSyn].Patch[1].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[1].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2KeyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].KeyShift := Pt2Key.Value;
  UpdatingControls := True;
  Pt2Key_value.Value := Synth[CurSyn].Patch[1].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[1].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2Key_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].KeyShift := Pt2Key_value.Value;
  UpdatingControls := True;
  Pt2Key.Value := Synth[CurSyn].Patch[1].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[1].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2OutputChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].Output := Pt2Output.Position;
  UpdatingControls := True;
  Pt2Output_value.Value := Synth[CurSyn].Patch[1].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[1].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2Output_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].Output := Pt2Output_value.Value;
  UpdatingControls := True;
  Pt2Output.Position := Synth[CurSyn].Patch[1].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[1].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2PanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].Pan := Pt2Pan.Value;
  UpdatingControls := True;
  Pt2Pan_value.Value := Synth[CurSyn].Patch[1].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[1].Pan + 7;
  SendCurrentSysEx;
end;


procedure TEditorForm.Pt2Pan_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].Pan := Pt2Pan_value.Value;
  UpdatingControls := True;
  Pt2Pan.Value := Synth[CurSyn].Patch[1].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[1].Pan + 7;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2PolyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].PolyMode := Pt2Poly.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $05
  );
  SetLength(SysExData,1);
  SysExData[0] := Pt2Poly.ItemIndex;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2PtlReserveChange(Sender: TObject);
var
  NewSum: Integer;
begin
  if UpdatingControls then Exit;

  NewSum := Pt1PtlReserve.Value +
            Pt2PtlReserve.Value +
            Pt3PtlReserve.Value +
            Pt4PtlReserve.Value +
            Pt5PtlReserve.Value +
            Pt6PtlReserve.Value +
            Pt7PtlReserve.Value +
            Pt8PtlReserve.Value +
            PtRPtlReserve.Value;
  if NewSum > 32 then
  begin
    MessageBeep(MB_ICONERROR);
    ShowMessage('Sum of all Parts'' partial reserves must not exdeed 32');
    UpdatingControls := True;
    Pt2PtlReserve.Value := Pt2PtlReserve.Value - (NewSum - 32);
    UpdatingControls := False;
  end;
  if Synth[CurSyn].System.PtlReserve[0] <> Pt2PtlReserve.Value then
  begin
    Synth[CurSyn].System.PtlReserve[0] := Pt2PtlReserve.Value;
    SysExAddress := LinearAddrToBytes(
      AdSystem +
      $01 +
      $04
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].System.PtlReserve[0];
  end;
end;

procedure TEditorForm.Pt2ReverbClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].Reverb := Pt2Reverb.Down;
  if CurPt = 1 then
  begin
    UpdatingControls := True;
    PtRevButton.Down := Synth[CurSyn].Patch[1].Reverb;
    UpdatingControls := False;
  end;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $06
  );
  SetLength(SysExData,1);
  SysExData[0] := Byte(Synth[CurSyn].Patch[1].Reverb);
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt2TimbreChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[1].TmbNumber := Pt2Timbre.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (1 * $10) +
    $01
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[1].TmbNumber;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3BankChange(Sender: TObject);
begin
  LoadTimbreNames(Pt3Bank, Pt3Timbre);

  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].TmbGroup := Pt3Bank.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $00
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[2].TmbGroup;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3BendChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].BendRange := Pt3Bend.Value;
  UpdatingControls := True;
  Pt3Bend_value.Value := Synth[CurSyn].Patch[2].BendRange;
  if CurPt = 2 then
    PtBendRange.Value := Synth[CurSyn].Patch[2].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[2].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3Bend_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].BendRange := Pt3Bend_value.Value;
  UpdatingControls := True;
  Pt3Bend.Value := Synth[CurSyn].Patch[2].BendRange;
  if CurPt = 2 then
    PtBendRange.Value := Synth[CurSyn].Patch[2].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[2].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3ChanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].System.MidiChannel[2] := Pt3Chan.Value - 1;
  UpdatingControls := True;
  PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[2];
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $02 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[2];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3EnableClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  if Pt3Enable.Down then
  begin
    Synth[CurSyn].System.MidiChannel[2] := Pt3Chan.Value - 1;
    Pt3Chan.Enabled := True;
    if CurPt = 2 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[2];
      UpdatingControls := False;
    end;
  end
  else
  begin
    Synth[CurSyn].System.MidiChannel[2] := 16;
    Pt3Chan.Enabled := False;
    if CurPt = 2 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[2];
      UpdatingControls := False;
    end;
  end;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $02 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[2];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3FineChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].FineTune := Pt3Fine.Value;
  UpdatingControls := True;
  Pt3Fine_value.Value := Synth[CurSyn].Patch[2].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[2].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3Fine_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].FineTune := Pt3Fine_value.Value;
  UpdatingControls := True;
  Pt3Key.Value := Synth[CurSyn].Patch[2].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[2].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3KeyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].KeyShift := Pt3Key.Value;
  UpdatingControls := True;
  Pt3Key_value.Value := Synth[CurSyn].Patch[2].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[2].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3Key_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].KeyShift := Pt3Key_value.Value;
  UpdatingControls := True;
  Pt3Key.Value := Synth[CurSyn].Patch[2].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[2].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3OutputChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].Output := Pt3Output.Position;
  UpdatingControls := True;
  Pt3Output_value.Value := Synth[CurSyn].Patch[2].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[2].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3Output_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].Output := Pt3Output_value.Value;
  UpdatingControls := True;
  Pt3Output.Position := Synth[CurSyn].Patch[2].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[2].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3PanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].Pan := Pt3Pan.Value;
  UpdatingControls := True;
  Pt3Pan_value.Value := Synth[CurSyn].Patch[2].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[2].Pan + 7;
  SendCurrentSysEx;
end;


procedure TEditorForm.Pt3Pan_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].Pan := Pt3Pan_value.Value;
  UpdatingControls := True;
  Pt3Pan.Value := Synth[CurSyn].Patch[2].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[2].Pan + 7;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3PolyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].PolyMode := Pt3Poly.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $05
  );
  SetLength(SysExData,1);
  SysExData[0] := Pt3Poly.ItemIndex;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3PtlReserveChange(Sender: TObject);
var
  NewSum: Integer;
begin
  if UpdatingControls then Exit;

  NewSum := Pt1PtlReserve.Value +
            Pt2PtlReserve.Value +
            Pt3PtlReserve.Value +
            Pt4PtlReserve.Value +
            Pt5PtlReserve.Value +
            Pt6PtlReserve.Value +
            Pt7PtlReserve.Value +
            Pt8PtlReserve.Value +
            PtRPtlReserve.Value;
  if NewSum > 32 then
  begin
    MessageBeep(MB_ICONERROR);
    ShowMessage('Sum of all Parts'' partial reserves must not exdeed 32');
    UpdatingControls := True;
    Pt3PtlReserve.Value := Pt3PtlReserve.Value - (NewSum - 32);
    UpdatingControls := False;
  end;
  if Synth[CurSyn].System.PtlReserve[0] <> Pt3PtlReserve.Value then
  begin
    Synth[CurSyn].System.PtlReserve[0] := Pt3PtlReserve.Value;
    SysExAddress := LinearAddrToBytes(
      AdSystem +
      $02 +
      $04
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].System.PtlReserve[0];
  end;
end;

procedure TEditorForm.Pt3ReverbClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].Reverb := Pt3Reverb.Down;
  if CurPt = 2 then
  begin
    UpdatingControls := True;
    PtRevButton.Down := Synth[CurSyn].Patch[2].Reverb;
    UpdatingControls := False;
  end;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $06
  );
  SetLength(SysExData,1);
  SysExData[0] := Byte(Synth[CurSyn].Patch[2].Reverb);
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt3TimbreChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[2].TmbNumber := Pt3Timbre.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (2 * $10) +
    $01
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[2].TmbNumber;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4BankChange(Sender: TObject);
begin
  LoadTimbreNames(Pt4Bank, Pt4Timbre);

  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].TmbGroup := Pt4Bank.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $00
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[3].TmbGroup;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4BendChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].BendRange := Pt4Bend.Value;
  UpdatingControls := True;
  Pt4Bend_value.Value := Synth[CurSyn].Patch[3].BendRange;
  if CurPt = 3 then
    PtBendRange.Value := Synth[CurSyn].Patch[3].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[3].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4Bend_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].BendRange := Pt4Bend_value.Value;
  UpdatingControls := True;
  Pt4Bend.Value := Synth[CurSyn].Patch[3].BendRange;
  if CurPt = 3 then
    PtBendRange.Value := Synth[CurSyn].Patch[3].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[3].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4ChanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].System.MidiChannel[3] := Pt4Chan.Value - 1;
  UpdatingControls := True;
  PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[3];
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $03 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[3];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4EnableClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  if Pt4Enable.Down then
  begin
    Synth[CurSyn].System.MidiChannel[3] := Pt4Chan.Value - 1;
    Pt4Chan.Enabled := True;
    if CurPt = 3 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[3];
      UpdatingControls := False;
    end;
  end
  else
  begin
    Synth[CurSyn].System.MidiChannel[3] := 16;
    Pt4Chan.Enabled := False;
    if CurPt = 3 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[3];
      UpdatingControls := False;
    end;
  end;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $03 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[3];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4FineChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].FineTune := Pt4Fine.Value;
  UpdatingControls := True;
  Pt4Fine_value.Value := Synth[CurSyn].Patch[3].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[3].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4Fine_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].FineTune := Pt4Fine_value.Value;
  UpdatingControls := True;
  Pt4Key.Value := Synth[CurSyn].Patch[3].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[3].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4KeyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].KeyShift := Pt4Key.Value;
  UpdatingControls := True;
  Pt4Key_value.Value := Synth[CurSyn].Patch[3].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[3].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4Key_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].KeyShift := Pt4Key_value.Value;
  UpdatingControls := True;
  Pt4Key.Value := Synth[CurSyn].Patch[3].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[3].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4OutputChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].Output := Pt4Output.Position;
  UpdatingControls := True;
  Pt4Output_value.Value := Synth[CurSyn].Patch[3].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[3].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4Output_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].Output := Pt4Output_value.Value;
  UpdatingControls := True;
  Pt4Output.Position := Synth[CurSyn].Patch[3].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[3].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4PanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].Pan := Pt4Pan.Value;
  UpdatingControls := True;
  Pt4Pan_value.Value := Synth[CurSyn].Patch[3].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[3].Pan + 7;
  SendCurrentSysEx;
end;


procedure TEditorForm.Pt4Pan_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].Pan := Pt4Pan_value.Value;
  UpdatingControls := True;
  Pt4Pan.Value := Synth[CurSyn].Patch[3].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[3].Pan + 7;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4PolyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].PolyMode := Pt4Poly.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $05
  );
  SetLength(SysExData,1);
  SysExData[0] := Pt4Poly.ItemIndex;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4PtlReserveChange(Sender: TObject);
var
  NewSum: Integer;
begin
  if UpdatingControls then Exit;

  NewSum := Pt1PtlReserve.Value +
            Pt2PtlReserve.Value +
            Pt3PtlReserve.Value +
            Pt4PtlReserve.Value +
            Pt5PtlReserve.Value +
            Pt6PtlReserve.Value +
            Pt7PtlReserve.Value +
            Pt8PtlReserve.Value +
            PtRPtlReserve.Value;
  if NewSum > 32 then
  begin
    MessageBeep(MB_ICONERROR);
    ShowMessage('Sum of all Parts'' partial reserves must not exdeed 32');
    UpdatingControls := True;
    Pt4PtlReserve.Value := Pt4PtlReserve.Value - (NewSum - 32);
    UpdatingControls := False;
  end;
  if Synth[CurSyn].System.PtlReserve[0] <> Pt4PtlReserve.Value then
  begin
    Synth[CurSyn].System.PtlReserve[0] := Pt4PtlReserve.Value;
    SysExAddress := LinearAddrToBytes(
      AdSystem +
      $03 +
      $04
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].System.PtlReserve[0];
  end;
end;

procedure TEditorForm.Pt4ReverbClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].Reverb := Pt4Reverb.Down;
  if CurPt = 3 then
  begin
    UpdatingControls := True;
    PtRevButton.Down := Synth[CurSyn].Patch[3].Reverb;
    UpdatingControls := False;
  end;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $06
  );
  SetLength(SysExData,1);
  SysExData[0] := Byte(Synth[CurSyn].Patch[3].Reverb);
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt4TimbreChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[3].TmbNumber := Pt4Timbre.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (3 * $10) +
    $01
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[3].TmbNumber;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5BankChange(Sender: TObject);
begin
  LoadTimbreNames(Pt5Bank, Pt5Timbre);

  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].TmbGroup := Pt5Bank.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $00
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[4].TmbGroup;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5BendChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].BendRange := Pt5Bend.Value;
  UpdatingControls := True;
  Pt5Bend_value.Value := Synth[CurSyn].Patch[4].BendRange;
  if CurPt = 4 then
    PtBendRange.Value := Synth[CurSyn].Patch[4].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[4].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5Bend_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].BendRange := Pt5Bend_value.Value;
  UpdatingControls := True;
  Pt5Bend.Value := Synth[CurSyn].Patch[4].BendRange;
  if CurPt = 4 then
    PtBendRange.Value := Synth[CurSyn].Patch[4].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[4].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5ChanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].System.MidiChannel[4] := Pt5Chan.Value - 1;
  UpdatingControls := True;
  PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[4];
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $04 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[4];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5EnableClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  if Pt5Enable.Down then
  begin
    Synth[CurSyn].System.MidiChannel[4] := Pt5Chan.Value - 1;
    Pt5Chan.Enabled := True;
    if CurPt = 4 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[4];
      UpdatingControls := False;
    end;
  end
  else
  begin
    Synth[CurSyn].System.MidiChannel[4] := 16;
    Pt5Chan.Enabled := False;
    if CurPt = 4 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[4];
      UpdatingControls := False;
    end;
  end;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $04 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[4];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5FineChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].FineTune := Pt5Fine.Value;
  UpdatingControls := True;
  Pt5Fine_value.Value := Synth[CurSyn].Patch[4].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[4].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5Fine_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].FineTune := Pt5Fine_value.Value;
  UpdatingControls := True;
  Pt5Key.Value := Synth[CurSyn].Patch[4].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[4].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5KeyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].KeyShift := Pt5Key.Value;
  UpdatingControls := True;
  Pt5Key_value.Value := Synth[CurSyn].Patch[4].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[4].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5Key_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].KeyShift := Pt5Key_value.Value;
  UpdatingControls := True;
  Pt5Key.Value := Synth[CurSyn].Patch[4].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[4].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5OutputChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].Output := Pt5Output.Position;
  UpdatingControls := True;
  Pt5Output_value.Value := Synth[CurSyn].Patch[4].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[4].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5Output_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].Output := Pt5Output_value.Value;
  UpdatingControls := True;
  Pt5Output.Position := Synth[CurSyn].Patch[4].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[4].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5PanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].Pan := Pt5Pan.Value;
  UpdatingControls := True;
  Pt5Pan_value.Value := Synth[CurSyn].Patch[4].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[4].Pan + 7;
  SendCurrentSysEx;
end;


procedure TEditorForm.Pt5Pan_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].Pan := Pt5Pan_value.Value;
  UpdatingControls := True;
  Pt5Pan.Value := Synth[CurSyn].Patch[4].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[4].Pan + 7;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5PolyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].PolyMode := Pt5Poly.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $05
  );
  SetLength(SysExData,1);
  SysExData[0] := Pt5Poly.ItemIndex;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5PtlReserveChange(Sender: TObject);
var
  NewSum: Integer;
begin
  if UpdatingControls then Exit;

  NewSum := Pt1PtlReserve.Value +
            Pt2PtlReserve.Value +
            Pt3PtlReserve.Value +
            Pt4PtlReserve.Value +
            Pt5PtlReserve.Value +
            Pt6PtlReserve.Value +
            Pt7PtlReserve.Value +
            Pt8PtlReserve.Value +
            PtRPtlReserve.Value;
  if NewSum > 32 then
  begin
    MessageBeep(MB_ICONERROR);
    ShowMessage('Sum of all Parts'' partial reserves must not exdeed 32');
    UpdatingControls := True;
    Pt5PtlReserve.Value := Pt5PtlReserve.Value - (NewSum - 32);
    UpdatingControls := False;
  end;
  if Synth[CurSyn].System.PtlReserve[0] <> Pt5PtlReserve.Value then
  begin
    Synth[CurSyn].System.PtlReserve[0] := Pt5PtlReserve.Value;
    SysExAddress := LinearAddrToBytes(
      AdSystem +
      $04 +
      $04
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].System.PtlReserve[0];
  end;
end;

procedure TEditorForm.Pt5ReverbClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].Reverb := Pt5Reverb.Down;
  if CurPt = 4 then
  begin
    UpdatingControls := True;
    PtRevButton.Down := Synth[CurSyn].Patch[4].Reverb;
    UpdatingControls := False;
  end;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $06
  );
  SetLength(SysExData,1);
  SysExData[0] := Byte(Synth[CurSyn].Patch[4].Reverb);
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt5TimbreChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[4].TmbNumber := Pt5Timbre.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (4 * $10) +
    $01
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[4].TmbNumber;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6BankChange(Sender: TObject);
begin
  LoadTimbreNames(Pt6Bank, Pt6Timbre);

  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].TmbGroup := Pt6Bank.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $00
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[5].TmbGroup;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6BendChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].BendRange := Pt6Bend.Value;
  UpdatingControls := True;
  Pt6Bend_value.Value := Synth[CurSyn].Patch[5].BendRange;
  if CurPt = 5 then
    PtBendRange.Value := Synth[CurSyn].Patch[5].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[5].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6Bend_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].BendRange := Pt6Bend_value.Value;
  UpdatingControls := True;
  Pt6Bend.Value := Synth[CurSyn].Patch[5].BendRange;
  if CurPt = 5 then
    PtBendRange.Value := Synth[CurSyn].Patch[5].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[5].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6ChanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].System.MidiChannel[5] := Pt6Chan.Value - 1;
  UpdatingControls := True;
  PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[5];
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $05 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[5];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6EnableClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  if Pt6Enable.Down then
  begin
    Synth[CurSyn].System.MidiChannel[5] := Pt6Chan.Value - 1;
    Pt6Chan.Enabled := True;
    if CurPt = 5 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[5];
      UpdatingControls := False;
    end;
  end
  else
  begin
    Synth[CurSyn].System.MidiChannel[5] := 16;
    Pt6Chan.Enabled := False;
    if CurPt = 5 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[5];
      UpdatingControls := False;
    end;
  end;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $05 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[5];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6FineChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].FineTune := Pt6Fine.Value;
  UpdatingControls := True;
  Pt6Fine_value.Value := Synth[CurSyn].Patch[5].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[5].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6Fine_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].FineTune := Pt6Fine_value.Value;
  UpdatingControls := True;
  Pt6Key.Value := Synth[CurSyn].Patch[5].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[5].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6KeyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].KeyShift := Pt6Key.Value;
  UpdatingControls := True;
  Pt6Key_value.Value := Synth[CurSyn].Patch[5].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[5].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6Key_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].KeyShift := Pt6Key_value.Value;
  UpdatingControls := True;
  Pt6Key.Value := Synth[CurSyn].Patch[5].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[5].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6OutputChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].Output := Pt6Output.Position;
  UpdatingControls := True;
  Pt6Output_value.Value := Synth[CurSyn].Patch[5].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[5].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6Output_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].Output := Pt6Output_value.Value;
  UpdatingControls := True;
  Pt6Output.Position := Synth[CurSyn].Patch[5].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[5].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6PanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].Pan := Pt6Pan.Value;
  UpdatingControls := True;
  Pt6Pan_value.Value := Synth[CurSyn].Patch[5].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[5].Pan + 7;
  SendCurrentSysEx;
end;


procedure TEditorForm.Pt6Pan_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].Pan := Pt6Pan_value.Value;
  UpdatingControls := True;
  Pt6Pan.Value := Synth[CurSyn].Patch[5].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[5].Pan + 7;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6PolyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].PolyMode := Pt6Poly.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $05
  );
  SetLength(SysExData,1);
  SysExData[0] := Pt6Poly.ItemIndex;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6PtlReserveChange(Sender: TObject);
var
  NewSum: Integer;
begin
  if UpdatingControls then Exit;

  NewSum := Pt1PtlReserve.Value +
            Pt2PtlReserve.Value +
            Pt3PtlReserve.Value +
            Pt4PtlReserve.Value +
            Pt5PtlReserve.Value +
            Pt6PtlReserve.Value +
            Pt7PtlReserve.Value +
            Pt8PtlReserve.Value +
            PtRPtlReserve.Value;
  if NewSum > 32 then
  begin
    MessageBeep(MB_ICONERROR);
    ShowMessage('Sum of all Parts'' partial reserves must not exdeed 32');
    UpdatingControls := True;
    Pt6PtlReserve.Value := Pt6PtlReserve.Value - (NewSum - 32);
    UpdatingControls := False;
  end;
  if Synth[CurSyn].System.PtlReserve[0] <> Pt6PtlReserve.Value then
  begin
    Synth[CurSyn].System.PtlReserve[0] := Pt6PtlReserve.Value;
    SysExAddress := LinearAddrToBytes(
      AdSystem +
      $05 +
      $04
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].System.PtlReserve[0];
  end;
end;

procedure TEditorForm.Pt6ReverbClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].Reverb := Pt6Reverb.Down;
  if CurPt = 5 then
  begin
    UpdatingControls := True;
    PtRevButton.Down := Synth[CurSyn].Patch[5].Reverb;
    UpdatingControls := False;
  end;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $06
  );
  SetLength(SysExData,1);
  SysExData[0] := Byte(Synth[CurSyn].Patch[5].Reverb);
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt6TimbreChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[5].TmbNumber := Pt6Timbre.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (5 * $10) +
    $01
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[5].TmbNumber;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7BankChange(Sender: TObject);
begin
  LoadTimbreNames(Pt7Bank, Pt7Timbre);

  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].TmbGroup := Pt7Bank.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $00
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[6].TmbGroup;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7BendChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].BendRange := Pt7Bend.Value;
  UpdatingControls := True;
  Pt7Bend_value.Value := Synth[CurSyn].Patch[6].BendRange;
  if CurPt = 6 then
    PtBendRange.Value := Synth[CurSyn].Patch[6].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[6].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7Bend_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].BendRange := Pt7Bend_value.Value;
  UpdatingControls := True;
  Pt7Bend.Value := Synth[CurSyn].Patch[6].BendRange;
  if CurPt = 6 then
    PtBendRange.Value := Synth[CurSyn].Patch[6].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[6].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7ChanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].System.MidiChannel[6] := Pt7Chan.Value - 1;
  UpdatingControls := True;
  PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[6];
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $06 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[6];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7EnableClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  if Pt7Enable.Down then
  begin
    Synth[CurSyn].System.MidiChannel[6] := Pt7Chan.Value - 1;
    Pt7Chan.Enabled := True;
    if CurPt = 6 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[6];
      UpdatingControls := False;
    end;
  end
  else
  begin
    Synth[CurSyn].System.MidiChannel[6] := 16;
    Pt7Chan.Enabled := False;
    if CurPt = 6 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[6];
      UpdatingControls := False;
    end;
  end;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $06 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[6];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7FineChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].FineTune := Pt7Fine.Value;
  UpdatingControls := True;
  Pt7Fine_value.Value := Synth[CurSyn].Patch[6].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[6].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7Fine_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].FineTune := Pt7Fine_value.Value;
  UpdatingControls := True;
  Pt7Key.Value := Synth[CurSyn].Patch[6].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[6].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7KeyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].KeyShift := Pt7Key.Value;
  UpdatingControls := True;
  Pt7Key_value.Value := Synth[CurSyn].Patch[6].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[6].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7Key_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].KeyShift := Pt7Key_value.Value;
  UpdatingControls := True;
  Pt7Key.Value := Synth[CurSyn].Patch[6].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[6].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7OutputChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].Output := Pt7Output.Position;
  UpdatingControls := True;
  Pt7Output_value.Value := Synth[CurSyn].Patch[6].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[6].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7Output_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].Output := Pt7Output_value.Value;
  UpdatingControls := True;
  Pt7Output.Position := Synth[CurSyn].Patch[6].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[6].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7PanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].Pan := Pt7Pan.Value;
  UpdatingControls := True;
  Pt7Pan_value.Value := Synth[CurSyn].Patch[6].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[6].Pan + 7;
  SendCurrentSysEx;
end;


procedure TEditorForm.Pt7Pan_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].Pan := Pt7Pan_value.Value;
  UpdatingControls := True;
  Pt7Pan.Value := Synth[CurSyn].Patch[6].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[6].Pan + 7;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7PolyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].PolyMode := Pt7Poly.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $05
  );
  SetLength(SysExData,1);
  SysExData[0] := Pt7Poly.ItemIndex;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7PtlReserveChange(Sender: TObject);
var
  NewSum: Integer;
begin
  if UpdatingControls then Exit;

  NewSum := Pt1PtlReserve.Value +
            Pt2PtlReserve.Value +
            Pt3PtlReserve.Value +
            Pt4PtlReserve.Value +
            Pt5PtlReserve.Value +
            Pt6PtlReserve.Value +
            Pt7PtlReserve.Value +
            Pt8PtlReserve.Value +
            PtRPtlReserve.Value;
  if NewSum > 32 then
  begin
    MessageBeep(MB_ICONERROR);
    ShowMessage('Sum of all Parts'' partial reserves must not exdeed 32');
    UpdatingControls := True;
    Pt7PtlReserve.Value := Pt7PtlReserve.Value - (NewSum - 32);
    UpdatingControls := False;
  end;
  if Synth[CurSyn].System.PtlReserve[0] <> Pt7PtlReserve.Value then
  begin
    Synth[CurSyn].System.PtlReserve[0] := Pt7PtlReserve.Value;
    SysExAddress := LinearAddrToBytes(
      AdSystem +
      $06 +
      $04
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].System.PtlReserve[0];
  end;
end;

procedure TEditorForm.Pt7ReverbClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].Reverb := Pt7Reverb.Down;
  if CurPt = 6 then
  begin
    UpdatingControls := True;
    PtRevButton.Down := Synth[CurSyn].Patch[6].Reverb;
    UpdatingControls := False;
  end;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $06
  );
  SetLength(SysExData,1);
  SysExData[0] := Byte(Synth[CurSyn].Patch[6].Reverb);
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt7TimbreChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[6].TmbNumber := Pt7Timbre.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (6 * $10) +
    $01
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[6].TmbNumber;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8BankChange(Sender: TObject);
begin
  LoadTimbreNames(Pt8Bank, Pt8Timbre);

  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].TmbGroup := Pt8Bank.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $00
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[7].TmbGroup;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8BendChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].BendRange := Pt8Bend.Value;
  UpdatingControls := True;
  Pt8Bend_value.Value := Synth[CurSyn].Patch[7].BendRange;
  if CurPt = 7 then
    PtBendRange.Value := Synth[CurSyn].Patch[7].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[7].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8Bend_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].BendRange := Pt8Bend_value.Value;
  UpdatingControls := True;
  Pt8Bend.Value := Synth[CurSyn].Patch[7].BendRange;
  if CurPt = 7 then
    PtBendRange.Value := Synth[CurSyn].Patch[7].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[7].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8ChanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].System.MidiChannel[7] := Pt8Chan.Value - 1;
  UpdatingControls := True;
  PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[7];
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $07 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[7];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8EnableClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  if Pt8Enable.Down then
  begin
    Synth[CurSyn].System.MidiChannel[7] := Pt8Chan.Value - 1;
    Pt8Chan.Enabled := True;
    if CurPt = 7 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[7];
      UpdatingControls := False;
    end;
  end
  else
  begin
    Synth[CurSyn].System.MidiChannel[7] := 16;
    Pt8Chan.Enabled := False;
    if CurPt = 7 then
    begin
      UpdatingControls := True;
      PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[7];
      UpdatingControls := False;
    end;
  end;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $07 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[7];
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8FineChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].FineTune := Pt8Fine.Value;
  UpdatingControls := True;
  Pt8Fine_value.Value := Synth[CurSyn].Patch[7].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[7].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8Fine_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].FineTune := Pt8Fine_value.Value;
  UpdatingControls := True;
  Pt8Key.Value := Synth[CurSyn].Patch[7].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[7].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8KeyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].KeyShift := Pt8Key.Value;
  UpdatingControls := True;
  Pt8Key_value.Value := Synth[CurSyn].Patch[7].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[7].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8Key_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].KeyShift := Pt8Key_value.Value;
  UpdatingControls := True;
  Pt8Key.Value := Synth[CurSyn].Patch[7].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[7].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8OutputChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].Output := Pt8Output.Position;
  UpdatingControls := True;
  Pt8Output_value.Value := Synth[CurSyn].Patch[7].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[7].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8Output_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].Output := Pt8Output_value.Value;
  UpdatingControls := True;
  Pt8Output.Position := Synth[CurSyn].Patch[7].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[7].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8PanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].Pan := Pt8Pan.Value;
  UpdatingControls := True;
  Pt8Pan_value.Value := Synth[CurSyn].Patch[7].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[7].Pan + 7;
  SendCurrentSysEx;
end;


procedure TEditorForm.Pt8Pan_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].Pan := Pt8Pan_value.Value;
  UpdatingControls := True;
  Pt8Pan.Value := Synth[CurSyn].Patch[7].Pan;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[7].Pan + 7;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8PolyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].PolyMode := Pt8Poly.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $05
  );
  SetLength(SysExData,1);
  SysExData[0] := Pt8Poly.ItemIndex;
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8PtlReserveChange(Sender: TObject);
var
  NewSum: Integer;
begin
  if UpdatingControls then Exit;

  NewSum := Pt1PtlReserve.Value +
            Pt2PtlReserve.Value +
            Pt3PtlReserve.Value +
            Pt4PtlReserve.Value +
            Pt5PtlReserve.Value +
            Pt6PtlReserve.Value +
            Pt7PtlReserve.Value +
            Pt8PtlReserve.Value +
            PtRPtlReserve.Value;
  if NewSum > 32 then
  begin
    MessageBeep(MB_ICONERROR);
    ShowMessage('Sum of all Parts'' partial reserves must not exdeed 32');
    UpdatingControls := True;
    Pt8PtlReserve.Value := Pt8PtlReserve.Value - (NewSum - 32);
    UpdatingControls := False;
  end;
  if Synth[CurSyn].System.PtlReserve[0] <> Pt8PtlReserve.Value then
  begin
    Synth[CurSyn].System.PtlReserve[0] := Pt8PtlReserve.Value;
    SysExAddress := LinearAddrToBytes(
      AdSystem +
      $07 +
      $04
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].System.PtlReserve[0];
  end;
end;

procedure TEditorForm.Pt8ReverbClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].Reverb := Pt8Reverb.Down;
  if CurPt = 7 then
  begin
    UpdatingControls := True;
    PtRevButton.Down := Synth[CurSyn].Patch[7].Reverb;
    UpdatingControls := False;
  end;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $06
  );
  SetLength(SysExData,1);
  SysExData[0] := Byte(Synth[CurSyn].Patch[7].Reverb);
  SendCurrentSysEx;
end;

procedure TEditorForm.Pt8TimbreChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[7].TmbNumber := Pt8Timbre.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (7 * $10) +
    $01
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[7].TmbNumber;
  SendCurrentSysEx;
end;

procedure TEditorForm.PtRBendChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[8].BendRange := PtRBend.Value;
  UpdatingControls := True;
  PtRBend_value.Value := Synth[CurSyn].Patch[8].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (8 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[8].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.PtRBend_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[8].BendRange := PtRBend_value.Value;
  UpdatingControls := True;
  PtRBend.Value := Synth[CurSyn].Patch[8].BendRange;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (8 * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[8].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.PtRChanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].System.MidiChannel[8] := PtRChan.Value - 1;
  UpdatingControls := True;
  PartMidiChan.ItemIndex := Synth[CurSyn].System.MidiChannel[8];
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $08 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[8];
  SendCurrentSysEx;
end;

procedure TEditorForm.PtREnableClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  if PtREnable.Down then
  begin
    Synth[CurSyn].System.MidiChannel[8] := PtRChan.Value - 1;
    PtRChan.Enabled := True;
  end
  else
  begin
    Synth[CurSyn].System.MidiChannel[8] := 16;
    PtRChan.Enabled := False;
  end;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $08 +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[8];
  SendCurrentSysEx;
end;

procedure TEditorForm.PtRFineChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[8].FineTune := PtRFine.Value;
  UpdatingControls := True;
  PtRFine_value.Value := Synth[CurSyn].Patch[8].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (8 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[8].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.PtRFine_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[8].FineTune := PtRFine_value.Value;
  UpdatingControls := True;
  PtRKey.Value := Synth[CurSyn].Patch[8].FineTune;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (8 * $10) +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[8].FineTune + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.PtRKeyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[8].KeyShift := PtRKey.Value;
  UpdatingControls := True;
  PtRKey_value.Value := Synth[CurSyn].Patch[8].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (8 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[8].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.PtRKey_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[8].KeyShift := PtRKey_value.Value;
  UpdatingControls := True;
  PtRKey.Value := Synth[CurSyn].Patch[8].KeyShift;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (8 * $10) +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[8].KeyShift + 24;
  SendCurrentSysEx;
end;

procedure TEditorForm.PtROutputChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[8].Output := PtROutput.Position;
  UpdatingControls := True;
  PtROutput_value.Value := Synth[CurSyn].Patch[8].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (8 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[8].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.PtROutput_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[8].Output := PtROutput_value.Value;
  UpdatingControls := True;
  PtROutput.Position := Synth[CurSyn].Patch[8].Output;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (8 * $10) +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[8].Output;
  SendCurrentSysEx;
end;

procedure TEditorForm.PtRPolyChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[8].PolyMode := PtRPoly.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (8 * $10) +
    $05
  );
  SetLength(SysExData,1);
  SysExData[0] := PtRPoly.ItemIndex;
  SendCurrentSysEx;
end;

procedure TEditorForm.PtRPtlReserveChange(Sender: TObject);
var
  NewSum: Integer;
begin
  if UpdatingControls then Exit;

  NewSum := Pt1PtlReserve.Value +
            Pt2PtlReserve.Value +
            Pt3PtlReserve.Value +
            Pt4PtlReserve.Value +
            Pt5PtlReserve.Value +
            Pt6PtlReserve.Value +
            Pt7PtlReserve.Value +
            Pt8PtlReserve.Value +
            PtRPtlReserve.Value;
  if NewSum > 32 then
  begin
    MessageBeep(MB_ICONERROR);
    ShowMessage('Sum of all Parts'' partial reserves must not exdeed 32');
    UpdatingControls := True;
    PtRPtlReserve.Value := PtRPtlReserve.Value - (NewSum - 32);
    UpdatingControls := False;
  end;
  if Synth[CurSyn].System.PtlReserve[0] <> PtRPtlReserve.Value then
  begin
    Synth[CurSyn].System.PtlReserve[0] := PtRPtlReserve.Value;
    SysExAddress := LinearAddrToBytes(
      AdSystem +
      $08 +
      $04
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].System.PtlReserve[0];
  end;
end;

procedure TEditorForm.PtBendRangeChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[CurPt].BendRange := PtBendRange.Value;
  UpdatingControls := True;
  case CurPt of
    0:
    begin
      Pt1Bend.Value := Synth[CurSyn].Patch[CurPt].BendRange;
      Pt1Bend_value.Value := Synth[CurSyn].Patch[CurPt].BendRange;
    end;
    1:
    begin
      Pt2Bend.Value := Synth[CurSyn].Patch[CurPt].BendRange;
      Pt2Bend_value.Value := Synth[CurSyn].Patch[CurPt].BendRange;
    end;
    2:
    begin
      Pt3Bend.Value := Synth[CurSyn].Patch[CurPt].BendRange;
      Pt3Bend_value.Value := Synth[CurSyn].Patch[CurPt].BendRange;
    end;
    3:
    begin
      Pt4Bend.Value := Synth[CurSyn].Patch[CurPt].BendRange;
      Pt4Bend_value.Value := Synth[CurSyn].Patch[CurPt].BendRange;
    end;
    4:
    begin
      Pt5Bend.Value := Synth[CurSyn].Patch[CurPt].BendRange;
      Pt5Bend_value.Value := Synth[CurSyn].Patch[CurPt].BendRange;
    end;
    5:
    begin
      Pt6Bend.Value := Synth[CurSyn].Patch[CurPt].BendRange;
      Pt6Bend_value.Value := Synth[CurSyn].Patch[CurPt].BendRange;
    end;
    6:
    begin
      Pt7Bend.Value := Synth[CurSyn].Patch[CurPt].BendRange;
      Pt7Bend_value.Value := Synth[CurSyn].Patch[CurPt].BendRange;
    end;
    7:
    begin
      Pt8Bend.Value := Synth[CurSyn].Patch[CurPt].BendRange;
      Pt8Bend_value.Value := Synth[CurSyn].Patch[CurPt].BendRange;
    end;
  end;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdPatchTemp +
    (CurPt * $10) +
    $04
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Patch[CurPt].BendRange;
  SendCurrentSysEx;
end;

procedure TEditorForm.PtBendRangeKeyPress(Sender: TObject; var Key: Char);
begin
  ActiveControl := nil;
end;

procedure TEditorForm.PtRevButtonClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Patch[CurPt].Reverb := PtRevButton.Down;
  UpdatingControls := True;
  case CurPt of
    0: Pt1Reverb.Down := Synth[CurSyn].Patch[CurPt].Reverb;
    1: Pt2Reverb.Down := Synth[CurSyn].Patch[CurPt].Reverb;
    2: Pt3Reverb.Down := Synth[CurSyn].Patch[CurPt].Reverb;
    3: Pt4Reverb.Down := Synth[CurSyn].Patch[CurPt].Reverb;
    4: Pt5Reverb.Down := Synth[CurSyn].Patch[CurPt].Reverb;
    5: Pt6Reverb.Down := Synth[CurSyn].Patch[CurPt].Reverb;
    6: Pt7Reverb.Down := Synth[CurSyn].Patch[CurPt].Reverb;
    7: Pt8Reverb.Down := Synth[CurSyn].Patch[CurPt].Reverb;
  end;
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(AdPatchTemp + (CurPt * $10) + $06);
  SetLength(SysExData,1);
  SysExData[0] := Byte(Synth[CurSyn].Patch[CurPt].Reverb);
  SendCurrentSysEx;
end;

procedure TEditorForm.SetWGSynth;
begin
  WGPulseWidth_label.Font.Color := clWindowText;
  if not WGPulseWidth.Enabled then
    WGPulseWidth.Enabled := True;
  if not WGPulseWidth_value.Enabled then
    WGPulseWidth_value.Enabled := True;

  WGVelSens_label.Font.Color := clWindowText;
  if not WGVelSens.Enabled then
    WGVelSens.Enabled := True;
  if not WGVelSens_value.Enabled then
    WGVelSens_value.Enabled := True;

  WGSample_label.Font.Color := clGrayText;
  if WGSample.Enabled then
    WGSample.Enabled := False;
end;

procedure TEditorForm.SetWGPCM;
begin
  WGPulseWidth_label.Font.Color := clGrayText;
  if WGPulseWidth.Enabled then
    WGPulseWidth.Enabled := False;
  if WGPulseWidth_value.Enabled then
    WGPulseWidth_value.Enabled := False;

  WGVelSens_label.Font.Color := clGrayText;
  if WGVelSens.Enabled then
    WGVelSens.Enabled := False;
  if WGVelSens_value.Enabled then
    WGVelSens_value.Enabled := False;

  WGSample_label.Font.Color := clWindowText;
  if not WGSample.Enabled then
    WGSample.Enabled := True;
end;

procedure TEditorForm.EnableTVF;
var
  i: Integer;
begin
  for i := 0 to TVFGroup.ControlCount - 1 do
    TVFGroup.Controls[i].Enabled := True;
  for i := 0 to TVFFilterGroup.ControlCount - 1 do
    TVFFilterGroup.Controls[i].Enabled := True;
  TVFPlot.Invalidate;
  TVFFilterPlot.Invalidate;
end;

procedure TEditorForm.DisableTVF;
var
  i: Integer;
begin
  for i := 0 to TVFGroup.ControlCount - 1 do
    TVFGroup.Controls[i].Enabled := False;
  for i := 0 to TVFFilterGroup.ControlCount - 1 do
    TVFFilterGroup.Controls[i].Enabled := False;

  TVFPlot.Invalidate;
  TVFFilterPlot.Invalidate;
end;

function TEditorForm.AllowSignedNumericKey(Edit: TEdit; var Key: Char): Boolean;
begin
  Result := True;

  if Key = #8 then Exit;
  if Key = #13 then Exit;
  if Key = #27 then Exit;
  
  if CharInSet(Key, ['0'..'9']) then Exit;

  if (Key = '-') and
    (Edit.SelStart = 0) and
    (Pos('-', Edit.Text) = 0) then
  Exit;

  Key := #0;
  //MessageBeep(MB_ICONWARNING);
  Result := False;
end;

procedure TEditorForm.PressedKey(Sender: TObject; var Key: Char);
begin
  case Key of
    #13, #27:
    begin
      Key := #0;
      ActiveControl := nil;
    end;
  end;
end;



{             }
{ UI Controls }
{             }


{ Part Controls }
procedure TEditorForm.OpenSyxButtonClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
  SyxBytes: TBytes;
begin
  //ShowMessage('Coming soon');
  OpenDialog := TOpenDialog.Create(Self);
  try
    OpenDialog.Title := 'Open SysEx File';
    OpenDialog.Filter := 'SysEx files (*.syx)|*.syx|All files (*.*)|*.*';
    OpenDialog.DefaultExt := 'syx';
    OpenDialog.Options := [ofFileMustExist, ofPathMustExist];

    if not OpenDialog.Execute then Exit;

    SyxBytes := TFile.ReadAllBytes(OpenDialog.FileName);

    if Length(SyxBytes) = 0 then
    begin
      ShowMessage('The selected file is empty.');
      Exit;
    end;

    if (SyxBytes[0] <> $F0) or (SyxBytes[High(SyxBytes)] <> $F7) then
    begin
      ShowMessage('This does not appear to be a valid SysEx file.');
      Exit;
    end;

    //SendSyxBytesToMunt(SyxBytes);
    LoadAllDataFromMunt;
    RefreshVisibleControls;

  finally
    OpenDialog.Free;
  end;
end;

procedure TEditorForm.SaveSyxButtonClick(Sender: TObject);
var
  SaveDialog: TSaveDialog;
  SyxBytes: TBytes;
begin
  SaveDialog := TSaveDialog.Create(Self);
  try
    SaveDialog.Title := 'Save SysEx File';
    SaveDialog.Filter := 'SysEx files (*.syx)|*.syx|All files (*.*)|*.*';
    SaveDialog.DefaultExt := 'syx';
    SaveDialog.Options := [ofOverwritePrompt, ofPathMustExist];

    if not SaveDialog.Execute then
      Exit;

    //SyxBytes := BuildSyxFromEditorModel;

    TFile.WriteAllBytes(SaveDialog.FileName, SyxBytes);
  finally
    SaveDialog.Free;
  end;
end;

procedure TEditorForm.CurPartChange(Sender: TObject);
begin
  if CurPt <> CurPart.ItemIndex then
  begin
    CurPt := CurPart.ItemIndex;

    UpdatingControls := True;
    RefreshVisibleControls;
    UpdatingControls := False;
  end;
end;

procedure TEditorForm.PartMidiChanChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].System.MidiChannel[CurPt] := PartMidiChan.ItemIndex;
  if PartMidiChan.ItemIndex < 16 then
    case CurPt of
      0: begin
        Pt1Enable.Down := True;
        Pt1Chan.Value := Synth[CurSyn].System.MidiChannel[CurPt]+1;
        Pt1Chan.Enabled := True;
      end;
      1: begin
        Pt2Enable.Down := True;
        Pt2Chan.Value := Synth[CurSyn].System.MidiChannel[CurPt]+1;
        Pt2Chan.Enabled := True;
      end;
      2: begin
        Pt3Enable.Down := True;
        Pt3Chan.Value := Synth[CurSyn].System.MidiChannel[CurPt]+1;
        Pt3Chan.Enabled := True;
      end;
      3: begin
        Pt4Enable.Down := True;
        Pt4Chan.Value := Synth[CurSyn].System.MidiChannel[CurPt]+1;
        Pt4Chan.Enabled := True;
      end;
      4: begin
        Pt5Enable.Down := True;
        Pt5Chan.Value := Synth[CurSyn].System.MidiChannel[CurPt]+1;
        Pt5Chan.Enabled := True;
      end;
      5: begin
        Pt6Enable.Down := True;
        Pt6Chan.Value := Synth[CurSyn].System.MidiChannel[CurPt]+1;
        Pt6Chan.Enabled := True;
      end;
      6: begin
        Pt7Enable.Down := True;
        Pt7Chan.Value := Synth[CurSyn].System.MidiChannel[CurPt]+1;
        Pt7Chan.Enabled := True;
      end;
      7: begin
        Pt8Enable.Down := True;
        Pt8Chan.Value := Synth[CurSyn].System.MidiChannel[CurPt]+1;
        Pt8Chan.Enabled := True;
      end;
      8: begin
        PtREnable.Down := True;
        PtRChan.Value := Synth[CurSyn].System.MidiChannel[CurPt]+1;
        PtRChan.Enabled := True;
      end;
    end
  else
    case CurPt of
      0: begin
        Pt1Enable.Down := False;
        Pt1Chan.Enabled := False;
      end;
      1: begin
        Pt2Enable.Down := False;
        Pt2Chan.Enabled := False;
      end;
      2: begin
        Pt3Enable.Down := False;
        Pt3Chan.Enabled := False;
      end;
      3: begin
        Pt4Enable.Down := False;
        Pt4Chan.Enabled := False;
      end;
      4: begin
        Pt5Enable.Down := False;
        Pt5Chan.Enabled := False;
      end;
      5: begin
        Pt6Enable.Down := False;
        Pt6Chan.Enabled := False;
      end;
      6: begin
        Pt7Enable.Down := False;
        Pt7Chan.Enabled := False;
      end;
      7: begin
        Pt8Enable.Down := False;
        Pt8Chan.Enabled := False;
      end;
      8: begin
        PtREnable.Down := False;
        PtRChan.Enabled := False;
      end;
    end;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    (CurPt) +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MidiChannel[CurPt];
  SendCurrentSysEx;
end;

procedure TEditorForm.TimbreNameExit(Sender: TObject);
begin
  if UpdatingControls then Exit;
  if Synth[CurSyn].Part[CurPt].Name = TimbreName.Text then Exit;

  Synth[CurSyn].Part[CurPt].Name := TimbreName.Text;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    $00
  );

  SetLength(SysExData,10);
  SysExData := StrToBytes(Synth[CurSyn].Part[CurPt].Name);
  SendCurrentSysEx;
end;

procedure TEditorForm.TimbreNameKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) or (Key = #27) then
  begin
    Key := #0;
    ActiveControl := nil;
  end;
end;

procedure TEditorForm.PartialMute1Click(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[0].Mute := PartialMute1.Checked;
  BuildMuteByte;
end;

procedure TEditorForm.PartialMute2Click(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[1].Mute := PartialMute2.Checked;
  BuildMuteByte;
end;

procedure TEditorForm.PartialMute3Click(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[2].Mute := PartialMute3.Checked;
  BuildMuteByte;
end;

procedure TEditorForm.PartialMute4Click(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[3].Mute := PartialMute4.Checked;
  BuildMuteByte;
end;

procedure TEditorForm.EnvModeClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].SustainOn := EnvMode.Down;

  SysExAddress := LinearAddrToBytes(AdTimbreTemp + (CurPt * $F6) + $0D);
  SetLength(SysExData,1);
  SysExData[0] := Byte(not Synth[CurSyn].Part[CurPt].SustainOn);
  SendCurrentSysEx;
end;

procedure TEditorForm.PartialStruct1Change(Sender: TObject);
begin
  RefreshStructs;
  if UpdatingControls then Exit;

  ApplyPartialStructState(0);
  {Part[CurPt].Struct1 := PartialStruct1.ItemIndex;
  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    $0A
  );
  SetLength(SysExData,1);
  SysExData[0] := Part[CurPt].Struct1;
  SendCurrentSysEx;}
end;

procedure TEditorForm.PartialStruct2Change(Sender: TObject);
begin
  RefreshStructs;
  if UpdatingControls then Exit;

  ApplyPartialStructState(1);
  {Part[CurPt].Struct2 := PartialStruct2.ItemIndex;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    $0B
  );
  SetLength(SysExData,1);
  SysExData[0] := Part[CurPt].Struct2;
  SendCurrentSysEx;}
end;

procedure TEditorForm.SelPartial1ButtonClick(Sender: TObject);
begin
  if CurPtl <> 0 then
  begin
    CurPtl := 0;

    UpdatingControls := True;
    RefreshPartialControls;
    UpdatingControls := False;
  end;
end;

procedure TEditorForm.SelPartial2ButtonClick(Sender: TObject);
begin
  if CurPtl <> 1 then
  begin
    CurPtl := 1;

    UpdatingControls := True;
    RefreshPartialControls;
    UpdatingControls := False;
  end;
end;

procedure TEditorForm.SelPartial3ButtonClick(Sender: TObject);
begin
  if CurPtl <> 2 then
  begin
    CurPtl := 2;

    UpdatingControls := True;
    RefreshPartialControls;
    UpdatingControls := False;
  end;
end;

procedure TEditorForm.SelPartial4ButtonClick(Sender: TObject);
begin
  if CurPtl <> 3 then
  begin
    CurPtl := 3;

    UpdatingControls := True;
    RefreshPartialControls;
    UpdatingControls := False;
  end;
end;

{ Wave Generator Controls }
procedure TEditorForm.WGCoarseChange(Sender: TObject);
begin
  case WGCoarse.Position of
    0: WGCoarseType.Caption := 'C-1'; 1: WGCoarseType.Caption := 'C#-1'; 2: WGCoarseType.Caption := 'D-1'; 3: WGCoarseType.Caption := 'D#-1';
    4: WGCoarseType.Caption := 'E-1'; 5: WGCoarseType.Caption := 'F-1'; 6: WGCoarseType.Caption := 'F#-1'; 7: WGCoarseType.Caption := 'G-1';
    8: WGCoarseType.Caption := 'G#-1'; 9: WGCoarseType.Caption := 'A-1'; 10: WGCoarseType.Caption := 'A#-1'; 11: WGCoarseType.Caption := 'B-1';

    12: WGCoarseType.Caption := 'C0'; 13: WGCoarseType.Caption := 'C#0'; 14: WGCoarseType.Caption := 'D0'; 15: WGCoarseType.Caption := 'D#0';
    16: WGCoarseType.Caption := 'E0'; 17: WGCoarseType.Caption := 'F0'; 18: WGCoarseType.Caption := 'F#0'; 19: WGCoarseType.Caption := 'G0';
    20: WGCoarseType.Caption := 'G#0'; 21: WGCoarseType.Caption := 'A0'; 22: WGCoarseType.Caption := 'A#0'; 23: WGCoarseType.Caption := 'B0';

    24: WGCoarseType.Caption := 'C1'; 25: WGCoarseType.Caption := 'C#1'; 26: WGCoarseType.Caption := 'D1'; 27: WGCoarseType.Caption := 'D#1';
    28: WGCoarseType.Caption := 'E1'; 29: WGCoarseType.Caption := 'F1'; 30: WGCoarseType.Caption := 'F#1'; 31: WGCoarseType.Caption := 'G1';
    32: WGCoarseType.Caption := 'G#1';33: WGCoarseType.Caption := 'A1'; 34: WGCoarseType.Caption := 'A#1'; 35: WGCoarseType.Caption := 'B1';

    36: WGCoarseType.Caption := 'C2'; 37: WGCoarseType.Caption := 'C#2'; 38: WGCoarseType.Caption := 'D2'; 39: WGCoarseType.Caption := 'D#2';
    40: WGCoarseType.Caption := 'E2'; 41: WGCoarseType.Caption := 'F2'; 42: WGCoarseType.Caption := 'F#2'; 43: WGCoarseType.Caption := 'G2';
    44: WGCoarseType.Caption := 'G#2'; 45: WGCoarseType.Caption := 'A2'; 46: WGCoarseType.Caption := 'A#2'; 47: WGCoarseType.Caption := 'B2';

    48: WGCoarseType.Caption := 'C3'; 49: WGCoarseType.Caption := 'C#3'; 50: WGCoarseType.Caption := 'D3'; 51: WGCoarseType.Caption := 'D#3';
    52: WGCoarseType.Caption := 'E3'; 53: WGCoarseType.Caption := 'F3'; 54: WGCoarseType.Caption := 'F#3'; 55: WGCoarseType.Caption := 'G3';
    56: WGCoarseType.Caption := 'G#3'; 57: WGCoarseType.Caption := 'A3'; 58: WGCoarseType.Caption := 'A#3'; 59: WGCoarseType.Caption := 'B3';

    60: WGCoarseType.Caption := 'C4'; 61: WGCoarseType.Caption := 'C#4'; 62: WGCoarseType.Caption := 'D4'; 63: WGCoarseType.Caption := 'D#4';
    64: WGCoarseType.Caption := 'E4'; 65: WGCoarseType.Caption := 'F4'; 66: WGCoarseType.Caption := 'F#4'; 67: WGCoarseType.Caption := 'G4';
    68: WGCoarseType.Caption := 'G#4'; 69: WGCoarseType.Caption := 'A4'; 70: WGCoarseType.Caption := 'A#4'; 71: WGCoarseType.Caption := 'B4';

    72: WGCoarseType.Caption := 'C5'; 73: WGCoarseType.Caption := 'C#5'; 74: WGCoarseType.Caption := 'D5'; 75: WGCoarseType.Caption := 'D#5';
    76: WGCoarseType.Caption := 'E5'; 77: WGCoarseType.Caption := 'F5'; 78: WGCoarseType.Caption := 'F#5'; 79: WGCoarseType.Caption := 'G5';
    80: WGCoarseType.Caption := 'G#5'; 81: WGCoarseType.Caption := 'A5'; 82: WGCoarseType.Caption := 'A#5'; 83: WGCoarseType.Caption := 'B5';

    84: WGCoarseType.Caption := 'C6'; 85: WGCoarseType.Caption := 'C#6'; 86: WGCoarseType.Caption := 'D6'; 87: WGCoarseType.Caption := 'D#6';
    88: WGCoarseType.Caption := 'E6'; 89: WGCoarseType.Caption := 'F6'; 90: WGCoarseType.Caption := 'F#6'; 91: WGCoarseType.Caption := 'G6';
    92: WGCoarseType.Caption := 'G#6'; 93: WGCoarseType.Caption := 'A6'; 94: WGCoarseType.Caption := 'A#6'; 95: WGCoarseType.Caption := 'B6';

    96: WGCoarseType.Caption := 'C7';
  end;

  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchCoarse := WGCoarse.Position;
  WGCoarse_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchCoarse);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $00
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchCoarse;
  SendCurrentSysEx;
end;

procedure TEditorForm.WGCoarse_valueExit(Sender: TObject);
begin
  if StrToInt(WGCoarse_value.Text) < WGCoarse.Min then
    WGCoarse_value.Text := IntToStr(WGCoarse.Min);
  if StrToInt(WGCoarse_value.Text) > WGCoarse.Max then
    WGCoarse_value.Text := IntToStr(WGCoarse.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchCoarse := StrToInt(WGCoarse_value.Text);
  UpdatingControls := True;
  WGCoarse.Position := StrToInt(WGCoarse_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $00
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchCoarse;
  SendCurrentSysEx;
end;

procedure TEditorForm.WGCoarse_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

procedure TEditorForm.WGPitchBendClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchBend := WGPitchBend.Down;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $03
  );
  SetLength(SysExData,1);
  SysExData[0] := Byte(Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchBend);
  SendCurrentSysEx;
end;

procedure TEditorForm.WGShapeClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  // Always update Struct1/Struct2 based on Synth vs PCM state
  ResolvePartialStructure;
  // PCM is only a UI concept. IT does not write WaveGen.Shape
  if WGShape.ItemIndex < 2 then
  begin
    Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.Shape := WGShape.ItemIndex;

    SysExAddress := LinearAddrToBytes(
      AdTimbreTemp +
      (CurPt * $F6) +
      (CurPtl * $3A) + $0E +
      $04
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.Shape;
    SendCurrentSysEx;
  end
end;

procedure TEditorForm.WGSampleClick(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PCMSample := WGSample.ItemIndex;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $05
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PCMSample;
  SendCurrentSysEx;
end;

procedure TEditorForm.WGPulseWidthChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PulseWidth := WGPulseWidth.Position;
  WGPulseWidth_value.Text :=
    IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PulseWidth);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $06
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PulseWidth;
  SendCurrentSysEx;
end;

procedure TEditorForm.WGPulseWidth_valueExit(Sender: TObject);
begin
  if StrToInt(WGPulseWidth_value.Text) < WGPulseWidth.Min then
    WGPulseWidth_value.Text := IntToStr(WGPulseWidth.Min);
  if StrToInt(WGPulseWidth_value.Text) > WGPulseWidth.Max then
    WGPulseWidth_value.Text := IntToStr(WGPulseWidth.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PulseWidth := StrToInt(WGPulseWidth_value.Text);
  UpdatingControls := True;
  WGPulseWidth.Position := StrToInt(WGPulseWidth_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $06
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PulseWidth;
  SendCurrentSysEx;
end;

procedure TEditorForm.WGPulseWidth_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.WGVelSensChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.VelSens := WGVelSens.Position;
  WGVelSens_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.VelSens);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $07
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.VelSens + 7;
  SendCurrentSysEx;
end;

procedure TEditorForm.WGVelSens_valueExit(Sender: TObject);
begin
  if StrToInt(WGVelSens_value.Text) < WGVelSens.Min then
    WGVelSens_value.Text := IntToStr(WGVelSens.Min);
  if StrToInt(WGVelSens_value.Text) > WGVelSens.Max then
    WGVelSens_value.Text := IntToStr(WGVelSens.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.VelSens := StrToInt(WGVelSens_value.Text);
  UpdatingControls := True;
  WGVelSens.Position := StrToInt(WGVelSens_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $07
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.VelSens + 7;
  SendCurrentSysEx;

end;

procedure TEditorForm.WGVelSens_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

procedure TEditorForm.WGFineChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchFine := WGFine.Position;
  WGFine_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchFine);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $01
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchFine + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.WGFine_valueExit(Sender: TObject);
begin
  if StrToInt(WGFine_value.Text) < WGFine.Min then
    WGFine_value.Text := IntToStr(WGFine.Min);
  if StrToInt(WGFine_value.Text) > WGFine.Max then
    WGFine_value.Text := IntToStr(WGFine.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchFine := StrToInt(WGFine_value.Text);
  UpdatingControls := True;
  WGFine.Position := StrToInt(WGFine_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $01
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.PitchFine + 50;
  SendCurrentSysEx;

end;

procedure TEditorForm.WGFine_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

procedure TEditorForm.WGKeyFollowChange(Sender: TObject);
begin
  case (WGKeyFollow.Position + 3) of
    0: WGKeyFollowType.Caption := '-1';
    1: WGKeyFollowType.Caption := '-1/2';
    2: WGKeyFollowType.Caption := '-1/4';
    3: WGKeyFollowType.Caption := '0';
    4: WGKeyFollowType.Caption := '1/8';
    5: WGKeyFollowType.Caption := '1/4';
    6: WGKeyFollowType.Caption := '3/8';
    7: WGKeyFollowType.Caption := '1/2';
    8: WGKeyFollowType.Caption := '5/8';
    9: WGKeyFollowType.Caption := '3/4';
    10: WGKeyFollowType.Caption := '7/8';
    11: WGKeyFollowType.Caption := '1';
    12: WGKeyFollowType.Caption := '5/4';
    13: WGKeyFollowType.Caption := '3/2';
    14: WGKeyFollowType.Caption := '2';
    15: WGKeyFollowType.Caption := 's1';
    16: WGKeyFollowType.Caption := 's2';
  end;

  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.KeyFollow := WGKeyFollow.Position;
  WGKeyFollow_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.KeyFollow);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.KeyFollow + 3;
  SendCurrentSysEx;
end;

procedure TEditorForm.WGKeyFollow_valueExit(Sender: TObject);
begin
  if StrToInt(WGKeyFollow_value.Text) < WGKeyFollow.Min then
    WGKeyFollow_value.Text := IntToStr(WGKeyFollow.Min);
  if StrToInt(WGKeyFollow_value.Text) > WGKeyFollow.Max then
    WGKeyFollow_value.Text := IntToStr(WGKeyFollow.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.KeyFollow := StrToInt(WGKeyFollow_value.Text);
  UpdatingControls := True;
  WGKeyFollow.Position := StrToInt(WGKeyFollow_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $02
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].WaveGen.KeyFollow + 3;
  SendCurrentSysEx;
end;

procedure TEditorForm.WGKeyFollow_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

{ Pitch Envelope Controls }
procedure TEditorForm.PEnvLevel0_valueExit(Sender: TObject);
begin
  if StrToInt(PEnvLevel0_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level0 then Exit;
  if StrToInt(PEnvLevel0_value.Text) < PEnvLevel0.Min then
    PEnvLevel0_value.Text := IntToStr(PEnvLevel0.Min);
  if StrToInt(PEnvLevel0_value.Text) > PEnvLevel0.Max then
    PEnvLevel0_value.Text := IntToStr(PEnvLevel0.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level0 := StrToInt(PEnvLevel0_value.Text);
  PEnvPlot.Invalidate;
  UpdatingControls := True;
  PEnvLevel0.Position := StrToInt(PEnvLevel0_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $0F
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level0 + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvLevel0_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

procedure TEditorForm.PEnvLevel1Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level1 := PEnvLevel1.Position;
  PEnvLevel1_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level1);
  PEnvPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $10
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level1 + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvLevel1_valueExit(Sender: TObject);
begin
  if StrToInt(PEnvLevel1_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level1 then Exit;
  if StrToInt(PEnvLevel1_value.Text) < PEnvLevel1.Min then
    PEnvLevel1_value.Text := IntToStr(PEnvLevel1.Min);
  if StrToInt(PEnvLevel1_value.Text) > PEnvLevel1.Max then
    PEnvLevel1_value.Text := IntToStr(PEnvLevel1.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level1 := StrToInt(PEnvLevel1_value.Text);
  PEnvPlot.Invalidate;
  UpdatingControls := True;
  PEnvLevel1.Position := StrToInt(PEnvLevel1_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $10
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level1 + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvLevel1_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

procedure TEditorForm.PEnvLevel2Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level2 := PEnvLevel2.Position;
  PEnvLevel2_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level2);
  PEnvPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $11
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level2 + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvLevel2_valueExit(Sender: TObject);
begin
  if StrToInt(PEnvLevel2_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level2 then Exit;
  if StrToInt(PEnvLevel2_value.Text) < PEnvLevel2.Min then
    PEnvLevel2_value.Text := IntToStr(PEnvLevel2.Min);
  if StrToInt(PEnvLevel2_value.Text) > PEnvLevel2.Max then
    PEnvLevel2_value.Text := IntToStr(PEnvLevel2.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level2 := StrToInt(PEnvLevel2_value.Text);
  PEnvPlot.Invalidate;
  UpdatingControls := True;
  PEnvLevel2.Position := StrToInt(PEnvLevel2_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $11
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level2 + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvLevel2_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

procedure TEditorForm.PEnvLFODepthChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFODepth := PEnvLFODepth.Value;
  PEnvLFODepth_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFODepth);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $15
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFODepth;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvLFODepth_valueExit(Sender: TObject);
begin
  if StrToInt(PEnvLFODepth_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFODepth then Exit;
  if StrToInt(PEnvLFODepth_value.Text) < PEnvLFODepth.Min then
    PEnvLFODepth_value.Text := IntToStr(PEnvLFODepth.Min);
  if StrToInt(PEnvLFODepth_value.Text) > PEnvLFODepth.Max then
    PEnvLFODepth_value.Text := IntToStr(PEnvLFODepth.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFODepth := StrToInt(PEnvLFODepth_value.Text);
  UpdatingControls := True;
  PEnvLFODepth.Value := StrToInt(PEnvLFODepth_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $15
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFODepth;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvLFODepth_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.PEnvLFOModSensChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFOModSens := PEnvLFOModSens.Value;
  PEnvLFOModSens_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFOModSens);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $16
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFOModSens;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvLFOModSens_valueExit(Sender: TObject);
begin
  if StrToInt(PEnvLFOModSens_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFOModSens then Exit;
  if StrToInt(PEnvLFOModSens_value.Text) < PEnvLFOModSens.Min then
    PEnvLFOModSens_value.Text := IntToStr(PEnvLFOModSens.Min);
  if StrToInt(PEnvLFOModSens_value.Text) > PEnvLFOModSens.Max then
    PEnvLFOModSens_value.Text := IntToStr(PEnvLFOModSens.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFOModSens := StrToInt(PEnvLFOModSens_value.Text);
  UpdatingControls := True;
  PEnvLFOModSens.Value := StrToInt(PEnvLFOModSens_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $16
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFOModSens;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvLFOModSens_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.PEnvLFORateChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFORate := PEnvLFORate.Value;
  PEnvLFORate_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFORate);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $14
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFORate;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvLFORate_valueExit(Sender: TObject);
begin
  if StrToInt(PEnvLFORate_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFORate then Exit;
  if StrToInt(PEnvLFORate_value.Text) < PEnvLFORate.Min then
    PEnvLFORate_value.Text := IntToStr(PEnvLFORate.Min);
  if StrToInt(PEnvLFORate_value.Text) > PEnvLFORate.Max then
    PEnvLFORate_value.Text := IntToStr(PEnvLFORate.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFORate := StrToInt(PEnvLFORate_value.Text);
  UpdatingControls := True;
  PEnvLFORate.Value := StrToInt(PEnvLFORate_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $14
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.LFORate;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvLFORate_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.PEnvPlotPaint(Sender: TObject);
var
  W, H: Integer;
  T1, T2, T3, T4: Integer;
  L0, L1, L2, LSus, LEnd: Integer;
  MaxTotal, SusW: Integer;
  X0, X1, X2, XSusA, XSusB, XEnd: Integer;
  Scale: Double;

  function LevelToY(Level: Integer): Integer;
  begin
    // for range -50..50
    Result := Round((50 - Level) / 100 * (H - 2)) + 1;
  end;
begin
  W := PEnvPlot.Width;
  H := PEnvPlot.Height;

  SusW := 100;
  MaxTotal := 100 + 100 + 100 + 100 + SusW;

  Scale := (W - 2) / MaxTotal;

  T1 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time1;
  T2 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time2;
  T3 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time3;
  T4 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time4;

  L0 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level0;
  L1 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level1;
  L2 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Level2;
  LSus := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Sustain;
  LEnd := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.EndLevel;

  X0 := 0;
  X1 := X0 + Round(T1 * Scale);
  X2 := X1 + Round(T2 * Scale);
  XSusA := X2 + Round(T3 * Scale);
  XSusB := XSusA + Round(SusW * Scale);
  XEnd := XSusB + Round(T4 * Scale);

  with PEnvPlot.Canvas do
  begin
    Brush.Color := clBtnFace;
    //Brush.Color := RGB(255,200,255);
    FillRect(PEnvPlot.ClientRect);

    Pen.Color := clGray;
    Rectangle(0, 0, W, H);
    // Draw 0 line
    Pen.Color := RGB(225,125,225);
    MoveTo(0, Round(H/2)-1);
    LineTo(W, Round(H/2)-1);

    if PEnvLevel0.Enabled then
      Pen.Color := clPurple;
    Pen.Width := 2;

    MoveTo(X0, LevelToY(L0));
    LineTo(X1, LevelToY(L1));
    LineTo(X2, LevelToY(L2));
    LineTo(XSusA, LevelToY(LSus));

    if PEnvLevel0.Enabled then
      Pen.Color := clFuchsia;
    Pen.Width := 3;
    LineTo(XSusB, LevelToY(LSus));

    if PEnvLevel0.Enabled then
      Pen.Color := clPurple;
    Pen.Width := 2;
    LineTo(XEnd, LevelToY(LEnd));

    if XEnd < W - 2 then
    begin
      LineTo(W - 2, LevelToY(LEnd));
    end;

    Pen.Width := 1;
  end;
end;

procedure TEditorForm.PEnvSustainChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Sustain := PEnvSustain.Position;
  PEnvSustain_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Sustain);
  PEnvPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $12
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Sustain + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvSustain_valueExit(Sender: TObject);
begin
  if StrToInt(PEnvSustain_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Sustain then Exit;
  if StrToInt(PEnvSustain_value.Text) < PEnvSustain.Min then
    PEnvSustain_value.Text := IntToStr(PEnvSustain.Min);
  if StrToInt(PEnvSustain_value.Text) > PEnvSustain.Max then
    PEnvSustain_value.Text := IntToStr(PEnvSustain.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Sustain := StrToInt(PEnvSustain_value.Text);
  PEnvPlot.Invalidate;
  UpdatingControls := True;
  PEnvSustain.Position := StrToInt(PEnvSustain_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $12
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Sustain + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvSustain_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

procedure TEditorForm.PEnvTime1Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time1 := PEnvTime1.Value;
  PEnvTime1_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time1);
  PEnvPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $0B
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time1;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvTime1_valueExit(Sender: TObject);
begin
  if StrToInt(PEnvTime1_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time1 then Exit;
  if StrToInt(PEnvTime1_value.Text) < PEnvTime1.Min then
    PEnvTime1_value.Text := IntToStr(PEnvTime1.Min);
  if StrToInt(PEnvTime1_value.Text) > PEnvTime1.Max then
    PEnvTime1_value.Text := IntToStr(PEnvTime1.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time1 := StrToInt(PEnvTime1_value.Text);
  PEnvPlot.Invalidate;
  UpdatingControls := True;
  PEnvTime1.Value := StrToInt(PEnvTime1_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $0B
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time1;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvTime1_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.PEnvTime2Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time2 := PEnvTime2.Value;
  PEnvTime2_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time2);
  PEnvPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $0C
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time2;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvTime2_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) or (Key = #27) then
  begin
    if StrToInt(PEnvTime2_value.Text) < PEnvTime2.Min then
      PEnvTime2_value.Text := IntToStr(PEnvTime2.Min);
    if StrToInt(PEnvTime2_value.Text) > PEnvTime2.Max then
      PEnvTime2_value.Text := IntToStr(PEnvTime2.Max);

    Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time2 := StrToInt(PEnvTime2_value.Text);
    PEnvPlot.Invalidate;
    UpdatingControls := True;
    PEnvTime2.Value := StrToInt(PEnvTime2_value.Text);
    UpdatingControls := False;

    SysExAddress := LinearAddrToBytes(
      AdTimbreTemp +
      (CurPt * $F6) +
      (CurPtl * $3A) + $0E +
      $0C
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time2;
    SendCurrentSysEx;

    Key := #0;
    ActiveControl := nil;
  end;
end;

procedure TEditorForm.PEnvTime3Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time3 := PEnvTime3.Value;
  PEnvTime3_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time3);
  PEnvPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $0D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time3;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvTime3_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) or (Key = #27) then
  begin
    if StrToInt(PEnvTime3_value.Text) < PEnvTime3.Min then
      PEnvTime3_value.Text := IntToStr(PEnvTime3.Min);
    if StrToInt(PEnvTime3_value.Text) > PEnvTime3.Max then
      PEnvTime3_value.Text := IntToStr(PEnvTime3.Max);

    Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time3 := StrToInt(PEnvTime3_value.Text);
    PEnvPlot.Invalidate;
    UpdatingControls := True;
    PEnvTime3.Value := StrToInt(PEnvTime3_value.Text);
    UpdatingControls := False;

    SysExAddress := LinearAddrToBytes(
      AdTimbreTemp +
      (CurPt * $F6) +
      (CurPtl * $3A) + $0E +
      $0D
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time3;
    SendCurrentSysEx;

    Key := #0;
    ActiveControl := nil;
  end;
end;

procedure TEditorForm.PEnvTime4Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time4 := PEnvTime4.Value;
  PEnvTime4_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time4);
  PEnvPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $0E
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time4;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvTime4_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) or (Key = #27) then
  begin
    if StrToInt(PEnvTime4_value.Text) < PEnvTime4.Min then
      PEnvTime4_value.Text := IntToStr(PEnvTime4.Min);
    if StrToInt(PEnvTime4_value.Text) > PEnvTime4.Max then
      PEnvTime4_value.Text := IntToStr(PEnvTime4.Max);

    Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time4 := StrToInt(PEnvTime4_value.Text);
    PEnvPlot.Invalidate;
    UpdatingControls := True;
    PEnvTime4.Value := StrToInt(PEnvTime4_value.Text);
    UpdatingControls := False;

    SysExAddress := LinearAddrToBytes(
      AdTimbreTemp +
      (CurPt * $F6) +
      (CurPtl * $3A) + $0E +
      $0E
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Time4;
    SendCurrentSysEx;

    Key := #0;
    ActiveControl := nil;
  end;
end;

procedure TEditorForm.PEnvTimeKeyFollowChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.TimeKeyFollow := PEnvTimeKeyFollow.Position;
  PEnvTimeKeyFollow_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.TimeKeyFollow);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $0A
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.TimeKeyFollow;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvTimeKeyFollow_valueExit(Sender: TObject);
begin
  if StrToInt(PEnvTimeKeyFollow_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.TimeKeyFollow then Exit;
  if StrToInt(PEnvTimeKeyFollow_value.Text) < PEnvTimeKeyFollow.Min then
    PEnvTimeKeyFollow_value.Text := IntToStr(PEnvTimeKeyFollow.Min);
  if StrToInt(PEnvTimeKeyFollow_value.Text) > PEnvTimeKeyFollow.Max then
    PEnvTimeKeyFollow_value.Text := IntToStr(PEnvTimeKeyFollow.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.TimeKeyFollow := StrToInt(PEnvTimeKeyFollow_value.Text);
  PEnvPlot.Invalidate;
  UpdatingControls := True;
  PEnvTimeKeyFollow.Position := StrToInt(PEnvTimeKeyFollow_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $0A
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.TimeKeyFollow;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvTimeKeyFollow_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.PEnvVelSensChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.VelSens  := PEnvVelSens.Position;
  PEnvVelSens_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.VelSens);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.VelSens;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvVelSens_valueExit(Sender: TObject);
begin
  if StrToInt(PEnvVelSens_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.VelSens then Exit;
  if StrToInt(PEnvVelSens_value.Text) < PEnvVelSens.Min then
    PEnvVelSens_value.Text := IntToStr(PEnvVelSens.Min);
  if StrToInt(PEnvVelSens_value.Text) > PEnvVelSens.Max then
    PEnvVelSens_value.Text := IntToStr(PEnvVelSens.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.VelSens := StrToInt(PEnvVelSens_value.Text);
  UpdatingControls := True;
  PEnvVelSens.Position := StrToInt(PEnvVelSens_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $09
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.VelSens;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvVelSens_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.PEnvDepthChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Depth := PEnvDepth.Position;
  PEnvDepth_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Depth);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $08
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Depth;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvDepth_valueExit(Sender: TObject);
begin
  if (StrToInt(PEnvDepth_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Depth) then Exit;
  if StrToInt(PEnvDepth_value.Text) < PEnvDepth.Min then
      PEnvDepth_value.Text := IntToStr(PEnvDepth.Min);
    if StrToInt(PEnvDepth_value.Text) > PEnvDepth.Max then
      PEnvDepth_value.Text := IntToStr(PEnvDepth.Max);

    Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Depth := StrToInt(PEnvDepth_value.Text);
    UpdatingControls := True;
    PEnvDepth.Position := StrToInt(PEnvDepth_value.Text);
    UpdatingControls := False;

    SysExAddress := LinearAddrToBytes(
      AdTimbreTemp +
      (CurPt * $F6) +
      (CurPtl * $3A) + $0E +
      $08
    );
    SetLength(SysExData,1);
    SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.Depth;
    SendCurrentSysEx;
end;

procedure TEditorForm.PEnvDepth_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.PEnvEndChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.EndLevel := PEnvEnd.Position;
  PEnvEnd_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.EndLevel);
  PEnvPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $13
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.EndLevel + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvEnd_valueExit(Sender: TObject);
begin
  if StrToInt(PEnvEnd_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.EndLevel then Exit;
  if StrToInt(PEnvEnd_value.Text) < PEnvEnd.Min then
    PEnvEnd_value.Text := IntToStr(PEnvEnd.Min);
  if StrToInt(PEnvEnd_value.Text) > PEnvEnd.Max then
    PEnvEnd_value.Text := IntToStr(PEnvEnd.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.EndLevel := StrToInt(PEnvEnd_value.Text);
  PEnvPlot.Invalidate;
  UpdatingControls := True;
  PEnvEnd.Position := StrToInt(PEnvEnd_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $13
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].PitchEnv.EndLevel + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.PEnvEnd_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

{ Time Variant Filter Controls }
procedure TEditorForm.TVFBiasLevelChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.BiasLevel := TVFBiasLevel.Position;
  TVFBiasLevel_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.BiasLevel);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $1B
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.BiasLevel + 7;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFBiasLevel_valueExit(Sender: TObject);
begin
  if StrToInt(TVFBiasLevel_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.BiasLevel then Exit;
  if StrToInt(TVFBiasLevel_value.Text) < TVFBiasLevel.Min then
    TVFBiasLevel_value.Text := IntToStr(TVFBiasLevel.Min);
  if StrToInt(TVFBiasLevel_value.Text) > TVFBiasLevel.Max then
    TVFBiasLevel_value.Text := IntToStr(TVFBiasLevel.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.BiasLevel := StrToInt(TVFBiasLevel_value.Text);
  UpdatingControls := True;
  TVFBiasLevel.Position := StrToInt(TVFBiasLevel_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $1B
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.BiasLevel + 7;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFBiasLevel_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFBiasPointChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.BiasPoint := TVFBiasPoint.ItemIndex;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $1A
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.BiasPoint;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFCutoffChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Cutoff := TVFCutoff.Position;
  TVFCutoff_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Cutoff);
  TVFFilterPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $17
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Cutoff;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFCutoff_valueExit(Sender: TObject);
begin
  if StrToInt(TVFCutoff_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Cutoff then Exit;
  if StrToInt(TVFCutoff_value.Text) < TVFCutoff.Min then
    TVFCutoff_value.Text := IntToStr(TVFCutoff.Min);
  if StrToInt(TVFCutoff_value.Text) > TVFCutoff.Max then
    TVFCutoff_value.Text := IntToStr(TVFCutoff.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Cutoff := StrToInt(TVFCutoff_value.Text);
  TVFFilterPlot.Invalidate;
  UpdatingControls := True;
  TVFCutoff.Position := StrToInt(TVFCutoff_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $17
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level1;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFCutoff_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFDepthChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Depth := TVFDepth.Position;
  TVFDepth_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Depth);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $1C
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Depth;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFDepthKeyFollowChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.DepthKeyFollow := TVFDepthKeyFollow.Position;
  TVFDepthKeyFollow_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.DepthKeyFollow);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $1E
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.DepthKeyFollow;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFDepthKeyFollow_valueExit(Sender: TObject);
begin
  if StrToInt(TVFDepthKeyFollow_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.DepthKeyFollow then Exit;
  if StrToInt(TVFDepthKeyFollow_value.Text) < TVFDepthKeyFollow.Min then
    TVFDepthKeyFollow_value.Text := IntToStr(TVFDepthKeyFollow.Min);
  if StrToInt(TVFDepthKeyFollow_value.Text) > TVFDepthKeyFollow.Max then
    TVFDepthKeyFollow_value.Text := IntToStr(TVFDepthKeyFollow.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.DepthKeyFollow := StrToInt(TVFDepthKeyFollow_value.Text);
  UpdatingControls := True;
  TVFDepthKeyFollow.Position := StrToInt(TVFDepthKeyFollow_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $1E
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.DepthKeyFollow;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFDepthKeyFollow_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFDepth_valueExit(Sender: TObject);
begin
  if StrToInt(TVFDepth_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Depth then Exit;
  if StrToInt(TVFDepth_value.Text) < TVFDepth.Min then
    TVFDepth_value.Text := IntToStr(TVFDepth.Min);
  if StrToInt(TVFDepth_value.Text) > TVFDepth.Max then
    TVFDepth_value.Text := IntToStr(TVFDepth.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Depth := StrToInt(TVFDepth_value.Text);
  UpdatingControls := True;
  TVFDepth.Position := StrToInt(TVFDepth_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $1C
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Depth;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFDepth_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFKeyFollowChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.KeyFollow := TVFKeyFollow.Position;
  TVFKeyFollow_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.KeyFollow);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $19
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.KeyFollow;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFKeyFollow_valueExit(Sender: TObject);
begin
  if StrToInt(TVFKeyFollow_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.KeyFollow then Exit;
  if StrToInt(TVFKeyFollow_value.Text) < TVFKeyFollow.Min then
    TVFKeyFollow_value.Text := IntToStr(TVFKeyFollow.Min);
  if StrToInt(TVFKeyFollow_value.Text) > TVFKeyFollow.Max then
    TVFKeyFollow_value.Text := IntToStr(TVFKeyFollow.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.KeyFollow := StrToInt(TVFKeyFollow_value.Text);
  UpdatingControls := True;
  TVFKeyFollow.Position := StrToInt(TVFKeyFollow_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $19
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.KeyFollow;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFKeyFollow_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFLevel1Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level1 := TVFLevel1.Position;
  TVFLevel1_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level1);
  TVFPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $25
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level1;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFLevel1_valueExit(Sender: TObject);
begin
  if StrToInt(TVFLevel1_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level1 then Exit;
  if StrToInt(TVFLevel1_value.Text) < TVFLevel1.Min then
    TVFLevel1_value.Text := IntToStr(TVFLevel1.Min);
  if StrToInt(TVFLevel1_value.Text) > TVFLevel1.Max then
    TVFLevel1_value.Text := IntToStr(TVFLevel1.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level1 := StrToInt(TVFLevel1_value.Text);
  TVFPlot.Invalidate;
  UpdatingControls := True;
  TVFLevel1.Position := StrToInt(TVFLevel1_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $25
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level1;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFLevel1_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFLevel2Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level2 := TVFLevel2.Position;
  TVFLevel2_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level2);
  TVFPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $26
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level2;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFLevel2_valueExit(Sender: TObject);
begin
  if StrToInt(TVFLevel2_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level2 then Exit;
  if StrToInt(TVFLevel2_value.Text) < TVFLevel2.Min then
    TVFLevel2_value.Text := IntToStr(TVFLevel2.Min);
  if StrToInt(TVFLevel2_value.Text) > TVFLevel2.Max then
    TVFLevel2_value.Text := IntToStr(TVFLevel2.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level2 := StrToInt(TVFLevel2_value.Text);
  TVFPlot.Invalidate;
  UpdatingControls := True;
  TVFLevel2.Position := StrToInt(TVFLevel2_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $26
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level2;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFLevel2_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFLevel3Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level3 := TVFLevel3.Position;
  TVFLevel3_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level3);
  TVFPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $27
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level3;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFLevel3_valueExit(Sender: TObject);
begin
  if StrToInt(TVFLevel3_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level3 then Exit;
  if StrToInt(TVFLevel3_value.Text) < TVFLevel3.Min then
    TVFLevel3_value.Text := IntToStr(TVFLevel3.Min);
  if StrToInt(TVFLevel3_value.Text) > TVFLevel3.Max then
    TVFLevel3_value.Text := IntToStr(TVFLevel3.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level3 := StrToInt(TVFLevel3_value.Text);
  TVFPlot.Invalidate;
  UpdatingControls := True;
  TVFLevel3.Position := StrToInt(TVFLevel3_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $27
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level3;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFLevel3_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFPlotPaint(Sender: TObject);
var
  W, H: Integer;
  T1, T2, T3, T4, T5: Integer;
  L0, L1, L2, L3, LSus: Integer;
  MaxTotal, SusW: Integer;
  X0, X1, X2, X3, XSusA, XSusB, XEnd: Integer;
  Scale: Double;

  function LevelToY(Level: Integer): Integer;
  begin
    Result := Round((100 - Level) / 100 * (H - 2)) + 1;
  end;
begin
  W := TVFPlot.Width;
  H := TVFPlot.Height;

  SusW := 100;
  MaxTotal := 100 + 100 + 100 + 100 + SusW + 100;

  Scale := (W - 2) / MaxTotal;

  T1 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time1;
  T2 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time2;
  T3 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time3;
  T4 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time4;
  T5 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time5;

  L0 := H-1;
  L1 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level1;
  L2 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level2;
  L3 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Level3;
  LSus := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Sustain;

  X0 := 2;
  X1 := X0 + Round(T1 * Scale);
  X2 := X1 + Round(T2 * Scale);
  X3 := X2 + Round(T3 * Scale);
  XSusA := X3 + Round(T4 * Scale);
  XSusB := XSusA + Round(SusW * Scale);
  XEnd := XSusB + Round(T5 * Scale);

  with TVFPlot.Canvas do
  begin
    {if TVFLevel1.Enabled then
      Brush.Color := clMoneyGreen
    else}
      Brush.Color := clBtnFace;
    FillRect(TVFPlot.ClientRect);

    Pen.Color := clGray;
    Rectangle(0, 0, W, H);

    if TVFLevel1.Enabled then
    begin
      Pen.Color := clGreen;
      Pen.Width := 2;
    end;

    MoveTo(X0, L0);
    LineTo(X1, LevelToY(L1));
    LineTo(X2, LevelToY(L2));
    LineTo(X3, LevelTOY(L3));
    LineTo(XSusA, LevelToY(LSus));

    if TVFLevel1.Enabled then
    begin
      //Pen.Color := RGB(50,205,50);
      Pen.Color := RGB(0,230,0);
      Pen.Width := 3;
    end;
    LineTo(XSusB, LevelToY(LSus));

    if TVFLevel1.Enabled then
    begin
      Pen.Color := clGreen;
      Pen.Width := 2;
    end;

    LineTo(XEnd, H-1);

    if TVFLevel1.Enabled then
      Pen.Width := 1;
  end;
end;

procedure TEditorForm.DrawTVFFilterGraph(PaintBox: TPaintBox);
var
  W, H: Integer;
  Cutoff, Resonance: Integer;
  CutoffNorm, ResonanceNorm: Double;
  X, Y: Integer;
  FreqNorm, Response, ResonancePeak: Double;
  Points: array of TPoint;
  NominalY: Integer;
  PeakHeadroom: Integer;
  DropHeight: Integer;
begin
  W := PaintBox.Width;
  H := PaintBox.Height;
  if (W <= 1) or (H <= 1) then Exit;

  NominalY := H div 3;            // 1/3 from the top
  PeakHeadroom := NominalY;   // resonance can rise all the way to top
  DropHeight := H - NominalY;     // lowpass rolloff falls from nominal line to bottom

  Cutoff := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Cutoff;
  Resonance := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Resonance;

  CutoffNorm := Cutoff / 100.0;
  ResonanceNorm := Resonance / 30.0;

  SetLength(Points, W);

  for X := 0 to W - 1 do
  begin
    FreqNorm := X / (W - 1);

    if FreqNorm <= CutoffNorm then
      Response := 1.0
    else
      Response := 1.0 / (1.0 + Sqr((FreqNorm - CutoffNorm) * 12.0));

    ResonancePeak :=
      ResonanceNorm *
      Exp(-Sqr((FreqNorm - CutoffNorm) * 7.0)) *
      0.55;

    Response := Response + ResonancePeak;

    if Response < 0.0 then Response := 0.0;

    if Response >= 1.0 then
      Y := NominalY - Round((Response - 1.0) / 0.65 * PeakHeadroom)
    else
      Y := NominalY + Round((1.0 - Response) * DropHeight);

    if Y < 0 then Y := 0;
    if Y > H - 1 then Y := H - 1;

    Points[X] := Point(X, Y);
  end;

  with PaintBox.Canvas do
  begin
    {if TVFCutoff.Enabled then
      Brush.Color := clMoneyGreen
    else}
      Brush.Color := clBtnFace;
    FillRect(PaintBox.ClientRect);
    Pen.Width := 1;
    Pen.Color := clGray;
    Rectangle(0, 0, W, H);

    if TVFCutoff.Enabled then
    begin
      Pen.Width := 2;
      Pen.Color := clGreen
    end;
    Polyline(Points);
  end;
end;

procedure TEditorForm.TVFFilterPlotPaint(Sender: TObject);
begin
  DrawTVFFilterGraph(TVFFilterPlot);
end;

procedure TEditorForm.TVFResonanceChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Resonance := TVFResonance.Position;
  TVFResonance_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Resonance);
  TVFFilterPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $18
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Resonance;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFResonance_valueExit(Sender: TObject);
begin
  if StrToInt(TVFResonance_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Resonance then Exit;
  if StrToInt(TVFResonance_value.Text) < TVFResonance.Min then
    TVFResonance_value.Text := IntToStr(TVFResonance.Min);
  if StrToInt(TVFResonance_value.Text) > TVFResonance.Max then
    TVFResonance_value.Text := IntToStr(TVFResonance.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Resonance := StrToInt(TVFResonance_value.Text);
  TVFPlot.Invalidate;
  UpdatingControls := True;
  TVFResonance.Position := StrToInt(TVFResonance_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $18
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Resonance;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFResonance_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFSustainChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Sustain := TVFSustain.Position;
  TVFSustain_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Sustain);
  TVFPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $28
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Sustain;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFSustain_valueExit(Sender: TObject);
begin
  if StrToInt(TVFSustain_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Sustain then Exit;
  if StrToInt(TVFSustain_value.Text) < TVFSustain.Min then
    TVFSustain_value.Text := IntToStr(TVFSustain.Min);
  if StrToInt(TVFSustain_value.Text) > TVFSustain.Max then
    TVFSustain_value.Text := IntToStr(TVFSustain.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Sustain := StrToInt(TVFSustain_value.Text);
  TVFPlot.Invalidate;
  UpdatingControls := True;
  TVFSustain.Position := StrToInt(TVFSustain_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $28
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Sustain;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFSustain_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFTime1Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time1 := TVFTime1.Value;
  TVFTime1_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time1);
  TVFPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $20
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time1;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFTime1_valueExit(Sender: TObject);
begin
  if StrToInt(TVFTime1_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time1 then Exit;
  if StrToInt(TVFTime1_value.Text) < TVFTime1.Min then
    TVFTime1_value.Text := IntToStr(TVFTime1.Min);
  if StrToInt(TVFTime1_value.Text) > TVFTime1.Max then
    TVFTime1_value.Text := IntToStr(TVFTime1.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time1 := StrToInt(TVFTime1_value.Text);
  TVFPlot.Invalidate;
  UpdatingControls := True;
  TVFTime1.Value := StrToInt(TVFTime1_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $20
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time1;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFTime1_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFTime2Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time2 := TVFTime2.Value;
  TVFTime2_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time2);
  TVFPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $21
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time2;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFTime2_valueExit(Sender: TObject);
begin
  if StrToInt(TVFTime2_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time2 then Exit;
  if StrToInt(TVFTime2_value.Text) < TVFTime2.Min then
    TVFTime2_value.Text := IntToStr(TVFTime2.Min);
  if StrToInt(TVFTime2_value.Text) > TVFTime2.Max then
    TVFTime2_value.Text := IntToStr(TVFTime2.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time2 := StrToInt(TVFTime2_value.Text);
  TVFPlot.Invalidate;
  UpdatingControls := True;
  TVFTime2.Value := StrToInt(TVFTime2_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $21
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time2;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFTime2_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFTime3Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time3 := TVFTime3.Value;
  TVFTime3_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time3);
  TVFPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $22
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time3;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFTime3_valueExit(Sender: TObject);
begin
  if StrToInt(TVFTime3_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time3 then Exit;
  if StrToInt(TVFTime3_value.Text) < TVFTime3.Min then
    TVFTime3_value.Text := IntToStr(TVFTime3.Min);
  if StrToInt(TVFTime3_value.Text) > TVFTime3.Max then
    TVFTime3_value.Text := IntToStr(TVFTime3.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time3 := StrToInt(TVFTime3_value.Text);
  TVFPlot.Invalidate;
  UpdatingControls := True;
  TVFTime3.Value := StrToInt(TVFTime3_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $22
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time3;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFTime3_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFTime4Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time4 := TVFTime4.Value;
  TVFTime4_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time4);
  TVFPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $23
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time4;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFTime4_valueExit(Sender: TObject);
begin
  if StrToInt(TVFTime4_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time4 then Exit;
  if StrToInt(TVFTime4_value.Text) < TVFTime4.Min then
    TVFTime4_value.Text := IntToStr(TVFTime4.Min);
  if StrToInt(TVFTime4_value.Text) > TVFTime4.Max then
    TVFTime4_value.Text := IntToStr(TVFTime4.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time4 := StrToInt(TVFTime4_value.Text);
  TVFPlot.Invalidate;
  UpdatingControls := True;
  TVFTime4.Value := StrToInt(TVFTime4_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $23
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time4;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFTime4_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFTime5Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time5 := TVFTime5.Value;
  TVFTime5_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time5);
  TVFPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $24
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time5;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFTime5_valueExit(Sender: TObject);
begin
  if StrToInt(TVFTime5_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time5 then Exit;
  if StrToInt(TVFTime5_value.Text) < TVFTime5.Min then
    TVFTime5_value.Text := IntToStr(TVFTime5.Min);
  if StrToInt(TVFTime5_value.Text) > TVFTime5.Max then
    TVFTime5_value.Text := IntToStr(TVFTime5.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time5 := StrToInt(TVFTime5_value.Text);
  TVFPlot.Invalidate;
  UpdatingControls := True;
  TVFTime5.Value := StrToInt(TVFTime5_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $24
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.Time5;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFTime5_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFTimeKeyFollowChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.TimeKeyFollow := TVFTimeKeyFollow.Position;
  TVFTimeKeyFollow_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.TimeKeyFollow);
  TVFPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $1F
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.TimeKeyFollow;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFTimeKeyFollow_valueExit(Sender: TObject);
begin
  if StrToInt(TVFTimeKeyFollow_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.TimeKeyFollow then Exit;
  if StrToInt(TVFTimeKeyFollow_value.Text) < TVFTimeKeyFollow.Min then
    TVFTimeKeyFollow_value.Text := IntToStr(TVFTimeKeyFollow.Min);
  if StrToInt(TVFTimeKeyFollow_value.Text) > TVFTimeKeyFollow.Max then
    TVFTimeKeyFollow_value.Text := IntToStr(TVFTimeKeyFollow.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.VelSens := StrToInt(TVFVelSens_value.Text);
  TVFPlot.Invalidate;
  UpdatingControls := True;
  TVFTimeKeyFollow.Position := StrToInt(TVFTimeKeyFollow_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $1F
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.TimeKeyFollow;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFTimeKeyFollow_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVFVelSensChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.VelSens := TVFVelSens.Position;
  TVFVelSens_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.VelSens);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $1D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.VelSens;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFVelSens_valueExit(Sender: TObject);
begin
  if StrToInt(TVFVelSens_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.VelSens then Exit;
  if StrToInt(TVFVelSens_value.Text) < TVFVelSens.Min then
    TVFVelSens_value.Text := IntToStr(TVFVelSens.Min);
  if StrToInt(TVFVelSens_value.Text) > TVFVelSens.Max then
    TVFVelSens_value.Text := IntToStr(TVFVelSens.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.VelSens := StrToInt(TVFVelSens_value.Text);
  UpdatingControls := True;
  TVFVelSens.Position := StrToInt(TVFVelSens_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $1D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVF.VelSens;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVFVelSens_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

{ Time Variant Amplifier Controls }
procedure TEditorForm.TVAAmplifierChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Amplifier := TVAAmplifier.Position;
  TVAAmplifier_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Amplifier);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $29
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Amplifier;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVAAmplifier_valueExit(Sender: TObject);
begin
  if StrToInt(TVAAmplifier_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Amplifier then Exit;
  if StrToInt(TVAAmplifier_value.Text) < TVAAmplifier.Min then
    TVAAmplifier_value.Text := IntToStr(TVAAmplifier.Min);
  if StrToInt(TVAAmplifier_value.Text) > TVAAmplifier.Max then
    TVAAmplifier_value.Text := IntToStr(TVAAmplifier.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Amplifier := StrToInt(TVAAmplifier_value.Text);
  UpdatingControls := True;
  TVAAmplifier.Position := StrToInt(TVAAmplifier_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $29
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Amplifier;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVAAmplifier_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVABiasLevel1Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel1 := TVABiasLevel1.Position;
  TVABiasLevel1_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel1);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $2C
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel1 + 12;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVABiasLevel1_valueExit(Sender: TObject);
begin
  if StrToInt(TVABiasLevel1_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel1 then Exit;
  if StrToInt(TVABiasLevel1_value.Text) < TVABiasLevel1.Min then
    TVABiasLevel1_value.Text := IntToStr(TVABiasLevel1.Min);
  if StrToInt(TVABiasLevel1_value.Text) > TVABiasLevel1.Max then
    TVABiasLevel1_value.Text := IntToStr(TVABiasLevel1.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel1 := StrToInt(TVABiasLevel1_value.Text);
  UpdatingControls := True;
  TVABiasLevel1.Position := StrToInt(TVABiasLevel1_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $2C
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel1 + 12;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVABiasLevel1_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVABiasLevel2Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel2 := TVABiasLevel2.Position;
  TVABiasLevel2_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel2);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $2E
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel2 + 12;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVABiasLevel2_valueExit(Sender: TObject);
begin
  if StrToInt(TVABiasLevel2_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel2 then Exit;
  if StrToInt(TVABiasLevel2_value.Text) < TVABiasLevel2.Min then
    TVABiasLevel2_value.Text := IntToStr(TVABiasLevel2.Min);
  if StrToInt(TVABiasLevel2_value.Text) > TVABiasLevel2.Max then
    TVABiasLevel2_value.Text := IntToStr(TVABiasLevel2.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel2 := StrToInt(TVABiasLevel2_value.Text);
  UpdatingControls := True;
  TVABiasLevel2.Position := StrToInt(TVABiasLevel2_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $2E
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasLevel2 + 12;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVABiasLevel2_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVABiasPoint1Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasPoint1 := TVABiasPoint1.ItemIndex;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $2B
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasPoint1;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVABiasPoint2Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasPoint2 := TVABiasPoint2.ItemIndex;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $2D
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.BiasPoint2;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVALevel1Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level1 := TVALevel1.Position;
  TVALevel1_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level1);
  TVAPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $36
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level1;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVALevel1_valueExit(Sender: TObject);
begin
  if StrToInt(TVALevel1_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level1 then Exit;
  if StrToInt(TVALevel1_value.Text) < TVALevel1.Min then
    TVALevel1_value.Text := IntToStr(TVALevel1.Min);
  if StrToInt(TVALevel1_value.Text) > TVALevel1.Max then
    TVALevel1_value.Text := IntToStr(TVALevel1.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level1 := StrToInt(TVALevel1_value.Text);
  TVAPlot.Invalidate;
  UpdatingControls := True;
  TVALevel1.Position := StrToInt(TVALevel1_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $36
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level1;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVALevel1_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVALevel2Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level2 := TVALevel2.Position;
  TVALevel2_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level2);
  TVAPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $37
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level2;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVALevel2_valueExit(Sender: TObject);
begin
  if StrToInt(TVALevel2_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level2 then Exit;
  if StrToInt(TVALevel2_value.Text) < TVALevel2.Min then
    TVALevel2_value.Text := IntToStr(TVALevel2.Min);
  if StrToInt(TVALevel2_value.Text) > TVALevel2.Max then
    TVALevel2_value.Text := IntToStr(TVALevel2.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level2 := StrToInt(TVALevel2_value.Text);
  TVAPlot.Invalidate;
  UpdatingControls := True;
  TVALevel2.Position := StrToInt(TVALevel2_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $37
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level2;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVALevel2_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVALevel3Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level3 := TVALevel3.Position;
  TVALevel3_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level3);
  TVAPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $38
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level3;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVALevel3_valueExit(Sender: TObject);
begin
  if StrToInt(TVALevel3_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level3 then Exit;
  if StrToInt(TVALevel3_value.Text) < TVALevel3.Min then
    TVALevel3_value.Text := IntToStr(TVALevel3.Min);
  if StrToInt(TVALevel3_value.Text) > TVALevel3.Max then
    TVALevel3_value.Text := IntToStr(TVALevel3.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level3 := StrToInt(TVALevel3_value.Text);
  TVAPlot.Invalidate;
  UpdatingControls := True;
  TVALevel3.Position := StrToInt(TVALevel3_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $38
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level3;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVALevel3_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVAPlotPaint(Sender: TObject);
var
  W, H: Integer;
  T1, T2, T3, T4, T5: Integer;
  L0, L1, L2, L3, LSus: Integer;
  MaxTotal, SusW: Integer;
  X0, X1, X2, X3, XSusA, XSusB, XEnd: Integer;
  Scale: Double;

  function LevelToY(Level: Integer): Integer;
  begin
    Result := Round((100 - Level) / 100 * (H - 2)) + 1;
  end;
begin
  W := TVAPlot.Width;
  H := TVAPlot.Height;

  SusW := 100;
  MaxTotal := 100 + 100 + 100 + 100 + SusW + 100;

  Scale := (W - 2) / MaxTotal;

  T1 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time1;
  T2 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time2;
  T3 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time3;
  T4 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time4;
  T5 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time5;

  L0 := H-1;
  L1 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level1;
  L2 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level2;
  L3 := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Level3;
  LSus := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Sustain;

  X0 := 1;
  X1 := X0 + Round(T1 * Scale);
  X2 := X1 + Round(T2 * Scale);
  X3 := X2 + Round(T3 * Scale);
  XSusA := X3 + Round(T4 * Scale);
  XSusB := XSusA + Round(SusW * Scale);
  XEnd := XSusB + Round(T5 * Scale);

  with TVAPlot.Canvas do
  begin
    Brush.Color := clBtnFace;
    //Brush.Color := RGB(255,200,190);
    FillRect(TVAPlot.ClientRect);

    Pen.Color := clGray;
    Rectangle(0, 0, W, H);

    if TVALevel1.Enabled then
      Pen.Color := clMaroon;
    Pen.Width := 2;

    MoveTo(X0, L0);
    LineTo(X1, LevelToY(L1));
    LineTo(X2, LevelToY(L2));
    LineTo(X3, LevelTOY(L3));
    LineTo(XSusA, LevelToY(LSus));

    if TVALevel1.Enabled then
      Pen.Color := clRed;
    Pen.Width := 3;
    LineTo(XSusB, LevelToY(LSus));

    if TVALevel1.Enabled then
      Pen.Color := clMaroon;
    Pen.Width := 2;
    LineTo(XEnd, H-1);

    Pen.Width := 1;
  end;
end;

procedure TEditorForm.TVASustainChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Sustain := TVASustain.Position;
  TVASustain_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Sustain);
  TVAPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $39
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Sustain;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVASustain_valueExit(Sender: TObject);
begin
  if StrToInt(TVASustain_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Sustain then Exit;
  if StrToInt(TVASustain_value.Text) < TVASustain.Min then
    TVASustain_value.Text := IntToStr(TVASustain.Min);
  if StrToInt(TVASustain_value.Text) > TVASustain.Max then
    TVASustain_value.Text := IntToStr(TVASustain.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Sustain := StrToInt(TVASustain_value.Text);
  TVAPlot.Invalidate;
  UpdatingControls := True;
  TVASustain.Position := StrToInt(TVASustain_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $39
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Sustain;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVASustain_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVATime1Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time1 := TVATime1.Value;
  TVATime1_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time1);
  TVAPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $31
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time1;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVATime1_valueExit(Sender: TObject);
begin
  if StrToInt(TVATime1_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time1 then Exit;
  if StrToInt(TVATime1_value.Text) < TVATime1.Min then
    TVATime1_value.Text := IntToStr(TVATime1.Min);
  if StrToInt(TVATime1_value.Text) > TVATime1.Max then
    TVATime1_value.Text := IntToStr(TVATime1.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time1 := StrToInt(TVATime1_value.Text);
  TVAPlot.Invalidate;
  UpdatingControls := True;
  TVATime1.Value := StrToInt(TVATime1_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $31
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time1;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVATime1_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVATime2Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time2 := TVATime2.Value;
  TVATime2_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time2);
  TVAPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $32
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time2;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVATime2_valueExit(Sender: TObject);
begin
  if StrToInt(TVATime2_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time2 then Exit;
  if StrToInt(TVATime2_value.Text) < TVATime2.Min then
    TVATime2_value.Text := IntToStr(TVATime2.Min);
  if StrToInt(TVATime2_value.Text) > TVATime2.Max then
    TVATime2_value.Text := IntToStr(TVATime2.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time2 := StrToInt(TVATime2_value.Text);
  TVAPlot.Invalidate;
  UpdatingControls := True;
  TVATime2.Value := StrToInt(TVATime2_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $32
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time2;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVATime2_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVATime3Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time3 := TVATime3.Value;
  TVATime3_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time3);
  TVAPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $33
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time3;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVATime3_valueExit(Sender: TObject);
begin
  if StrToInt(TVATime3_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time3 then Exit;
  if StrToInt(TVATime3_value.Text) < TVATime3.Min then
    TVATime3_value.Text := IntToStr(TVATime3.Min);
  if StrToInt(TVATime3_value.Text) > TVATime3.Max then
    TVATime3_value.Text := IntToStr(TVATime3.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time3 := StrToInt(TVATime3_value.Text);
  TVAPlot.Invalidate;
  UpdatingControls := True;
  TVATime3.Value := StrToInt(TVATime3_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $33
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time3;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVATime3_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVATime4Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time4 := TVATime4.Value;
  TVATime4_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time4);
  TVAPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $34
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time4;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVATime4_valueExit(Sender: TObject);
begin
  if StrToInt(TVATime4_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time4 then Exit;
  if StrToInt(TVATime4_value.Text) < TVATime4.Min then
    TVATime4_value.Text := IntToStr(TVATime4.Min);
  if StrToInt(TVATime4_value.Text) > TVATime4.Max then
    TVATime4_value.Text := IntToStr(TVATime4.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time4 := StrToInt(TVATime4_value.Text);
  TVAPlot.Invalidate;
  UpdatingControls := True;
  TVATime4.Value := StrToInt(TVATime4_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $34
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time4;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVATime4_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVATime5Change(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time5 := TVATime5.Value;
  TVATime5_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time5);
  TVAPlot.Invalidate;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $35
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time5;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVATime5_valueExit(Sender: TObject);
begin
  if StrToInt(TVATime5_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time5 then Exit;
  if StrToInt(TVATime5_value.Text) < TVATime5.Min then
    TVATime5_value.Text := IntToStr(TVATime5.Min);
  if StrToInt(TVATime5_value.Text) > TVATime5.Max then
    TVATime5_value.Text := IntToStr(TVATime5.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time5 := StrToInt(TVATime5_value.Text);
  TVAPlot.Invalidate;
  UpdatingControls := True;
  TVATime5.Value := StrToInt(TVATime5_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $35
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.Time5;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVATime5_valueKeyPress(Sender: TObject; var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVATimeKeyFollowChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.TimeKeyFollow := TVATimeKeyFollow.Position;
  TVATimeKeyFollow_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.TimeKeyFollow);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $2F
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.TimeKeyFollow;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVATimeKeyFollow_valueExit(Sender: TObject);
begin
  if StrToInt(TVATimeKeyFollow_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.TimeKeyFollow then Exit;
  if StrToInt(TVATimeKeyFollow_value.Text) < TVATimeKeyFollow.Min then
    TVATimeKeyFollow_value.Text := IntToStr(TVATimeKeyFollow.Min);
  if StrToInt(TVATimeKeyFollow_value.Text) > TVATimeKeyFollow.Max then
    TVATimeKeyFollow_value.Text := IntToStr(TVATimeKeyFollow.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.TimeKeyFollow := StrToInt(TVATimeKeyFollow_value.Text);
  TVAPlot.Invalidate;
  UpdatingControls := True;
  TVATimeKeyFollow.Position := StrToInt(TVATimeKeyFollow_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $2F
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.TimeKeyFollow;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVATimeKeyFollow_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVAVelKeyFollowChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelKeyFollow := TVAVelKeyFollow.Position;
  TVAVelKeyFollow_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelKeyFollow);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $30
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelKeyFollow;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVAVelKeyFollow_valueExit(Sender: TObject);
begin
  if StrToInt(TVAVelKeyFollow_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelKeyFollow then Exit;
  if StrToInt(TVAVelKeyFollow_value.Text) < TVAVelKeyFollow.Min then
    TVAVelKeyFollow_value.Text := IntToStr(TVAVelKeyFollow.Min);
  if StrToInt(TVAVelKeyFollow_value.Text) > TVAVelKeyFollow.Max then
    TVAVelKeyFollow_value.Text := IntToStr(TVAVelKeyFollow.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelKeyFollow := StrToInt(TVAVelKeyFollow_value.Text);
  TVAPlot.Invalidate;
  UpdatingControls := True;
  TVAVelKeyFollow.Position := StrToInt(TVAVelKeyFollow_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $30
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelKeyFollow;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVAVelKeyFollow_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  PressedKey(Sender,Key);
end;

procedure TEditorForm.TVAVelSensChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelSens := TVAVelSens.Position;
  TVAVelSens_value.Text := IntToStr(Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelSens);

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $2A
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelSens + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVAVelSens_valueExit(Sender: TObject);
begin
  if StrToInt(TVAVelSens_value.Text) = Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelSens then Exit;
  if StrToInt(TVAVelSens_value.Text) < TVAVelSens.Min then
    TVAVelSens_value.Text := IntToStr(TVAVelSens.Min);
  if StrToInt(TVAVelSens_value.Text) > TVAVelSens.Max then
    TVAVelSens_value.Text := IntToStr(TVAVelSens.Max);

  Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelSens := StrToInt(TVAVelSens_value.Text);
  TVAPlot.Invalidate;
  UpdatingControls := True;
  TVAVelSens.Position := StrToInt(TVAVelSens_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdTimbreTemp +
    (CurPt * $F6) +
    (CurPtl * $3A) + $0E +
    $2A
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].Part[CurPt].Partial[CurPtl].TVA.VelSens + 50;
  SendCurrentSysEx;
end;

procedure TEditorForm.TVAVelSens_valueKeyPress(Sender: TObject; var Key: Char);
begin
  if not AllowSignedNumericKey(TEdit(Sender), Key) then Exit;
  PressedKey(Sender,Key);
end;

{ System Controls }
procedure TEditorForm.MasterVolumeChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  Synth[CurSyn].System.MasterVolume := MasterVolume.Position;
  MasterVolume_value.Value := Synth[CurSyn].System.MasterVolume;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $16
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MasterVolume;
  SendCurrentSysEx;
end;

procedure TEditorForm.MasterVolume_valueChange(Sender: TObject);
begin
  if UpdatingControls then Exit;

  if StrToInt(MasterVolume_value.Text) = Synth[CurSyn].System.MasterVolume then Exit;
  if StrToInt(MasterVolume_value.Text) < MasterVolume.Min then
    MasterVolume_value.Text := IntToStr(MasterVolume.Min);
  if StrToInt(MasterVolume_value.Text) > MasterVolume.Max then
    MasterVolume_value.Text := IntToStr(MasterVolume.Max);

  Synth[CurSyn].System.MasterVolume := StrToInt(MasterVolume_value.Text);
  UpdatingControls := True;
  MasterVolume.Position := StrToInt(MasterVolume_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $16
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MasterVolume;
  SendCurrentSysEx;
end;
{
procedure TEditorForm.OLDMasterVolume_valueExit(Sender: TObject);
begin
  if StrToInt(MasterVolume_value.Text) = Synth[CurSyn].System.MasterVolume then Exit;
  if StrToInt(MasterVolume_value.Text) < MasterVolume.Min then
    MasterVolume_value.Text := IntToStr(MasterVolume.Min);
  if StrToInt(MasterVolume_value.Text) > MasterVolume.Max then
    MasterVolume_value.Text := IntToStr(MasterVolume.Max);

  Synth[CurSyn].System.MasterVolume := StrToInt(MasterVolume_value.Text);
  UpdatingControls := True;
  MasterVolume.Position := 100 - StrToInt(MasterVolume_value.Text);
  UpdatingControls := False;

  SysExAddress := LinearAddrToBytes(
    AdSystem +
    $16
  );
  SetLength(SysExData,1);
  SysExData[0] := Synth[CurSyn].System.MasterVolume;
  SendCurrentSysEx;
end;

procedure TEditorForm.OLDMasterVolume_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  PressedKey(Sender,Key);
end;
}
procedure TEditorForm.MixAdvanceToggleClick(Sender: TObject);
begin
  if not MuntReady then Exit;

  if not MixAdvanceToggle.Down then // Advanced Options Disabled
  begin
    Pt1AdvPanel.Height := Pt1AdvPanel.Height - 236;
    Pt2AdvPanel.Height := Pt2AdvPanel.Height - 236;
    Pt3AdvPanel.Height := Pt3AdvPanel.Height - 236;
    Pt4AdvPanel.Height := Pt4AdvPanel.Height - 236;
    Pt5AdvPanel.Height := Pt5AdvPanel.Height - 236;
    Pt6AdvPanel.Height := Pt6AdvPanel.Height - 236;
    Pt7AdvPanel.Height := Pt7AdvPanel.Height - 236;
    Pt8AdvPanel.Height := Pt8AdvPanel.Height - 236;
    PtRAdvPanel.Height := PtRAdvPanel.Height - 236;
    Pt1Bend_label.Top := Pt1Bend_label.Top - 231;
    Pt2Bend_label.Top := Pt2Bend_label.Top - 231;
    Pt3Bend_label.Top := Pt3Bend_label.Top - 231;
    Pt4Bend_label.Top := Pt4Bend_label.Top - 231;
    Pt5Bend_label.Top := Pt5Bend_label.Top - 231;
    Pt6Bend_label.Top := Pt6Bend_label.Top - 231;
    Pt7Bend_label.Top := Pt7Bend_label.Top - 231;
    Pt8Bend_label.Top := Pt8Bend_label.Top - 231;
    PtRBend_label.Top := PtRBend_label.Top - 231;
    Pt1Bend.Top := Pt1Bend.Top - 231;
    Pt2Bend.Top := Pt2Bend.Top - 231;
    Pt3Bend.Top := Pt3Bend.Top - 231;
    Pt4Bend.Top := Pt4Bend.Top - 231;
    Pt5Bend.Top := Pt5Bend.Top - 231;
    Pt6Bend.Top := Pt6Bend.Top - 231;
    Pt7Bend.Top := Pt7Bend.Top - 231;
    Pt8Bend.Top := Pt8Bend.Top - 231;
    PtRBend.Top := PtRBend.Top - 231;
    Pt1Bend_value.Top := Pt1Bend_value.Top - 231;
    Pt2Bend_value.Top := Pt2Bend_value.Top - 231;
    Pt3Bend_value.Top := Pt3Bend_value.Top - 231;
    Pt4Bend_value.Top := Pt4Bend_value.Top - 231;
    Pt5Bend_value.Top := Pt5Bend_value.Top - 231;
    Pt6Bend_value.Top := Pt6Bend_value.Top - 231;
    Pt7Bend_value.Top := Pt7Bend_value.Top - 231;
    Pt8Bend_value.Top := Pt8Bend_value.Top - 231;
    PtRBend_value.Top := PtRBend_value.Top - 231;
    Pt1Pan_label.Top := Pt1Pan_label.Top - 231;
    Pt2Pan_label.Top := Pt2Pan_label.Top - 231;
    Pt3Pan_label.Top := Pt3Pan_label.Top - 231;
    Pt4Pan_label.Top := Pt4Pan_label.Top - 231;
    Pt5Pan_label.Top := Pt5Pan_label.Top - 231;
    Pt6Pan_label.Top := Pt6Pan_label.Top - 231;
    Pt7Pan_label.Top := Pt7Pan_label.Top - 231;
    Pt8Pan_label.Top := Pt8Pan_label.Top - 231;
    Pt1Pan.Top := Pt1Pan.Top - 231;
    Pt2Pan.Top := Pt2Pan.Top - 231;
    Pt3Pan.Top := Pt3Pan.Top - 231;
    Pt4Pan.Top := Pt4Pan.Top - 231;
    Pt5Pan.Top := Pt5Pan.Top - 231;
    Pt6Pan.Top := Pt6Pan.Top - 231;
    Pt7Pan.Top := Pt7Pan.Top - 231;
    Pt8Pan.Top := Pt8Pan.Top - 231;
    Pt1Pan_value.Top := Pt1Pan_value.Top - 231;
    Pt2Pan_value.Top := Pt2Pan_value.Top - 231;
    Pt3Pan_value.Top := Pt3Pan_value.Top - 231;
    Pt4Pan_value.Top := Pt4Pan_value.Top - 231;
    Pt5Pan_value.Top := Pt5Pan_value.Top - 231;
    Pt6Pan_value.Top := Pt6Pan_value.Top - 231;
    Pt7Pan_value.Top := Pt7Pan_value.Top - 231;
    Pt8Pan_value.Top := Pt8Pan_value.Top - 231;
    Pt1Output_label.Top := Pt1Output_label.Top - 231;
    Pt2Output_label.Top := Pt2Output_label.Top - 231;
    Pt3Output_label.Top := Pt3Output_label.Top - 231;
    Pt4Output_label.Top := Pt4Output_label.Top - 231;
    Pt5Output_label.Top := Pt5Output_label.Top - 231;
    Pt6Output_label.Top := Pt6Output_label.Top - 231;
    Pt7Output_label.Top := Pt7Output_label.Top - 231;
    Pt8Output_label.Top := Pt8Output_label.Top - 231;
    PtROutput_label.Top := PtROutput_label.Top - 231;
    Pt1Output.Top := Pt1Output.Top - 231;
    Pt2Output.Top := Pt2Output.Top - 231;
    Pt3Output.Top := Pt3Output.Top - 231;
    Pt4Output.Top := Pt4Output.Top - 231;
    Pt5Output.Top := Pt5Output.Top - 231;
    Pt6Output.Top := Pt6Output.Top - 231;
    Pt7Output.Top := Pt7Output.Top - 231;
    Pt8Output.Top := Pt8Output.Top - 231;
    PtROutput.Top := PtROutput.Top - 231;
    Pt1Output.Height := Pt1Output.Height + 231;
    Pt2Output.Height := Pt2Output.Height + 231;
    Pt3Output.Height := Pt3Output.Height + 231;
    Pt4Output.Height := Pt4Output.Height + 231;
    Pt5Output.Height := Pt5Output.Height + 231;
    Pt6Output.Height := Pt6Output.Height + 231;
    Pt7Output.Height := Pt7Output.Height + 231;
    Pt8Output.Height := Pt8Output.Height + 231;
    PtROutput.Height := PtROutput.Height + 231;
    Pt1Output.Frequency := 5;
    Pt2Output.Frequency := 5;
    Pt3Output.Frequency := 5;
    Pt4Output.Frequency := 5;
    Pt5Output.Frequency := 5;
    Pt6Output.Frequency := 5;
    Pt7Output.Frequency := 5;
    Pt8Output.Frequency := 5;
    PtROutput.Frequency := 5;
  end
  else // Advanced Options Enabled
  begin
    Pt1Output.Height := Pt1Output.Height - 231;
    Pt2Output.Height := Pt2Output.Height - 231;
    Pt3Output.Height := Pt3Output.Height - 231;
    Pt4Output.Height := Pt4Output.Height - 231;
    Pt5Output.Height := Pt5Output.Height - 231;
    Pt6Output.Height := Pt6Output.Height - 231;
    Pt7Output.Height := Pt7Output.Height - 231;
    Pt8Output.Height := Pt8Output.Height - 231;
    PtROutput.Height := PtROutput.Height - 231;
    Pt1Output.Top := Pt1Output.Top + 231;
    Pt2Output.Top := Pt2Output.Top + 231;
    Pt3Output.Top := Pt3Output.Top + 231;
    Pt4Output.Top := Pt4Output.Top + 231;
    Pt5Output.Top := Pt5Output.Top + 231;
    Pt6Output.Top := Pt6Output.Top + 231;
    Pt7Output.Top := Pt7Output.Top + 231;
    Pt8Output.Top := Pt8Output.Top + 231;
    PtROutput.Top := PtROutput.Top + 231;
    Pt1Output.Frequency := 10;
    Pt2Output.Frequency := 10;
    Pt3Output.Frequency := 10;
    Pt4Output.Frequency := 10;
    Pt5Output.Frequency := 10;
    Pt6Output.Frequency := 10;
    Pt7Output.Frequency := 10;
    Pt8Output.Frequency := 10;
    PtROutput.Frequency := 10;
    Pt1Output_label.Top := Pt1Output_label.Top + 231;
    Pt2Output_label.Top := Pt2Output_label.Top + 231;
    Pt3Output_label.Top := Pt3Output_label.Top + 231;
    Pt4Output_label.Top := Pt4Output_label.Top + 231;
    Pt5Output_label.Top := Pt5Output_label.Top + 231;
    Pt6Output_label.Top := Pt6Output_label.Top + 231;
    Pt7Output_label.Top := Pt7Output_label.Top + 231;
    Pt8Output_label.Top := Pt8Output_label.Top + 231;
    PtROutput_label.Top := PtROutput_label.Top + 231;
    Pt1Pan_value.Top := Pt1Pan_value.Top + 231;
    Pt2Pan_value.Top := Pt2Pan_value.Top + 231;
    Pt3Pan_value.Top := Pt3Pan_value.Top + 231;
    Pt4Pan_value.Top := Pt4Pan_value.Top + 231;
    Pt5Pan_value.Top := Pt5Pan_value.Top + 231;
    Pt6Pan_value.Top := Pt6Pan_value.Top + 231;
    Pt7Pan_value.Top := Pt7Pan_value.Top + 231;
    Pt8Pan_value.Top := Pt8Pan_value.Top + 231;
    Pt1Pan.Top := Pt1Pan.Top + 231;
    Pt2Pan.Top := Pt2Pan.Top + 231;
    Pt3Pan.Top := Pt3Pan.Top + 231;
    Pt4Pan.Top := Pt4Pan.Top + 231;
    Pt5Pan.Top := Pt5Pan.Top + 231;
    Pt6Pan.Top := Pt6Pan.Top + 231;
    Pt7Pan.Top := Pt7Pan.Top + 231;
    Pt8Pan.Top := Pt8Pan.Top + 231;
    Pt1Pan_label.Top := Pt1Pan_label.Top + 231;
    Pt2Pan_label.Top := Pt2Pan_label.Top + 231;
    Pt3Pan_label.Top := Pt3Pan_label.Top + 231;
    Pt4Pan_label.Top := Pt4Pan_label.Top + 231;
    Pt5Pan_label.Top := Pt5Pan_label.Top + 231;
    Pt6Pan_label.Top := Pt6Pan_label.Top + 231;
    Pt7Pan_label.Top := Pt7Pan_label.Top + 231;
    Pt8Pan_label.Top := Pt8Pan_label.Top + 231;
    Pt1Bend_value.Top := Pt1Bend_value.Top + 231;
    Pt2Bend_value.Top := Pt2Bend_value.Top + 231;
    Pt3Bend_value.Top := Pt3Bend_value.Top + 231;
    Pt4Bend_value.Top := Pt4Bend_value.Top + 231;
    Pt5Bend_value.Top := Pt5Bend_value.Top + 231;
    Pt6Bend_value.Top := Pt6Bend_value.Top + 231;
    Pt7Bend_value.Top := Pt7Bend_value.Top + 231;
    Pt8Bend_value.Top := Pt8Bend_value.Top + 231;
    PtRBend_value.Top := PtRBend_value.Top + 231;
    Pt1Bend.Top := Pt1Bend.Top + 231;
    Pt2Bend.Top := Pt2Bend.Top + 231;
    Pt3Bend.Top := Pt3Bend.Top + 231;
    Pt4Bend.Top := Pt4Bend.Top + 231;
    Pt5Bend.Top := Pt5Bend.Top + 231;
    Pt6Bend.Top := Pt6Bend.Top + 231;
    Pt7Bend.Top := Pt7Bend.Top + 231;
    Pt8Bend.Top := Pt8Bend.Top + 231;
    PtRBend.Top := PtRBend.Top + 231;
    Pt1Bend_label.Top := Pt1Bend_label.Top + 231;
    Pt2Bend_label.Top := Pt2Bend_label.Top + 231;
    Pt3Bend_label.Top := Pt3Bend_label.Top + 231;
    Pt4Bend_label.Top := Pt4Bend_label.Top + 231;
    Pt5Bend_label.Top := Pt5Bend_label.Top + 231;
    Pt6Bend_label.Top := Pt6Bend_label.Top + 231;
    Pt7Bend_label.Top := Pt7Bend_label.Top + 231;
    Pt8Bend_label.Top := Pt8Bend_label.Top + 231;
    PtRBend_label.Top := PtRBend_label.Top + 231;
    Pt1AdvPanel.Height := Pt1AdvPanel.Height + 236;
    Pt2AdvPanel.Height := Pt2AdvPanel.Height + 236;
    Pt3AdvPanel.Height := Pt3AdvPanel.Height + 236;
    Pt4AdvPanel.Height := Pt4AdvPanel.Height + 236;
    Pt5AdvPanel.Height := Pt5AdvPanel.Height + 236;
    Pt6AdvPanel.Height := Pt6AdvPanel.Height + 236;
    Pt7AdvPanel.Height := Pt7AdvPanel.Height + 236;
    Pt8AdvPanel.Height := Pt8AdvPanel.Height + 236;
    PtRAdvPanel.Height := PtRAdvPanel.Height + 236;
  end;
end;

{ Debug Example Controls }
procedure TEditorForm.Button1Click(Sender: TObject);
begin
  if MuntReady then
  begin
    PHandlerInterface_v1.sendShortMessage(MuntVSTiInstance, $007F4091);
    Timer1.Interval := 500;
    Timer1.Enabled := true;
  end;
end;

procedure TEditorForm.Timer1Timer(Sender: TObject);
begin
  if MuntReady then
  begin
    PHandlerInterface_v1.sendShortMessage(MuntVSTiInstance, $007F4081);
    Timer1.Enabled := false;
  end;
end;

procedure TEditorForm.Button2Click(Sender: TObject);
const
  LCDMESSAGE: array[0..29] of byte = ($F0, $41, $10, $16, $12, $20, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $00, $00, $20, $F7);
begin
  if MuntReady then
  begin
    PHandlerInterface_v1.sendSysExMessage(MuntVSTiInstance, @LCDMESSAGE, 30);
  end;
end;

procedure TEditorForm.Button3Click(Sender: TObject);
var
  MemoryInfo: array of byte;
  i: integer;
  Addr, DataSize: Cardinal;
begin
  if MuntReady then
  begin
    Addr := Cardinal(StrToInt('$' + Edit3.Text));
    DataSize := Cardinal(StrToInt('$' + Edit4.Text));

    SetLength(MemoryInfo, DataSize);
    GetData(Addr,
            DataSize,
            MemoryInfo,
            CurSyn
    );
    Memo1.Text := '';
    for i := 0 to High(MemoryInfo) do
      Memo1.Text := Memo1.Text + IntToHex(MemoryInfo[i], 2) + ' ';
  end;
end;

procedure TEditorForm.Button4Click(Sender: TObject);
var
  input: string;
  parts: TStringList;
  bytes: array of Byte;
  i, idx: Integer;
  token: string;
begin
  input := Edit2.Text;

  parts := TStringList.Create;
  parts.Delimiter := ' ';
  parts.StrictDelimiter := True;
  parts.DelimitedText := input;

  SetLength(bytes, parts.Count);
  idx := 0;

  for i := 0 to parts.Count - 1 do
  begin
    token := parts[i];

    if token = '' then
      Continue;

    bytes[idx] := StrToInt('$' + token);
    Inc(idx);
  end;

  SetLength(bytes, idx);

  if (idx > 0) and MuntReady then
  begin
    PHandlerInterface_v1.sendSysExMessage(
      MuntVSTiInstance,
      @bytes[0],
      idx
    );
  end;

  parts.Free;
end;

end.
