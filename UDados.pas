unit UDados;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.FMTBcd, Data.SqlExpr,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, RxMemDS;

type
  TDataModule1 = class(TDataModule)
    DadosVendas: TSQLConnection;
    sqlCliente: TSQLQuery;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    sqlProduto: TSQLQuery;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    tb_Aux_Impressao: TRxMemoryData;
    tb_Aux_ImpressaoPR_CODIGO: TIntegerField;
    tb_Aux_ImpressaoPR_DESCRICAO: TStringField;
    tb_Aux_ImpressaoPR_VALOR_UNITARIO: TSingleField;
    tb_Aux_ImpressaoPR_ATIVO: TStringField;
    dsRelProduto: TDataSource;
    dsCliente: TDataSource;
    dsProduto: TDataSource;
    sqlVenda: TSQLQuery;
    dspVenda: TDataSetProvider;
    cdsVenda: TClientDataSet;
    dsVenda: TDataSource;
    sqlItem: TSQLQuery;
    dspItem: TDataSetProvider;
    cdsItem: TClientDataSet;
    dsItem: TDataSource;
    cdsVendaVD: TIntegerField;
    cdsVendaVD_CLIENTE: TIntegerField;
    cdsVendaVD_DATA_EMISSAO: TDateField;
    cdsVendaVD_SITUACAO: TStringField;
    cdsVendaVD_VALOR_TOTAL: TFMTBCDField;
    cdsVendaVD_OBSERVACAO: TStringField;
    cdsProdutoPR_CODIGO: TIntegerField;
    cdsProdutoPR_DESCRICAO: TStringField;
    cdsPrValUni: TFMTBCDField;
    cdsProdutoPR_ATIVO: TStringField;
    sqldtsRelCliente: TSQLDataSet;
    sqldtsRelClienteCL_CODIGO: TIntegerField;
    sqldtsRelClienteCL_NOME: TStringField;
    sqldtsRelClienteCL_CPF: TStringField;
    sqldtsRelClienteCL_DATA_NASCIMENTO: TDateField;
    sqldtsRelClienteCL_ATIVO: TStringField;
    dtstprRelCliente: TDataSetProvider;
    cdsRelCliente: TClientDataSet;
    cdsItemIV_VENDA: TIntegerField;
    cdsItemIV_ITEM: TIntegerField;
    cdsItemIV_PRODUTO: TIntegerField;
    cdsItemIV_QUANTIDADE: TIntegerField;
    cdsItemIV_VALOR_UNITARIO: TSingleField;
    cdsItemIV_TOTAL_ITEM: TSingleField;
    cdsItemIV_VENDA1: TIntegerField;
    cdsItemIV_ITEM1: TIntegerField;
    cdsItemIV_PRODUTO1: TIntegerField;
    cdsItemIV_QUANTIDADE1: TIntegerField;
    cdsItemIV_VALOR_UNITARIO1: TSingleField;
    cdsItemIV_TOTAL_ITEM1: TSingleField;
    sqlItemCupom: TSQLQuery;
    cdsItemCupom: TClientDataSet;
    dspItemCupom: TDataSetProvider;
    dsItemCupom: TDataSource;
    cdsClienteCL_CODIGO1: TIntegerField;
    strngfldClienteCL_NOME: TStringField;
    strngfldClienteCL_CPF: TStringField;
    dtfldClienteCL_DATA_NASCIMENTO: TDateField;
    strngfldClienteCL_ATIVO: TStringField;
    strngfldClienteCL_RG: TStringField;
    strngfldClienteCL_TIPOSUJEITO: TStringField;
    strngfldClienteCL_CNPJ: TStringField;
    strngfldClienteCL_IE: TStringField;
    strngfldClienteCL_ENDERECO: TStringField;
    strngfldClienteCL_NUMERO: TStringField;
    strngfldClienteCL_BAIRRO: TStringField;
    strngfldClienteCL_CIDADE: TStringField;
    strngfldClienteCL_UF: TStringField;
    strngfldClienteCL_CEP: TStringField;
    cdsClienteCL_CODIGO: TIntegerField;
    strngfldClienteCL_NOME1: TStringField;
    strngfldClienteCL_CPF1: TStringField;
    dtfldClienteCL_DATA_NASCIMENTO1: TDateField;
    strngfldClienteCL_ATIVO1: TStringField;
    strngfldClienteCL_RG1: TStringField;
    strngfldClienteCL_TIPOSUJEITO1: TStringField;
    strngfldClienteCL_CNPJ1: TStringField;
    strngfldClienteCL_IE1: TStringField;
    strngfldClienteCL_ENDERECO1: TStringField;
    strngfldClienteCL_NUMERO1: TStringField;
    strngfldClienteCL_BAIRRO1: TStringField;
    strngfldClienteCL_CIDADE1: TStringField;
    strngfldClienteCL_UF1: TStringField;
    strngfldClienteCL_CEP1: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
