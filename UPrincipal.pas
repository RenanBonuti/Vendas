unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    mm1: TMainMenu;
    C1: TMenuItem;
    r1: TMenuItem;
    s1: TMenuItem;
    S2: TMenuItem;
    mnCadastroClientes: TMenuItem;
    mnCadastroProdutos: TMenuItem;
    mnVendas: TMenuItem;
    mnRelCadastroClientes: TMenuItem;
    mnRelRelatoriosProdutos: TMenuItem;
    mnRelCatalogoPrecos: TMenuItem;
    mnRelReimpressaoCupomVen: TMenuItem;
    Timer: TTimer;
    StatusBar1: TStatusBar;
    procedure S2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnCadastroClientesClick(Sender: TObject);
    procedure mnCadastroProdutosClick(Sender: TObject);
    procedure mnVendasClick(Sender: TObject);
    procedure mnRelCadastroClientesClick(Sender: TObject);
    procedure mnRelReimpressaoCupomVenClick(Sender: TObject);
    procedure mnRelCatalogoPrecosClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnRelRelatoriosProdutosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  UCadastroClientes, UCadastroProdutos, UVendas, URelatoriosCatalogoPrecos, UReimpressaoCupomVenda, URelatorioClientes, URelatorioProdutos, URelatorioCatalogoPrecos, UDados;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  DataModule1 := TDataModule1.Create(Self);
end;

procedure TfrmPrincipal.mnCadastroClientesClick(Sender: TObject);
begin
   frmCadastroClientes := TfrmCadastroClientes.Create(nil);
    try
      frmCadastroClientes.ShowModal;
    finally
      FreeAndNil(frmCadastroClientes);
    end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja Realmente Sair do Sistema?','Informa��o',MB_YESNO+MB_ICONQUESTION)= mrYes then
     Application.Terminate
   else
   Abort;
end;

procedure TfrmPrincipal.mnCadastroProdutosClick(Sender: TObject);
begin
  frmCadastroProdutos := TfrmCadastroProdutos.Create(nil);
    try
      frmCadastroProdutos.ShowModal;
    finally
      FreeAndNil(frmCadastroProdutos);
    end;
end;

procedure TfrmPrincipal.mnRelCadastroClientesClick(Sender: TObject);
begin
   frmRelatorioClientes := TfrmRelatorioClientes.Create(nil);
    try
      frmRelatorioClientes.ShowModal;
    finally
      FreeAndNil(frmRelatorioClientes);
    end;
end;

procedure TfrmPrincipal.mnRelCatalogoPrecosClick(Sender: TObject);
begin
   frmRelatorioCatalogoPrecos := TfrmRelatorioCatalogoPrecos.Create(nil);
    try
      frmRelatorioCatalogoPrecos.ShowModal;
    finally
     FreeAndNil(frmRelatorioCatalogoPrecos);
    end;
end;

procedure TfrmPrincipal.mnRelReimpressaoCupomVenClick(Sender: TObject);
begin
  frmReimpressaoCupomVenda := TfrmReimpressaoCupomVenda.Create(nil);
    try
      frmReimpressaoCupomVenda.ShowModal;
    finally
      FreeAndNil(frmReimpressaoCupomVenda);
    end;
end;

procedure TfrmPrincipal.mnRelRelatoriosProdutosClick(Sender: TObject);
begin
    frmRelatorioProdutos := TfrmRelatorioProdutos.Create(nil);
    try
      frmRelatorioProdutos.ShowModal;
    finally
      FreeAndNil(frmRelatorioProdutos);
    end;
end;

procedure TfrmPrincipal.S2Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente sair do sistema?','Informa��o',MB_YESNO+MB_ICONQUESTION)= mrYes then
     Application.Terminate
   else
   Abort;
end;

procedure TfrmPrincipal.TimerTimer(Sender: TObject);
begin
    Statusbar1.Panels.Items[0].Text := DateTimetoSTR(now);
    Statusbar1.Panels.Items[1].Text := ('Servidor: Base Teste');
    Statusbar1.Panels.Items[2].Text := ('Sistec - S�o Joaquim da Barra-SP');
end;

procedure TfrmPrincipal.mnVendasClick(Sender: TObject);
begin
  frmVendas := TfrmVendas.Create(nil);
    try
      frmVendas.ShowModal;
    finally
      FreeAndNil(frmVendas);
    end;
end;

end.
