object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 331
  Width = 909
  object DadosVendas: TSQLConnection
    DriverName = 'Firebird'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=127.0.0.1/3050:D:\Meu projetos\Dados\VENDAS.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Connected = True
    Left = 56
    Top = 40
  end
  object sqlCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    SQLConnection = DadosVendas
    Left = 56
    Top = 104
    object cdsClienteCL_CODIGO1: TIntegerField
      FieldName = 'CL_CODIGO'
      Required = True
    end
    object strngfldClienteCL_NOME: TStringField
      FieldName = 'CL_NOME'
      Size = 50
    end
    object strngfldClienteCL_CPF: TStringField
      FieldName = 'CL_CPF'
      Size = 11
    end
    object dtfldClienteCL_DATA_NASCIMENTO: TDateField
      FieldName = 'CL_DATA_NASCIMENTO'
    end
    object strngfldClienteCL_ATIVO: TStringField
      FieldName = 'CL_ATIVO'
      Size = 1
    end
    object strngfldClienteCL_RG: TStringField
      FieldName = 'CL_RG'
    end
    object strngfldClienteCL_TIPOSUJEITO: TStringField
      FieldName = 'CL_TIPOSUJEITO'
      Size = 1
    end
    object strngfldClienteCL_CNPJ: TStringField
      FieldName = 'CL_CNPJ'
    end
    object strngfldClienteCL_IE: TStringField
      FieldName = 'CL_IE'
    end
    object strngfldClienteCL_ENDERECO: TStringField
      FieldName = 'CL_ENDERECO'
      Size = 50
    end
    object strngfldClienteCL_NUMERO: TStringField
      FieldName = 'CL_NUMERO'
    end
    object strngfldClienteCL_BAIRRO: TStringField
      FieldName = 'CL_BAIRRO'
      Size = 50
    end
    object strngfldClienteCL_CIDADE: TStringField
      FieldName = 'CL_CIDADE'
      Size = 50
    end
    object strngfldClienteCL_UF: TStringField
      FieldName = 'CL_UF'
      Size = 2
    end
    object strngfldClienteCL_CEP: TStringField
      FieldName = 'CL_CEP'
      Size = 10
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = sqlCliente
    Constraints = False
    Left = 168
    Top = 104
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'dspCliente'
    Left = 112
    Top = 104
    object cdsClienteCL_CODIGO: TIntegerField
      FieldName = 'CL_CODIGO'
      Required = True
    end
    object strngfldClienteCL_NOME1: TStringField
      FieldName = 'CL_NOME'
      Size = 50
    end
    object strngfldClienteCL_CPF1: TStringField
      FieldName = 'CL_CPF'
      EditMask = '000.000.000-00;0;'
      Size = 11
    end
    object dtfldClienteCL_DATA_NASCIMENTO1: TDateField
      FieldName = 'CL_DATA_NASCIMENTO'
      EditMask = '!00/00/0000;1;'
    end
    object strngfldClienteCL_ATIVO1: TStringField
      FieldName = 'CL_ATIVO'
      Size = 1
    end
    object strngfldClienteCL_RG1: TStringField
      FieldName = 'CL_RG'
    end
    object strngfldClienteCL_TIPOSUJEITO1: TStringField
      FieldName = 'CL_TIPOSUJEITO'
      Size = 1
    end
    object strngfldClienteCL_CNPJ1: TStringField
      FieldName = 'CL_CNPJ'
    end
    object strngfldClienteCL_IE1: TStringField
      FieldName = 'CL_IE'
    end
    object strngfldClienteCL_ENDERECO1: TStringField
      FieldName = 'CL_ENDERECO'
      Size = 50
    end
    object strngfldClienteCL_NUMERO1: TStringField
      FieldName = 'CL_NUMERO'
    end
    object strngfldClienteCL_BAIRRO1: TStringField
      FieldName = 'CL_BAIRRO'
      Size = 50
    end
    object strngfldClienteCL_CIDADE1: TStringField
      FieldName = 'CL_CIDADE'
      Size = 50
    end
    object strngfldClienteCL_UF1: TStringField
      FieldName = 'CL_UF'
      Size = 2
    end
    object strngfldClienteCL_CEP1: TStringField
      FieldName = 'CL_CEP'
      EditMask = '00000\-000;0;'
      Size = 10
    end
  end
  object sqlProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM  PRODUTO')
    SQLConnection = DadosVendas
    Left = 56
    Top = 176
  end
  object dspProduto: TDataSetProvider
    DataSet = sqlProduto
    Constraints = False
    Left = 168
    Top = 176
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 112
    Top = 176
    object cdsProdutoPR_CODIGO: TIntegerField
      FieldName = 'PR_CODIGO'
      Required = True
    end
    object strngfldProdutoPR_DESCRICAO: TStringField
      FieldName = 'PR_DESCRICAO'
      Size = 150
    end
    object cdsProdutoPR_VALOR_UNITARIO: TFMTBCDField
      FieldName = 'PR_VALOR_UNITARIO'
      DisplayFormat = '#,##0.00;0;'
      Precision = 18
      Size = 2
    end
    object strngfldProdutoPR_ATIVO: TStringField
      FieldName = 'PR_ATIVO'
      Size = 1
    end
    object cdsProdutoPR_ESTOQUE: TIntegerField
      FieldName = 'PR_ESTOQUE'
    end
  end
  object tb_Aux_Impressao: TRxMemoryData
    FieldDefs = <>
    Left = 616
    Top = 48
    object tb_Aux_ImpressaoPR_CODIGO: TIntegerField
      FieldName = 'PR_CODIGO'
    end
    object tb_Aux_ImpressaoPR_DESCRICAO: TStringField
      FieldName = 'PR_DESCRICAO'
      Size = 51
    end
    object tb_Aux_ImpressaoPR_VALOR_UNITARIO: TSingleField
      FieldName = 'PR_VALOR_UNITARIO'
    end
    object tb_Aux_ImpressaoPR_ATIVO: TStringField
      FieldName = 'PR_ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dsRelProduto: TDataSource
    DataSet = cdsProduto
    Left = 696
    Top = 216
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 232
    Top = 107
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 232
    Top = 176
  end
  object sqlVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM VENDA')
    SQLConnection = DadosVendas
    Left = 56
    Top = 248
  end
  object dspVenda: TDataSetProvider
    DataSet = sqlVenda
    Constraints = False
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 168
    Top = 248
  end
  object cdsVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVenda'
    Left = 112
    Top = 248
    object cdsVendaVD: TIntegerField
      FieldName = 'VD_NUMERO'
      Required = True
    end
    object cdsVendaVD_CLIENTE: TIntegerField
      FieldName = 'VD_CLIENTE'
    end
    object cdsVendaVD_DATA_EMISSAO: TDateField
      FieldName = 'VD_DATA_EMISSAO'
    end
    object cdsVendaVD_SITUACAO: TStringField
      FieldName = 'VD_SITUACAO'
      Size = 1
    end
    object cdsVendaVD_VALOR_TOTAL: TFMTBCDField
      FieldName = 'VD_VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object cdsVendaVD_OBSERVACAO: TStringField
      FieldName = 'VD_OBSERVACAO'
      Size = 1000
    end
  end
  object dsVenda: TDataSource
    DataSet = cdsVenda
    Left = 232
    Top = 248
  end
  object sqlItem: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'VD_NUMERO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM ITEM WHERE IV_VENDA = :VD_NUMERO')
    SQLConnection = DadosVendas
    Left = 304
    Top = 112
    object cdsItemIV_VENDA1: TIntegerField
      FieldName = 'IV_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsItemIV_ITEM1: TIntegerField
      FieldName = 'IV_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsItemIV_PRODUTO1: TIntegerField
      FieldName = 'IV_PRODUTO'
    end
    object cdsItemIV_QUANTIDADE1: TIntegerField
      FieldName = 'IV_QUANTIDADE'
    end
    object cdsItemIV_VALOR_UNITARIO1: TSingleField
      FieldName = 'IV_VALOR_UNITARIO'
    end
    object cdsItemIV_TOTAL_ITEM1: TSingleField
      FieldName = 'IV_TOTAL_ITEM'
    end
  end
  object dspItem: TDataSetProvider
    DataSet = sqlItem
    Constraints = False
    UpdateMode = upWhereKeyOnly
    Left = 416
    Top = 112
  end
  object cdsItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItem'
    Left = 360
    Top = 112
    object cdsItemIV_VENDA: TIntegerField
      FieldName = 'IV_VENDA'
    end
    object cdsItemIV_ITEM: TIntegerField
      FieldName = 'IV_ITEM'
    end
    object cdsItemIV_PRODUTO: TIntegerField
      FieldName = 'IV_PRODUTO'
    end
    object cdsItemIV_QUANTIDADE: TIntegerField
      FieldName = 'IV_QUANTIDADE'
    end
    object cdsItemIV_VALOR_UNITARIO: TSingleField
      FieldName = 'IV_VALOR_UNITARIO'
      DisplayFormat = '#,##0.00;0;'
    end
    object cdsItemIV_TOTAL_ITEM: TSingleField
      FieldName = 'IV_TOTAL_ITEM'
      DisplayFormat = '#,##0.00;0;'
    end
  end
  object dsItem: TDataSource
    AutoEdit = False
    DataSet = cdsItem
    Left = 464
    Top = 112
  end
  object sqldtsRelCliente: TSQLDataSet
    CommandText = 'SELECT * FROM CLIENTE;'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DadosVendas
    Left = 312
    Top = 184
    object sqldtsRelClienteCL_CODIGO: TIntegerField
      FieldName = 'CL_CODIGO'
      Required = True
    end
    object sqldtsRelClienteCL_NOME: TStringField
      FieldName = 'CL_NOME'
      Size = 50
    end
    object sqldtsRelClienteCL_CPF: TStringField
      FieldName = 'CL_CPF'
      EditMask = '999\.999\.999\-99;0;'
      Size = 11
    end
    object sqldtsRelClienteCL_DATA_NASCIMENTO: TDateField
      FieldName = 'CL_DATA_NASCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object sqldtsRelClienteCL_ATIVO: TStringField
      FieldName = 'CL_ATIVO'
      Size = 1
    end
    object strngfldRelClienteCL_RG: TStringField
      FieldName = 'CL_RG'
    end
    object strngfldRelClienteCL_CNPJ: TStringField
      FieldName = 'CL_CNPJ'
    end
    object strngfldRelClienteCL_IE: TStringField
      FieldName = 'CL_IE'
    end
    object strngfldRelClienteCL_ENDERECO: TStringField
      FieldName = 'CL_ENDERECO'
      Size = 50
    end
    object strngfldRelClienteCL_NUMERO: TStringField
      FieldName = 'CL_NUMERO'
    end
    object strngfldRelClienteCL_BAIRRO: TStringField
      FieldName = 'CL_BAIRRO'
      Size = 50
    end
    object strngfldRelClienteCL_CIDADE: TStringField
      FieldName = 'CL_CIDADE'
      Size = 50
    end
    object strngfldRelClienteCL_UF: TStringField
      FieldName = 'CL_UF'
      Size = 2
    end
    object strngfldRelClienteCL_CEP: TStringField
      FieldName = 'CL_CEP'
      EditMask = '99999-000;1;_'
      Size = 10
    end
    object strngfldRelClienteCL_TIPOSUJEITO: TStringField
      FieldName = 'CL_TIPOSUJEITO'
      FixedChar = True
      Size = 1
    end
  end
  object dtstprRelCliente: TDataSetProvider
    DataSet = sqldtsRelCliente
    Left = 392
    Top = 184
  end
  object cdsRelCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtstprRelCliente'
    Left = 464
    Top = 184
    object cdsRelClienteCL_CODIGO: TIntegerField
      FieldName = 'CL_CODIGO'
      Required = True
    end
    object strngfldRelClienteCL_NOME: TStringField
      FieldName = 'CL_NOME'
      Size = 50
    end
    object strngfldRelClienteCL_CPF: TStringField
      FieldName = 'CL_CPF'
      EditMask = '999\.999\.999\-99;0;'
      Size = 11
    end
    object dtfldRelClienteCL_DATA_NASCIMENTO: TDateField
      FieldName = 'CL_DATA_NASCIMENTO'
    end
    object strngfldRelClienteCL_ATIVO: TStringField
      FieldName = 'CL_ATIVO'
      Size = 1
    end
    object strngfldRelClienteCL_RG1: TStringField
      FieldName = 'CL_RG'
    end
    object strngfldRelClienteCL_CNPJ1: TStringField
      FieldName = 'CL_CNPJ'
      EditMask = '!99\.999\.999\/9999\-99;0;_'
    end
    object strngfldRelClienteCL_IE1: TStringField
      FieldName = 'CL_IE'
    end
    object strngfldRelClienteCL_ENDERECO1: TStringField
      FieldName = 'CL_ENDERECO'
      Size = 50
    end
    object strngfldRelClienteCL_NUMERO1: TStringField
      FieldName = 'CL_NUMERO'
    end
    object strngfldRelClienteCL_BAIRRO1: TStringField
      FieldName = 'CL_BAIRRO'
      Size = 50
    end
    object strngfldRelClienteCL_CIDADE1: TStringField
      FieldName = 'CL_CIDADE'
      Size = 50
    end
    object strngfldRelClienteCL_UF1: TStringField
      FieldName = 'CL_UF'
      Size = 2
    end
    object strngfldRelClienteCL_CEP1: TStringField
      FieldName = 'CL_CEP'
      EditMask = '99999\-999;0;_'
      Size = 10
    end
    object strngfldRelClienteCL_TIPOSUJEITO1: TStringField
      FieldName = 'CL_TIPOSUJEITO'
      FixedChar = True
      Size = 1
    end
  end
  object sqlItemCupom: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftUnknown
        Name = 'IV_VENDA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT MAX(IV_ITEM) FROM ITEM  WHERE  IV_VENDA =  :IV_VENDA'
      ''
      ''
      '')
    SQLConnection = DadosVendas
    Left = 280
    Top = 24
  end
  object cdsItemCupom: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItemCupom'
    Left = 360
    Top = 24
  end
  object dspItemCupom: TDataSetProvider
    DataSet = sqlItemCupom
    Constraints = False
    UpdateMode = upWhereKeyOnly
    Left = 456
    Top = 24
  end
  object dsItemCupom: TDataSource
    AutoEdit = False
    DataSet = cdsItemCupom
    Left = 528
    Top = 24
  end
end
