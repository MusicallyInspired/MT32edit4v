unit SynthSlider;
{$EXCESSPRECISION OFF}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IMPORTEDDATA OFF}
{$O+}

interface

uses
  System.Classes, System.Types, System.Math,
  Winapi.Windows, Winapi.Messages,
  Vcl.Controls, Vcl.Graphics;

type
  TSynthTickMarks = (
    stmNone,
    stmBottomRight,
    stmTopLeft,
    stmBoth
  );
  TSynthSliderOrientation = (stoHorizontal, stoVertical);

  [ComponentPlatforms(pidWin32 or pidWin64)]
  TSynthSlider = class(TCustomControl)
  private
    FMin: Integer;
    FMax: Integer;
    FPosition: Integer;
    FOrientation: TSynthSliderOrientation;
    FDragging: Boolean;
    FHoverThumb: Boolean;

    FTrackColor: TColor;
    FFillColor: TColor;
    FThumbColor: TColor;
    FTickColor: TColor;
    FTickMarks: TSynthTickMarks;
    FFrequency: Integer;
    FThumbSize: Integer;
    FThumbBorder: Boolean;
    FCenterMark: Boolean;
    FCenterValue: Integer;

    FOnChange: TNotifyEvent;

    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;

    procedure SetCenterMark(Value: Boolean);
    procedure SetCenterValue(Value: Integer);

    procedure SetPosition(Value: Integer);
    procedure SetMin(Value: Integer);
    procedure SetMax(Value: Integer);
    procedure SetOrientation(Value: TSynthSliderOrientation);
    procedure SetTrackColor(Value: TColor);
    procedure SetFillColor(Value: TColor);
    procedure SetThumbColor(Value: TColor);
    procedure SetTickColor(Value: TColor);
    procedure SetTickMarks(Value: TSynthTickMarks);
    procedure SetThumbSize(Value: Integer);
    procedure SetThumbBorder(Value: Boolean);
    procedure SetFrequency(Value: Integer);

    function PosToPixel: Integer;
    function PixelToPos(X, Y: Integer): Integer;
    function PointInThumb(X, Y: Integer): Boolean;

    procedure DoChange;

  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure WMMouseWheel(var Msg: TWMMouseWheel); message WM_MOUSEWHEEL;

  public
    constructor Create(AOwner: TComponent); override;

  published
    property Min: Integer read FMin write SetMin default 0;
    property Max: Integer read FMax write SetMax default 100;
    property Position: Integer read FPosition write SetPosition default 0;
    property Orientation: TSynthSliderOrientation read FOrientation write SetOrientation default stoVertical;

    property CenterMark: Boolean read FCenterMark write SetCenterMark default False;
    property CenterValue: Integer read FCenterValue write SetCenterValue default 0;
    property TrackColor: TColor read FTrackColor write SetTrackColor;
    property FillColor: TColor read FFillColor write SetFillColor;
    property ThumbColor: TColor read FThumbColor write SetThumbColor;
    property TickColor: TColor read FTickColor write SetTickColor;

    property TickMarks: TSynthTickMarks read FTickMarks write SetTickMarks default stmNone;
    property Frequency: Integer read FFrequency write SetFrequency default 1;
    property ThumbSize: Integer read FThumbSize write SetThumbSize default 12;
    property ThumbBorder: Boolean read FThumbBorder write SetThumbBorder default False;

    property Color default clBtnFace;
    property ParentColor default True;

    property Align;
    property Anchors;
    property Enabled;
    property TabOrder;
    property TabStop;
    property Visible;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('MT32edit4v', [TSynthSlider]);
end;

constructor TSynthSlider.Create(AOwner: TComponent);
begin
  inherited;

  Width := 23;
  Height := 105;

  FMin := 0;
  FMax := 100;
  FPosition := 0;
  FOrientation := stoVertical;
  FCenterMark := False;
  FCenterValue := 0;

  FTrackColor := $00E0E0E0;
  FFillColor := $00FF9A11;
  FThumbColor := $00D77800;
  FTickColor := clSilver;
  FTickMarks := stmNone;
  FFrequency := 1;
  FThumbSize := 12;
  FThumbBorder := False;

  Enabled := True;
  ParentColor := True;
  Color := clBtnFace;
  TabStop := True;
end;

procedure TSynthSlider.SetCenterMark(Value: Boolean);
begin
  if FCenterMark <> Value then
  begin
    FCenterMark := Value;
    Invalidate;
  end;
end;

