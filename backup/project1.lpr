program webviewer_in_desktop;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, Forms, Unit1, uCEFApplication;

{$R *.res}
{$IFDEF MSWINDOWS}
  {$SetPEFlags $20}
{$ENDIF}

begin
  GlobalCEFApp := TCefApplication.Create;

  if GlobalCEFApp.StartMainProcess then
  begin
    RequireDerivedFormResource := True;
    Application.Scaled := True;
    Application.Initialize;
    Application.CreateForm(TfrmMenu, Form1);
    Application.Run;
  end;

  GlobalCEFApp.Free;
  GlobalCEFApp := nil;
end.

