object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 355
  Width = 463
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Aulas\Arthur\ERP\exe\banco\BANCO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=23063'
      'CharacterSet=ISO8859_1'
      'DriverID=FB')
    LoginPrompt = False
    Left = 68
    Top = 24
  end
  object AureliusConnection: TAureliusConnection
    AdapterName = 'FireDac'
    AdaptedConnection = FDConnection
    SQLDialect = 'Firebird'
    Left = 140
    Top = 20
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 68
    Top = 124
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 68
    Top = 76
  end
end
