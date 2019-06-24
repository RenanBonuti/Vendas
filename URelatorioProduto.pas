unit URelatorioProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, frxClass,
  frxDBSet, Vcl.ExtCtrls;

type
  TfrmRelatorioProduto = class(TForm)
    Panel1: TPanel;
    frxrprtProduto: TfrxReport;
    frxdbdtstProduto: TfrxDBDataset;
    btnImprimir: TBitBtn;
    rgRelatorio: TRadioGroup;
    btnSair: TBitBtn;
    pnl1: TPanel;
    rgFiltro: TRadioGroup;
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioProduto: TfrmRelatorioProduto;

implementation

uses
  UDados, UCadastroProdutos, UPesquisaProduto;

{$R *.dfm}

procedure TfrmRelatorioProduto.btnImprimirClick(Sender: TObject);
begin
    with DataModule1.sqlProduto do
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM PRODUTO');

    case rgRelatorio.ItemIndex of
      0:
      begin;
        SQL.Add('SELECT * FROM PRODUTO WHERE PR_ATIVO = S');
      end;
      1:
      begin;
        SQL.Add('SELECT * FROM PRODUTO WHERE PR_ATIVO = S');
      end;
    end;


    DataModule1.cdsProduto.Open;
    frxdbdtstProduto.LoadFromFile('D:\Meu projetos\Fontes\Vendas\RelProduto.fr3');
    frxdbdtstProduto.PrepareReport(True);
    frxdbdtstProduto.ShowReport;

  end;
  with  DataModule1.cdsProduto do
  begin
    Close;
    Open;

    if RecordCount = 0 then
    begin
      ShowMessage('Nenhum registro encontrado com esses dados!');
      Exit;
    end;
  end;
end;

end.
