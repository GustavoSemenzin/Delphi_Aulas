inherited frmCadUsuarios: TfrmCadUsuarios
  Caption = '(ERP) - Cadastro de usu'#225'rios'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TPageControl
    inherited tsPesquisa: TTabSheet
      inherited gbPesquisa: TcxGroupBox
        object cxLabel5: TcxLabel
          Left = 10
          Top = 22
          Caption = 'Seq.:'
          Transparent = True
        end
        object cxLabel6: TcxLabel
          Left = 10
          Top = 48
          Caption = 'Usu'#225'rio:'
          Transparent = True
        end
        object edtPSequencia: TcxTextEdit
          Left = 61
          Top = 20
          TabOrder = 3
          Width = 60
        end
        object edtPUsuario: TcxTextEdit
          Left = 61
          Top = 46
          TabOrder = 4
          Width = 491
        end
      end
      inherited grdDados: TcxGrid
        inherited grdDadosTV: TcxGridDBTableView
          object grdDadosTVID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
          end
          object grdDadosTVUSUARIO: TcxGridDBColumn
            DataBinding.FieldName = 'USUARIO'
          end
          object grdDadosTVSENHA: TcxGridDBColumn
            DataBinding.FieldName = 'SENHA'
          end
          object grdDadosTVSTATUS: TcxGridDBColumn
            DataBinding.FieldName = 'STATUS'
          end
        end
      end
    end
    inherited tsCadastro: TTabSheet
      inherited gbCadastro: TcxGroupBox
        object cxLabel1: TcxLabel
          Left = 10
          Top = 22
          Caption = 'Seq.:'
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 10
          Top = 48
          Caption = 'Login:'
          Transparent = True
        end
        object cxLabel3: TcxLabel
          Left = 10
          Top = 74
          Caption = 'Senha:'
          Transparent = True
        end
        object edtSequencia: TcxTextEdit
          Left = 55
          Top = 20
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = True
          Style.TextColor = clTeal
          Style.TextStyle = [fsBold]
          TabOrder = 3
          Width = 60
        end
        object edtLogin: TcxTextEdit
          Left = 55
          Top = 46
          Properties.MaxLength = 20
          Properties.OnChange = edtLoginPropertiesChange
          TabOrder = 4
          Width = 121
        end
        object edtSenha: TcxTextEdit
          Left = 55
          Top = 72
          Properties.EchoMode = eemPassword
          Properties.MaxLength = 60
          Properties.OnChange = edtLoginPropertiesChange
          TabOrder = 5
          Width = 121
        end
        object cxLabel4: TcxLabel
          Left = 184
          Top = 74
          Caption = 'Confirmar senha:'
          Transparent = True
        end
        object edtConfirmarSenha: TcxTextEdit
          Left = 278
          Top = 72
          Properties.EchoMode = eemPassword
          TabOrder = 7
          Width = 121
        end
        object cmbStatus: TcxImageComboBox
          Left = 508
          Top = 20
          EditValue = 1
          Properties.Images = ilImagens
          Properties.Items = <
            item
              Description = 'ATIVO'
              ImageIndex = 1
              Tag = 1
              Value = 1
            end
            item
              Description = 'INATIVO'
              ImageIndex = 0
              Value = 0
            end>
          TabOrder = 8
          Width = 121
        end
        object cxLabel7: TcxLabel
          Left = 462
          Top = 22
          Caption = 'Status:'
          Transparent = True
        end
      end
    end
  end
  inherited dsDados: TDataSource
    OnDataChange = dsDadosDataChange
  end
  object ilImagens: TcxImageList [3]
    FormatVersion = 1
    DesignInfo = 16318697
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000003303E00067AB1000AA1E5010A9EE50003
          72B200012B3F0000000000000000000000000000000000000000000000000000
          00000000000000000000000861740821CCFD1E4DF8FF1F55FFFF194EFFFF0E3B
          F7FF0315BEFD0001557400000000000000000000000000000000000000000000
          0000000000000005343E0D28D3FD3A6BFFFF3565FFFF305FFFFF2857FFFF1E4F
          FFFF1248FFFF0314BEFD00012B3F000000000000000000000000000000000000
          000000000000000E8DAF3F6BFAFF4978FFFF4675FFFF406FFFFF3566FFFF295B
          FFFF1C4FFFFF0D3BF7FF000372B2000000000000000000000000000000000000
          000000000000011DC5E6588AFFFF5486FFFF5284FFFF4D7DFFFF4472FFFF3666
          FFFF2658FFFF184EFFFF010A9EE6000000000000000000000000000000000000
          0000000000000122CCE6639BFFFF5F96FFFF5C92FFFF5588FFFF4D7CFFFF3F6E
          FFFF2F5FFFFF1E53FFFF000CA2E6000000000000000000000000000000000000
          00000000000000169FAF5991FCFF68A2FFFF649EFFFF5C91FFFF5283FFFF4572
          FFFF3363FFFF1E4CF8FF00067BB1000000000000000000000000000000000000
          000000000000000A3D3D1647F9FD6FA9FFFF68A3FFFF5E94FFFF5384FFFF4876
          FFFF3769FFFF0821CCFD0003303E000000000000000000000000000000000000
          00000000000000000000001772721648F8FD5890FDFF6197FFFF5788FFFF3D6A
          FAFF0C28D4FD0008617300000000000000000000000000000000000000000000
          0000000000000000000000000000000A3D3D0017A0AF0122CDE6011FC6E6000E
          8EAF0005343E0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000025003E006000B1017F01E5017D00E5005E
          00B20024003F0000000000000000000000000000000000000000000000000000
          00000000000000000000004B00740B9F0FFD27BE3AFF2CC542FF28C23BFF1CB4
          2BFF07940AFD0045007400000000000000000000000000000000000000000000
          0000000000000027003E0CA513FD3AD356FF36CF50FF32CC4CFF2DC645FF29C2
          3DFF24BD35FF069409FD0023003F000000000000000000000000000000000000
          000000000000006800AF39D255FF40D961FF3ED75DFF3CD559FF35CE51FF2FC9
          46FF27C13CFF1DB42BFF005E00B2000000000000000000000000000000000000
          00000000000007920EE64DE674FF4AE36EFF47E06CFF44DD64FF3ED75CFF35CE
          51FF2EC743FF27C13BFF017F00E6000000000000000000000000000000000000
          0000000000000A9415E656EF81FF52EB7DFF51EA79FF4BE471FF44DD65FF3AD3
          57FF32CB4BFF2BC541FF018101E6000000000000000000000000000000000000
          000000000000077010AF50E97BFF5FF88DFF59F285FF51EA79FF48E16AFF3DD6
          5CFF35CE4FFF26BE39FF006000B1000000000000000000000000000000000000
          000000000000042C093D26BF41FD69FF9DFF5EF78CFF52EB7BFF49E26DFF3FD8
          5FFF39D254FF0B9F0FFD0025003E000000000000000000000000000000000000
          000000000000000000000A58177226BF42FD4FE878FF55EE7EFF4BE471FF37D0
          52FF0CA512FD004B007300000000000000000000000000000000000000000000
          0000000000000000000000000000042C093D077013AF0C9617E608920FE60068
          00AF0027003E0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  inherited cdsDados: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faReadonly, faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Status'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    Left = 25
    Top = 209
    DesignClass = 'Core.Entities.TUsuario'
    object cdsDadosID: TIntegerField
      FieldName = 'ID'
    end
    object cdsDadosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 25
    end
    object cdsDadosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 100
    end
    object cdsDadosSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
  end
end
