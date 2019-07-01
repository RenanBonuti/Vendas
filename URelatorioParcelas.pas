unit URelatorioParcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxDBSet, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, acPNG, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls,DateUtils,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient;

type
  TfrmRelatorioParcelas = class(TForm)
    btnImprimir: TBitBtn;
    frxrprtParcela: TfrxReport;
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
    frxdbdtst1: TfrxDBDataset;
    btn1: TBitBtn;
    frxrprtParcela2: TfrxReport;
    frxrprtParcela1: TfrxReport;
    procedure ordena;
    procedure filtrar;
    procedure ImprimePorNome;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    varfiltro           :string;
    varRelatorioCliente :Integer;
    varCaminho          :String;
    varNomeRelatorio    :String;
  public
    { Public declarations }
  end;

var
  frmRelatorioParcelas: TfrmRelatorioParcelas;

implementation

uses
  UDados, UPesquisaCliente, UMesExtenso;

{$R *.dfm}

procedure TfrmRelatorioParcelas.ordena;
begin
  case rgFiltro2.ItemIndex of
    0:
    begin
        DataModule1.sqlRelParcela.SQL.add( ' ORDER BY CL_CODIGO');
    end;
    1:
    begin
        DataModule1.sqlRelParcela.SQL.add( ' ORDER BY X.PA_DATA_VENCIMENTO');
    end;
  end;
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


procedure TfrmRelatorioParcelas.btn1Click(Sender: TObject);
begin
    medtDataIni.Text := '25/06/2019';
    medtDatafim.Text := '28/06/2019';
end;

procedure TfrmRelatorioParcelas.ImprimePorNome;
var
    varDataInicio    :string;
    varDataFim       :string;
    varCaminho       :string;
    varNomeRelatorio :string;
begin
  DataModule1.cdsRelParcela.Close;
  DataModule1.sqlRelParcela.SQL.Clear;
  DataModule1.sqlRelParcela.SQL.Text := 'SELECT ' +
                                            'Extract(Month from X.pa_data_vencimento), ' +
                                            'EXTRACT(Year from X.pa_data_vencimento) as ANO, ' +
                                            'CASE Extract(Month from X.pa_data_vencimento) ' +
                                            'WHEN ''1'' THEN ''Janeiro'''  +
                                            'WHEN ''2'' THEN ''Fevereiro'''  +
                                            'WHEN ''3'' THEN ''Mar�o''' +
                                            'WHEN ''4'' THEN ''Abril''' +
                                            'WHEN ''5'' THEN ''Maio''' +
                                            'WHEN ''6'' THEN ''Junho''' +
                                            'WHEN ''7'' THEN ''Julho''' +
                                            'WHEN ''8'' THEN ''Agosto''' +
                                            'WHEN ''9'' THEN ''Setembro''' +
                                            'WHEN ''10'' THEN ''Outubro''' +
                                            'WHEN ''11'' THEN ''Novembro''' +
                                            'WHEN ''12'' THEN ''Dezembro''' +
                                            'ELSE '''' END AS Mes, ' +
                                            'R.CL_CODIGO, ' +
                                            'R.CL_NOME, ' +
                                            'L.VD_DATA_EMISSAO, ' +
                                            'X.PA_VENDA_ID, ' +
                                            'X.PA_PARCELA, ' +
                                            'X.PA_DATA_VENCIMENTO, ' +
                                            'X.PA_DATA_PGTO, ' +
                                            'X.PA_PAGO, ' +
                                            'X.PA_VALOR ' +
                                            'from PARCELA X ' +
                                            'INNER JOIN VENDA L ' +
                                            'ON L.VD_NUMERO = X.PA_VENDA_ID ' +
                                            'INNER JOIN CLIENTE R ' +
                                            'ON R.CL_CODIGO = L.VD_CLIENTE ' +
                                            'WHERE L.VD_DATA_EMISSAO ' +
                                            'BETWEEN :datainicio and :datafim ';
    varDataInicio := FormatDateTime('MM/DD/YYYY', StrToDate(medtDataIni.Text));
    varDataFim    := FormatDateTime('MM/DD/YYYY', StrToDate(medtDatafim.Text));
    DataModule1.sqlRelParcela.ParamByName('datainicio').AsString := vardataInicio;
    DataModule1.sqlRelParcela.ParamByName('datafim').AsString    := vardataFim;

    if varRelatorioCliente <> 0 then
      begin
        DataModule1.sqlRelParcela.SQL.Add(' AND R.CL_CODIGO = ' + QuotedStr(IntToStr(varRelatorioCliente)));
      end;
      filtrar;
    if ((varfiltro = 'S') or (varFiltro = 'N')) then
      begin
        DataModule1.sqlRelParcela.SQL.Add('AND X.PA_PAGO = ' + QuotedStr(varFiltro));
      end;
     ordena;
end;

procedure TfrmRelatorioParcelas.btnImprimirClick(Sender: TObject);
begin

    case rgFiltro2.ItemIndex of
    0:
      begin
        ImprimePorNome;
        DataModule1.cdsRelParcela.Open;
        frxrprtParcela1.ShowReport();
      end;
    1:
      begin
        ImprimePorNome;
        DataModule1.cdsRelParcela.Open;
        frxrprtParcela2.ShowReport();
      end;
    end;
end;


end.
