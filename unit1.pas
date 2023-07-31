unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, uCEFChromium, uCEFWindowParent, uCEFInterfaces,
  uCEFConstants;

type
  { TfrmMenu }

  TfrmMenu = class(TForm)
    CEFWindowParent: TCEFWindowParent;
    Chromium: TChromium;
    Timer: TTimer;
    procedure ChromiumAfterCreated(Sender: TObject; const browser: ICefBrowser);
    procedure FormShow(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private

  public

  end;

var
  frmMenu: TfrmMenu;

implementation
    {$R *.lfm}

{ TfrmMenu }
uses
  uCEFApplication;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
  if not(Chromium.CreateBrowser(CEFWindowParent)) then
    Timer.Enabled := True;
end;

procedure TfrmMenu.ChromiumAfterCreated(Sender: TObject;
  const browser: ICefBrowser);
begin
  PostMessage(Handle, CEF_AFTERCREATED, 0, 0);
  Chromium.LoadURL(UTF8Decode('https://google.com'));
end;

procedure TfrmMenu.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := False;

  if not(Chromium.CreateBrowser(CEFWindowParent)) and not(Chromium.Initialized) then
    Timer.Enabled := True;
end;

end.
