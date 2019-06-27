unit URelatorioParcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, acPNG, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmRelatorioParcelas = class(TForm)
    btnImprimir: TBitBtn;
    frxrprtParcela: TfrxReport;
    frxdbdtstParcela: TfrxDBDataset;
    edtCodigoCliente: TDBEdit;
    lblCodigoCliente: TLabel;
    lblCliente: TLabel;
    edtNomeCliente: TDBEdit;
    btnPesquisar: TBitBtn;
    grp1: TGroupBox;
    rgFiltro1: TRadioGroup;
    rgFiltro2: TRadioGroup;
    grp2: TGroupBox;
    lbl1: TLabel;
    medtDataIni: TMaskEdit;
    lbl2: TLabel;
    medtDatafim: TMaskEdit;
    frxdbdtstCliente: TfrxDBDataset;
    procedure ordena;
    procedure filtrar;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    varfiltro           :string;
    varRelatorioCliente :Integer;
  public
    { Public declarations }
  end;

var
  frmRelatorioParcelas: TfrmRelatorioParcelas;

implementation

uses
  UDados, UPesquisaCliente;

{$R *.dfm}

procedure TfrmRelatorioParcelas.ordena;
begin
 { case rgFiltro2.ItemIndex of
    0:
      varCodigoNome := 'PR_CODIGO';
    1:
      varCodigoNome := 'PR_DESCRICAO';
  end; }
end;

procedure TfrmRelatorioParcelas.btnPesquisarClick(Sender: TObject);
begin
  frmPesquisaCliente := TfrmPesquisaCliente.Create(Self);
  try
    if frmPesquisaCliente.ShowModal= mrOk then
      with DataModule1.sqlCliente do
      begin
        Close;
        DataModule1.cdsCliente.Close;
        DataModule1.cdsParcela.Close;
        DataModule1.sqlCliente.SQL.Text := 'SELECT * FROM CLIENTE WHERE CL_CODIGO ='
        + QuotedStr(IntToStr(frmPesquisaCliente.varcodigoCliente));
          edtCodigoCliente.Text := IntToStr(frmPesquisaCliente.varcodigoCliente);
          varRelatorioCliente := frmPesquisaCliente.varcodigoCliente;
          DataModule1.cdsCliente.Open;
          edtCodigoCliente.Enabled := True;
          edtNomeCliente.Enabled   := True;
       end;
  finally
    frmPesquisaCliente.Free;
  end;
end;

procedure TfrmRelatorioParcelas.filtrar;
begin
  case rgFiltro1.ItemIndex of
    0:
      varfiltro := 'S';
    1:
      varFiltro := 'N';
    2:
      varFiltro := 'T';
  end
end;


procedure TfrmRelatorioParcelas.btnImprimirClick(Sender: TObject);
var
    varDataInicio   :string;
    varDataFim      :string;
begin
  DataModule1.sqlParcela.Close;
  DataModule1.sqlParcela.SQL.Clear;
  DataModule1.sqlParcela.SQL.Text := 'SELECT' +
                                     'L.VD_DATA_EMISSAO,' +
                                     'X.PA_VENDA_ID,' +
                                     'X.PA_PARCELA,' +
                                     'X.PA_DATA_VENCIMENTO,' +
                                     'X.PA_DATA_PGTO,' +
                                     'X.PA_PAGO,' +
                                     'X.PA_VALOR' +
                                     'FROM PARCELA X' +
                                     'INNER JOIN VENDA L' +
                                     'ON L.VD_NUMERO = X.PA_VENDA_ID' +
                                     'INNER JOIN CLIENTE R' +
                                     'ON R.CL_CODIGO = L.VD_CLIENTE' +
                                     'WHERE R.CL_CODIGO = :cliente' +
                                     'AND L.VD_DATA_EMISSAO BETWEEN :datainicio AND :datafim ';
    varDataInicio := FormatDateTime('MM/DD/YYYY', StrToDate(medtDataIni.Text));
    varDataFim    := FormatDateTime('MM/DD/YYYY', StrToDate(medtDatafim.Text));
    DataModule1.sqlParcela.ParamByName('datainicio').AsString := vardataInicio;
    DataModule1.sqlParcela.ParamByName('datafim').AsString := vardataFim;
    DataModule1.sqlParcela.ParamByName('cliente').AsInteger := varrelatorioCliente;
    filtrar;
  if ((varfiltro = 'S') or (varFiltro = 'N')) then
  begin
    DataModule1.sqlParcela.SQL.Add('AND X.PA_PAGO = ' + QuotedStr(varFiltro));
  end;
    DataModule1.sqlParcela.SQL.Add('ORDER BY 1 ');
    DataModule1.sqlParcela.Open;
    frxrprtParcela.ShowReport();
    DataModule1.sqlParcela.Close;
end;
end.