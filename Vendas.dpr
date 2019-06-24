program Vendas;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  UCadastroClientes in 'UCadastroClientes.pas' {frmCadastroClientes},
  UCadastroProdutos in 'UCadastroProdutos.pas' {frmCadastroProdutos},
  UVendas in 'UVendas.pas' {frmVendas},
  URelatorioClientes in 'URelatorioClientes.pas' {frmRelatorioClientes},
  UReimpressaoCupomVenda in 'UReimpressaoCupomVenda.pas' {frmReimpressaoCupomVenda},
  URelatorioCatalogoPrecos in 'URelatorioCatalogoPrecos.pas' {frmRelatorioCatalogoPrecos},
  UDados in 'UDados.pas' {DataModule1: TDataModule},
  UValidaCpf in 'UValidaCpf.pas',
  UPesquisaCliente in 'UPesquisaCliente.pas' {frmPesquisaCliente},
  UPesquisaProduto in 'UPesquisaProduto.pas' {frmPesquisaProduto},
  URelatorioProdutos in 'URelatorioProdutos.pas' {frmRelatorioProdutos},
  UPesquisaVenda in 'UPesquisaVenda.pas' {frmPesquisaVenda},
  UImpressaoCupom in 'UImpressaoCupom.pas' {frmImpressaoCupom};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
