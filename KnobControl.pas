unit KnobControl;

interface

uses
  Windows, Messages, Classes, Math, Controls, Graphics, GDIPAPI, GDIPOBJ;

type
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  TKnobControl = class(TCustomControl)
  private
    FValue: Integer;
    FMin: Integer;
    FMax: Integer;
    FLastY: Integer;
    FDragging: Boolean;
    FOnChange: TNotifyEvent;
    FStartAngle: Integer;
    FEndAngle: Integer;
    FShowTicks: Boolean;
    FIndColor: TColor;
    KnobFillColor: TColor;
    KnobBorderColor: TColor;
    IndicatorColor: TColor;
    TicksColor: TColor;
    GdiPPen: TGPPen;
    GdiPBrush: TGPSolidBrush;

    procedure SetStartAngle(AValue: Integer);
    procedure SetEndAngle(AValue: Integer);
    procedure SetValue(AValue: Integer);
    procedure SetShowTicks(AValue: Boolean);
    procedure SetIndColor(NewColor: TColor);
  protected
    procedure Paint; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MouseWheelHandler(var Message: TMessage); override;
  published
    property Color;
    property ParentColor;
    property Enabled;
    property Min: Integer read FMin write FMin default 0;
    property Max: Integer read FMax write FMax default 127;
    property Value: Integer read FValue write SetValue default 0;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property StartAngle: Integer read FStartAngle write SetStartAngle default 225;
    property EndAngle: Integer read FEndAngle write SetEndAngle default 495;
    property ShowTicks: Boolean read FShowTicks write SetShowTicks default True;
    property IndColor: TColor read FIndColor write SetIndColor default clHighlight;
  end;

procedure Register;

implementation

var
  GdiPInitDone: Boolean = false;
  UsedInstances: Integer = 0;
  GdiPInitCriticalSection: RTL_CRITICAL_SECTION;

constructor TKnobControl.Create(AOwner: TComponent);
begin
  inherited;
  Controlstyle := Controlstyle + [csopaque];
  DoubleBuffered := true;

  EnterCriticalSection(GdiPInitCriticalSection);
  try
    Inc(UsedInstances);
    if UsedInstances = 1 then
    begin
      if FreeLibrary(LoadLibrary('gdiplus.dll')) then
      begin
        StartupInput.DebugEventCallback := nil;
        StartupInput.SuppressBackgroundThread := False;
        StartupInput.SuppressExternalCodecs := False;
        StartupInput.GdiplusVersion := 1;
        GdiplusStartup(GdiplusToken, @StartupInput, nil);
        GdiPInitDone := true;
      end;
    end;
  finally
    LeaveCriticalSection(GdiPInitCriticalSection);
  end;

  if Enabled then
  begin
    KnobFillColor := clBtnFace;
    KnobBorderColor := clGray;
    IndicatorColor := RGB(0, 120, 215);
    TicksColor := clBlack;
  end
  else
  begin
    KnobFillColor := clBtnFace;
    KnobBorderColor := clSilver;
    IndicatorColor := clGray;
    TicksColor := clGray;
  end;

  if GdiPInitDone then
  begin
    GdiPPen := TGPPen.Create(ColorRefToARGB(ColorToRGB(KnobBorderColor)));
    GdiPBrush := TGPSolidBrush.Create(ColorRefToARGB(ColorToRGB(KnobFillColor)));
  end;

  Width := 42;
  Height := 42;
  ParentColor := True;
  FMin := 0;
  FMax := 100;
  FValue := 0;
  FStartAngle := 135;
  FEndAngle := 405;
  FShowTicks := True;
  FIndColor := clHighlight;
end;

destructor TKnobControl.Destroy;
begin
  GdiPBrush.Free;
  GdiPPen.Free;

  EnterCriticalSection(GdiPInitCriticalSection);
  try
    Dec(UsedInstances);
    if (UsedInstances = 0) and GdiPInitDone then
      GdiplusShutdown(GdiplusToken);
  finally
    LeaveCriticalSection(GdiPInitCriticalSection);
  end;

  inherited;
end;

procedure TKnobControl.SetValue(AValue: Integer);
begin
  if AValue < FMin then AValue := FMin;
  if AValue > FMax then AValue := FMax;

  if FValue <> AValue then
  begin
    FValue := AValue;
    Invalidate;

    if Assigned(FOnChange) then
      FOnChange(Self);
  end;
end;

procedure TKnobControl.SetIndColor(NewColor: TColor);
begin
  if FIndColor <> NewColor then
  begin
    FIndColor := NewColor;
    Invalidate;
  end;
end;

procedure TKnobControl.Paint;
var
  cx, cy, r: Integer;
  angle, norm: Double;
  x2, y2: Integer;
  GdiPGraphics: TGPGraphics;

procedure DrawTick(AngleDeg: Double);
  var
    a: Double;
    x1, y1, x2, y2: Integer;
  begin
    a := Math.DegToRad(AngleDeg);

    x1 := cx + Round(Cos(a) * (r + 2));
    y1 := cy + Round(Sin(a) * (r + 2));

    x2 := cx + Round(Cos(a) * (r + 7));
    y2 := cy + Round(Sin(a) * (r + 7));

    if GdiPInitDone then
    begin
      GdiPGraphics.DrawLine(GdiPPen, x1, y1, x2, y2);
    end
    else
    begin
      Canvas.MoveTo(x1, y1);
      Canvas.LineTo(x2, y2);
    end;
  end;

