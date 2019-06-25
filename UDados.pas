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
    cdsProdutoPR_CODIGO: TIntegerField;
    strngfldProdutoPR_DESCRICAO: TStringField;
    cdsProdutoPR_VALOR_UNITARIO: TFMTBCDField;
    strngfldProdutoPR_ATIVO: TStringField;
    cdsProdutoPR_ESTOQUE: TIntegerField;
    strngfldRelClienteCL_RG: TStringField;
    strngfldRelClienteCL_CNPJ: TStringField;
    strngfldRelClienteCL_IE: TStringField;
    strngfldRelClienteCL_ENDERECO: TStringField;
    strngfldRelClienteCL_NUMERO: TStringField;
    strngfldRelClienteCL_BAIRRO: TStringField;
    strngfldRelClienteCL_CIDADE: TStringField;
    strngfldRelClienteCL_UF: TStringField;
    strngfldRelClienteCL_CEP: TStringField;
    strngfldRelClienteCL_TIPOSUJEITO: TStringField;
    cdsRelClienteCL_CODIGO: TIntegerField;
    strngfldRelClienteCL_NOME: TStringField;
    strngfldRelClienteCL_CPF: TStringField;
    dtfldRelClienteCL_DATA_NASCIMENTO: TDateField;
    strngfldRelClienteCL_ATIVO: TStringField;
    strngfldRelClienteCL_RG1: TStringField;
    strngfldRelClienteCL_CNPJ1: TStringField;
    strngfldRelClienteCL_IE1: TStringField;
    strngfldRelClienteCL_ENDERECO1: TStringField;
    strngfldRelClienteCL_NUMERO1: TStringField;
    strngfldRelClienteCL_BAIRRO1: TStringField;
    strngfldRelClienteCL_CIDADE1: TStringField;
    strngfldRelClienteCL_UF1: TStringField;
    strngfldRelClienteCL_CEP1: TStringField;
    strngfldRelClienteCL_TIPOSUJEITO1: TStringField;
    strngfldVendaVD_CONDPGTO: TStringField;
    cdsVendaVD_NUMERO: TIntegerField;
    dtfldVendaVD_DATA_EMISSAO: TDateField;
    strngfldVendaVD_SITUACAO: TStringField;
    sqlVendaVD_VALOR_TOTAL: TFMTBCDField;
    strngfldVendaVD_OBSERVACAO: TStringField;
    cdsVendaVD_CLIENTE1: TIntegerField;
    strngfldVendaVD_CONDPGTO1: TStringField;
    procedure cdsVendaAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

uses
  UVendas;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.cdsVendaAfterInsert(DataSet: TDataSet);
begin
  cdsVenda.FieldByName('VD_CONDPGTO').AsString := '0/';
end;

end.
