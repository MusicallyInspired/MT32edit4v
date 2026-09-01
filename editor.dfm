object EditorForm: TEditorForm
  Left = 551
  Top = 228
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'MuntVSTi Editor'
  ClientHeight = 616
  ClientWidth = 809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object MasterVolume_label: TLabel
    Left = 760
    Top = 227
    Width = 42
    Height = 26
    Alignment = taCenter
    Caption = 'Master'#13#10'Volume'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12014080
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Synth1Toggle: TSpeedButton
    Left = 756
    Top = 28
    Width = 52
    Height = 24
    GroupIndex = 1
    Down = True
    Caption = 'Synth 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12014080
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = SynthToggleClick
  end
  object Synth2Toggle: TSpeedButton
    Tag = 1
    Left = 756
    Top = 51
    Width = 52
    Height = 24
    GroupIndex = 1
    Caption = 'Synth 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = SynthToggleClick
  end
  object EditorPage: TPageControl
    Left = -2
    Top = 0
    Width = 756
    Height = 619
    ActivePage = TimbreTempArea
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    TabWidth = 100
    OnChange = EditorPageChange
    object TimbreTempArea: TTabSheet
      Caption = 'Timbre Editor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object TimbreName_label: TLabel
        Left = 398
        Top = 27
        Width = 62
        Height = 13
        Caption = 'Timbre Name'
      end
      object EnvMode: TSpeedButton
        Left = 476
        Top = 29
        Width = 55
        Height = 35
        Hint = 'Sustain On: notes held'#13#10'Sustain Off: notes not held'
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Sustain'#13#10'Enable'
        ParentShowHint = False
        ShowHint = False
        OnClick = EnvModeClick
      end
      object SelPartial1Button: TSpeedButton
        Left = 21
        Top = 76
        Width = 24
        Height = 23
        Hint = 'Select a Partial of the current Part to edit'
        GroupIndex = 2
        Down = True
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = SelPartialButtonClick
      end
      object SelPartial2Button: TSpeedButton
        Tag = 1
        Left = 21
        Top = 97
        Width = 24
        Height = 23
        Hint = 'Select a Partial of the current Part to edit'
        GroupIndex = 2
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = SelPartialButtonClick
      end
      object SelPartial3Button: TSpeedButton
        Tag = 2
        Left = 21
        Top = 118
        Width = 24
        Height = 23
        Hint = 'Select a Partial of the current Part to edit'
        GroupIndex = 2
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = SelPartialButtonClick
      end
      object SelPartial4Button: TSpeedButton
        Tag = 3
        Left = 21
        Top = 139
        Width = 24
        Height = 23
        Hint = 'Select a Partial of the current Part to edit'
        GroupIndex = 2
        Caption = '4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = SelPartialButtonClick
      end
      object Partials_label: TLabel
        Left = 535
        Top = 15
        Width = 15
        Height = 37
        Caption = 'Partials'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Orientation = 900
        Font.Style = []
        ParentFont = False
      end
      object PartialSelect_label: TLabel
        Left = 3
        Top = 88
        Width = 15
        Height = 65
        Caption = 'Partial Select'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Orientation = 900
        Font.Style = []
        ParentFont = False
      end
      object PitchEnvGroup: TGroupBox
        Left = 3
        Top = 168
        Width = 242
        Height = 419
        Caption = 'Pitch Envelope'
        Color = clBtnFace
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 2
        object PEnvLevel0_label: TLabel
          Left = 5
          Top = 17
          Width = 22
          Height = 13
          Caption = 'Lvl 0'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object PEnvLevel1_label: TLabel
          Left = 35
          Top = 17
          Width = 22
          Height = 13
          Caption = 'Lvl 1'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object PEnvLevel2_label: TLabel
          Left = 67
          Top = 17
          Width = 22
          Height = 13
          Caption = 'Lvl 2'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object PEnvSus_label: TLabel
          Left = 94
          Top = 17
          Width = 35
          Height = 13
          Caption = 'Sustain'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object PEnvEnd_label: TLabel
          Left = 133
          Top = 17
          Width = 18
          Height = 13
          Caption = 'End'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object PEnvPlot: TPaintBox
          Left = 3
          Top = 129
          Width = 154
          Height = 59
          OnPaint = PEnvPlotPaint
        end
        object PEnvDepth_label: TLabel
          Left = 13
          Top = 284
          Width = 29
          Height = 13
          Caption = 'Depth'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object PEnvVelSens_label: TLabel
          Left = 13
          Top = 371
          Width = 89
          Height = 13
          Caption = 'Velocity Sensitivity'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object PEnvTimeKeyFollow_label: TLabel
          Left = 13
          Top = 329
          Width = 76
          Height = 13
          Caption = 'Time Key Follow'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object PEnvTime1_label: TLabel
          Left = 17
          Top = 197
          Width = 31
          Height = 13
          Caption = 'Time 1'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object PEnvTime2_label: TLabel
          Left = 71
          Top = 197
          Width = 31
          Height = 13
          Caption = 'Time 2'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object PEnvTime3_label: TLabel
          Left = 125
          Top = 197
          Width = 31
          Height = 13
          Caption = 'Time 3'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object PEnvTime4_label: TLabel
          Left = 179
          Top = 197
          Width = 31
          Height = 13
          Caption = 'Time 4'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object PEnvLevel1_value: TEdit
          Left = 35
          Top = 101
          Width = 26
          Height = 21
          Hint = '-50 ~ +50'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Text = '0'
          OnExit = PEnvLevel1_valueExit
          OnKeyPress = PEnvLevel1_valueKeyPress
        end
        object PEnvLevel2_value: TEdit
          Left = 67
          Top = 101
          Width = 26
          Height = 21
          Hint = '-50 ~ +50'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Text = '0'
          OnExit = PEnvLevel2_valueExit
          OnKeyPress = PEnvLevel2_valueKeyPress
        end
        object PEnvSustain_value: TEdit
          Left = 99
          Top = 101
          Width = 26
          Height = 21
          Hint = '-50 ~ +50'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Text = '0'
          OnExit = PEnvSustain_valueExit
          OnKeyPress = PEnvSustain_valueKeyPress
        end
        object PEnvEnd_value: TEdit
          Left = 131
          Top = 101
          Width = 26
          Height = 21
          Hint = '-50 ~ +50'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Text = '0'
          OnExit = PEnvEnd_valueExit
          OnKeyPress = PEnvEnd_valueKeyPress
        end
        object PEnvTime1_value: TEdit
          Left = 21
          Top = 254
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 5
          Text = '0'
          OnExit = PEnvTime1_valueExit
          OnKeyPress = PEnvTime1_valueKeyPress
        end
        object PEnvTime2_value: TEdit
          Left = 75
          Top = 254
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 6
          Text = '0'
          OnKeyPress = PEnvTime2_valueKeyPress
        end
        object PEnvTime3_value: TEdit
          Left = 129
          Top = 254
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 7
          Text = '0'
          OnKeyPress = PEnvTime3_valueKeyPress
        end
        object PEnvTime4_value: TEdit
          Left = 183
          Top = 254
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 8
          Text = '0'
          OnKeyPress = PEnvTime4_valueKeyPress
        end
        object PEnvDepth_value: TEdit
          Left = 207
          Top = 302
          Width = 25
          Height = 21
          Hint = '0 ~ 10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 10
          Text = '0'
          OnExit = PEnvDepth_valueExit
          OnKeyPress = PEnvDepth_valueKeyPress
        end
        object PEnvLevel0_value: TEdit
          Left = 3
          Top = 101
          Width = 26
          Height = 21
          Hint = '-50 ~ +50'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          Text = '0'
          OnExit = PEnvLevel0_valueExit
          OnKeyPress = PEnvLevel0_valueKeyPress
        end
        object PEnvVelSens_value: TEdit
          Left = 207
          Top = 384
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 12
          Text = '0'
          OnExit = PEnvVelSens_valueExit
          OnKeyPress = PEnvVelSens_valueKeyPress
        end
        object PEnvTimeKeyFollow_value: TEdit
          Left = 207
          Top = 341
          Width = 25
          Height = 21
          Hint = '0 ~ 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 1
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 11
          Text = '0'
          OnExit = PEnvTimeKeyFollow_valueExit
          OnKeyPress = PEnvTimeKeyFollow_valueKeyPress
        end
        object PEnvTime1: TKnobControl
          Left = 12
          Top = 209
          Width = 42
          Height = 42
          Max = 100
          OnChange = PEnvTime1Change
          StartAngle = 135
          EndAngle = 405
        end
        object PEnvTime2: TKnobControl
          Left = 66
          Top = 209
          Width = 42
          Height = 42
          Max = 100
          OnChange = PEnvTime2Change
          StartAngle = 135
          EndAngle = 405
        end
        object PEnvTime3: TKnobControl
          Left = 120
          Top = 209
          Width = 42
          Height = 42
          Max = 100
          OnChange = PEnvTime3Change
          StartAngle = 135
          EndAngle = 405
        end
        object PEnvTime4: TKnobControl
          Left = 174
          Top = 209
          Width = 42
          Height = 42
          Max = 100
          OnChange = PEnvTime4Change
          StartAngle = 135
          EndAngle = 405
        end
        object PEnvLFOGroup: TGroupBox
          Left = 162
          Top = 11
          Width = 75
          Height = 179
          Caption = 'LFO'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12014080
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 9
          object PEnvLFODepth_label: TLabel
            Left = 10
            Top = 67
            Width = 29
            Height = 13
            Caption = 'Depth'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object PEnvLFOModSens_label: TLabel
            Left = 10
            Top = 123
            Width = 46
            Height = 13
            Caption = 'Mod Sens'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object PEnvLFORate_label: TLabel
            Left = 10
            Top = 15
            Width = 23
            Height = 13
            Caption = 'Rate'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object PEnvLFODepth: TKnobControl
            Left = 2
            Top = 80
            Width = 40
            Height = 40
            Max = 100
            OnChange = PEnvLFODepthChange
            StartAngle = 135
            EndAngle = 405
          end
          object PEnvLFODepth_value: TEdit
            Left = 45
            Top = 89
            Width = 25
            Height = 21
            Hint = '0 ~ 100'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            NumbersOnly = True
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            Text = '0'
            OnExit = PEnvLFODepth_valueExit
            OnKeyPress = PEnvLFODepth_valueKeyPress
          end
          object PEnvLFOModSens: TKnobControl
            Left = 2
            Top = 135
            Width = 40
            Height = 40
            Max = 100
            OnChange = PEnvLFOModSensChange
            StartAngle = 135
            EndAngle = 405
          end
          object PEnvLFOModSens_value: TEdit
            Left = 45
            Top = 144
            Width = 25
            Height = 21
            Hint = '0 ~ 100'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            NumbersOnly = True
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            Text = '0'
            OnExit = PEnvLFOModSens_valueExit
            OnKeyPress = PEnvLFOModSens_valueKeyPress
          end
          object PEnvLFORate: TKnobControl
            Left = 2
            Top = 27
            Width = 40
            Height = 40
            Max = 100
            OnChange = PEnvLFORateChange
            StartAngle = 135
            EndAngle = 405
          end
          object PEnvLFORate_value: TEdit
            Left = 45
            Top = 36
            Width = 25
            Height = 21
            Hint = '0 ~ 100'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            NumbersOnly = True
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Text = '0'
            OnExit = PEnvLFORate_valueExit
            OnKeyPress = PEnvLFORate_valueKeyPress
          end
        end
        object PEnvLevel0: TSynthSlider
          Left = 4
          Top = 31
          Width = 23
          Height = 70
          Min = -50
          Max = 50
          CenterMark = True
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 17
          TabStop = True
          OnChange = PEnvLevel0Change
        end
        object PEnvLevel1: TSynthSlider
          Left = 36
          Top = 31
          Width = 23
          Height = 70
          Min = -50
          Max = 50
          CenterMark = True
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 18
          TabStop = True
          OnChange = PEnvLevel1Change
        end
        object PEnvLevel2: TSynthSlider
          Left = 68
          Top = 31
          Width = 23
          Height = 70
          Min = -50
          Max = 50
          CenterMark = True
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 19
          TabStop = True
          OnChange = PEnvLevel2Change
        end
        object PEnvSustain: TSynthSlider
          Left = 100
          Top = 31
          Width = 23
          Height = 70
          Min = -50
          Max = 50
          CenterMark = True
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 20
          TabStop = True
          OnChange = PEnvSustainChange
        end
        object PEnvEnd: TSynthSlider
          Left = 132
          Top = 31
          Width = 23
          Height = 70
          Min = -50
          Max = 50
          Position = -1
          CenterMark = True
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 21
          TabStop = True
          OnChange = PEnvEndChange
        end
        object PEnvDepth: TSynthSlider
          Left = 1
          Top = 302
          Width = 200
          Height = 26
          Max = 10
          Orientation = stoHorizontal
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmTopLeft
          ThumbSize = 7
          ParentColor = False
          TabOrder = 22
          TabStop = True
          OnChange = PEnvDepthChange
        end
        object PEnvTimeKeyFollow: TSynthSlider
          Left = 1
          Top = 342
          Width = 200
          Height = 22
          Max = 4
          Orientation = stoHorizontal
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBottomRight
          ThumbSize = 7
          ParentColor = False
          TabOrder = 23
          TabStop = True
          OnChange = PEnvTimeKeyFollowChange
        end
        object PEnvVelSens: TSynthSlider
          Left = 1
          Top = 384
          Width = 200
          Height = 23
          Orientation = stoHorizontal
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          ThumbSize = 7
          ParentColor = False
          TabOrder = 24
          TabStop = True
          OnChange = PEnvVelSensChange
        end
      end
      object TVFGroup: TGroupBox
        Left = 251
        Top = 168
        Width = 242
        Height = 419
        Caption = 'Time Variant Filter'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 3
        object TVFLevel0_label: TLabel
          Left = 5
          Top = 17
          Width = 22
          Height = 13
          Caption = 'Lvl 1'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFLevel2_label: TLabel
          Left = 37
          Top = 17
          Width = 22
          Height = 13
          Caption = 'Lvl 2'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFLevel3_label: TLabel
          Left = 69
          Top = 17
          Width = 22
          Height = 13
          Caption = 'Lvl 3'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFSustain_label: TLabel
          Left = 96
          Top = 17
          Width = 35
          Height = 13
          Caption = 'Sustain'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFKeyFollow_label: TLabel
          Left = 133
          Top = 6
          Width = 30
          Height = 24
          Alignment = taCenter
          Caption = 'Key'#13#10'Follow'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFPlot: TPaintBox
          Left = 5
          Top = 129
          Width = 154
          Height = 59
          OnPaint = TVFPlotPaint
        end
        object TVFTime1_label: TLabel
          Left = 14
          Top = 190
          Width = 31
          Height = 13
          Caption = 'Time 1'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFTime2_label: TLabel
          Left = 58
          Top = 190
          Width = 31
          Height = 13
          Caption = 'Time 2'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFTime3_label: TLabel
          Left = 102
          Top = 190
          Width = 31
          Height = 13
          Caption = 'Time 3'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFTime4_label: TLabel
          Left = 146
          Top = 190
          Width = 31
          Height = 13
          Caption = 'Time 4'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFTime5_label: TLabel
          Left = 190
          Top = 190
          Width = 31
          Height = 13
          Caption = 'Time 5'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFDepth_label: TLabel
          Left = 13
          Top = 274
          Width = 29
          Height = 13
          Caption = 'Depth'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFVelSens_label: TLabel
          Left = 13
          Top = 317
          Width = 89
          Height = 13
          Caption = 'Velocity Sensitivity'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFTimeKeyFollow_label: TLabel
          Left = 133
          Top = 317
          Width = 76
          Height = 13
          Caption = 'Time Key Follow'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFDepthKeyFollow_label: TLabel
          Left = 133
          Top = 274
          Width = 83
          Height = 13
          Caption = 'Depth Key Follow'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFBiasLevel_label: TLabel
          Left = 104
          Top = 365
          Width = 47
          Height = 13
          Caption = 'Bias Level'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFBiasPoint_label: TLabel
          Left = 13
          Top = 365
          Width = 46
          Height = 13
          Caption = 'Bias Point'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVFKeyFollow_result: TLabel
          Left = 133
          Top = 105
          Width = 28
          Height = 13
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object TVFLevel2_value: TEdit
          Left = 37
          Top = 102
          Width = 26
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Text = '0'
          OnExit = TVFLevel2_valueExit
          OnKeyPress = TVFLevel2_valueKeyPress
        end
        object TVFLevel3_value: TEdit
          Left = 69
          Top = 102
          Width = 26
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Text = '0'
          OnExit = TVFLevel3_valueExit
          OnKeyPress = TVFLevel3_valueKeyPress
        end
        object TVFSustain_value: TEdit
          Left = 101
          Top = 102
          Width = 26
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Text = '0'
          OnExit = TVFSustain_valueExit
          OnKeyPress = TVFSustain_valueKeyPress
        end
        object TVFLevel1_value: TEdit
          Left = 5
          Top = 102
          Width = 26
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          Text = '0'
          OnExit = TVFLevel1_valueExit
          OnKeyPress = TVFLevel1_valueKeyPress
        end
        object TVFTime1_value: TEdit
          Left = 17
          Top = 247
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Text = '0'
          OnExit = TVFTime1_valueExit
          OnKeyPress = TVFTime1_valueKeyPress
        end
        object TVFTime2_value: TEdit
          Left = 61
          Top = 247
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 5
          Text = '0'
          OnExit = TVFTime2_valueExit
          OnKeyPress = TVFTime2_valueKeyPress
        end
        object TVFTime3_value: TEdit
          Left = 105
          Top = 247
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 6
          Text = '0'
          OnExit = TVFTime3_valueExit
          OnKeyPress = TVFTime3_valueKeyPress
        end
        object TVFTime4_value: TEdit
          Left = 149
          Top = 247
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 7
          Text = '0'
          OnExit = TVFTime4_valueExit
          OnKeyPress = TVFTime4_valueKeyPress
        end
        object TVFTime1: TKnobControl
          Left = 8
          Top = 202
          Width = 42
          Height = 42
          Max = 100
          OnChange = TVFTime1Change
          StartAngle = 135
          EndAngle = 405
        end
        object TVFTime2: TKnobControl
          Left = 52
          Top = 202
          Width = 42
          Height = 42
          Max = 100
          OnChange = TVFTime2Change
          StartAngle = 135
          EndAngle = 405
        end
        object TVFTime3: TKnobControl
          Left = 96
          Top = 202
          Width = 42
          Height = 42
          Max = 100
          OnChange = TVFTime3Change
          StartAngle = 135
          EndAngle = 405
        end
        object TVFTime4: TKnobControl
          Left = 141
          Top = 202
          Width = 42
          Height = 42
          Max = 100
          Value = 1
          OnChange = TVFTime4Change
          StartAngle = 135
          EndAngle = 405
        end
        object TVFTime5: TKnobControl
          Left = 185
          Top = 202
          Width = 42
          Height = 42
          Max = 100
          OnChange = TVFTime5Change
          StartAngle = 135
          EndAngle = 405
        end
        object TVFTime5_value: TEdit
          Left = 193
          Top = 247
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 8
          Text = '0'
          OnExit = TVFTime5_valueExit
          OnKeyPress = TVFTime5_valueKeyPress
        end
        object TVFDepth_value: TEdit
          Left = 91
          Top = 289
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 10
          Text = '0'
          OnExit = TVFDepth_valueExit
          OnKeyPress = TVFDepth_valueKeyPress
        end
        object TVFVelSens_value: TEdit
          Left = 91
          Top = 333
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 11
          Text = '0'
          OnExit = TVFVelSens_valueExit
          OnKeyPress = TVFVelSens_valueKeyPress
        end
        object TVFTimeKeyFollow_value: TEdit
          Left = 211
          Top = 333
          Width = 25
          Height = 21
          Hint = '0 ~ 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 1
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 12
          Text = '0'
          OnExit = TVFTimeKeyFollow_valueExit
          OnKeyPress = TVFTimeKeyFollow_valueKeyPress
        end
        object TVFDepthKeyFollow_value: TEdit
          Left = 211
          Top = 289
          Width = 25
          Height = 21
          Hint = '0 ~ 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 1
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 13
          Text = '0'
          OnExit = TVFDepthKeyFollow_valueExit
          OnKeyPress = TVFDepthKeyFollow_valueKeyPress
        end
        object TVFBiasLevel_value: TEdit
          Left = 211
          Top = 382
          Width = 25
          Height = 21
          Hint = '-7 ~ +7'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 15
          Text = '0'
          OnExit = TVFBiasLevel_valueExit
          OnKeyPress = TVFBiasLevel_valueKeyPress
        end
        object TVFBiasPoint: TComboBox
          Left = 11
          Top = 381
          Width = 78
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 14
          Text = '< A0'
          OnChange = TVFBiasPointChange
          Items.Strings = (
            '< A0'
            '< A#0'
            '< B0'
            '< C1'
            '< C#1'
            '< D1'
            '< D#1'
            '< E1'
            '< F1'
            '< F#1'
            '< G1'
            '< G#1'
            '< A1'
            '< A#1'
            '< B1'
            '< C2'
            '< C#2'
            '< D2'
            '< D#2'
            '< E2'
            '< F2'
            '< F#2'
            '< G2'
            '< G#2'
            '< A2'
            '< A#2'
            '< B2'
            '< C3'
            '< C#3'
            '< D3'
            '< D#3'
            '< E3'
            '< F3'
            '< F#3'
            '< G3'
            '< G#3'
            '< A3'
            '< A#3'
            '< B3'
            '< C4'
            ' < C#4'
            '< D4'
            '< D#4'
            '< E4'
            '< F4'
            '< F#4'
            '< G4'
            '< G#4'
            '< A4'
            '< A#4'
            '< B4'
            '< C5'
            ' < C#5'
            '< D5'
            '< D#5'
            '< E5'
            '< F5'
            '< F#5'
            '< G5'
            '< G#5'
            '< A5'
            '< A#5'
            '< B5'
            '< C6'
            '> A0'
            '> A#0'
            '> B0'
            '> C1'
            '> C#1'
            '> D1'
            '> D#1'
            '> E1'
            '> F1'
            '> F#1'
            '> G1'
            '> G#1'
            '> A1'
            '> A#1'
            '> B1'
            '> C2'
            '> C#2'
            '> D2'
            '> D#2'
            '> E2'
            '> F2'
            '> F#2'
            '> G2'
            '> G#2'
            '> A2'
            '> A#2'
            '> B2'
            '> C3'
            '> C#3'
            '> D3'
            '> D#3'
            '> E3'
            '> F3'
            '> F#3'
            '> G3'
            '> G#3'
            '> A3'
            '> A#3'
            '> B3'
            '> C4'
            '> C#4'
            '> D4'
            '> D#4'
            '> E4'
            '> F4'
            '> F#4'
            '> G4'
            '> G#4'
            '> A4'
            '> A#4'
            '> B4'
            '> C5'
            '> C#5'
            '> D5'
            '> D#5'
            '> E5'
            '> F5'
            '> F#5'
            '> G5'
            '> G#5'
            '> A5'
            '> A#5'
            '> B5'
            '> C6')
        end
        object TVFFilterGroup: TGroupBox
          Left = 164
          Top = 10
          Width = 73
          Height = 181
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 9
          object TVFResonance_label: TLabel
            Left = 44
            Top = 7
            Width = 18
            Height = 13
            Caption = 'Res'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object TVFCutoff_label: TLabel
            Left = 7
            Top = 7
            Width = 31
            Height = 13
            Caption = 'Cutoff'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object TVFFilterPlot: TPaintBox
            Left = 3
            Top = 119
            Width = 67
            Height = 59
            OnPaint = TVFFilterPlotPaint
          end
          object TVFResonance_value: TEdit
            Left = 42
            Top = 92
            Width = 25
            Height = 21
            Hint = '0 ~ 30'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            NumbersOnly = True
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            Text = '0'
            OnExit = TVFResonance_valueExit
            OnKeyPress = TVFResonance_valueKeyPress
          end
          object TVFCutoff_value: TEdit
            Left = 8
            Top = 92
            Width = 25
            Height = 21
            Hint = '0 ~ 100'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            NumbersOnly = True
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Text = '0'
            OnExit = TVFCutoff_valueExit
            OnKeyPress = TVFCutoff_valueKeyPress
          end
          object TVFCutoff: TSynthSlider
            Left = 9
            Top = 21
            Width = 23
            Height = 70
            TrackColor = 14737632
            FillColor = 16751121
            ThumbColor = 14120960
            TickColor = clSilver
            Frequency = 10
            ThumbSize = 10
            ParentColor = False
            TabOrder = 2
            TabStop = True
            OnChange = TVFCutoffChange
          end
          object TVFResonance: TSynthSlider
            Left = 43
            Top = 21
            Width = 23
            Height = 70
            Max = 30
            TrackColor = 14737632
            FillColor = 16751121
            ThumbColor = 14120960
            TickColor = clSilver
            ThumbSize = 10
            ParentColor = False
            TabOrder = 3
            TabStop = True
            OnChange = TVFResonanceChange
          end
        end
        object TVFLevel1: TSynthSlider
          Left = 6
          Top = 31
          Width = 23
          Height = 70
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 21
          TabStop = True
          OnChange = TVFLevel1Change
        end
        object TVFLevel3: TSynthSlider
          Left = 70
          Top = 31
          Width = 23
          Height = 70
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 22
          TabStop = True
          OnChange = TVFLevel3Change
        end
        object TVFLevel2: TSynthSlider
          Left = 38
          Top = 31
          Width = 23
          Height = 70
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 23
          TabStop = True
          OnChange = TVFLevel2Change
        end
        object TVFSustain: TSynthSlider
          Left = 102
          Top = 31
          Width = 23
          Height = 70
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 24
          TabStop = True
          OnChange = TVFSustainChange
        end
        object TVFKeyFollow: TSynthSlider
          Left = 133
          Top = 29
          Width = 29
          Height = 70
          Min = -3
          Max = 11
          CenterMark = True
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBottomRight
          Frequency = 3
          ThumbSize = 11
          ParentColor = False
          TabOrder = 25
          TabStop = True
          OnChange = TVFKeyFollowChange
        end
        object TVFDepth: TSynthSlider
          Left = 1
          Top = 291
          Width = 88
          Height = 24
          Orientation = stoHorizontal
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmTopLeft
          Frequency = 10
          ThumbSize = 7
          ParentColor = False
          TabOrder = 26
          TabStop = True
          OnChange = TVFDepthChange
        end
        object TVFDepthKeyFollow: TSynthSlider
          Left = 120
          Top = 290
          Width = 88
          Height = 23
          Max = 4
          Orientation = stoHorizontal
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBottomRight
          ThumbSize = 7
          ParentColor = False
          TabOrder = 27
          TabStop = True
          OnChange = TVFDepthKeyFollowChange
        end
        object TVFVelSens: TSynthSlider
          Left = 1
          Top = 333
          Width = 88
          Height = 23
          Orientation = stoHorizontal
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          ThumbSize = 7
          ParentColor = False
          TabOrder = 28
          TabStop = True
          OnChange = TVFVelSensChange
        end
        object TVFTimeKeyFollow: TSynthSlider
          Left = 120
          Top = 333
          Width = 88
          Height = 23
          Max = 4
          Orientation = stoHorizontal
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBottomRight
          ThumbSize = 7
          ParentColor = False
          TabOrder = 29
          TabStop = True
          OnChange = TVFTimeKeyFollowChange
        end
        object TVFBiasLevel: TSynthSlider
          Left = 92
          Top = 384
          Width = 118
          Height = 24
          Min = -7
          Max = 7
          Orientation = stoHorizontal
          CenterMark = True
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmTopLeft
          ThumbSize = 7
          ParentColor = False
          TabOrder = 30
          TabStop = True
          OnChange = TVFBiasLevelChange
        end
      end
      object TVAGroup: TGroupBox
        Left = 499
        Top = 168
        Width = 242
        Height = 419
        Caption = 'Time Variant Amplifier'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 4
        object TVALevel1_label: TLabel
          Left = 16
          Top = 17
          Width = 22
          Height = 13
          Caption = 'Lvl 1'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVALevel2_label: TLabel
          Left = 56
          Top = 17
          Width = 22
          Height = 13
          Caption = 'Lvl 2'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVALevel3_label: TLabel
          Left = 96
          Top = 17
          Width = 22
          Height = 13
          Caption = 'Lvl 3'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVASustain_label: TLabel
          Left = 129
          Top = 17
          Width = 35
          Height = 13
          Caption = 'Sustain'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVAPlot: TPaintBox
          Left = 10
          Top = 129
          Width = 155
          Height = 59
          OnPaint = TVAPlotPaint
        end
        object TVATime1_label: TLabel
          Left = 14
          Top = 190
          Width = 31
          Height = 13
          Caption = 'Time 1'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVATime2_label: TLabel
          Left = 58
          Top = 190
          Width = 31
          Height = 13
          Caption = 'Time 2'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVATime3_label: TLabel
          Left = 102
          Top = 190
          Width = 31
          Height = 13
          Caption = 'Time 3'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVATime4_label: TLabel
          Left = 146
          Top = 190
          Width = 31
          Height = 13
          Caption = 'Time 4'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVATime5_label: TLabel
          Left = 190
          Top = 190
          Width = 31
          Height = 13
          Caption = 'Time 5'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVAVelSens_label: TLabel
          Left = 14
          Top = 270
          Width = 89
          Height = 13
          Caption = 'Velocity Sensitivity'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVATimeKeyFollow_label: TLabel
          Left = 16
          Top = 304
          Width = 76
          Height = 13
          Caption = 'Time Key Follow'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVAVelKeyFollow_label: TLabel
          Left = 126
          Top = 304
          Width = 91
          Height = 13
          Caption = 'Velocity Key Follow'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVABiasPoint1_label: TLabel
          Left = 13
          Top = 340
          Width = 55
          Height = 13
          Caption = 'Bias Point 1'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVABiasLevel1_label: TLabel
          Left = 104
          Top = 340
          Width = 56
          Height = 13
          Caption = 'Bias Level 1'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVABiasPoint2_label: TLabel
          Left = 13
          Top = 378
          Width = 55
          Height = 13
          Caption = 'Bias Point 2'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVABiasLevel2_label: TLabel
          Left = 104
          Top = 378
          Width = 56
          Height = 13
          Caption = 'Bias Level 2'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object TVALevel2_value: TEdit
          Left = 56
          Top = 102
          Width = 26
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Text = '0'
          OnExit = TVALevel2_valueExit
          OnKeyPress = TVALevel2_valueKeyPress
        end
        object TVALevel3_value: TEdit
          Left = 96
          Top = 102
          Width = 26
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Text = '0'
          OnExit = TVALevel3_valueExit
          OnKeyPress = TVALevel3_valueKeyPress
        end
        object TVASustain_value: TEdit
          Left = 136
          Top = 102
          Width = 26
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Text = '0'
          OnExit = TVASustain_valueExit
          OnKeyPress = TVASustain_valueKeyPress
        end
        object TVALevel1_value: TEdit
          Left = 16
          Top = 102
          Width = 26
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          Text = '0'
          OnExit = TVALevel1_valueExit
          OnKeyPress = TVALevel1_valueKeyPress
        end
        object TVATime1_value: TEdit
          Left = 17
          Top = 247
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Text = '0'
          OnExit = TVATime1_valueExit
          OnKeyPress = TVATime1_valueKeyPress
        end
        object TVATime2_value: TEdit
          Left = 61
          Top = 247
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 5
          Text = '0'
          OnExit = TVATime2_valueExit
          OnKeyPress = TVATime2_valueKeyPress
        end
        object TVATime3_value: TEdit
          Left = 105
          Top = 247
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 6
          Text = '0'
          OnExit = TVATime3_valueExit
          OnKeyPress = TVATime3_valueKeyPress
        end
        object TVATime4_value: TEdit
          Left = 149
          Top = 247
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 7
          Text = '0'
          OnExit = TVATime4_valueExit
          OnKeyPress = TVATime4_valueKeyPress
        end
        object TVATime1: TKnobControl
          Left = 8
          Top = 202
          Width = 42
          Height = 42
          Max = 100
          OnChange = TVATime1Change
          StartAngle = 135
          EndAngle = 405
        end
        object TVATime2: TKnobControl
          Left = 52
          Top = 202
          Width = 42
          Height = 42
          Max = 100
          OnChange = TVATime2Change
          StartAngle = 135
          EndAngle = 405
        end
        object TVATime3: TKnobControl
          Left = 96
          Top = 202
          Width = 42
          Height = 42
          Max = 100
          OnChange = TVATime3Change
          StartAngle = 135
          EndAngle = 405
        end
        object TVATime4: TKnobControl
          Left = 141
          Top = 202
          Width = 42
          Height = 42
          Max = 100
          Value = 1
          OnChange = TVATime4Change
          StartAngle = 135
          EndAngle = 405
        end
        object TVATime5: TKnobControl
          Left = 185
          Top = 202
          Width = 42
          Height = 42
          Max = 100
          OnChange = TVATime5Change
          StartAngle = 135
          EndAngle = 405
        end
        object TVATime5_value: TEdit
          Left = 193
          Top = 247
          Width = 25
          Height = 21
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 8
          Text = '0'
          OnExit = TVATime5_valueExit
          OnKeyPress = TVATime5_valueKeyPress
        end
        object TVAVelSens_value: TEdit
          Left = 210
          Top = 280
          Width = 25
          Height = 21
          Hint = '-50 ~ +50'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 10
          Text = '0'
          OnExit = TVAVelSens_valueExit
          OnKeyPress = TVAVelSens_valueKeyPress
        end
        object TVATimeKeyFollow_value: TEdit
          Left = 91
          Top = 317
          Width = 25
          Height = 21
          Hint = '0 ~ 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 1
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 11
          Text = '0'
          OnExit = TVATimeKeyFollow_valueExit
          OnKeyPress = TVATimeKeyFollow_valueKeyPress
        end
        object TVAVelKeyFollow_value: TEdit
          Left = 210
          Top = 317
          Width = 25
          Height = 21
          Hint = '0 ~ 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 1
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 12
          Text = '0'
          OnExit = TVAVelKeyFollow_valueExit
          OnKeyPress = TVAVelKeyFollow_valueKeyPress
        end
        object TVABiasPoint1: TComboBox
          Left = 11
          Top = 354
          Width = 78
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 13
          Text = '< A0'
          OnChange = TVABiasPoint1Change
          Items.Strings = (
            '< A0'
            '< A#0'
            '< B0'
            '< C1'
            '< C#1'
            '< D1'
            '< D#1'
            '< E1'
            '< F1'
            '< F#1'
            '< G1'
            '< G#1'
            '< A1'
            '< A#1'
            '< B1'
            '< C2'
            '< C#2'
            '< D2'
            '< D#2'
            '< E2'
            '< F2'
            '< F#2'
            '< G2'
            '< G#2'
            '< A2'
            '< A#2'
            '< B2'
            '< C3'
            '< C#3'
            '< D3'
            '< D#3'
            '< E3'
            '< F3'
            '< F#3'
            '< G3'
            '< G#3'
            '< A3'
            '< A#3'
            '< B3'
            '< C4'
            ' < C#4'
            '< D4'
            '< D#4'
            '< E4'
            '< F4'
            '< F#4'
            '< G4'
            '< G#4'
            '< A4'
            '< A#4'
            '< B4'
            '< C5'
            ' < C#5'
            '< D5'
            '< D#5'
            '< E5'
            '< F5'
            '< F#5'
            '< G5'
            '< G#5'
            '< A5'
            '< A#5'
            '< B5'
            '< C6'
            '> A0'
            '> A#0'
            '> B0'
            '> C1'
            '> C#1'
            '> D1'
            '> D#1'
            '> E1'
            '> F1'
            '> F#1'
            '> G1'
            '> G#1'
            '> A1'
            '> A#1'
            '> B1'
            '> C2'
            '> C#2'
            '> D2'
            '> D#2'
            '> E2'
            '> F2'
            '> F#2'
            '> G2'
            '> G#2'
            '> A2'
            '> A#2'
            '> B2'
            '> C3'
            '> C#3'
            '> D3'
            '> D#3'
            '> E3'
            '> F3'
            '> F#3'
            '> G3'
            '> G#3'
            '> A3'
            '> A#3'
            '> B3'
            '> C4'
            '> C#4'
            '> D4'
            '> D#4'
            '> E4'
            '> F4'
            '> F#4'
            '> G4'
            '> G#4'
            '> A4'
            '> A#4'
            '> B4'
            '> C5'
            '> C#5'
            '> D5'
            '> D#5'
            '> E5'
            '> F5'
            '> F#5'
            '> G5'
            '> G#5'
            '> A5'
            '> A#5'
            '> B5'
            '> C6')
        end
        object TVABiasLevel1_value: TEdit
          Left = 210
          Top = 357
          Width = 25
          Height = 21
          Hint = '-12 ~ 0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 14
          Text = '0'
          OnExit = TVABiasLevel1_valueExit
          OnKeyPress = TVABiasLevel1_valueKeyPress
        end
        object TVAAmpGroup: TGroupBox
          Left = 175
          Top = 11
          Width = 60
          Height = 179
          Color = clBtnFace
          ParentBackground = False
          ParentColor = False
          TabOrder = 9
          object TVAAmplifier_label: TLabel
            Left = 11
            Top = 6
            Width = 41
            Height = 13
            Alignment = taCenter
            Caption = 'Amplifier'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object TVAAmplifier_value: TEdit
            Left = 15
            Top = 152
            Width = 30
            Height = 21
            Hint = '0 ~ 100'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            NumbersOnly = True
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Text = '0'
            OnExit = TVAAmplifier_valueExit
            OnKeyPress = TVAAmplifier_valueKeyPress
          end
          object TVAAmplifier: TSynthSlider
            Left = 13
            Top = 20
            Width = 32
            Height = 131
            TrackColor = 14737632
            FillColor = 16751121
            ThumbColor = 14120960
            TickColor = clSilver
            TickMarks = stmBoth
            Frequency = 25
            ThumbSize = 13
            ParentColor = False
            TabOrder = 1
            TabStop = True
            OnChange = TVAAmplifierChange
          end
        end
        object TVABiasPoint2: TComboBox
          Left = 11
          Top = 392
          Width = 78
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 15
          Text = '< A0'
          OnChange = TVABiasPoint2Change
          Items.Strings = (
            '< A0'
            '< A#0'
            '< B0'
            '< C1'
            '< C#1'
            '< D1'
            '< D#1'
            '< E1'
            '< F1'
            '< F#1'
            '< G1'
            '< G#1'
            '< A1'
            '< A#1'
            '< B1'
            '< C2'
            '< C#2'
            '< D2'
            '< D#2'
            '< E2'
            '< F2'
            '< F#2'
            '< G2'
            '< G#2'
            '< A2'
            '< A#2'
            '< B2'
            '< C3'
            '< C#3'
            '< D3'
            '< D#3'
            '< E3'
            '< F3'
            '< F#3'
            '< G3'
            '< G#3'
            '< A3'
            '< A#3'
            '< B3'
            '< C4'
            ' < C#4'
            '< D4'
            '< D#4'
            '< E4'
            '< F4'
            '< F#4'
            '< G4'
            '< G#4'
            '< A4'
            '< A#4'
            '< B4'
            '< C5'
            ' < C#5'
            '< D5'
            '< D#5'
            '< E5'
            '< F5'
            '< F#5'
            '< G5'
            '< G#5'
            '< A5'
            '< A#5'
            '< B5'
            '< C6'
            '> A0'
            '> A#0'
            '> B0'
            '> C1'
            '> C#1'
            '> D1'
            '> D#1'
            '> E1'
            '> F1'
            '> F#1'
            '> G1'
            '> G#1'
            '> A1'
            '> A#1'
            '> B1'
            '> C2'
            '> C#2'
            '> D2'
            '> D#2'
            '> E2'
            '> F2'
            '> F#2'
            '> G2'
            '> G#2'
            '> A2'
            '> A#2'
            '> B2'
            '> C3'
            '> C#3'
            '> D3'
            '> D#3'
            '> E3'
            '> F3'
            '> F#3'
            '> G3'
            '> G#3'
            '> A3'
            '> A#3'
            '> B3'
            '> C4'
            '> C#4'
            '> D4'
            '> D#4'
            '> E4'
            '> F4'
            '> F#4'
            '> G4'
            '> G#4'
            '> A4'
            '> A#4'
            '> B4'
            '> C5'
            '> C#5'
            '> D5'
            '> D#5'
            '> E5'
            '> F5'
            '> F#5'
            '> G5'
            '> G#5'
            '> A5'
            '> A#5'
            '> B5'
            '> C6')
        end
        object TVABiasLevel2_value: TEdit
          Left = 210
          Top = 392
          Width = 25
          Height = 21
          Hint = '-12 ~ 0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 16
          Text = '0'
          OnExit = TVABiasLevel2_valueExit
          OnKeyPress = TVABiasLevel2_valueKeyPress
        end
        object TVALevel1: TSynthSlider
          Left = 17
          Top = 36
          Width = 23
          Height = 70
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 22
          TabStop = True
          OnChange = TVALevel1Change
        end
        object TVALevel2: TSynthSlider
          Left = 57
          Top = 31
          Width = 23
          Height = 70
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 23
          TabStop = True
          OnChange = TVALevel2Change
        end
        object TVALevel3: TSynthSlider
          Left = 97
          Top = 31
          Width = 23
          Height = 70
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 24
          TabStop = True
          OnChange = TVALevel3Change
        end
        object TVASustain: TSynthSlider
          Left = 137
          Top = 31
          Width = 23
          Height = 70
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          Frequency = 10
          ThumbSize = 10
          ParentColor = False
          TabOrder = 25
          TabStop = True
          OnChange = TVASustainChange
        end
        object TVAVelSens: TSynthSlider
          Left = 1
          Top = 283
          Width = 206
          Height = 20
          Min = -50
          Max = 50
          Orientation = stoHorizontal
          CenterMark = True
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBottomRight
          Frequency = 10
          ThumbSize = 7
          ParentColor = False
          TabOrder = 26
          TabStop = True
          OnChange = TVAVelSensChange
        end
        object TVATimeKeyFollow: TSynthSlider
          Left = 1
          Top = 318
          Width = 89
          Height = 20
          Max = 4
          Orientation = stoHorizontal
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBottomRight
          ThumbSize = 7
          ParentColor = False
          TabOrder = 27
          TabStop = True
          OnChange = TVATimeKeyFollowChange
        end
        object TVAVelKeyFollow: TSynthSlider
          Left = 118
          Top = 318
          Width = 89
          Height = 20
          Max = 4
          Orientation = stoHorizontal
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBottomRight
          ThumbSize = 7
          ParentColor = False
          TabOrder = 28
          TabStop = True
          OnChange = TVAVelKeyFollowChange
        end
        object TVABiasLevel1: TSynthSlider
          Left = 92
          Top = 356
          Width = 115
          Height = 24
          Min = -12
          Max = 0
          Orientation = stoHorizontal
          CenterMark = True
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmTopLeft
          ThumbSize = 7
          ParentColor = False
          TabOrder = 29
          TabStop = True
          OnChange = TVABiasLevel1Change
        end
        object TVABiasLevel2: TSynthSlider
          Left = 92
          Top = 393
          Width = 115
          Height = 24
          Min = -12
          Max = 0
          Orientation = stoHorizontal
          CenterMark = True
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmTopLeft
          ThumbSize = 7
          ParentColor = False
          TabOrder = 30
          TabStop = True
          OnChange = TVABiasLevel2Change
        end
      end
      object TimbreName: TEdit
        Left = 393
        Top = 43
        Width = 77
        Height = 21
        Hint = 'Set the name of the current Part'#39's Timbre (10 chars max)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnExit = TimbreNameExit
        OnKeyPress = PressedKey
      end
      object WaveGenGroup: TGroupBox
        Left = 51
        Top = 69
        Width = 690
        Height = 95
        Caption = 'Wave Generator'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object WGPulseWidth_label: TLabel
          Left = 86
          Top = 9
          Width = 56
          Height = 13
          Caption = 'Pulse Width'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object WGVelSens_label: TLabel
          Left = 86
          Top = 53
          Width = 89
          Height = 13
          Caption = 'Velocity Sensitivity'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object WGPitchBend: TSpeedButton
          Left = 566
          Top = 57
          Width = 105
          Height = 29
          Hint = 'Pitch bender toggle for the current partial'
          AllowAllUp = True
          GroupIndex = 3
          Down = True
          Caption = 'Pitch Bend Enable'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = WGPitchBendClick
        end
        object WGCoarse_label: TLabel
          Left = 423
          Top = 9
          Width = 68
          Height = 13
          Caption = 'Pitch (Coarse)'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object WGFine_label: TLabel
          Left = 423
          Top = 53
          Width = 54
          Height = 13
          Caption = 'Pitch (Fine)'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object WGKeyFollow_label: TLabel
          Left = 558
          Top = 9
          Width = 103
          Height = 13
          Caption = 'Key Follow (multi/oct)'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object WGSample_label: TLabel
          Left = 222
          Top = 9
          Width = 67
          Height = 13
          Caption = 'PCM Samples:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object WGCoarseType: TLabel
          Left = 531
          Top = 9
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = 'C2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object WGShape: TRadioGroup
          Left = 6
          Top = 11
          Width = 68
          Height = 78
          Hint = 'Shape of the waveform that this partial will generate'
          Caption = ' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'Square'
            'Saw'
            'PCM')
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          OnClick = WGShapeClick
        end
        object WGPulseWidth_value: TEdit
          Left = 190
          Top = 27
          Width = 26
          Height = 21
          Cursor = crIBeam
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Text = '0'
          OnExit = WGPulseWidth_valueExit
          OnKeyPress = WGPulseWidth_valueKeyPress
        end
        object WGVelSens_value: TEdit
          Left = 190
          Top = 64
          Width = 26
          Height = 21
          Hint = '-7 ~ +7'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Text = '0'
          OnExit = WGVelSens_valueExit
          OnKeyPress = WGVelSens_valueKeyPress
        end
        object WGCoarse_value: TEdit
          Left = 523
          Top = 27
          Width = 26
          Height = 21
          Hint = '0 ~ 96'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Text = '36'
          OnExit = WGCoarse_valueExit
          OnKeyPress = WGCoarse_valueKeyPress
        end
        object WGFine_value: TEdit
          Left = 523
          Top = 64
          Width = 26
          Height = 21
          Hint = '-50 ~ +50'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Text = '0'
          OnExit = WGFine_valueExit
          OnKeyPress = WGFine_valueKeyPress
        end
        object WGSample: TListBox
          Left = 222
          Top = 26
          Width = 188
          Height = 61
          Hint = 'PCM sample for this partial (instead of waveform)'
          Enabled = False
          ExtendedSelect = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          Items.Strings = (
            '000: Ac. Bass Drum'
            '001: Ac. Snare Drum'
            '002: El. Snare Drum'
            '003: Electric Tom'
            '004: Closed Hihat'
            '005: Open Hihat'
            '006: Crash Cymbal'
            '007: Crash Cymbal (loop)'
            '008: Ride cymbal'
            '009: Rim Shot'
            '010: Hand Clap'
            '011: Muted Conga'
            '012: Conga'
            '013: Bongo'
            '014: Cowbell'
            '015: Tambourine'
            '016: Agogo Bell'
            '017: Claves'
            '018: Timbale'
            '019: Cabasa'
            '020: Keypress'
            '021: Perc Organ'
            '022: Trombone'
            '023: Trumpet'
            '024: Breath Noise (loop)'
            '025: Clarient'
            '026: Flute'
            '027: Pan Pipes'
            '028: Shakuhachi'
            '029: Alto Sax'
            '030: Baritone Sax'
            '031: Marimba'
            '032: Glockenspiel'
            '033: Xylophone'
            '034: Tubular Bells'
            '035: Fingered Bass'
            '036: Slap Bass'
            '037: Picked Bass (loop)'
            '038: Acoustic Bass'
            '039: Nylon Guitar'
            '040: Steel Guitar'
            '041: Pizzicato'
            '042: Harp'
            '043: Harpsichord (loop)'
            '044: Bow string'
            '045: Violin'
            '046: Timpani'
            '047: Orchestra Hit'
            '048: Flute'
            '049: Organ (loop)'
            '050: Bowed Glass (loop)'
            '051: Telephone'
            '052: Bowed Glass'
            '053: Reverse Cymbal'
            '054: Ac. Bass Drum #'
            '055: Ac. Snare Drum #'
            '056: El. Snare Drum #'
            '057: Ac. Tom #'
            '058: Closed Hihat #'
            '059: Open Hihat #'
            '060: Crash Cymbal #'
            '061: Crash Cymbal (loop) #'
            '062: Ride Cymbal #'
            '063: Rim shot #'
            '064: Hand clap #'
            '065: Mute Conga #'
            '066: Conga #'
            '067: Bongo #'
            '068: Cowbell #'
            '069: Tambourine #'
            '070: Agogo #'
            '071: Claves #'
            '072: Timbale #'
            '073: Cabasa #'
            '074: Bass Drum (loop)'
            '075: Snare (loop)'
            '076: Acoustic Tom (loop)'
            '077: Electric Tom (loop)'
            '078: Hihat (loop)'
            '079: Crash Cymbal (loop)'
            '080: Ride cymbal (loop)'
            '081: Ride cymbal 2 (loop)'
            '082: Rim (loop)'
            '083: Hand clap (loop)'
            '084: Bongo (loop)'
            '085: Conga (loop)'
            '086: Muted conga (loop)'
            '087: Cowbell (loop)'
            '088: Tambourine (loop)'
            '089: Agogo (loop)'
            '090: Woodblock (loop)'
            '091: Timbales (loop)'
            '092: Maracas (loop)'
            '093: Sticks (loop)'
            '094: Perc Organ (loop)'
            '095: Trombone (loop)'
            '096: Trumpet (loop)'
            '097: Clarinet (loop)'
            '098: Piccolo (loop)'
            '099: Pan Pipe (loop)'
            '100: Breath Noise (loop)'
            '101: Alto Sax (loop)'
            '102: Baritone Sax (loop)'
            '103: Xylophone (loop)'
            '104: Glockenspiel (loop)'
            '105: Marimba (loop)'
            '106: Tubular Bells (loop)'
            '107: Fingered Bass (loop)'
            '108: Slap Bass (loop)'
            '109: Acoustic Bass (loop)'
            '110: Nylon Guitar (loop)'
            '111: Steel Guitar (loop)'
            '112: Pizzicato (loop)'
            '113: Harp (loop)'
            '114: Bowed string (loop)'
            '115: String Ensemble (loop)'
            '116: Timpani (loop)'
            '117: Orchestra Hit (loop)'
            '118: Flute (loop)'
            '119: Perc. loop 1'
            '120: Perc. loop 2'
            '121: Orch&Perc loop'
            '122: Wind&Perc loop'
            '123: Guitar & Bass loop'
            '124: Orchestra loop'
            '125: Perc. loop 3'
            '126: Bass & Perc. loop'
            '127: Bass & Snare loop')
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 5
          OnClick = WGSampleClick
        end
        object WGPulseWidth: TSynthSlider
          Left = 77
          Top = 24
          Width = 107
          Height = 29
          Orientation = stoHorizontal
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBoth
          Frequency = 10
          ThumbSize = 8
          ParentColor = False
          TabOrder = 6
          TabStop = True
          OnChange = WGPulseWidthChange
        end
        object WGVelSens: TSynthSlider
          Left = 77
          Top = 66
          Width = 107
          Height = 21
          Min = -7
          Max = 7
          Orientation = stoHorizontal
          CenterMark = True
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBottomRight
          ThumbSize = 8
          ParentColor = False
          TabOrder = 7
          TabStop = True
          OnChange = WGVelSensChange
        end
        object WGCoarse: TSynthSlider
          Left = 416
          Top = 24
          Width = 105
          Height = 29
          Max = 96
          Position = 36
          Orientation = stoHorizontal
          CenterMark = True
          CenterValue = 36
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBoth
          Frequency = 12
          ThumbSize = 8
          ParentColor = False
          TabOrder = 8
          TabStop = True
          OnChange = WGCoarseChange
        end
        object WGFine: TSynthSlider
          Left = 413
          Top = 65
          Width = 105
          Height = 22
          Min = -50
          Max = 50
          Orientation = stoHorizontal
          CenterMark = True
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBottomRight
          Frequency = 10
          ThumbSize = 8
          ParentColor = False
          TabOrder = 9
          TabStop = True
          OnChange = WGFineChange
        end
        object WGKeyFollow: TComboBox
          Left = 558
          Top = 27
          Width = 122
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 11
          ParentFont = False
          TabOrder = 10
          Text = '1 (Standard)'
          OnChange = WGKeyFollowChange
          Items.Strings = (
            '-1 (Inverted)'
            '-1/2'
            '-1/4'
            '0 (Fixed)'
            '1/8 (Microtonal)'
            '1/4'
            '3/8'
            '1/2'
            '5/8'
            '3/4'
            '7/8'
            '1 (Standard)'
            '5/4'
            '3/2'
            '2 (Double)'
            's1 (Stretch +1'#162'/oct)'
            's2 (Stretch +5'#162'/oct)')
        end
        object WGSampleBank1: TRadioButton
          Left = 294
          Top = 9
          Width = 61
          Height = 15
          Caption = 'Standard'
          Checked = True
          Enabled = False
          TabOrder = 11
          TabStop = True
          OnClick = WGSampleBank1Click
        end
        object WGSampleBank2: TRadioButton
          Left = 359
          Top = 9
          Width = 54
          Height = 15
          Caption = 'CM-32L'
          Enabled = False
          TabOrder = 12
          OnClick = WGSampleBank2Click
        end
      end
      object PartialGroup: TGroupBox
        Left = 552
        Top = 3
        Width = 189
        Height = 64
        TabOrder = 5
        object PartialMute_label: TLabel
          Left = 12
          Top = 2
          Width = 24
          Height = 13
          Caption = 'Mute'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object PartialStruct_label: TLabel
          Left = 66
          Top = 2
          Width = 45
          Height = 13
          Caption = 'Structure'
        end
        object PartialMute1: TCheckBox
          Left = 8
          Top = 16
          Width = 27
          Height = 17
          Caption = '1'
          Checked = True
          ParentShowHint = False
          ShowHint = False
          State = cbChecked
          TabOrder = 0
          OnClick = PartialMuteClick
        end
        object PartialMute2: TCheckBox
          Tag = 1
          Left = 34
          Top = 16
          Width = 27
          Height = 17
          Caption = '2'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnClick = PartialMuteClick
        end
        object PartialMute3: TCheckBox
          Tag = 2
          Left = 8
          Top = 37
          Width = 27
          Height = 17
          Caption = '3'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          OnClick = PartialMuteClick
        end
        object PartialMute4: TCheckBox
          Tag = 3
          Left = 34
          Top = 37
          Width = 27
          Height = 17
          Caption = '4'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          OnClick = PartialMuteClick
        end
        object PartialStruct1: TComboBox
          Left = 62
          Top = 15
          Width = 122
          Height = 21
          Hint = 
            'Structure of partial output signals (P1 & P2)'#13#10#13#10'S = Synth, P = ' +
            'PCM Sample, R = Ring Mod'#13#10'Stereo = P1 -> Left, P2 -> Right'#13#10#13#10'NO' +
            'TE: The stereo mode structure can only'#13#10'consist of two synth par' +
            'tials or two PCM '#13#10'partials. They cannot intermix.'
          Style = csDropDownList
          ItemIndex = 0
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Text = '(P1 + P2)'
          OnChange = PartialStruct1Change
          Items.Strings = (
            '(P1 + P2)'
            '(P1 + P2 -> R) + P1'
            '(P1 + P2) -> R'
            'Stereo (Synth)'
            'Stereo (PCM)')
        end
        object PartialStruct2: TComboBox
          Left = 62
          Top = 36
          Width = 122
          Height = 21
          Hint = 
            'Structure of partial output signals (P3 & P4)'#13#10#13#10'S = Synth, P = ' +
            'PCM Sample, R = Ring Mod'#13#10'Stereo = P3 -> Left, P4 -> Right'#13#10#13#10'NO' +
            'TE: The stereo mode structure can only'#13#10'consist of two synth par' +
            'tials or two PCM '#13#10'partials. They cannot intermix.'
          Style = csDropDownList
          ItemIndex = 0
          ParentShowHint = False
          ShowHint = False
          TabOrder = 5
          Text = '(P3 + P4)'
          OnChange = PartialStruct2Change
          Items.Strings = (
            '(P3 + P4)'
            '(P3 + P4 -> R) + P3'
            '(P3 + P4) -> R'
            'Stereo (Synth)'
            'Stereo (PCM)')
        end
      end
      object PartControlsGroup: TGroupBox
        Left = 4
        Top = -1
        Width = 383
        Height = 68
        Margins.Right = 7
        Caption = 'Patch Controls (current part)'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 6
        object PtTmbMemBevel: TBevel
          Left = 227
          Top = 9
          Width = 151
          Height = 54
        end
        object CurPart_label: TLabel
          Left = 5
          Top = 22
          Width = 62
          Height = 13
          Caption = 'Part Select'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12014080
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PartMidiChan_label: TLabel
          Left = 75
          Top = 22
          Width = 45
          Height = 13
          Caption = 'Channel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PtRevButton: TSpeedButton
          Left = 177
          Top = 18
          Width = 46
          Height = 40
          Hint = 'Reverb Enable'
          AllowAllUp = True
          GroupIndex = 4
          Down = True
          Caption = 'Reverb'#13#10'Enable'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtRevButtonClick
        end
        object PtBendRange_label: TLabel
          Left = 128
          Top = 22
          Width = 40
          Height = 13
          Caption = 'Bender'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object CurMem_label: TLabel
          Left = 235
          Top = 16
          Width = 47
          Height = 13
          Caption = 'Memory'
          Color = 12014080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object CurPart: TComboBox
          Left = 5
          Top = 38
          Width = 63
          Height = 21
          Hint = 'Current active Part'
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          Text = 'Part 1'
          OnChange = CurPartChange
          Items.Strings = (
            'Part 1'
            'Part 2'
            'Part 3'
            'Part 4'
            'Part 5'
            'Part 6'
            'Part 7'
            'Part 8')
        end
        object PartMidiChan: TComboBox
          Left = 75
          Top = 38
          Width = 44
          Height = 21
          Hint = 
            'MIDI channel that the selected Part will respond on (1 ~ 16, Off' +
            ')'
          DropDownCount = 17
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 1
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Text = '2'
          OnChange = PtMidiChanChange
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12'
            '13'
            '14'
            '15'
            '16'
            'OFF')
        end
        object PtBendRange: TSpinEdit
          Left = 128
          Top = 38
          Width = 41
          Height = 22
          Hint = 'Pitch Bender Range (0 ~ 24)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 24
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Value = 12
          OnChange = PtBendRangeChange
          OnKeyPress = PressedKey
        end
        object SaveTmbMemButton: TButton
          Left = 289
          Top = 11
          Width = 43
          Height = 26
          Hint = 'Store current Timbre to Timbre Memory Area'
          Caption = 'Save'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          WordWrap = True
          OnClick = SaveTmbMemButtonClick
        end
        object LoadTmbMemButton: TButton
          Left = 331
          Top = 11
          Width = 43
          Height = 26
          Hint = 'Load Timbre from Timbre Memory Area'
          Caption = 'Load'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          OnClick = LoadTmbMemButtonClick
        end
        object CurMem: TComboBox
          Left = 235
          Top = 38
          Width = 139
          Height = 21
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
      object InitTimbreButton: TButton
        Left = 393
        Top = 1
        Width = 138
        Height = 22
        Hint = 'Initialize current Timbre settings'
        Caption = 'Initialize Timbre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
        WordWrap = True
        OnClick = InitTimbreButtonClick
      end
    end
    object RhythmSetup: TTabSheet
      Caption = 'Rhythm Set Up'
      ImageIndex = 3
      TabVisible = False
      object RhyControlsGroup: TGroupBox
        Left = 4
        Top = -1
        Width = 737
        Height = 68
        Margins.Right = 7
        Caption = 'Patch Controls (rhythm)'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object RhyPartBevel: TBevel
          Left = 5
          Top = 38
          Width = 63
          Height = 22
          Shape = bsFrame
        end
        object RhyMidiChan_label: TLabel
          Left = 75
          Top = 22
          Width = 45
          Height = 13
          Caption = 'Channel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RhyBendRange_label: TLabel
          Left = 127
          Top = 22
          Width = 40
          Height = 13
          Caption = 'Bender'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RhyPart_label: TLabel
          Left = 5
          Top = 22
          Width = 34
          Height = 13
          Caption = 'Part 9'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 12014080
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RhyPart: TLabel
          Left = 9
          Top = 42
          Width = 37
          Height = 13
          Caption = 'Rhythm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object RhyFine_label: TLabel
          Left = 221
          Top = 9
          Width = 28
          Height = 26
          Caption = 'Fine'#13#10'Tune'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RhyKey_label: TLabel
          Left = 176
          Top = 9
          Width = 26
          Height = 26
          Caption = 'Key'#13#10'Shift'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RhyPoly_label: TLabel
          Left = 649
          Top = 22
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Poly Mode'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RhyPtlReserve_label: TLabel
          Left = 591
          Top = 9
          Width = 47
          Height = 26
          AutoSize = False
          Caption = 'Partial'#13#10'Reserve'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RhyOutput_label: TLabel
          Left = 269
          Top = 9
          Width = 39
          Height = 13
          Caption = 'Output'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RhyMidiChan: TComboBox
          Tag = 8
          Left = 75
          Top = 38
          Width = 44
          Height = 21
          Hint = 'MIDI channel that the Rhythm Part will respond on (1 ~ 16, Off)'
          DropDownCount = 17
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 9
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          Text = '10'
          OnChange = RhyMidiChanChange
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12'
            '13'
            '14'
            '15'
            '16'
            'OFF')
        end
        object RhyBendRange: TSpinEdit
          Tag = 8
          Left = 127
          Top = 38
          Width = 42
          Height = 22
          Hint = 'Pitch Bender Range (0 ~ 24)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 24
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Value = 12
          OnChange = RhyBendRangeChange
          OnKeyPress = PressedKey
        end
        object RhyFine: TSpinEdit
          Tag = 8
          Left = 221
          Top = 38
          Width = 38
          Height = 22
          Hint = '-50 ~ +50'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          MaxValue = 50
          MinValue = -50
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Value = 0
          OnChange = RhyFineChange
          OnKeyPress = PressedKey
        end
        object RhyKey: TSpinEdit
          Tag = 8
          Left = 176
          Top = 38
          Width = 38
          Height = 22
          Hint = '-24 ~ +24'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          MaxValue = 24
          MinValue = -24
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Value = 0
          OnChange = RhyKeyChange
          OnKeyPress = PressedKey
        end
        object RhyPoly: TComboBox
          Tag = 8
          Left = 649
          Top = 38
          Width = 79
          Height = 21
          Hint = 
            '1: Single Assign, FIFO (priority given to last note)'#13#10'2: Single ' +
            'Assign, FILO (priority given to first note)'#13#10'3: Multiple Assign,' +
            ' FIFO (priority given to last note)'#13#10'4: Multiple Assign, FILO (p' +
            'riority given to first note)'#13#10#13#10'Single Assign = identical notes ' +
            'do NOT stack'#13#10'(conserves partials)'#13#10#13#10'Multiple Assign = identica' +
            'l notes DO stack'#13#10'(uses more partials)'
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Text = '(S)  FIFO'
          OnChange = RhyPolyChange
          Items.Strings = (
            '(S)  FIFO'
            '(S)  FILO'
            '(M)  FIFO'
            '(M)  FILO')
        end
        object RhyPtlReserve: TSpinEdit
          Tag = 8
          Left = 591
          Top = 38
          Width = 48
          Height = 22
          Hint = 
            'Reserves partials for the Rhythm Part (0 ~ 32)'#13#10#13#10'NOTE: The tota' +
            'l sum of each Part'#39's reserve'#13#10'partial settings cannot exceed 32.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 32
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 5
          Value = 0
          OnChange = RhyPtlReserveChange
        end
        object RhyOutput: TSynthSlider
          Tag = 8
          Left = 262
          Top = 25
          Width = 264
          Height = 36
          Hint = 'Output level of the Rhythm Part'
          Orientation = stoHorizontal
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBoth
          Frequency = 5
          ParentColor = False
          TabOrder = 6
          TabStop = True
          OnChange = RhyOutputChange
        end
        object RhyOutput_value: TSpinEdit
          Tag = 8
          Left = 532
          Top = 38
          Width = 48
          Height = 22
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          MaxValue = 100
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 7
          Value = 0
          OnChange = RhyOutput_valueChange
          OnKeyPress = PressedKey
        end
      end
      object ScrollBox1: TScrollBox
        Left = 13
        Top = 113
        Width = 719
        Height = 464
        TabOrder = 1
      end
    end
    object PatchTempArea: TTabSheet
      Caption = 'Patch Mixer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 2
      ParentFont = False
      object MixAdvanceToggle: TSpeedButton
        Left = 623
        Top = -1
        Width = 122
        Height = 22
        Hint = 'Toggle advanced controls display'
        ParentCustomHint = False
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Advanced Controls'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = MixAdvanceToggleClick
      end
      object Pt1MixPanel: TPanel
        Left = 1
        Top = 24
        Width = 81
        Height = 564
        Margins.Left = 2
        Margins.Right = 2
        BevelOuter = bvLowered
        Caption = 'Part 1'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        VerticalAlignment = taAlignTop
        object Pt1Reverb: TSpeedButton
          Left = 45
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Reverb Enable'
          AllowAllUp = True
          GroupIndex = 2
          Down = True
          Caption = 'Rev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtReverbClick
        end
        object Pt1Output_label: TLabel
          Left = 7
          Top = 187
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Output:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt1Pan_label: TLabel
          Left = 7
          Top = 140
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt1Chan_label: TLabel
          Left = 6
          Top = 54
          Width = 30
          Height = 13
          AutoSize = False
          Caption = 'Chan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt1Enable: TSpeedButton
          Left = 6
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Part Enable'
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtEnableClick
        end
        object Pt1Bend_label: TLabel
          Left = 7
          Top = 88
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Bend Range:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt1Pan: TKnobControl
          Left = 7
          Top = 152
          Width = 30
          Height = 30
          Min = -7
          Max = 7
          OnChange = PtPanChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt1Pan_value: TSpinEdit
          Left = 43
          Top = 160
          Width = 35
          Height = 22
          Hint = '-7 ~ +7'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 7
          MinValue = -7
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Value = 0
          OnChange = PtPan_valueChange
          OnKeyPress = PressedKey
        end
        object Pt1Chan: TSpinEdit
          Left = 39
          Top = 51
          Width = 42
          Height = 22
          Hint = 'MIDI channel this Part will respond on (1 ~ 16)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 16
          MinValue = 1
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Value = 1
          OnChange = PtChanChange
          OnKeyPress = PressedKey
        end
        object Pt1Output_value: TSpinEdit
          Left = 18
          Top = 537
          Width = 48
          Height = 22
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          MaxValue = 100
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Value = 0
          OnChange = PtOutput_valueChange
          OnKeyPress = PressedKey
        end
        object Pt1Bend_value: TSpinEdit
          Left = 43
          Top = 111
          Width = 35
          Height = 22
          Hint = '0 ~ 24'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 24
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Value = 0
          OnChange = PtBend_valueChange
          OnKeyPress = PressedKey
        end
        object Pt1Bend: TKnobControl
          Left = 7
          Top = 103
          Width = 30
          Height = 30
          Max = 24
          OnChange = PtBendChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt1AdvPanel: TPanel
          Left = 1
          Top = 78
          Width = 79
          Height = 2
          BevelOuter = bvNone
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 6
          VerticalAlignment = taAlignTop
          object Pt1Bank_label: TLabel
            Left = 3
            Top = 94
            Width = 78
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bank/Timbre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt1Key_label: TLabel
            Left = 5
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Shift:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt1Fine_label: TLabel
            Left = 41
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fine:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt1PtlReserve_label: TLabel
            Left = 5
            Top = 48
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Partial Rsv:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt1Poly_label: TLabel
            Left = 5
            Top = 3
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Poly Mode:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt1Bank: TComboBox
            Left = 1
            Top = 112
            Width = 79
            Height = 21
            Hint = 
              'Bank Selection'#13#10#13#10'Preset A: The first 64 default timbres'#13#10'Preset' +
              ' B: The last 64 default timbres'#13#10'Custom: 64 user timbres stored ' +
              'in Timbre Memory'#13#10'Rhythm: 30 default rhythm sounds* (cannot be e' +
              'dited)'#13#10#13#10'*If using the CM-32, this bank includes'#13#10'an additional' +
              ' 33 unique sound effects'#13#10'                '
            Style = csDropDownList
            DropDownCount = 4
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Text = 'Preset A'
            OnChange = PtBankChange
            Items.Strings = (
              'Preset A'
              'Preset B'
              'Custom'
              'Rhythm')
          end
          object Pt1Fine: TKnobControl
            Left = 44
            Top = 176
            Width = 30
            Height = 30
            Hint = 'Pitch Fine Tune'
            Min = -50
            Max = 50
            OnChange = PtFineChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt1Fine_value: TSpinEdit
            Left = 42
            Top = 212
            Width = 38
            Height = 22
            Hint = '-50 ~ +50'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 50
            MinValue = -50
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            Value = 0
            OnChange = PtFine_valueChange
            OnKeyPress = PressedKey
          end
          object Pt1Key: TKnobControl
            Left = 8
            Top = 176
            Width = 30
            Height = 30
            Hint = 
              'Key Shift = Transposes the Part up to'#13#10'two octaves higher or low' +
              'er'
            Min = -24
            Max = 24
            OnChange = PtKeyChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt1Key_value: TSpinEdit
            Left = 3
            Top = 212
            Width = 38
            Height = 22
            Hint = '-24 ~ +24'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 24
            MinValue = -24
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Value = 0
            OnChange = PtKey_valueChange
            OnKeyPress = PressedKey
          end
          object Pt1Timbre: TComboBox
            Left = 1
            Top = 134
            Width = 79
            Height = 21
            Hint = 
              'Timbre Selection (0 - 63)'#13#10#13#10'This list changes based on which of' +
              ' the'#13#10'four Banks are selected'
            Style = csDropDownList
            DropDownCount = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            OnChange = PtTimbreChange
            Items.Strings = (
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          ')
          end
          object Pt1Poly: TComboBox
            Left = 1
            Top = 21
            Width = 79
            Height = 21
            Hint = 
              '1: Single Assign, FIFO (priority given to last note)'#13#10'2: Single ' +
              'Assign, FILO (priority given to first note)'#13#10'3: Multiple Assign,' +
              ' FIFO (priority given to last note)'#13#10'4: Multiple Assign, FILO (p' +
              'riority given to first note)'#13#10#13#10'Single Assign = identical notes ' +
              'do NOT stack'#13#10'(conserves partials)'#13#10#13#10'Multiple Assign = identica' +
              'l notes DO stack'#13#10'(uses more partials)'
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
            Text = '(S)  FIFO'
            OnChange = PtPolyChange
            Items.Strings = (
              '(S)  FIFO'
              '(S)  FILO'
              '(M)  FIFO'
              '(M)  FILO')
          end
          object Pt1PtlReserve: TSpinEdit
            Left = 18
            Top = 64
            Width = 48
            Height = 22
            Hint = 
              'Reserves partials for this Part (0 ~ 32)'#13#10#13#10'NOTE: The total sum ' +
              'of each Part'#39's reserve'#13#10'partial settings cannot exceed 32.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            MaxValue = 32
            MinValue = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            Value = 0
            OnChange = PtPtlReserveChange
          end
        end
        object Pt1Output: TSynthSlider
          Left = 18
          Top = 202
          Width = 48
          Height = 335
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBoth
          Frequency = 5
          ThumbSize = 15
          ParentColor = False
          TabOrder = 7
          TabStop = True
          OnChange = PtOutputChange
        end
      end
      object Pt2MixPanel: TPanel
        Left = 84
        Top = 24
        Width = 81
        Height = 564
        Margins.Left = 2
        Margins.Right = 2
        BevelOuter = bvLowered
        Caption = 'Part 2'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
        VerticalAlignment = taAlignTop
        object Pt2Reverb: TSpeedButton
          Tag = 1
          Left = 45
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Reverb Enable'
          AllowAllUp = True
          GroupIndex = 2
          Down = True
          Caption = 'Rev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtReverbClick
        end
        object Pt2Output_label: TLabel
          Left = 7
          Top = 187
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Output:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt2Pan_label: TLabel
          Left = 7
          Top = 140
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt2Chan_label: TLabel
          Left = 6
          Top = 54
          Width = 30
          Height = 13
          AutoSize = False
          Caption = 'Chan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt2Enable: TSpeedButton
          Tag = 1
          Left = 6
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Part Enable'
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtEnableClick
        end
        object Pt2Bend_label: TLabel
          Left = 7
          Top = 88
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Bend Range:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt2Pan: TKnobControl
          Tag = 1
          Left = 7
          Top = 152
          Width = 30
          Height = 30
          Min = -7
          Max = 7
          OnChange = PtPanChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt2Pan_value: TSpinEdit
          Tag = 1
          Left = 43
          Top = 160
          Width = 35
          Height = 22
          Hint = '-7 ~ +7'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 7
          MinValue = -7
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Value = 0
          OnChange = PtPan_valueChange
          OnKeyPress = PressedKey
        end
        object Pt2Chan: TSpinEdit
          Tag = 1
          Left = 39
          Top = 51
          Width = 42
          Height = 22
          Hint = 'MIDI channel this Part will respond on (1 ~ 16)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 16
          MinValue = 1
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Value = 1
          OnChange = PtChanChange
          OnKeyPress = PressedKey
        end
        object Pt2Output_value: TSpinEdit
          Tag = 1
          Left = 18
          Top = 537
          Width = 48
          Height = 22
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          MaxValue = 100
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Value = 0
          OnChange = PtOutput_valueChange
          OnKeyPress = PressedKey
        end
        object Pt2Bend_value: TSpinEdit
          Tag = 1
          Left = 43
          Top = 111
          Width = 35
          Height = 22
          Hint = '0 ~ 24'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 24
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Value = 0
          OnChange = PtBend_valueChange
          OnKeyPress = PressedKey
        end
        object Pt2Bend: TKnobControl
          Tag = 1
          Left = 7
          Top = 103
          Width = 30
          Height = 30
          Max = 24
          OnChange = PtBendChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt2AdvPanel: TPanel
          Left = 1
          Top = 78
          Width = 79
          Height = 2
          BevelOuter = bvNone
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 6
          VerticalAlignment = taAlignTop
          object Pt2Bank_label: TLabel
            Left = 3
            Top = 94
            Width = 78
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bank/Timbre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt2Key_label: TLabel
            Left = 5
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Shift:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt2Fine_label: TLabel
            Left = 41
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fine:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt2PtlReserve_label: TLabel
            Left = 5
            Top = 48
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Partial Rsv:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt2Poly_label: TLabel
            Left = 5
            Top = 3
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Poly Mode:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt2Bank: TComboBox
            Tag = 1
            Left = 1
            Top = 112
            Width = 79
            Height = 21
            Hint = 
              'Bank Selection'#13#10#13#10'Preset A: The first 64 default timbres'#13#10'Preset' +
              ' B: The last 64 default timbres'#13#10'Custom: 64 user timbres stored ' +
              'in Timbre Memory'#13#10'Rhythm: 30 default rhythm sounds* (cannot be e' +
              'dited)'#13#10#13#10'*If using the CM-32, this bank includes'#13#10'an additional' +
              ' 33 unique sound effects'#13#10'                '
            Style = csDropDownList
            DropDownCount = 4
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Text = 'Preset A'
            OnChange = PtBankChange
            Items.Strings = (
              'Preset A'
              'Preset B'
              'Custom'
              'Rhythm')
          end
          object Pt2Fine: TKnobControl
            Tag = 1
            Left = 44
            Top = 176
            Width = 30
            Height = 30
            Min = -50
            Max = 50
            OnChange = PtFineChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt2Fine_value: TSpinEdit
            Tag = 1
            Left = 42
            Top = 212
            Width = 38
            Height = 22
            Hint = '-50 ~ +50'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 50
            MinValue = -50
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            Value = 0
            OnChange = PtFine_valueChange
            OnKeyPress = PressedKey
          end
          object Pt2Key: TKnobControl
            Tag = 1
            Left = 8
            Top = 176
            Width = 30
            Height = 30
            Min = -24
            Max = 24
            OnChange = PtKeyChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt2Key_value: TSpinEdit
            Tag = 1
            Left = 3
            Top = 212
            Width = 38
            Height = 22
            Hint = '-24 ~ +24'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 24
            MinValue = -24
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Value = 0
            OnChange = PtKey_valueChange
            OnKeyPress = PressedKey
          end
          object Pt2Timbre: TComboBox
            Tag = 1
            Left = 1
            Top = 134
            Width = 79
            Height = 21
            Hint = 
              'Timbre Selection (0 - 63)'#13#10#13#10'This list changes based on which of' +
              ' the'#13#10'four Banks are selected'
            Style = csDropDownList
            DropDownCount = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            OnChange = PtTimbreChange
            Items.Strings = (
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          ')
          end
          object Pt2Poly: TComboBox
            Tag = 1
            Left = 1
            Top = 21
            Width = 79
            Height = 21
            Hint = 
              '1: Single Assign, FIFO (priority given to last note)'#13#10'2: Single ' +
              'Assign, FILO (priority given to first note)'#13#10'3: Multiple Assign,' +
              ' FIFO (priority given to last note)'#13#10'4: Multiple Assign, FILO (p' +
              'riority given to first note)'#13#10#13#10'Single Assign = identical notes ' +
              'do NOT stack'#13#10'(conserves partials)'#13#10#13#10'Multiple Assign = identica' +
              'l notes DO stack'#13#10'(uses more partials)'
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
            Text = '(S)  FIFO'
            OnChange = PtPolyChange
            Items.Strings = (
              '(S)  FIFO'
              '(S)  FILO'
              '(M)  FIFO'
              '(M)  FILO')
          end
          object Pt2PtlReserve: TSpinEdit
            Tag = 1
            Left = 18
            Top = 64
            Width = 48
            Height = 22
            Hint = 
              'Reserves partials for this Part (0 ~ 32)'#13#10#13#10'NOTE: The total sum ' +
              'of each Part'#39's reserve'#13#10'partial settings cannot exceed 32.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            MaxValue = 32
            MinValue = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            Value = 0
            OnChange = PtPtlReserveChange
          end
        end
        object Pt2Output: TSynthSlider
          Tag = 1
          Left = 18
          Top = 202
          Width = 48
          Height = 335
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBoth
          Frequency = 5
          ThumbSize = 15
          ParentColor = False
          TabOrder = 7
          TabStop = True
          OnChange = PtOutputChange
        end
      end
      object Pt3MixPanel: TPanel
        Left = 167
        Top = 24
        Width = 81
        Height = 564
        Margins.Left = 2
        Margins.Right = 2
        BevelOuter = bvLowered
        Caption = 'Part 3'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 2
        VerticalAlignment = taAlignTop
        object Pt3Reverb: TSpeedButton
          Tag = 2
          Left = 45
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Reverb Enable'
          AllowAllUp = True
          GroupIndex = 2
          Down = True
          Caption = 'Rev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtReverbClick
        end
        object Pt3Output_label: TLabel
          Left = 7
          Top = 187
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Output:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt3Pan_label: TLabel
          Left = 7
          Top = 140
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt3Chan_label: TLabel
          Left = 6
          Top = 54
          Width = 30
          Height = 13
          AutoSize = False
          Caption = 'Chan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt3Enable: TSpeedButton
          Tag = 2
          Left = 6
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Part Enable'
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtEnableClick
        end
        object Pt3Bend_label: TLabel
          Left = 7
          Top = 88
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Bend Range:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt3Pan: TKnobControl
          Tag = 2
          Left = 7
          Top = 152
          Width = 30
          Height = 30
          Min = -7
          Max = 7
          OnChange = PtPanChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt3Pan_value: TSpinEdit
          Tag = 2
          Left = 43
          Top = 160
          Width = 35
          Height = 22
          Hint = '-7 ~ +7'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 7
          MinValue = -7
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Value = 0
          OnChange = PtPan_valueChange
          OnKeyPress = PressedKey
        end
        object Pt3Chan: TSpinEdit
          Tag = 2
          Left = 39
          Top = 51
          Width = 42
          Height = 22
          Hint = 'MIDI channel this Part will respond on (1 ~ 16)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 16
          MinValue = 1
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Value = 1
          OnChange = PtChanChange
          OnKeyPress = PressedKey
        end
        object Pt3Output_value: TSpinEdit
          Tag = 2
          Left = 18
          Top = 537
          Width = 48
          Height = 22
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          MaxValue = 100
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Value = 0
          OnChange = PtOutput_valueChange
          OnKeyPress = PressedKey
        end
        object Pt3Bend_value: TSpinEdit
          Tag = 2
          Left = 43
          Top = 111
          Width = 35
          Height = 22
          Hint = '0 ~ 24'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 24
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Value = 0
          OnChange = PtBend_valueChange
          OnKeyPress = PressedKey
        end
        object Pt3Bend: TKnobControl
          Tag = 2
          Left = 7
          Top = 103
          Width = 30
          Height = 30
          Max = 24
          OnChange = PtBendChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt3AdvPanel: TPanel
          Left = 1
          Top = 78
          Width = 79
          Height = 2
          BevelOuter = bvNone
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 6
          VerticalAlignment = taAlignTop
          object Pt3Bank_label: TLabel
            Left = 3
            Top = 94
            Width = 78
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bank/Timbre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt3Key_label: TLabel
            Left = 5
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Shift:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt3Fine_label: TLabel
            Left = 41
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fine:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt3PtlReserve_label: TLabel
            Left = 5
            Top = 48
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Partial Rsv:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt3Poly_label: TLabel
            Left = 5
            Top = 3
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Poly Mode:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt3Bank: TComboBox
            Tag = 2
            Left = 1
            Top = 112
            Width = 79
            Height = 21
            Hint = 
              'Bank Selection'#13#10#13#10'Preset A: The first 64 default timbres'#13#10'Preset' +
              ' B: The last 64 default timbres'#13#10'Custom: 64 user timbres stored ' +
              'in Timbre Memory'#13#10'Rhythm: 30 default rhythm sounds* (cannot be e' +
              'dited)'#13#10#13#10'*If using the CM-32, this bank includes'#13#10'an additional' +
              ' 33 unique sound effects'#13#10'                '
            Style = csDropDownList
            DropDownCount = 4
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Text = 'Preset A'
            OnChange = PtBankChange
            Items.Strings = (
              'Preset A'
              'Preset B'
              'Custom'
              'Rhythm')
          end
          object Pt3Fine: TKnobControl
            Tag = 2
            Left = 44
            Top = 176
            Width = 30
            Height = 30
            Min = -50
            Max = 50
            OnChange = PtFineChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt3Fine_value: TSpinEdit
            Tag = 2
            Left = 42
            Top = 212
            Width = 38
            Height = 22
            Hint = '-50 ~ +50'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 50
            MinValue = -50
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            Value = 0
            OnChange = PtFine_valueChange
            OnKeyPress = PressedKey
          end
          object Pt3Key: TKnobControl
            Tag = 2
            Left = 8
            Top = 176
            Width = 30
            Height = 30
            Min = -24
            Max = 24
            OnChange = PtKeyChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt3Key_value: TSpinEdit
            Tag = 2
            Left = 3
            Top = 212
            Width = 38
            Height = 22
            Hint = '-24 ~ +24'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 24
            MinValue = -24
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Value = 0
            OnChange = PtKey_valueChange
            OnKeyPress = PressedKey
          end
          object Pt3Timbre: TComboBox
            Tag = 2
            Left = 1
            Top = 134
            Width = 79
            Height = 21
            Hint = 
              'Timbre Selection (0 - 63)'#13#10#13#10'This list changes based on which of' +
              ' the'#13#10'four Banks are selected'
            Style = csDropDownList
            DropDownCount = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            OnChange = PtTimbreChange
            Items.Strings = (
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          ')
          end
          object Pt3Poly: TComboBox
            Tag = 2
            Left = 1
            Top = 21
            Width = 79
            Height = 21
            Hint = 
              '1: Single Assign, FIFO (priority given to last note)'#13#10'2: Single ' +
              'Assign, FILO (priority given to first note)'#13#10'3: Multiple Assign,' +
              ' FIFO (priority given to last note)'#13#10'4: Multiple Assign, FILO (p' +
              'riority given to first note)'#13#10#13#10'Single Assign = identical notes ' +
              'do NOT stack'#13#10'(conserves partials)'#13#10#13#10'Multiple Assign = identica' +
              'l notes DO stack'#13#10'(uses more partials)'
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
            Text = '(S)  FIFO'
            OnChange = PtPolyChange
            Items.Strings = (
              '(S)  FIFO'
              '(S)  FILO'
              '(M)  FIFO'
              '(M)  FILO')
          end
          object Pt3PtlReserve: TSpinEdit
            Tag = 2
            Left = 18
            Top = 64
            Width = 48
            Height = 22
            Hint = 
              'Reserves partials for this Part (0 ~ 32)'#13#10#13#10'NOTE: The total sum ' +
              'of each Part'#39's reserve'#13#10'partial settings cannot exceed 32.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            MaxValue = 32
            MinValue = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            Value = 0
            OnChange = PtPtlReserveChange
          end
        end
        object Pt3Output: TSynthSlider
          Tag = 2
          Left = 18
          Top = 202
          Width = 48
          Height = 335
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBoth
          Frequency = 5
          ThumbSize = 15
          ParentColor = False
          TabOrder = 7
          TabStop = True
          OnChange = PtOutputChange
        end
      end
      object Pt4MixPanel: TPanel
        Left = 250
        Top = 24
        Width = 81
        Height = 564
        Margins.Left = 2
        Margins.Right = 2
        BevelOuter = bvLowered
        Caption = 'Part 4'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 3
        VerticalAlignment = taAlignTop
        object Pt4Reverb: TSpeedButton
          Tag = 3
          Left = 45
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Reverb Enable'
          AllowAllUp = True
          GroupIndex = 2
          Down = True
          Caption = 'Rev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtReverbClick
        end
        object Pt4Output_label: TLabel
          Left = 7
          Top = 187
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Output:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt4Pan_label: TLabel
          Left = 7
          Top = 140
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt4Chan_label: TLabel
          Left = 6
          Top = 54
          Width = 30
          Height = 13
          AutoSize = False
          Caption = 'Chan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt4Enable: TSpeedButton
          Tag = 3
          Left = 6
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Part Enable'
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtEnableClick
        end
        object Pt4Bend_label: TLabel
          Left = 7
          Top = 88
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Bend Range:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt4Pan: TKnobControl
          Tag = 3
          Left = 7
          Top = 152
          Width = 30
          Height = 30
          Min = -7
          Max = 7
          OnChange = PtPanChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt4Pan_value: TSpinEdit
          Tag = 3
          Left = 43
          Top = 160
          Width = 35
          Height = 22
          Hint = '-7 ~ +7'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 7
          MinValue = -7
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Value = 0
          OnChange = PtPan_valueChange
          OnKeyPress = PressedKey
        end
        object Pt4Chan: TSpinEdit
          Tag = 3
          Left = 39
          Top = 51
          Width = 42
          Height = 22
          Hint = 'MIDI channel this Part will respond on (1 ~ 16)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 16
          MinValue = 1
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Value = 1
          OnChange = PtChanChange
          OnKeyPress = PressedKey
        end
        object Pt4Output_value: TSpinEdit
          Tag = 3
          Left = 18
          Top = 537
          Width = 48
          Height = 22
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          MaxValue = 100
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Value = 0
          OnChange = PtOutput_valueChange
          OnKeyPress = PressedKey
        end
        object Pt4Bend_value: TSpinEdit
          Tag = 3
          Left = 43
          Top = 111
          Width = 35
          Height = 22
          Hint = '0 ~ 24'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 24
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Value = 0
          OnChange = PtBend_valueChange
          OnKeyPress = PressedKey
        end
        object Pt4Bend: TKnobControl
          Tag = 3
          Left = 7
          Top = 103
          Width = 30
          Height = 30
          Max = 24
          OnChange = PtBendChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt4AdvPanel: TPanel
          Left = 1
          Top = 78
          Width = 79
          Height = 2
          BevelOuter = bvNone
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 6
          VerticalAlignment = taAlignTop
          object Pt4Bank_label: TLabel
            Left = 3
            Top = 94
            Width = 78
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bank/Timbre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt4Key_label: TLabel
            Left = 5
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Shift:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt4Fine_label: TLabel
            Left = 41
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fine:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt4PtlReserve_label: TLabel
            Left = 5
            Top = 48
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Partial Rsv:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt4Poly_label: TLabel
            Left = 5
            Top = 3
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Poly Mode:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt4Bank: TComboBox
            Tag = 3
            Left = 1
            Top = 112
            Width = 79
            Height = 21
            Hint = 
              'Bank Selection'#13#10#13#10'Preset A: The first 64 default timbres'#13#10'Preset' +
              ' B: The last 64 default timbres'#13#10'Custom: 64 user timbres stored ' +
              'in Timbre Memory'#13#10'Rhythm: 30 default rhythm sounds* (cannot be e' +
              'dited)'#13#10#13#10'*If using the CM-32, this bank includes'#13#10'an additional' +
              ' 33 unique sound effects'#13#10'                '
            Style = csDropDownList
            DropDownCount = 4
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Text = 'Preset A'
            OnChange = PtBankChange
            Items.Strings = (
              'Preset A'
              'Preset B'
              'Custom'
              'Rhythm')
          end
          object Pt4Fine: TKnobControl
            Tag = 3
            Left = 44
            Top = 176
            Width = 30
            Height = 30
            Min = -50
            Max = 50
            OnChange = PtFineChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt4Fine_value: TSpinEdit
            Tag = 3
            Left = 42
            Top = 212
            Width = 38
            Height = 22
            Hint = '-50 ~ +50'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 50
            MinValue = -50
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            Value = 0
            OnChange = PtFine_valueChange
            OnKeyPress = PressedKey
          end
          object Pt4Key: TKnobControl
            Tag = 3
            Left = 8
            Top = 176
            Width = 30
            Height = 30
            Min = -24
            Max = 24
            OnChange = PtKeyChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt4Key_value: TSpinEdit
            Tag = 3
            Left = 3
            Top = 212
            Width = 38
            Height = 22
            Hint = '-24 ~ +24'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 24
            MinValue = -24
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Value = 0
            OnChange = PtKey_valueChange
            OnKeyPress = PressedKey
          end
          object Pt4Timbre: TComboBox
            Tag = 3
            Left = 1
            Top = 134
            Width = 79
            Height = 21
            Hint = 
              'Timbre Selection (0 - 63)'#13#10#13#10'This list changes based on which of' +
              ' the'#13#10'four Banks are selected'
            Style = csDropDownList
            DropDownCount = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            OnChange = PtTimbreChange
            Items.Strings = (
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          ')
          end
          object Pt4Poly: TComboBox
            Tag = 3
            Left = 1
            Top = 21
            Width = 79
            Height = 21
            Hint = 
              '1: Single Assign, FIFO (priority given to last note)'#13#10'2: Single ' +
              'Assign, FILO (priority given to first note)'#13#10'3: Multiple Assign,' +
              ' FIFO (priority given to last note)'#13#10'4: Multiple Assign, FILO (p' +
              'riority given to first note)'#13#10#13#10'Single Assign = identical notes ' +
              'do NOT stack'#13#10'(conserves partials)'#13#10#13#10'Multiple Assign = identica' +
              'l notes DO stack'#13#10'(uses more partials)'
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
            Text = '(S)  FIFO'
            OnChange = PtPolyChange
            Items.Strings = (
              '(S)  FIFO'
              '(S)  FILO'
              '(M)  FIFO'
              '(M)  FILO')
          end
          object Pt4PtlReserve: TSpinEdit
            Tag = 3
            Left = 18
            Top = 64
            Width = 48
            Height = 22
            Hint = 
              'Reserves partials for this Part (0 ~ 32)'#13#10#13#10'NOTE: The total sum ' +
              'of each Part'#39's reserve'#13#10'partial settings cannot exceed 32.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            MaxValue = 32
            MinValue = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            Value = 0
            OnChange = PtPtlReserveChange
          end
        end
        object Pt4Output: TSynthSlider
          Tag = 3
          Left = 18
          Top = 202
          Width = 48
          Height = 335
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBoth
          Frequency = 5
          ThumbSize = 15
          ParentColor = False
          TabOrder = 7
          TabStop = True
          OnChange = PtOutputChange
        end
      end
      object Pt5MixPanel: TPanel
        Left = 333
        Top = 24
        Width = 81
        Height = 564
        Margins.Left = 2
        Margins.Right = 2
        BevelOuter = bvLowered
        Caption = 'Part 5'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 4
        VerticalAlignment = taAlignTop
        object Pt5Reverb: TSpeedButton
          Tag = 4
          Left = 45
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Reverb Enable'
          AllowAllUp = True
          GroupIndex = 2
          Down = True
          Caption = 'Rev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtReverbClick
        end
        object Pt5Output_label: TLabel
          Left = 7
          Top = 187
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Output:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt5Pan_label: TLabel
          Left = 7
          Top = 140
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt5Chan_label: TLabel
          Left = 6
          Top = 54
          Width = 30
          Height = 13
          AutoSize = False
          Caption = 'Chan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt5Enable: TSpeedButton
          Tag = 4
          Left = 6
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Part Enable'
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtEnableClick
        end
        object Pt5Bend_label: TLabel
          Left = 7
          Top = 88
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Bend Range:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt5Pan: TKnobControl
          Tag = 4
          Left = 7
          Top = 152
          Width = 30
          Height = 30
          Min = -7
          Max = 7
          OnChange = PtPanChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt5Pan_value: TSpinEdit
          Tag = 4
          Left = 43
          Top = 160
          Width = 35
          Height = 22
          Hint = '-7 ~ +7'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 7
          MinValue = -7
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Value = 0
          OnChange = PtPan_valueChange
          OnKeyPress = PressedKey
        end
        object Pt5Chan: TSpinEdit
          Tag = 4
          Left = 39
          Top = 51
          Width = 42
          Height = 22
          Hint = 'MIDI channel this Part will respond on (1 ~ 16)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 16
          MinValue = 1
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Value = 1
          OnChange = PtChanChange
          OnKeyPress = PressedKey
        end
        object Pt5Output_value: TSpinEdit
          Tag = 4
          Left = 18
          Top = 537
          Width = 48
          Height = 22
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          MaxValue = 100
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Value = 0
          OnChange = PtOutput_valueChange
          OnKeyPress = PressedKey
        end
        object Pt5Bend_value: TSpinEdit
          Tag = 4
          Left = 43
          Top = 111
          Width = 35
          Height = 22
          Hint = '0 ~ 24'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 24
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Value = 0
          OnChange = PtBend_valueChange
          OnKeyPress = PressedKey
        end
        object Pt5Bend: TKnobControl
          Tag = 4
          Left = 7
          Top = 103
          Width = 30
          Height = 30
          Max = 24
          OnChange = PtBendChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt5AdvPanel: TPanel
          Left = 1
          Top = 78
          Width = 79
          Height = 2
          BevelOuter = bvNone
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 6
          VerticalAlignment = taAlignTop
          object Pt5Bank_label: TLabel
            Left = 3
            Top = 94
            Width = 78
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bank/Timbre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt5Key_label: TLabel
            Left = 5
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Shift:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt5Fine_label: TLabel
            Left = 41
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fine:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt5PtlReserve_label: TLabel
            Left = 5
            Top = 48
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Partial Rsv:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt5Poly_label: TLabel
            Left = 5
            Top = 3
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Poly Mode:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt5Bank: TComboBox
            Tag = 4
            Left = 1
            Top = 112
            Width = 79
            Height = 21
            Hint = 
              'Bank Selection'#13#10#13#10'Preset A: The first 64 default timbres'#13#10'Preset' +
              ' B: The last 64 default timbres'#13#10'Custom: 64 user timbres stored ' +
              'in Timbre Memory'#13#10'Rhythm: 30 default rhythm sounds* (cannot be e' +
              'dited)'#13#10#13#10'*If using the CM-32, this bank includes'#13#10'an additional' +
              ' 33 unique sound effects'#13#10'                '
            Style = csDropDownList
            DropDownCount = 4
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Text = 'Preset A'
            OnChange = PtBankChange
            Items.Strings = (
              'Preset A'
              'Preset B'
              'Custom'
              'Rhythm')
          end
          object Pt5Fine: TKnobControl
            Tag = 4
            Left = 44
            Top = 176
            Width = 30
            Height = 30
            Min = -50
            Max = 50
            OnChange = PtFineChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt5Fine_value: TSpinEdit
            Tag = 4
            Left = 42
            Top = 212
            Width = 38
            Height = 22
            Hint = '-50 ~ +50'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 50
            MinValue = -50
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            Value = 0
            OnChange = PtFine_valueChange
            OnKeyPress = PressedKey
          end
          object Pt5Key: TKnobControl
            Tag = 4
            Left = 8
            Top = 176
            Width = 30
            Height = 30
            Min = -24
            Max = 24
            OnChange = PtKeyChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt5Key_value: TSpinEdit
            Tag = 4
            Left = 3
            Top = 212
            Width = 38
            Height = 22
            Hint = '-24 ~ +24'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 24
            MinValue = -24
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Value = 0
            OnChange = PtKey_valueChange
            OnKeyPress = PressedKey
          end
          object Pt5Timbre: TComboBox
            Tag = 4
            Left = 1
            Top = 134
            Width = 79
            Height = 21
            Hint = 
              'Timbre Selection (0 - 63)'#13#10#13#10'This list changes based on which of' +
              ' the'#13#10'four Banks are selected'
            Style = csDropDownList
            DropDownCount = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            OnChange = PtTimbreChange
            Items.Strings = (
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          ')
          end
          object Pt5Poly: TComboBox
            Tag = 4
            Left = 1
            Top = 21
            Width = 79
            Height = 21
            Hint = 
              '1: Single Assign, FIFO (priority given to last note)'#13#10'2: Single ' +
              'Assign, FILO (priority given to first note)'#13#10'3: Multiple Assign,' +
              ' FIFO (priority given to last note)'#13#10'4: Multiple Assign, FILO (p' +
              'riority given to first note)'#13#10#13#10'Single Assign = identical notes ' +
              'do NOT stack'#13#10'(conserves partials)'#13#10#13#10'Multiple Assign = identica' +
              'l notes DO stack'#13#10'(uses more partials)'
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
            Text = '(S)  FIFO'
            OnChange = PtPolyChange
            Items.Strings = (
              '(S)  FIFO'
              '(S)  FILO'
              '(M)  FIFO'
              '(M)  FILO')
          end
          object Pt5PtlReserve: TSpinEdit
            Tag = 4
            Left = 18
            Top = 64
            Width = 48
            Height = 22
            Hint = 
              'Reserves partials for this Part (0 ~ 32)'#13#10#13#10'NOTE: The total sum ' +
              'of each Part'#39's reserve'#13#10'partial settings cannot exceed 32.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            MaxValue = 32
            MinValue = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            Value = 0
            OnChange = PtPtlReserveChange
          end
        end
        object Pt5Output: TSynthSlider
          Tag = 4
          Left = 18
          Top = 202
          Width = 48
          Height = 335
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBoth
          Frequency = 5
          ThumbSize = 15
          ParentColor = False
          TabOrder = 7
          TabStop = True
          OnChange = PtOutputChange
        end
      end
      object Pt6MixPanel: TPanel
        Left = 416
        Top = 24
        Width = 81
        Height = 564
        Margins.Left = 2
        Margins.Right = 2
        BevelOuter = bvLowered
        Caption = 'Part 6'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 5
        VerticalAlignment = taAlignTop
        object Pt6Reverb: TSpeedButton
          Tag = 5
          Left = 45
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Reverb Enable'
          AllowAllUp = True
          GroupIndex = 2
          Down = True
          Caption = 'Rev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtReverbClick
        end
        object Pt6Output_label: TLabel
          Left = 7
          Top = 187
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Output:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt6Pan_label: TLabel
          Left = 7
          Top = 140
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt6Chan_label: TLabel
          Left = 6
          Top = 54
          Width = 30
          Height = 13
          AutoSize = False
          Caption = 'Chan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt6Enable: TSpeedButton
          Tag = 5
          Left = 6
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Part Enable'
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtEnableClick
        end
        object Pt6Bend_label: TLabel
          Left = 7
          Top = 88
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Bend Range:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt6Pan: TKnobControl
          Tag = 5
          Left = 7
          Top = 152
          Width = 30
          Height = 30
          Min = -7
          Max = 7
          OnChange = PtPanChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt6Pan_value: TSpinEdit
          Tag = 5
          Left = 43
          Top = 160
          Width = 35
          Height = 22
          Hint = '-7 ~ +7'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 7
          MinValue = -7
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Value = 0
          OnChange = PtPan_valueChange
          OnKeyPress = PressedKey
        end
        object Pt6Chan: TSpinEdit
          Tag = 5
          Left = 39
          Top = 51
          Width = 42
          Height = 22
          Hint = 'MIDI channel this Part will respond on (1 ~ 16)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 16
          MinValue = 1
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Value = 1
          OnChange = PtChanChange
          OnKeyPress = PressedKey
        end
        object Pt6Output_value: TSpinEdit
          Tag = 5
          Left = 18
          Top = 537
          Width = 48
          Height = 22
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          MaxValue = 100
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Value = 0
          OnChange = PtOutput_valueChange
          OnKeyPress = PressedKey
        end
        object Pt6Bend_value: TSpinEdit
          Tag = 5
          Left = 43
          Top = 111
          Width = 35
          Height = 22
          Hint = '0 ~ 24'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 24
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Value = 0
          OnChange = PtBend_valueChange
          OnKeyPress = PressedKey
        end
        object Pt6Bend: TKnobControl
          Tag = 5
          Left = 7
          Top = 103
          Width = 30
          Height = 30
          Max = 24
          OnChange = PtBendChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt6AdvPanel: TPanel
          Left = 1
          Top = 78
          Width = 79
          Height = 2
          BevelOuter = bvNone
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 6
          VerticalAlignment = taAlignTop
          object Pt6Bank_label: TLabel
            Left = 3
            Top = 94
            Width = 78
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bank/Timbre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt6Key_label: TLabel
            Left = 5
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Shift:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt6Fine_label: TLabel
            Left = 41
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fine:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt6PtlReserve_label: TLabel
            Left = 5
            Top = 48
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Partial Rsv:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt6Poly_label: TLabel
            Left = 5
            Top = 3
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Poly Mode:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt6Bank: TComboBox
            Tag = 5
            Left = 1
            Top = 112
            Width = 79
            Height = 21
            Hint = 
              'Bank Selection'#13#10#13#10'Preset A: The first 64 default timbres'#13#10'Preset' +
              ' B: The last 64 default timbres'#13#10'Custom: 64 user timbres stored ' +
              'in Timbre Memory'#13#10'Rhythm: 30 default rhythm sounds* (cannot be e' +
              'dited)'#13#10#13#10'*If using the CM-32, this bank includes'#13#10'an additional' +
              ' 33 unique sound effects'#13#10'                '
            Style = csDropDownList
            DropDownCount = 4
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Text = 'Preset A'
            OnChange = PtBankChange
            Items.Strings = (
              'Preset A'
              'Preset B'
              'Custom'
              'Rhythm')
          end
          object Pt6Fine: TKnobControl
            Tag = 5
            Left = 44
            Top = 176
            Width = 30
            Height = 30
            Min = -50
            Max = 50
            OnChange = PtFineChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt6Fine_value: TSpinEdit
            Tag = 5
            Left = 42
            Top = 212
            Width = 38
            Height = 22
            Hint = '-50 ~ +50'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 50
            MinValue = -50
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            Value = 0
            OnChange = PtFine_valueChange
            OnKeyPress = PressedKey
          end
          object Pt6Key: TKnobControl
            Tag = 5
            Left = 8
            Top = 176
            Width = 30
            Height = 30
            Min = -24
            Max = 24
            OnChange = PtKeyChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt6Key_value: TSpinEdit
            Tag = 5
            Left = 3
            Top = 212
            Width = 38
            Height = 22
            Hint = '-24 ~ +24'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 24
            MinValue = -24
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Value = 0
            OnChange = PtKey_valueChange
            OnKeyPress = PressedKey
          end
          object Pt6Timbre: TComboBox
            Tag = 5
            Left = 1
            Top = 134
            Width = 79
            Height = 21
            Hint = 
              'Timbre Selection (0 - 63)'#13#10#13#10'This list changes based on which of' +
              ' the'#13#10'four Banks are selected'
            Style = csDropDownList
            DropDownCount = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            OnChange = PtTimbreChange
            Items.Strings = (
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          ')
          end
          object Pt6Poly: TComboBox
            Tag = 5
            Left = 1
            Top = 21
            Width = 79
            Height = 21
            Hint = 
              '1: Single Assign, FIFO (priority given to last note)'#13#10'2: Single ' +
              'Assign, FILO (priority given to first note)'#13#10'3: Multiple Assign,' +
              ' FIFO (priority given to last note)'#13#10'4: Multiple Assign, FILO (p' +
              'riority given to first note)'#13#10#13#10'Single Assign = identical notes ' +
              'do NOT stack'#13#10'(conserves partials)'#13#10#13#10'Multiple Assign = identica' +
              'l notes DO stack'#13#10'(uses more partials)'
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
            Text = '(S)  FIFO'
            OnChange = PtPolyChange
            Items.Strings = (
              '(S)  FIFO'
              '(S)  FILO'
              '(M)  FIFO'
              '(M)  FILO')
          end
          object Pt6PtlReserve: TSpinEdit
            Tag = 5
            Left = 18
            Top = 64
            Width = 48
            Height = 22
            Hint = 
              'Reserves partials for this Part (0 ~ 32)'#13#10#13#10'NOTE: The total sum ' +
              'of each Part'#39's reserve'#13#10'partial settings cannot exceed 32.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            MaxValue = 32
            MinValue = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            Value = 0
            OnChange = PtPtlReserveChange
          end
        end
        object Pt6Output: TSynthSlider
          Tag = 5
          Left = 18
          Top = 202
          Width = 48
          Height = 335
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBoth
          Frequency = 5
          ThumbSize = 15
          ParentColor = False
          TabOrder = 7
          TabStop = True
          OnChange = PtOutputChange
        end
      end
      object Pt7MixPanel: TPanel
        Left = 499
        Top = 24
        Width = 81
        Height = 564
        Margins.Left = 2
        Margins.Right = 2
        BevelOuter = bvLowered
        Caption = 'Part 7'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 6
        VerticalAlignment = taAlignTop
        object Pt7Reverb: TSpeedButton
          Tag = 6
          Left = 45
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Reverb Enable'
          AllowAllUp = True
          GroupIndex = 2
          Down = True
          Caption = 'Rev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtReverbClick
        end
        object Pt7Output_label: TLabel
          Left = 7
          Top = 187
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Output:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt7Pan_label: TLabel
          Left = 7
          Top = 140
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt7Chan_label: TLabel
          Left = 6
          Top = 54
          Width = 30
          Height = 13
          AutoSize = False
          Caption = 'Chan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt7Enable: TSpeedButton
          Tag = 6
          Left = 6
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Part Enable'
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtEnableClick
        end
        object Pt7Bend_label: TLabel
          Left = 7
          Top = 88
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Bend Range:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt7Pan: TKnobControl
          Tag = 6
          Left = 7
          Top = 152
          Width = 30
          Height = 30
          Min = -7
          Max = 7
          OnChange = PtPanChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt7Pan_value: TSpinEdit
          Tag = 6
          Left = 43
          Top = 160
          Width = 35
          Height = 22
          Hint = '-7 ~ +7'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 7
          MinValue = -7
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Value = 0
          OnChange = PtPan_valueChange
          OnKeyPress = PressedKey
        end
        object Pt7Chan: TSpinEdit
          Tag = 6
          Left = 39
          Top = 51
          Width = 42
          Height = 22
          Hint = 'MIDI channel this Part will respond on (1 ~ 16)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 16
          MinValue = 1
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Value = 1
          OnChange = PtChanChange
          OnKeyPress = PressedKey
        end
        object Pt7Output_value: TSpinEdit
          Tag = 6
          Left = 18
          Top = 537
          Width = 48
          Height = 22
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          MaxValue = 100
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Value = 0
          OnChange = PtOutput_valueChange
          OnKeyPress = PressedKey
        end
        object Pt7Bend_value: TSpinEdit
          Tag = 6
          Left = 43
          Top = 111
          Width = 35
          Height = 22
          Hint = '0 ~ 24'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 24
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Value = 0
          OnChange = PtBend_valueChange
          OnKeyPress = PressedKey
        end
        object Pt7Bend: TKnobControl
          Tag = 6
          Left = 7
          Top = 103
          Width = 30
          Height = 30
          Max = 24
          OnChange = PtBendChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt7AdvPanel: TPanel
          Left = 1
          Top = 78
          Width = 79
          Height = 2
          BevelOuter = bvNone
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 6
          VerticalAlignment = taAlignTop
          object Pt7Bank_label: TLabel
            Left = 3
            Top = 94
            Width = 78
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bank/Timbre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt7Key_label: TLabel
            Left = 5
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Shift:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt7Fine_label: TLabel
            Left = 41
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fine:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt7PtlReserve_label: TLabel
            Left = 5
            Top = 48
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Partial Rsv:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt7Poly_label: TLabel
            Left = 5
            Top = 3
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Poly Mode:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt7Bank: TComboBox
            Tag = 6
            Left = 1
            Top = 112
            Width = 79
            Height = 21
            Hint = 
              'Bank Selection'#13#10#13#10'Preset A: The first 64 default timbres'#13#10'Preset' +
              ' B: The last 64 default timbres'#13#10'Custom: 64 user timbres stored ' +
              'in Timbre Memory'#13#10'Rhythm: 30 default rhythm sounds* (cannot be e' +
              'dited)'#13#10#13#10'*If using the CM-32, this bank includes'#13#10'an additional' +
              ' 33 unique sound effects'#13#10'                '
            Style = csDropDownList
            DropDownCount = 4
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Text = 'Preset A'
            OnChange = PtBankChange
            Items.Strings = (
              'Preset A'
              'Preset B'
              'Custom'
              'Rhythm')
          end
          object Pt7Fine: TKnobControl
            Tag = 6
            Left = 44
            Top = 176
            Width = 30
            Height = 30
            Min = -50
            Max = 50
            OnChange = PtFineChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt7Fine_value: TSpinEdit
            Tag = 6
            Left = 42
            Top = 212
            Width = 38
            Height = 22
            Hint = '-50 ~ +50'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 50
            MinValue = -50
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            Value = 0
            OnChange = PtFine_valueChange
            OnKeyPress = PressedKey
          end
          object Pt7Key: TKnobControl
            Tag = 6
            Left = 8
            Top = 176
            Width = 30
            Height = 30
            Min = -24
            Max = 24
            OnChange = PtKeyChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt7Key_value: TSpinEdit
            Tag = 6
            Left = 3
            Top = 212
            Width = 38
            Height = 22
            Hint = '-24 ~ +24'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 24
            MinValue = -24
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Value = 0
            OnChange = PtKey_valueChange
            OnKeyPress = PressedKey
          end
          object Pt7Timbre: TComboBox
            Tag = 6
            Left = 1
            Top = 134
            Width = 79
            Height = 21
            Hint = 
              'Timbre Selection (0 - 63)'#13#10#13#10'This list changes based on which of' +
              ' the'#13#10'four Banks are selected'
            Style = csDropDownList
            DropDownCount = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            OnChange = PtTimbreChange
            Items.Strings = (
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          ')
          end
          object Pt7Poly: TComboBox
            Tag = 6
            Left = 1
            Top = 21
            Width = 79
            Height = 21
            Hint = 
              '1: Single Assign, FIFO (priority given to last note)'#13#10'2: Single ' +
              'Assign, FILO (priority given to first note)'#13#10'3: Multiple Assign,' +
              ' FIFO (priority given to last note)'#13#10'4: Multiple Assign, FILO (p' +
              'riority given to first note)'#13#10#13#10'Single Assign = identical notes ' +
              'do NOT stack'#13#10'(conserves partials)'#13#10#13#10'Multiple Assign = identica' +
              'l notes DO stack'#13#10'(uses more partials)'
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
            Text = '(S)  FIFO'
            OnChange = PtPolyChange
            Items.Strings = (
              '(S)  FIFO'
              '(S)  FILO'
              '(M)  FIFO'
              '(M)  FILO')
          end
          object Pt7PtlReserve: TSpinEdit
            Tag = 6
            Left = 18
            Top = 64
            Width = 48
            Height = 22
            Hint = 
              'Reserves partials for this Part (0 ~ 32)'#13#10#13#10'NOTE: The total sum ' +
              'of each Part'#39's reserve'#13#10'partial settings cannot exceed 32.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            MaxValue = 32
            MinValue = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            Value = 0
            OnChange = PtPtlReserveChange
          end
        end
        object Pt7Output: TSynthSlider
          Tag = 6
          Left = 18
          Top = 202
          Width = 48
          Height = 335
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBoth
          Frequency = 5
          ThumbSize = 15
          ParentColor = False
          TabOrder = 7
          TabStop = True
          OnChange = PtOutputChange
        end
      end
      object Pt8MixPanel: TPanel
        Left = 582
        Top = 24
        Width = 81
        Height = 564
        Margins.Left = 2
        Margins.Right = 2
        BevelOuter = bvLowered
        Caption = 'Part 8'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 7
        VerticalAlignment = taAlignTop
        object Pt8Reverb: TSpeedButton
          Tag = 7
          Left = 45
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Reverb Enable'
          AllowAllUp = True
          GroupIndex = 2
          Down = True
          Caption = 'Rev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtReverbClick
        end
        object Pt8Output_label: TLabel
          Left = 7
          Top = 187
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Output:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt8Pan_label: TLabel
          Left = 7
          Top = 140
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt8Chan_label: TLabel
          Left = 6
          Top = 54
          Width = 30
          Height = 13
          AutoSize = False
          Caption = 'Chan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt8Enable: TSpeedButton
          Tag = 7
          Left = 6
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Part Enable'
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtEnableClick
        end
        object Pt8Bend_label: TLabel
          Left = 7
          Top = 88
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Bend Range:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Pt8Pan: TKnobControl
          Tag = 7
          Left = 7
          Top = 152
          Width = 30
          Height = 30
          Min = -7
          Max = 7
          OnChange = PtPanChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt8Pan_value: TSpinEdit
          Tag = 7
          Left = 43
          Top = 160
          Width = 35
          Height = 22
          Hint = '-7 ~ +7'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 7
          MinValue = -7
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Value = 0
          OnChange = PtPan_valueChange
          OnKeyPress = PressedKey
        end
        object Pt8Chan: TSpinEdit
          Tag = 7
          Left = 39
          Top = 51
          Width = 42
          Height = 22
          Hint = 'MIDI channel this Part will respond on (1 ~ 16)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 16
          MinValue = 1
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Value = 1
          OnChange = PtChanChange
          OnKeyPress = PressedKey
        end
        object Pt8Output_value: TSpinEdit
          Tag = 7
          Left = 18
          Top = 537
          Width = 48
          Height = 22
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          MaxValue = 100
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          Value = 0
          OnChange = PtOutput_valueChange
          OnKeyPress = PressedKey
        end
        object Pt8Bend_value: TSpinEdit
          Tag = 7
          Left = 43
          Top = 111
          Width = 35
          Height = 22
          Hint = '0 ~ 24'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 24
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 4
          Value = 0
          OnChange = PtBend_valueChange
          OnKeyPress = PressedKey
        end
        object Pt8Bend: TKnobControl
          Tag = 7
          Left = 7
          Top = 103
          Width = 30
          Height = 30
          Max = 24
          OnChange = PtBendChange
          StartAngle = 135
          EndAngle = 405
        end
        object Pt8AdvPanel: TPanel
          Left = 1
          Top = 78
          Width = 79
          Height = 2
          BevelOuter = bvNone
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 6
          VerticalAlignment = taAlignTop
          object Pt8Bank_label: TLabel
            Left = 3
            Top = 94
            Width = 78
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bank/Timbre:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt8Key_label: TLabel
            Left = 5
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Shift:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt8Fine_label: TLabel
            Left = 41
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fine:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Pt8PtlReserve_label: TLabel
            Left = 5
            Top = 48
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Partial Rsv:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt8Poly_label: TLabel
            Left = 5
            Top = 3
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Poly Mode:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Pt8Bank: TComboBox
            Tag = 7
            Left = 1
            Top = 112
            Width = 79
            Height = 21
            Hint = 
              'Bank Selection'#13#10#13#10'Preset A: The first 64 default timbres'#13#10'Preset' +
              ' B: The last 64 default timbres'#13#10'Custom: 64 user timbres stored ' +
              'in Timbre Memory'#13#10'Rhythm: 30 default rhythm sounds* (cannot be e' +
              'dited)'#13#10#13#10'*If using the CM-32, this bank includes'#13#10'an additional' +
              ' 33 unique sound effects'#13#10'                '
            Style = csDropDownList
            DropDownCount = 4
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Text = 'Preset A'
            OnChange = PtBankChange
            Items.Strings = (
              'Preset A'
              'Preset B'
              'Custom'
              'Rhythm')
          end
          object Pt8Fine: TKnobControl
            Tag = 7
            Left = 44
            Top = 176
            Width = 30
            Height = 30
            Min = -50
            Max = 50
            OnChange = PtFineChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt8Fine_value: TSpinEdit
            Tag = 7
            Left = 42
            Top = 212
            Width = 38
            Height = 22
            Hint = '-50 ~ +50'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 50
            MinValue = -50
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            Value = 0
            OnChange = PtFine_valueChange
            OnKeyPress = PressedKey
          end
          object Pt8Key: TKnobControl
            Tag = 7
            Left = 8
            Top = 176
            Width = 30
            Height = 30
            Min = -24
            Max = 24
            OnChange = PtKeyChange
            StartAngle = 135
            EndAngle = 405
          end
          object Pt8Key_value: TSpinEdit
            Tag = 7
            Left = 3
            Top = 212
            Width = 38
            Height = 22
            Hint = '-24 ~ +24'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 24
            MinValue = -24
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Value = 0
            OnChange = PtKey_valueChange
            OnKeyPress = PressedKey
          end
          object Pt8Timbre: TComboBox
            Tag = 7
            Left = 1
            Top = 134
            Width = 79
            Height = 21
            Hint = 
              'Timbre Selection (0 - 63)'#13#10#13#10'This list changes based on which of' +
              ' the'#13#10'four Banks are selected'
            Style = csDropDownList
            DropDownCount = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            OnChange = PtTimbreChange
            Items.Strings = (
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          '
              '          ')
          end
          object Pt8Poly: TComboBox
            Tag = 7
            Left = 1
            Top = 21
            Width = 79
            Height = 21
            Hint = 
              '1: Single Assign, FIFO (priority given to last note)'#13#10'2: Single ' +
              'Assign, FILO (priority given to first note)'#13#10'3: Multiple Assign,' +
              ' FIFO (priority given to last note)'#13#10'4: Multiple Assign, FILO (p' +
              'riority given to first note)'#13#10#13#10'Single Assign = identical notes ' +
              'do NOT stack'#13#10'(conserves partials)'#13#10#13#10'Multiple Assign = identica' +
              'l notes DO stack'#13#10'(uses more partials)'
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
            Text = '(S)  FIFO'
            OnChange = PtPolyChange
            Items.Strings = (
              '(S)  FIFO'
              '(S)  FILO'
              '(M)  FIFO'
              '(M)  FILO')
          end
          object Pt8PtlReserve: TSpinEdit
            Tag = 7
            Left = 18
            Top = 64
            Width = 48
            Height = 22
            Hint = 
              'Reserves partials for this Part (0 ~ 32)'#13#10#13#10'NOTE: The total sum ' +
              'of each Part'#39's reserve'#13#10'partial settings cannot exceed 32.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            MaxValue = 32
            MinValue = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            Value = 0
            OnChange = PtPtlReserveChange
          end
        end
        object Pt8Output: TSynthSlider
          Tag = 7
          Left = 18
          Top = 202
          Width = 48
          Height = 335
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBoth
          Frequency = 5
          ThumbSize = 15
          ParentColor = False
          TabOrder = 7
          TabStop = True
          OnChange = PtOutputChange
        end
      end
      object PtRMixPanel: TPanel
        Left = 665
        Top = 24
        Width = 81
        Height = 564
        Margins.Left = 2
        Margins.Right = 2
        BevelOuter = bvLowered
        Caption = 'Part 9 (R)'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 8
        VerticalAlignment = taAlignTop
        object PtROutput_label: TLabel
          Left = 7
          Top = 187
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Output:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object PtRChan_label: TLabel
          Left = 6
          Top = 54
          Width = 30
          Height = 13
          AutoSize = False
          Caption = 'Chan:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object PtREnable: TSpeedButton
          Tag = 8
          Left = 6
          Top = 23
          Width = 34
          Height = 22
          Hint = 'Part Enable'
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = PtEnableClick
        end
        object PtRBend_label: TLabel
          Left = 7
          Top = 88
          Width = 71
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Bend Range:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object PtRChan: TSpinEdit
          Tag = 8
          Left = 39
          Top = 51
          Width = 42
          Height = 22
          Hint = 'MIDI channel this Part will respond on (1 ~ 16)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 16
          MinValue = 1
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          Value = 1
          OnChange = PtChanChange
          OnKeyPress = PressedKey
        end
        object PtROutput_value: TSpinEdit
          Tag = 8
          Left = 18
          Top = 537
          Width = 48
          Height = 22
          Hint = '0 ~ 100'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 3
          MaxValue = 100
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          Value = 0
          OnChange = PtOutput_valueChange
          OnKeyPress = PressedKey
        end
        object PtRBend_value: TSpinEdit
          Tag = 8
          Left = 43
          Top = 111
          Width = 35
          Height = 22
          Hint = '0 ~ 24'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 24
          MinValue = 0
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Value = 0
          OnChange = PtBend_valueChange
          OnKeyPress = PressedKey
        end
        object PtRBend: TKnobControl
          Tag = 8
          Left = 7
          Top = 103
          Width = 30
          Height = 30
          Max = 24
          OnChange = PtBendChange
          StartAngle = 135
          EndAngle = 405
        end
        object PtRAdvPanel: TPanel
          Left = 1
          Top = 78
          Width = 79
          Height = 2
          BevelOuter = bvNone
          DoubleBuffered = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 4
          VerticalAlignment = taAlignTop
          object PtRKey_label: TLabel
            Left = 5
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Shift:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object PtRFine_label: TLabel
            Left = 41
            Top = 162
            Width = 35
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Fine:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object PtRPtlReserve_label: TLabel
            Left = 5
            Top = 48
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Partial Rsv:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object PtRPoly_label: TLabel
            Left = 5
            Top = 3
            Width = 71
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Poly Mode:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object PtRFine: TKnobControl
            Tag = 8
            Left = 44
            Top = 176
            Width = 30
            Height = 30
            Min = -50
            Max = 50
            OnChange = PtFineChange
            StartAngle = 135
            EndAngle = 405
          end
          object PtRFine_value: TSpinEdit
            Tag = 8
            Left = 42
            Top = 212
            Width = 38
            Height = 22
            Hint = '-50 ~ +50'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 50
            MinValue = -50
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            Value = 0
            OnChange = PtFine_valueChange
            OnKeyPress = PressedKey
          end
          object PtRKey: TKnobControl
            Tag = 8
            Left = 8
            Top = 176
            Width = 30
            Height = 30
            Min = -24
            Max = 24
            OnChange = PtKeyChange
            StartAngle = 135
            EndAngle = 405
          end
          object PtRKey_value: TSpinEdit
            Tag = 8
            Left = 3
            Top = 212
            Width = 38
            Height = 22
            Hint = '-24 ~ +24'
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 3
            MaxValue = 24
            MinValue = -24
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 3
            Value = 0
            OnChange = PtKey_valueChange
            OnKeyPress = PressedKey
          end
          object PtRPoly: TComboBox
            Tag = 8
            Left = 1
            Top = 21
            Width = 79
            Height = 21
            Hint = 
              '1: Single Assign, FIFO (priority given to last note)'#13#10'2: Single ' +
              'Assign, FILO (priority given to first note)'#13#10'3: Multiple Assign,' +
              ' FIFO (priority given to last note)'#13#10'4: Multiple Assign, FILO (p' +
              'riority given to first note)'#13#10#13#10'Single Assign = identical notes ' +
              'do NOT stack'#13#10'(conserves partials)'#13#10#13#10'Multiple Assign = identica' +
              'l notes DO stack'#13#10'(uses more partials)'
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 4
            Text = '(S)  FIFO'
            OnChange = PtPolyChange
            Items.Strings = (
              '(S)  FIFO'
              '(S)  FILO'
              '(M)  FIFO'
              '(M)  FILO')
          end
          object PtRPtlReserve: TSpinEdit
            Tag = 8
            Left = 18
            Top = 64
            Width = 48
            Height = 22
            Hint = 
              'Reserves partials for this Part (0 ~ 32)'#13#10#13#10'NOTE: The total sum ' +
              'of each Part'#39's reserve'#13#10'partial settings cannot exceed 32.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            MaxValue = 32
            MinValue = 0
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            Value = 0
            OnChange = PtPtlReserveChange
          end
        end
        object PtROutput: TSynthSlider
          Tag = 8
          Left = 18
          Top = 202
          Width = 48
          Height = 335
          TrackColor = 14737632
          FillColor = 16751121
          ThumbColor = 14120960
          TickColor = clSilver
          TickMarks = stmBoth
          Frequency = 5
          ThumbSize = 15
          ParentColor = False
          TabOrder = 5
          TabStop = True
          OnChange = PtOutputChange
        end
      end
    end
    object SystemArea: TTabSheet
      Caption = 'System'
      ImageIndex = 4
      object SystemBevel: TBevel
        Left = 3
        Top = 24
        Width = 366
        Height = 417
      end
      object MasterTune_label: TLabel
        Left = 12
        Top = 48
        Width = 72
        Height = 16
        Caption = 'Master Tune'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object MasterTuneHz: TLabel
        Left = 157
        Top = 45
        Width = 56
        Height = 16
        Alignment = taCenter
        Caption = '442.0 Hz'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ReverbRoomButton: TSpeedButton
        Left = 69
        Top = 155
        Width = 57
        Height = 49
        Hint = 
          'Reverb mode setting or the whole synth (every Part with reverb e' +
          'nabled will be affected)'
        GroupIndex = 1
        Down = True
        Caption = 'Room'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = ReverbModeButtonClick
      end
      object ReverbHallButton: TSpeedButton
        Tag = 1
        Left = 132
        Top = 155
        Width = 57
        Height = 49
        Hint = 
          'Reverb mode setting or the whole synth (every Part with reverb e' +
          'nabled will be affected)'
        GroupIndex = 1
        Caption = 'Hall'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = ReverbModeButtonClick
      end
      object ReverbPlateButton: TSpeedButton
        Tag = 2
        Left = 195
        Top = 155
        Width = 57
        Height = 49
        Hint = 
          'Reverb mode setting or the whole synth (every Part with reverb e' +
          'nabled will be affected)'
        GroupIndex = 1
        Caption = 'Plate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = ReverbModeButtonClick
      end
      object ReverbTapDelayButton: TSpeedButton
        Tag = 3
        Left = 258
        Top = 155
        Width = 57
        Height = 49
        Hint = 
          'Reverb mode setting or the whole synth (every Part with reverb e' +
          'nabled will be affected)'
        GroupIndex = 1
        Caption = 'Tap'#13#10'Delay'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = ReverbModeButtonClick
      end
      object ReverbMode_label: TLabel
        Left = 19
        Top = 171
        Width = 31
        Height = 16
        Caption = 'Mode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ReverbTime_label: TLabel
        Left = 19
        Top = 234
        Width = 29
        Height = 16
        Caption = 'Time'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ReverbLevel_label: TLabel
        Left = 19
        Top = 340
        Width = 29
        Height = 16
        Caption = 'Level'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EnableDebug: TSpeedButton
        Left = 610
        Top = 91
        Width = 101
        Height = 28
        Hint = 'Enable hidden debug option controls for testing'
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Debug Options'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = EnableDebugClick
      end
      object ReverbControls_label: TLabel
        Left = 3
        Top = 122
        Width = 366
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Reverb'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12014080
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditorOptions_label: TLabel
        Left = 520
        Top = 24
        Width = 116
        Height = 19
        Caption = 'Editor Options'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MasterTune: TSynthSlider
        Left = 12
        Top = 67
        Width = 286
        Height = 33
        Max = 127
        Orientation = stoHorizontal
        CenterMark = True
        CenterValue = 74
        TrackColor = 14737632
        FillColor = 14737632
        ThumbColor = 14120960
        TickColor = clSilver
        TickMarks = stmBottomRight
        Frequency = 2
        ParentColor = False
        TabOrder = 0
        TabStop = True
        OnChange = MasterTuneChange
      end
      object MasterTune_value: TSpinEdit
        Left = 304
        Top = 67
        Width = 50
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 3
        MaxValue = 127
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 0
        OnChange = MasterTune_valueChange
        OnKeyPress = PressedKey
      end
      object ReverbTime: TSynthSlider
        Left = 19
        Top = 256
        Width = 283
        Height = 40
        Max = 7
        Orientation = stoHorizontal
        TrackColor = 14737632
        FillColor = 16751121
        ThumbColor = 14120960
        TickColor = clSilver
        TickMarks = stmTopLeft
        ThumbSize = 15
        ParentColor = False
        TabOrder = 2
        TabStop = True
        OnChange = ReverbTimeChange
      end
      object ReverbLevel: TSynthSlider
        Left = 19
        Top = 370
        Width = 283
        Height = 40
        Max = 7
        Orientation = stoHorizontal
        TrackColor = 14737632
        FillColor = 16751121
        ThumbColor = 14120960
        TickColor = clSilver
        TickMarks = stmBoth
        ThumbSize = 15
        ParentColor = False
        TabOrder = 3
        TabStop = True
        OnChange = ReverbLevelChange
      end
      object ReverbLevel_value: TSpinEdit
        Left = 308
        Top = 376
        Width = 46
        Height = 26
        Hint = 
          'Reverb level setting or the whole synth (every Part with reverb ' +
          'enabled will be affected)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 1
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 4
        Value = 0
        OnChange = ReverbLevel_valueChange
        OnKeyPress = PressedKey
      end
      object ReverbTime_value: TSpinEdit
        Left = 308
        Top = 263
        Width = 46
        Height = 26
        Hint = 
          'Reverb time setting for the whole synth (every Part with reverb ' +
          'enabled will be affected)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 1
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 5
        Value = 0
        OnChange = ReverbTime_valueChange
        OnKeyPress = PressedKey
      end
      object AboutButton: TButton
        Left = 610
        Top = 57
        Width = 101
        Height = 28
        Caption = 'About'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = AboutButtonClick
      end
      object CMSamples: TCheckBox
        Left = 451
        Top = 63
        Width = 144
        Height = 17
        Hint = 
          'Check this if you'#39're using CM-32L ROMs with MuntVSTi.'#13#10#13#10'The CM-' +
          '32L PCM sample ROM contains 33 extra sounds'#13#10'in the Rhythm Bank ' +
          '(accessible via the Patch Mixer) as well'#13#10'as 127 extra samples i' +
          'n the sample bank (accessible to each'#13#10'partial via the Timbre Ed' +
          'itor).'
        Caption = 'CM-32L Sample Mode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = CMSamplesClick
      end
    end
    object Debug: TTabSheet
      Caption = 'Debug'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabVisible = False
      object ReadMemAddr_label: TLabel
        Left = 88
        Top = 84
        Width = 39
        Height = 13
        Caption = 'Address'
      end
      object ReadMemSize_label: TLabel
        Left = 149
        Top = 84
        Width = 19
        Height = 13
        Caption = 'Size'
      end
      object ReturnedBytes_label: TLabel
        Left = 205
        Top = 102
        Width = 79
        Height = 13
        Caption = 'Returned Bytes:'
      end
      object BytesToSend_label: TLabel
        Left = 491
        Top = 102
        Width = 71
        Height = 13
        Caption = 'Bytes to Send:'
      end
      object TestNoteCh_label: TLabel
        Left = 100
        Top = 28
        Width = 39
        Height = 13
        Caption = 'Channel'
      end
      object TestNote_label: TLabel
        Left = 151
        Top = 28
        Width = 23
        Height = 13
        Caption = 'Note'
      end
      object TestNoteVel_label: TLabel
        Left = 212
        Top = 28
        Width = 37
        Height = 13
        Caption = 'Velocity'
      end
      object LastSysEx_label: TLabel
        Left = 293
        Top = 9
        Width = 81
        Height = 13
        Caption = 'Last SysEx Sent:'
      end
      object TestNoteButton: TButton
        Left = 4
        Top = 4
        Width = 92
        Height = 25
        Caption = 'Send Test Note'
        TabOrder = 0
        OnClick = TestNoteButtonClick
      end
      object ReadMemory: TButton
        Left = 3
        Top = 97
        Width = 79
        Height = 25
        Caption = 'Read Memory'
        TabOrder = 1
        OnClick = ReadMemoryClick
      end
      object SendSysExStr: TButton
        Left = 380
        Top = 97
        Width = 99
        Height = 25
        Caption = 'Send SysEx String'
        TabOrder = 2
        OnClick = SendSysExStrClick
      end
      object ReadMemAddr: TEdit
        Left = 88
        Top = 99
        Width = 55
        Height = 21
        TabOrder = 3
        Text = '10000'
      end
      object ReadMemSize: TEdit
        Left = 149
        Top = 99
        Width = 43
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = 'F6'
      end
      object ReturnedBytes: TMemo
        Left = 3
        Top = 128
        Width = 360
        Height = 401
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 5
      end
      object BytesToSend: TMemo
        Left = 380
        Top = 128
        Width = 360
        Height = 401
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object TestNote: TComboBox
        Left = 151
        Top = 6
        Width = 55
        Height = 21
        ItemIndex = 60
        TabOrder = 7
        Text = 'C3'
        Items.Strings = (
          'C-2'
          'C#-2'
          'D-2'
          'D#-2'
          'E-2'
          'F-2'
          'F#-2'
          'G-2'
          'G#-2'
          'A-1'
          'A#-1'
          'B-1'
          'C-1'
          'C#-1'
          'D-1'
          'D#-1'
          'E-1'
          'F-1'
          'F#-1'
          'G-1'
          'G#-1'
          'A0'
          'A#0'
          'B0'
          'C0'
          'C#0'
          'D0'
          'D#0'
          'E0'
          'F0'
          'F#0'
          'G0'
          'G#0'
          'A1'
          'A#1'
          'B1'
          'C1'
          'C#1'
          'D1'
          'D#1'
          'E1'
          'F1'
          'F#1'
          'G1'
          'G#1'
          'A2'
          'A#2'
          'B2'
          'C2'
          'C#2'
          'D2'
          'D#2'
          'E2'
          'F2'
          'F#2'
          'G2'
          'G#2'
          'A3'
          'A#3'
          'B3'
          'C3'
          'C#3'
          'D3'
          'D#3'
          'E3'
          'F3'
          'F#3'
          'G3'
          'G#3'
          'A4'
          'A#4'
          'B4'
          'C4'
          'C#4'
          'D4'
          'D#4'
          'E4'
          'F4'
          'F#4'
          'G4'
          'G#4'
          'A5'
          'A#5'
          'B5'
          'C5'
          'C#5'
          'D5'
          'D#5'
          'E5'
          'F5'
          'F#5'
          'G5'
          'G#5'
          'A6'
          'A#6'
          'B6'
          'C6'
          'C#6'
          'D6'
          'D#6'
          'E6'
          'F6'
          'F#6'
          'G6'
          'G#6'
          'A7'
          'A#7'
          'B7'
          'C7'
          'C#7'
          'D7'
          'D#7'
          'E7'
          'F7'
          'F#7'
          'G7'
          'G#7'
          'A8'
          'A#8'
          'B8'
          'C8'
          'C#8'
          'D8'
          'D#8'
          'E8'
          'F8'
          'F#8')
      end
      object TestNoteVel: TSpinEdit
        Left = 210
        Top = 6
        Width = 49
        Height = 22
        MaxValue = 127
        MinValue = 0
        TabOrder = 8
        Value = 127
      end
      object TestNoteChan: TSpinEdit
        Left = 99
        Top = 6
        Width = 47
        Height = 22
        MaxValue = 16
        MinValue = 1
        TabOrder = 9
        Value = 2
      end
      object LastSysEx: TMemo
        Left = 380
        Top = 3
        Width = 360
        Height = 88
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 10
      end
    end
  end
  object SyncAllButton: TBitBtn
    Left = 756
    Top = 197
    Width = 52
    Height = 24
    Caption = 'Sync'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    WordWrap = True
    OnClick = SyncAllButtonClick
  end
  object MasterVolume_value: TSpinEdit
    Left = 758
    Top = 588
    Width = 48
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 3
    MaxValue = 100
    MinValue = 0
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    Value = 0
    OnChange = MasterVolume_valueChange
    OnKeyPress = PressedKey
  end
  object MasterVolume: TSynthSlider
    Left = 756
    Top = 259
    Width = 49
    Height = 329
    TrackColor = 14737632
    FillColor = 16751121
    ThumbColor = 14120960
    TickColor = clSilver
    TickMarks = stmBoth
    Frequency = 5
    ThumbSize = 17
    ParentColor = False
    TabOrder = 3
    TabStop = True
    OnChange = MasterVolumeChange
  end
  object OpenSyxButton: TButton
    Left = 756
    Top = 134
    Width = 52
    Height = 24
    Hint = 'Import a SYX file'
    Caption = 'Import'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    WordWrap = True
    OnClick = OpenSyxButtonClick
  end
  object SaveSyxButton: TButton
    Left = 756
    Top = 157
    Width = 52
    Height = 24
    Hint = 'Export a SYX file'
    Caption = 'Export'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
    WordWrap = True
    OnClick = SaveSyxButtonClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 24
  end
end