procedure TSynthSlider.SetCenterValue(Value: Integer);
begin
  if Value < FMin then Value := FMin;
  if Value > FMax then Value := FMax;

  if FCenterValue <> Value then
  begin
    FCenterValue := Value;
    Invalidate;
  end;
end;

procedure TSynthSlider.SetMin(Value: Integer);
begin
  FMin := Value;
  if FMax < FMin then
    FMax := FMin;
  SetPosition(FPosition);
  Invalidate;
end;

procedure TSynthSlider.SetMax(Value: Integer);
begin
  FMax := Value;
  if FMin > FMax then
    FMin := FMax;
  SetPosition(FPosition);
  Invalidate;
end;

procedure TSynthSlider.SetOrientation(Value: TSynthSliderOrientation);
var
  Temp: Integer;
begin
  if FOrientation <> Value then
  begin
    FOrientation := Value;

    if not (csLoading in ComponentState) then
    begin
      Temp := Width;
      Width := Height;
      Height := Temp;
    end;

    Invalidate;
  end;
end;

procedure TSynthSlider.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TSynthSlider.SetPosition(Value: Integer);
begin
  Value := EnsureRange(Value, FMin, FMax);

  if FPosition <> Value then
  begin
    FPosition := Value;
    Invalidate;
    DoChange;
  end;
end;

procedure TSynthSlider.SetTrackColor(Value: TColor);
begin
  if FTrackColor <> Value then
  begin
    FTrackColor := Value;
    Invalidate;
  end;
end;

procedure TSynthSlider.SetFillColor(Value: TColor);
begin
  if FFillColor <> Value then
  begin
    FFillColor := Value;
    Invalidate;
  end;
end;

procedure TSynthSlider.SetThumbColor(Value: TColor);
begin
  if FThumbColor <> Value then
  begin
    FThumbColor := Value;
    Invalidate;
  end;
end;

procedure TSynthSlider.SetTickColor(Value: TColor);
begin
  if FTickColor <> Value then
  begin
    FTickColor := Value;
    Invalidate;
  end;
end;

procedure TSynthSlider.SetThumbSize(Value: Integer);
begin
  Value := EnsureRange(Value, 4, 100);

  if FThumbSize <> Value then
  begin
    FThumbSize := Value;
    Invalidate;
  end;
end;

procedure TSynthSlider.SetThumbBorder(Value: Boolean);
begin
  if FThumbBorder <> Value then
  begin
    FThumbBorder := Value;
    Invalidate;
  end;
end;

procedure TSynthSlider.SetFrequency(Value: Integer);
begin
  Value := System.Math.Max(1, Value);

  if FFrequency <> Value then
  begin
    FFrequency := Value;
    Invalidate;
  end;
end;

procedure TSynthSlider.SetTickMarks(Value: TSynthTickMarks);
begin
  if FTickMarks <> Value then
  begin
    FTickMarks := Value;
    Invalidate;
  end;
end;

procedure TSynthSlider.DoChange;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

function TSynthSlider.PosToPixel: Integer;
var
  R: Double;
begin
  if FMax = FMin then
    Exit(0);

  R := (FPosition - FMin) / (FMax - FMin);

  if FOrientation = stoHorizontal then
    Result := Round(10 + R * (Width - 20))
  else
    Result := Round((Height - 10) - R * (Height - 20));
end;

function TSynthSlider.PixelToPos(X, Y: Integer): Integer;
var
  R: Double;
begin
  if FOrientation = stoHorizontal then
  begin
    R := (X - 10) / System.Math.Max(1, Width - 20);
  end
  else
  begin
    R := ((Height - 10) - Y) / System.Math.Max(1, Height - 20);
  end;

  R := EnsureRange(R, 0.0, 1.0);
  Result := FMin + Round(R * (FMax - FMin));
end;

function TSynthSlider.PointInThumb(X, Y: Integer): Boolean;
var
  P: Integer;
  ThumbHalf: Integer;
  R: TRect;
begin
  P := PosToPixel;
  ThumbHalf := FThumbSize div 2;

  if FOrientation = stoHorizontal then
    R := Rect(
      P - ThumbHalf,
      Height div 2 - FThumbSize,
      P + ThumbHalf,
      Height div 2 + FThumbSize
    )
  else
    R := Rect(
      Width div 2 - FThumbSize,
      P - ThumbHalf,
      Width div 2 + FThumbSize,
      P + ThumbHalf
    );

  Result := PtInRect(R, Point(X, Y));
end;

