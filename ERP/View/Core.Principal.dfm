object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = '(ERP) - Principal'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 144
    Top = 88
    object miCadastros: TMenuItem
      Caption = 'Cadastros'
      object miUsuarios: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = miUsuariosClick
      end
    end
    object miSair: TMenuItem
      Caption = 'Sair'
      OnClick = miSairClick
    end
  end
end
