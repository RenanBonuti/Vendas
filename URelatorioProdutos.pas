unit URelatorioProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, acPNG;

type
  TfrmRelatorioProdutos = class(TForm)
    btnImprimir: TBitBtn;
    frxrprtProduto: TfrxReport;
    frxProduto: TfrxDBDataset;
    rgFiltro2: TRadioGroup;
    rgFiltro1: TRadioGroup;
    img1: TImage;
    procedure ordena;
    procedure filtrar;
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   varCodigoNome  :string;
   varFiltro      :string;

  end;

var
  frmRelatorioProdutos: TfrmRelatorioProdutos;

implementation

uses
  UDados;

{$R *.dfm}

procedure TfrmRelatorioProdutos.ordena;
begin
  case rgFiltro2.ItemIndex of
    0:
      varCodigoNome := 'PR_CODIGO';
    1:
      varCodigoNome := 'PR_DESCRICAO';
  end;
end;

procedure TfrmRelatorioProdutos.btnImprimirClick(Sender: TObject);
begin
  ordena;
  filtrar;
  DataModule1.cdsProduto.Close;
  DataModule1.sqlProduto.SQL.Clear;
  DataModule1.sqlProduto.SQL.Text :=
    'SELECT PR_CODIGO,PR_DESCRICAO,PR_VALOR_UNITARIO, CASE WHEN PR_ATIVO = ' +
    QuotedStr('A') + ' THEN ' + QuotedStr('ATIVO') + ' ELSE ' +
    QuotedStr('INATIVO') + ' END AS PR_ATIVO FROM PRODUTO ';
  if (varFiltro = 'A') or (varFiltro = 'I') then
  begin
    DataModule1.sqlProduto.SQL.Add('WHERE PR_ATIVO =' + QuotedStr(varFiltro));
  end;
  DataModule1.sqlProduto.SQL.Add(' ORDER BY ' + varCodigoNome + ' ASC');
  DataModule1.cdsProduto.Open;
  frxrprtProduto.ShowReport();
  DataModule1.sqlProduto.Close;
end;

procedure TfrmRelatorioProdutos.filtrar;
begin
  case rgFiltro1.ItemIndex of
    0:
      varfiltro := 'A';
    1:
      varFiltro := 'I';
    2:
      varFiltro := 'T';
  end
end;





end.
