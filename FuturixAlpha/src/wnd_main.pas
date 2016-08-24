unit wnd_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, imageenio;

type
  TfrmMain = class(TForm)
    lbxFiles: TListBox;
    lblFiles: TLabel;
    btnAdd: TButton;
    btnConvert: TButton;
    dlgOpen: TOpenDialog;
    btnClear: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnAddClick(Sender: TObject);
var
	filename: string;
    io: TImageEnIO;
begin
	if dlgOpen.Execute(Self.Handle) then
        begin
        for filename in dlgOpen.Files do
            begin
            if FileExists(filename) then
            	begin
                io := TImageEnIO.Create(nil);
                io.LoadFromFileAuto(filename);

                if not io.Aborting then
                    begin
                    if ((io.Params.FileType = ioBMP) or (io.Params.FileType = ioPNG)) then
                        lbxFiles.Items.Add(filename)
                    else
                    	MessageBox(Self.Handle, 'Invalid file format.', 'FuturixAlpha', MB_OK or MB_ICONERROR);
                    end
                else
                	MessageBox(Self.Handle, 'Failed to load file.', 'FuturixAlpha', MB_OK or MB_ICONERROR);
                
                FreeAndNil(io);
                end;            
            end;
        end;
end;

procedure TfrmMain.btnClearClick(Sender: TObject);
begin
	lbxFiles.Clear();
end;

procedure TfrmMain.btnConvertClick(Sender: TObject);
var
	item: string;
    io: TImageEnIO;
begin
	if (lbxFiles.Items.Count > 0) then
    	begin
        for item in lbxFiles.Items do
            begin
            if FileExists(item) then
            	begin
                io := TImageEnIO.Create(nil);
                io.Params.BMP_HandleTransparency := true;
                io.LoadFromFileAuto(item);

                if not io.Aborting then
                    begin
                    if (io.Params.FileType = ioBMP) then
                        io.SaveToFilePNG(ChangeFileExt(item, '.png'))
                    else if (io.Params.FileType = ioPNG) then
                    	io.SaveToFileBMP(ChangeFileExt(item, '.bmp'))	
                    else
                    	MessageBox(Self.Handle, 'Incorrect file format or bit depth.', 'FuturixAlpha', MB_OK or MB_ICONERROR);
                    end
                else
                	MessageBox(Self.Handle, 'Failed to load file.', 'FuturixAlpha', MB_OK or MB_ICONERROR);
                
                FreeAndNil(io);
                end;            
            end;
        end;
end;

end.
