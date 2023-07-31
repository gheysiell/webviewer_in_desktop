unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, GeckoBrowser;

type

  { TForm2 }

  TForm2 = class(TForm)
    GeckoBrowser1: TGeckoBrowser;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormShow(Sender: TObject);
begin
  GeckoBrowser1.LoadURI('https://cnp30blob.blob.core.windows.net/cnp3files/b3ccd4c9c7e5be3a0b1d477054452494a1e643096d01d654ff6b62bdba4b6911.jpeg');
end;

end.