procedure TSynthSlider.Paint;
var
  P: Integer;
  TrackRect, FillRect, ThumbRect: TRect;
  I, TickPos: Integer;
  TrackHalf: Integer;
  ThumbHalf: Integer;
  ThumbLength: Integer;
  ThumbTravelSize: Integer;
  TickLen: Integer;
  TickInner: Integer;
  TickOuter: Integer;
  RangeStart, RangeEnd: Integer;
  TrackStart, TrackEnd: Integer;
  CenterPos: Integer;

  function ValueToPixel(AValue: Integer): Integer;
  var
    Ratio: Double;
  begin
    if FMax <= FMin then
      Exit(RangeStart);

    Ratio := (AValue - FMin) / (FMax - FMin);

    if FOrientation = stoHorizontal then
      Result := RangeStart + Round(Ratio * (RangeEnd - RangeStart))
    else
      Result := RangeEnd - Round(Ratio * (RangeEnd - RangeStart));
  end;

  procedure DrawCenterMark;
  var
    MarkPos: Integer;
    Pts: array[0..2] of TPoint;
    MarkSize: Integer;
    MarkDepth: Integer;
    C: Integer;
  begin
    if not FCenterMark then
      Exit;

    if FMax <= FMin then
      Exit;

    MarkSize := System.Math.Max(2, (TickOuter - TickInner) div 2);
    MarkDepth := MarkSize;

    Canvas.Brush.Color := clBlack;
    Canvas.Pen.Color := clBlack;

    if FOrientation = stoHorizontal then
    begin
      MarkPos := CenterPos;

      C := Height div 2;

      if FTickMarks in [stmTopLeft, stmBoth] then
      begin
        Pts[0] := Point(MarkPos - MarkSize, C - TickInner - MarkDepth - 2);
        Pts[1] := Point(MarkPos + MarkSize, C - TickInner - MarkDepth - 2);
        Pts[2] := Point(MarkPos,            C - TickInner - 2);
        Canvas.Polygon(Pts);
      end;

      if FTickMarks in [stmBottomRight, stmBoth] then
      begin
        Pts[0] := Point(MarkPos - MarkSize, C + TickInner + MarkDepth);
        Pts[1] := Point(MarkPos + MarkSize, C + TickInner + MarkDepth);
        Pts[2] := Point(MarkPos,            C + TickInner);
        Canvas.Polygon(Pts);
      end;
    end
    else
    begin
      MarkPos := CenterPos;

      C := Width div 2;

      if FTickMarks in [stmTopLeft, stmBoth] then
      begin
        Pts[0] := Point(C - TickInner - MarkDepth - 2, MarkPos - MarkSize);
        Pts[1] := Point(C - TickInner - MarkDepth - 2, MarkPos + MarkSize);
        Pts[2] := Point(C - TickInner - 2,             MarkPos);
        Canvas.Polygon(Pts);
      end;

      if FTickMarks in [stmBottomRight, stmBoth] then
      begin
        Pts[0] := Point(C + TickInner + MarkDepth, MarkPos - MarkSize);
        Pts[1] := Point(C + TickInner + MarkDepth, MarkPos + MarkSize);
        Pts[2] := Point(C + TickInner,             MarkPos);
        Canvas.Polygon(Pts);
      end;
    end;
  end;

  function PosToPixelLocal: Integer;
  begin
    Result := ValueToPixel(FPosition);
  end;

  procedure DrawThumb;
  var
    Pts: array[0..5] of TPoint;
    MidX, MidY: Integer;
    ArrowSize: Integer;
    L, T, R, B: Integer;
  begin
    if Enabled then
      Canvas.Brush.Color := FThumbColor
    else
      Canvas.Brush.Color := clSilver;

    Canvas.Pen.Color := clBlack;

    if FOrientation = stoHorizontal then
    begin
      MidX := P;
      MidY := ThumbRect.Top + (ThumbRect.Height div 2);
    end
    else
    begin
      MidX := ThumbRect.Left + (ThumbRect.Width div 2);
      MidY := P;
    end;

    L := ThumbRect.Left;
    T := ThumbRect.Top;
    R := ThumbRect.Right - 1;
    B := ThumbRect.Bottom - 1;

    if FOrientation = stoHorizontal then
    begin
      ArrowSize := (ThumbRect.Width div 2);

      case FTickMarks of
        stmTopLeft:
          begin
            // point upward
            Pts[0] := Point(MidX, T);
            Pts[1] := Point(R, T + ArrowSize);
            Pts[2] := Point(R, B);
            Pts[3] := Point(L, B);
            Pts[4] := Point(L, T + ArrowSize);
            Pts[5] := Pts[0];
            Canvas.Polygon(Pts);
          end;

        stmBottomRight:
          begin
            // point downward
            Pts[0] := Point(L, T);
            Pts[1] := Point(R, T);
            Pts[2] := Point(R, B - ArrowSize);
            Pts[3] := Point(MidX, B);
            Pts[4] := Point(L, B - ArrowSize);
            Pts[5] := Pts[0];
            Canvas.Polygon(Pts);
          end;

      else
        Canvas.Rectangle(ThumbRect);
      end;
    end
    else
    begin
      ArrowSize := (ThumbRect.Height div 2);

      case FTickMarks of
        stmTopLeft:
          begin
            // point left
            Pts[0] := Point(L, MidY);
            Pts[1] := Point(L + ArrowSize, T);
            Pts[2] := Point(R, T);
            Pts[3] := Point(R, B);
            Pts[4] := Point(L + ArrowSize, B);
            Pts[5] := Pts[0];
            Canvas.Polygon(Pts);
          end;

        stmBottomRight:
          begin
            // point right
            Pts[0] := Point(L, T);
            Pts[1] := Point(R - ArrowSize, T);
            Pts[2] := Point(R, MidY);
            Pts[3] := Point(R - ArrowSize, B);
            Pts[4] := Point(L, B);
            Pts[5] := Pts[0];
            Canvas.Polygon(Pts);
          end;

      else
        Canvas.Rectangle(ThumbRect);
      end;
    end;
  end;

  procedure DrawTick(Value: Integer);
  var
    Ratio: Double;
  begin
    if FMax <= FMin then
      Exit;

    Ratio := (Value - FMin) / (FMax - FMin);

    if FOrientation = stoHorizontal then
    begin
      TickPos := RangeStart + Round(Ratio * (RangeEnd - RangeStart));

      if FTickMarks in [stmTopLeft, stmBoth] then
      begin
        Canvas.MoveTo(TickPos, Height div 2 - TickOuter - 2);
        Canvas.LineTo(TickPos, Height div 2 - TickInner - 2);
      end;

      if FTickMarks in [stmBottomRight, stmBoth] then
      begin
        Canvas.MoveTo(TickPos, Height div 2 + TickInner);
        Canvas.LineTo(TickPos, Height div 2 + TickOuter);
      end;
    end
    else
    begin
      TickPos := RangeEnd - Round(Ratio * (RangeEnd - RangeStart));

      if FTickMarks in [stmTopLeft, stmBoth] then
      begin
        Canvas.MoveTo(Width div 2 - TickOuter, TickPos);
        Canvas.LineTo(Width div 2 - TickInner, TickPos);
      end;

      if FTickMarks in [stmBottomRight, stmBoth] then
      begin
        Canvas.MoveTo(Width div 2 + TickInner, TickPos);
        Canvas.LineTo(Width div 2 + TickOuter, TickPos);
      end;
    end;
  end;

