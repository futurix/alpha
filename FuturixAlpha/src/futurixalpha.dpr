program futurixalpha;

uses
  Forms,
  wnd_main in 'wnd_main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'FuturixAlpha';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
