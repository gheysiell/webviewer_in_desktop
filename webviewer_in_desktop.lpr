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

begin
  GlobalCEFApp := TCefApplication.Create;

  if GlobalCEFApp.StartMainProcess then
  begin
    RequireDerivedFormResource := True;
    Application.Scaled := True;
    Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
    Application.Run;
  end;

  GlobalCEFApp.Free;
  GlobalCEFApp := nil;
end.