begin
  if Parent <> nil then
    Parent.Perform(WM_ERASEBKGND, Canvas.Handle, 0)
  else
  begin
    Canvas.Brush.Color := Color;
    Canvas.FillRect(ClientRect);
  end;

  TrackHalf := 3;
  ThumbLength := Round(FThumbSize * 1.95);

  ThumbTravelSize := Round(FThumbSize * 1.02);
  if not Odd(ThumbTravelSize) then
    Inc(ThumbTravelSize);

  ThumbHalf := ThumbTravelSize div 2;
  TickLen := 3;

  TickInner := FThumbSize;
  TickOuter := TickInner + TickLen;

  if FOrientation = stoHorizontal then // Horizontal Slider
  begin
    TrackStart := 10;
    TrackEnd := Width - 10;
    RangeStart := TrackStart + ThumbHalf;
    RangeEnd := TrackEnd - ThumbHalf;

    P := PosToPixelLocal;

    if FCenterMark then
      CenterPos := ValueToPixel(FCenterValue)
    else
      CenterPos := ValueToPixel(FMin);

    TrackRect := Rect(
      TrackStart,
      Height div 2 - TrackHalf,
      TrackEnd,
      Height div 2 + TrackHalf
    );

    if FCenterMark then
      CenterPos := ValueToPixel(FCenterValue)
    else
      CenterPos := ValueToPixel(FMin);

    FillRect := Rect(
      System.Math.Min(P, CenterPos),
      Height div 2 - TrackHalf,
      System.Math.Max(P, CenterPos),
      Height div 2 + TrackHalf
    );

    ThumbRect := Rect(
      P - ThumbHalf,
      Height div 2 - (ThumbLength div 2),
      P + ThumbHalf + 1,
      Height div 2 + (ThumbLength div 2)
    );
  end
  else // Vertical Slider
  begin
    TrackStart := 10;
    TrackEnd := Height - 10;
    RangeStart := TrackStart + ThumbHalf;
    RangeEnd := TrackEnd - ThumbHalf;

    P := PosToPixelLocal;

    if FCenterMark then
      CenterPos := ValueToPixel(FCenterValue)
    else
      CenterPos := ValueToPixel(FMin);

    TrackRect := Rect(
      Width div 2 - TrackHalf,
      TrackStart,
      Width div 2 + TrackHalf,
      TrackEnd
    );

    if FCenterMark then
      CenterPos := ValueToPixel(FCenterValue)
    else
      CenterPos := ValueToPixel(FMin);

    FillRect := Rect(
      Width div 2 - TrackHalf,
      System.Math.Min(P, CenterPos),
      Width div 2 + TrackHalf,
      System.Math.Max(P, CenterPos)
    );

    ThumbRect := Rect(
      Width div 2 - (ThumbLength div 2),
      P - ThumbHalf,
      Width div 2 + (ThumbLength div 2),
      P + ThumbHalf + 1
    );
  end;

  Canvas.Brush.Color := FTrackColor;
  Canvas.FillRect(TrackRect);

  if P <> CenterPos then
  begin
    if Enabled = True then
    begin
      Canvas.Brush.Color := FFillColor;
      Canvas.FillRect(FillRect);
    end;
  end;

  if FFrequency > 0 then
  begin
    Canvas.Pen.Color := FTickColor;

    I := FMin;
    while I <= FMax do
    begin
      DrawTick(I);
      Inc(I, FFrequency);
    end;

    if (FMax - FMin) mod FFrequency <> 0 then
      DrawTick(FMax);
  end;

  DrawCenterMark;

  if FDragging then
    Canvas.Brush.Color := clSilver
  else if FHoverThumb then
    Canvas.Brush.Color := clBlack
  else
    Canvas.Brush.Color := FThumbColor;

  if FThumbBorder then
  begin
    Canvas.Pen.Color := clBlack;
    Canvas.Pen.Style := psSolid;
    //Canvas.Rectangle(ThumbRect);
    DrawThumb;
  end
  else
  begin
    Canvas.Pen.Style := psClear;
    //Canvas.Rectangle(ThumbRect);
    DrawThumb;
    Canvas.Pen.Style := psSolid;
  end;