begin
  if Enabled then
  begin
    KnobFillColor := clBtnFace;
    KnobBorderColor := clGray;
    IndicatorColor := FIndColor;//RGB(0,120,215);
    TicksColor := clSilver;
  end
  else
  begin
    KnobFillColor := clBtnFace;
    KnobBorderColor := clSilver;
    IndicatorColor := clGray;
    TicksColor := clSilver;
  end;	

  cx := Width div 2;
  cy := Height div 2;
  r := System.Math.Min(Width, Height) div 2 - 4;

  if FMax <> FMin then
    norm := (FValue - FMin) / (FMax - FMin)
  else
    norm := 0;

  angle := Math.DegToRad(FStartAngle + norm * (FEndAngle - FStartAngle));

  x2 := cx + Round(Cos(angle) * r * 0.75);
  y2 := cy + Round(Sin(angle) * r * 0.75);

  if GdiPInitDone then
  begin
    if Parent <> nil then
      Parent.Perform(WM_ERASEBKGND, Canvas.Handle, 0)
    else
    begin
      Canvas.Brush.Color := Color;
      Canvas.FillRect(ClientRect);
    end;

    GdiPGraphics := TGPGraphics.Create(Canvas.Handle);
    try
      GdiPPen.SetWidth(1);
      GdiPPen.SetColor(ColorRefToARGB(ColorToRGB(KnobBorderColor)));
      GdiPGraphics.SetSmoothingMode(SmoothingModeAntiAlias);
      GdiPBrush.SetColor(ColorRefToARGB(ColorToRGB(KnobFillColor)));
      GdiPGraphics.FillEllipse(GdiPBrush, cx - r, cy - r, r * 2, r * 2); //GdiPGraphics.FillEllipse(GdiPBrush, cx - r, cy - r, (cx + r) - (cx - r), (cy + r) - (cy - r));
      GdiPGraphics.DrawEllipse(GdiPPen, cx - r, cy - r, r * 2, r * 2); //GdiPGraphics.DrawEllipse(GdiPPen, cx - r, cy - r, (cx + r) - (cx - r), (cy + r) - (cy - r));

      if FShowTicks then
      begin
        GdiPPen.SetColor(ColorRefToARGB(ColorToRGB(TicksColor)));
        GdiPPen.SetWidth(1);
        DrawTick(FStartAngle);
        DrawTick(FEndAngle);
      end;

      GdiPPen.SetColor(ColorRefToARGB(ColorToRGB(IndicatorColor)));
      if Enabled then
        GdiPPen.SetWidth(2)
      else
        GdiPPen.SetWidth(1);

      GdiPGraphics.DrawLine(GdiPPen, cx, cy, x2, y2);
    finally
      GdiPGraphics.Free;
    end;
  end
  else
  begin
    if Parent <> nil then
      Parent.Perform(WM_ERASEBKGND, Canvas.Handle, 0)
    else
    begin
      Canvas.Brush.Color := Color;
      Canvas.FillRect(ClientRect);
    end;

    Canvas.Brush.Color := KnobFillColor;
    Canvas.Pen.Color := KnobBorderColor;
    Canvas.Pen.Width := 1;
    Canvas.Ellipse(cx - r, cy - r, cx + r, cy + r);

    if FShowTicks then
    begin
      Canvas.Pen.Color := TicksColor;
      Canvas.Pen.Width := 1;
      DrawTick(FStartAngle);
      DrawTick(FEndAngle);
    end;

    Canvas.Pen.Color := IndicatorColor;
    if Enabled then
      Canvas.Pen.Width := 2
    else
      Canvas.Pen.Width := 1;

    Canvas.MoveTo(cx, cy);
    Canvas.LineTo(x2, y2);
  end;
end;

procedure TKnobControl.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if Button = mbLeft then
  begin
    FDragging := True;
    FLastY := Y;
    SetCapture(Handle);
  end;
end;

procedure TKnobControl.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Delta: Integer;
begin
  inherited;

  if FDragging then
  begin
    Delta := FLastY - Y;

    if ssShift in Shift then
      Delta := Delta div 4;

    SetValue(FValue + Delta);
    FLastY := Y;
  end;
end;

procedure TKnobControl.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;

  if Button = mbLeft then
  begin
    FDragging := False;
    ReleaseCapture;
  end;
end;

procedure TKnobControl.MouseWheelHandler(var Message: TMessage);
var
  Delta: SmallInt;
  Step: Integer;
begin
  inherited;

  Step := 1;
  Delta := SmallInt(HiWord(Message.WParam));

  if Delta > 0 then
    Value := Value + Step
  else
    Value := Value - Step;

  Message.Result := 1;
end;

procedure TKnobControl.SetStartAngle(AValue: Integer);
begin
  if FStartAngle <> AValue then
  begin
    FStartAngle := AValue;
    Invalidate;
  end;
end;

procedure TKnobControl.SetEndAngle(AValue: Integer);
begin
  if FEndAngle <> AValue then
  begin
    FEndAngle := AValue;
    Invalidate;
  end;
end;

procedure TKnobControl.SetShowTicks(AValue: Boolean);
begin
  if FShowTicks <> AValue then
  begin
    FShowTicks := AValue;
    Invalidate;
  end;
end;

procedure TKnobControl.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure Register;
begin
  RegisterComponents('Mt32edit4v', [TKnobControl]);
end;

initialization
  InitializeCriticalSection(GdiPInitCriticalSection);

finalization
  DeleteCriticalSection(GdiPInitCriticalSection);

end.
