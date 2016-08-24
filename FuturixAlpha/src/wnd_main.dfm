object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FuturixAlpha'
  ClientHeight = 420
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblFiles: TLabel
    Left = 8
    Top = 8
    Width = 78
    Height = 13
    Caption = 'Files to convert:'
    Transparent = True
  end
  object lbxFiles: TListBox
    Left = 8
    Top = 27
    Width = 435
    Height = 354
    ItemHeight = 13
    TabOrder = 0
  end
  object btnAdd: TButton
    Left = 8
    Top = 387
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnConvert: TButton
    Left = 368
    Top = 387
    Width = 75
    Height = 25
    Caption = 'Convert'
    TabOrder = 2
    OnClick = btnConvertClick
  end
  object btnClear: TButton
    Left = 89
    Top = 387
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 3
    OnClick = btnClearClick
  end
  object dlgOpen: TOpenDialog
    Filter = 'Target formats|*.bmp;*.png;|Bitmap images|*.bmp|PNG images|*.png'
    Options = [ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing, ofDontAddToRecent, ofForceShowHidden]
    Left = 395
    Top = 44
  end
end
