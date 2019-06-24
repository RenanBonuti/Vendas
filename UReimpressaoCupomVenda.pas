unit UReimpressaoCupomVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RDprint;

type
  TfrmReimpressaoCupomVenda = class(TForm)
    rdpCupom: TRDprint;
    procedure ImprimeCupom;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReimpressaoCupomVenda: TfrmReimpressaoCupomVenda;

implementation

uses
  URelatorioClientes, URelatorioProdutos, URelatoriosCatalogoPrecos, UDados;

{$R *.dfm}

procedure TfrmReimpressaoCupomVenda.ImprimeCupom;
begin
{var
  varTotal         :Integer;
  varCerrilhado    :string;
  VarLinha         :integer;
  VarTotalCupom    :double;
  VarAuxTotal      :double;
begin
  varTotal := 0;
  varCerrilhado := '-------------------------------------------------------------------';

  rdpCupom.TamanhoQteLinhas := 1;
  rdpCupom.TamanhoQteColunas := 66;
  rdpCupom.FonteTamanhoPadrao := s20cpp;
  rdpCupom.OpcoesPreview.Preview := false;

  begin
  varCodigoCliente    := StrToInt(edtCodigoCliente.Text);
  varVenCodigoVenda   := StrToInt(edtCodigoVenda.Text);
  varVendaDataEmissao := edtDataVenda.Text;
  varClienteNome      := edtCliente.text;
  end;

  with rdpCupom do
  begin

     Abrir;
      impc(02, 1, '========================================', [Comp12, Negrito]);
      impc(03, 1, 'Nº Venda: ' + IntToStr(varVenCodigoVenda), [Comp12]);
      impc(03, 51, 'Emissão: ' + varVendaDataEmissao, [Comp12]);
      impc(04, 1, 'Cliente: ' + IntToStr(varCodigoCliente), [Comp12]);
      impc(04, 25, ' - ' + varClienteNome, [Comp12]);
      imp(05, 01, varCerrilhado);
      impc(06, 1, 'Item | Produto', [Comp12]);
      impc(07, 36, 'Quantidade | Preço    |   Sub. Total', [Comp12]);
      imp(08, 01, varCerrilhado);
      VarLinha := 09;

      PegaUltimoItem;
      varPrimeiroItem := 1;
      DataModule1.cdsItem.First;
      VarTotalCupom := 0;
    while varPrimeiroItem <= varUltimoItem do
    begin
      with rdpCupom do
      varProdutoItem := DataModule1.cdsItemIV_PRODUTO.Value;
      PegaDescricaoProduto;
      imp(VarLinha, 06, IntToStr(varPrimeiroItem));
      impc(VarLinha, 15, varProdutoDescricao, [Comp12]);
      inc(VarLinha);
      impval(VarLinha, 10, '##0', DataModule1.cdsItemIV_QUANTIDADE.Value, []);
      impval(VarLinha, 27, '##,##0.00', DataModule1.cdsItemIV_VALOR_UNITARIO.Value, []);
      impval(VarLinha, 55, '##,##0.00', DataModule1.cdsItemIV_TOTAL_ITEM.Value, []);
      varSubtotal := DataModule1.cdsItemIV_TOTAL_ITEM.Value;
      VarTotalCupom := VarTotalCupom + varSubtotal;
      inc(varLinha);
      inc(varPrimeiroItem);
      DataModule1.cdsItem.Next;
    end;
      imp(varLinha, 01, varCerrilhado);
      inc(varLinha);
      impc(varLinha, 40, 'Total: |', [Comp12]);
      DataModule1.cdsItem.Filter := 'VD_NUMERO = ' + QuotedStr(IntToStr(varVenCodigoVenda));
      impval(varLinha, 55,'##,##0.00',VarTotalCupom, []);
      inc(varLinha);
      imp(varLinha, 01, varCerrilhado);
      inc(varLinha);
      impc(varLinha, 01, DataModule1.cdsVendaVD_OBSERVACAO.Value, [Comp12]);
      inc(varLinha);
      varLinha := varLinha + 3;
      imp(varLinha, 01, ' ');

      TamanhoQteLinhas := varLinha;
      OpcoesPreview.Preview := true;

    Fechar;
  end;
    rdpCupom.OpcoesPreview.Preview := false;
    rdpCupom.TamanhoQteLinhas := 1;

    }
end;

end.
