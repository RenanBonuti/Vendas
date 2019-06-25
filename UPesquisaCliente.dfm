object frmPesquisaCliente: TfrmPesquisaCliente
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Pesquisa de Cliente'
  ClientHeight = 365
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPesquisaCliente: TPanel
    Left = 0
    Top = 0
    Width = 735
    Height = 365
    Align = alClient
    TabOrder = 0
    object lblPesquisa: TLabel
      Left = 537
      Top = 11
      Width = 4
      Height = 17
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbgrdPesquisar: TDBGrid
      Left = 0
      Top = 95
      Width = 724
      Height = 252
      DataSource = dsCliente
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = dbgrdPesquisarDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CL_CODIGO'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CL_NOME'
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CL_CPF'
          Title.Caption = 'CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CL_DATA_NASCIMENTO'
          Title.Caption = 'Data Nasc.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CL_ATIVO'
          Title.Caption = 'Situa'#231#227'o'
          Visible = True
        end>
    end
    object btnPesquisar2: TBitBtn
      Left = 639
      Top = 47
      Width = 89
      Height = 42
      Caption = 'Busca'
      Glyph.Data = {
        36080000424D3608000000000000360400002800000020000000200000000100
        080000000000000400000000000000000000000100000000000000000000FAEF
        E100F6EFE300F8F1E100F9EFE100FBEFE100FAF0E200F8EFE300E9D5BE00EAD8
        C100E8D5BD00E8D3BA00EFE6D300E6CFB600EDDEC900FAEFE200E4CEB500EFDF
        C900FEEDE100E7D3BB00F5E7D400EAD7C000FEF8EE00FAEFE000FAEFE100FAEF
        E100FAEFE100FAEFE100FAEFE100FAEFE100FAEFE100FAEFE100FAEFE200FAEF
        E100FAEFE100FAEFE100FAEFE100FAEFE100FAEFE100FAEFE100FAEFE100FAEF
        E100FAEFE100FAEFE100FAEFE100FAEFE100FAEFE100FAEFE100FAEFE100FAEF
        E100FAEFE100FAEFE100FAEFE100FAEFE100FAEFE100FAEFE100FAEEE100FAEF
        E100FAEFE100FBEFE100FAEFE100FAEFE100FAEFE100FAEFE100FAEFE100F7EA
        DA00FBF0E300FAEFE200EBD9C300FFFFFF00E8D4BC00E9D5BD00F9EEE100E9D5
        BD00EEDEC900FAEFE100E8D4BD00E9D5BE00E8D4BD00E9D5BE00E8D4BC00E9D6
        BF00FAEFE100E9D5BE00E8D4BC00E9D5BE00FAEFE100E8D5BD00EBD8C100FAEF
        E100FAEFE100FAEFE100FEF9EF00FAEFE100FAF0E200FBF0E200F2E6D800E7DA
        CC00E7DBCC00F4E8DA00FCF1E300FBF1E300AC9C8B008C7A6800887562008775
        62008F7D6B00B5A59400EDE1D300DACDBE00887664009B897600CBBEAE00E2D7
        CA00DDCEBC00C3B3A00092806D00E1D4C500B2A18E00FDF8F100FAF1E700F4E6
        D300F4E4D000EBDBC700A6948100917F6C00EEE1D200F5ECE200F7ECDF00F3E3
        D100F2E2CE00F3E3CF00E9D9C6008E7B6800B8A69200F9ECDD00CBBDAE00FDF8
        F200F3E5D200B9A89600917D6700EAD8C200F7EBDB00E3D9CD00FAF3EA00F2E2
        CD00D1C1AE008A766200E1CDB500ECDBC500E1D6CA00FBF4EB00CFBFAC00E2CE
        B600E8D4BC00ECDAC500C5B7A700FAF1E600F2E2CF00B4A3900094806B00E7D3
        BB00EBDBC800E4D4C00089776400BAA58E00EAD6BE00A5948100958370008673
        5E00EAD5BC00917F6D008D7B6800B4A39100887563009A897600B0B3B000E6D4
        BE00E9D4BC00EEE2D200B9A692008A7661009988760049688F0048A1F100A0C1
        D900E6D3BC00F9EDDD00EAD8C300ADAEB0003B8DEF003090FF0046A7FB00E6D3
        BD00EDDBC50099B6D9003991FC0046A6FC00A3C1D800E7D3BC00E7D4BC002F90
        FF0059AEF400D8CFC200E7D3BD009CB7D8004C99F50084B4E200E2D2BE00D7CD
        C200E1D1BE00FFFFFF00ACC0C700408C4B000000000000000000000000000000
        0000F4C0C700408C4B0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000E4BFC700408C4B0000000000000000000000000000000000000000000000
        00000121183D591B1C5D5D1D335A5B425C160000000000000000000000000000
        0121563A24255D5D5D5D5D5D5D5D254144575815000000000000000000001201
        2728295D5D5D5D5D5D5D5D5D5D5D8E959A5449551314000000000000000F0152
        365D5D5D5D5D5D5D5D5D5D5D5D8E959A9A9A9A4C53101100000000000101341B
        5D5D5D5D5D5D5D5D5D5D5D5D8E959A9A9A9A9A9A50510D0E0000000201301B5D
        5D5D5D5D5D5D5D5D5D5D5D8E959A9A9A9A9A9A9A9A4E4F0B0C000001274B5D5D
        5D5D5D5D5D5D5D5D5D5D8E959A9A9A9AB29A9A9A9A9A4C4D0A000148285D5D5D
        5D5D5D5D5D5D5D5D5D8E959A9A9A9AC8D1D2B29A9A9A9A494A0901222A5D5D5D
        5D5D5D5D5D5D5D5D8E959A9A9AB2CCCDCECFD09A9A9A9A46470843235D5D5D5D
        5D5D5D5D5D5D5D8E959A9A9AB2C8C3C4C9CACBB29A9A9A9A44451F245D5D5D5D
        5D5D5D5D5D5D8EC29A9A9A9AB1C3C4BFC5C6C79A9A9A9A9B414219255D5D5D5D
        5D5D5D5D5FBBBC9499A1A6AABDBEBFC0B9C19A9A9A9A9B8E253D1A5D5D5D5D5D
        5D5D5D64B3B48CB5B5A0A594B6B7B8B9BAB29A9A9A9B8E5D5D3E1B5D5D5D5D5D
        5D5D6475ABAC8B9298ADA4A9AEAFB0B1B29A9A9A9B8E5D5D5D401D5D5D5D5D5D
        5D5F6C6AA7847A7A7A7AA3A8A994AA9A9A9A9A9B8E5D5D5D5D3F5D5D5D5D5D5D
        5D646B74A283828282827AA3A4A5A69A9A9A9B8E5D5D5D5D5D5D5D5D5D5D5D5D
        5D636A9C9D9E82828282827A9FA0A19A9A9B8E5D5D5D5D5D5D5D1D5D5D5D5D5D
        5F626996978282828282827A9893999A9B8E5D5D5D5D5D5D5D1D1B5D5D5D5D5D
        5F61688F909182828282827A929394958E5D5D5D5D5D5D5D5D1B1A5D5D5D5D5D
        5E606788898A82828282827A8B8C8D8E5D5D5D5D5D5D5D5D5D3E19255D5D5D5D
        5D5F666F7F808182828283848586875D5D5D5D5D5D5D5D5D253D1F245D5D5D5D
        5D5F626E76607778797A7B7C7D7E5F5D5D5D5D5D5D5D5D5D3C1F37235D5D5D5D
        5D5D656D6E6F70717273746A75645D5D5D5D5D5D5D5D5D5D3A3B0139295D5D5D
        5D5D5D6562666768696A6B6C645D5D5D5D5D5D5D5D5D5D2A26010137285D5D5D
        5D5D5D5D5F5F60616263645F5D5D5D5D5D5D5D5D5D5D5D283801000135365D5D
        5D5D5D5D5D5D5E5F5F5D5D5D5D5D5D5D5D5D5D5D5D5D363501000007012C325D
        5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D1B2C010300000001013132
        5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D33340105000000000004052C
        2D2E5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D5D2E2F300106000000000000000201
        2728295D5D5D5D5D5D5D5D5D5D5D5D5D5D2A282B010300000000000000000000
        0121222324255D5D5D5D5D5D5D5D252423262101000000000000000000000000
        0000011718191A1B1C5D5D1D1B1E191F20010000000000000000}
      TabOrder = 1
      OnClick = btnPesquisar2Click
    end
    object rgPesquisar: TRadioGroup
      Left = 4
      Top = 0
      Width = 150
      Height = 89
      Caption = 'Op'#231#227'o de Pesquisa'
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo'
        'Nome'
        'CPF')
      TabOrder = 2
    end
    object edtPesquisa: TEdit
      Left = 160
      Top = 57
      Width = 467
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      OnKeyPress = edtPesquisaKeyPress
    end
  end
  object dsCliente: TDataSource
    DataSet = DataModule1.cdsCliente
    Left = 188
    Top = 206
  end
end