end;

procedure TSynthSlider.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if not Enabled then Exit;

  if Button <> mbLeft then
    Exit;

  SetFocus;

  // Clicked directly on thumb = drag mode
  if PointInThumb(X, Y) then
  begin
    FDragging := True;
    MouseCapture := True;
    Invalidate;
    Exit;
  end;

  // Clicked track = step value instead of jumping
  if FOrientation = stoHorizontal then
  begin
    if X < PosToPixel then
      Position := Position - 2
    else if X > PosToPixel then
      Position := Position + 2;
  end
  else
  begin
    if Y > PosToPixel then
      Position := Position - 2
    else if Y < PosToPixel then
      Position := Position + 2;
  end;
end;

procedure TSynthSlider.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  NewHover: Boolean;
begin
  inherited;

  if FDragging then
  begin
    Position := PixelToPos(X, Y);
    Exit;
  end;

  NewHover := PointInThumb(X, Y);

  if NewHover <> FHoverThumb then
  begin
    FHoverThumb := NewHover;
    Invalidate;
  end;
end;

procedure TSynthSlider.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if Button = mbLeft then
  begin
    FDragging := False;
    MouseCapture := False;

    FHoverThumb := PointInThumb(X, Y);

    Invalidate;
  end;
end;

procedure TSynthSlider.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not Enabled then Exit;

  case Key of
    VK_RIGHT, VK_UP:
      Position := Position + 1;

    VK_LEFT, VK_DOWN:
      Position := Position - 1;

    VK_PRIOR:
      Position := Position + 10;

    VK_NEXT:
      Position := Position - 10;

    VK_HOME:
      Position := Min;

    VK_END:
      Position := Max;
  end;
end;

procedure TSynthSlider.WMMouseWheel(var Msg: TWMMouseWheel);
begin
  inherited;
  if not Enabled then Exit;

  if Msg.WheelDelta > 0 then
  begin
    if (FMax - FMin < 10) or (FFrequency < 5) then
      Position := Position + 1
    else
      Position := Position + 2
  end
  else
  begin
    if (FMax - FMin < 10) or (FFrequency < 5) then
      Position := Position - 1
    else
      Position := Position - 2;
  end;
end;

end.
