unit URelatorioClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Data.DB, acPNG;

type
  TfrmRelatorioClientes = class(TForm)
    bvl1: TBevel;
    rgFiltro1: TRadioGroup;
    rgFiltro2: TRadioGroup;
    btnImprimir: TBitBtn;
    relClientes: TRLReport;
    rlbnd1: TRLBand;
    rlsystmnf1: TRLSystemInfo;
    rlbnd3: TRLBand;
    rldbtxtCL_CODIGO: TRLDBText;
    rldbNome: TRLDBText;
    rldbDataNas: TRLDBText;
    rldbCpf: TRLDBText;
    rldbStatus: TRLDBText;
    rlbnd4: TRLBand;
    rlsystmnf3: TRLSystemInfo;
    rlsystmnf4: TRLSystemInfo;
    dsRelCliente: TDataSource;
    img1: TImage;
    rlbl6: TRLLabel;
    rlbl7: TRLLabel;
    rlbl1: TRLLabel;
    rlbl2: TRLLabel;
    rlbl3: TRLLabel;
    rlbl4: TRLLabel;
    rldbtxtCL_CPF: TRLDBText;
    rlbl5: TRLLabel;
    rldbtxtCL_RG: TRLDBText;
    rlbl10: TRLLabel;
    rldbtxtCL_CNPJ1: TRLDBText;
    rlbl11: TRLLabel;
    rldbtxtCL_TIPOSUJEITO: TRLDBText;
    rlbl12: TRLLabel;
    rldbtxtCL_ENDERECO: TRLDBText;
    rlbl13: TRLLabel;
    rldbtxtCL_DATA_NASCIMENTO: TRLDBText;
    rldbtxtCL_NUMERO1: TRLDBText;
    rlbl15: TRLLabel;
    rldbtxtCL_DATA_NASCIMENTO1: TRLDBText;
    rlbl16: TRLLabel;
    rldbtxtCL_UF: TRLDBText;
    rlbl17: TRLLabel;
    procedure ordena;
    procedure filtrar;
    procedure btnImprimirClick(Sender: TObject);
    procedure relClientesBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rldbStatusBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure rldbtxtCL_CNPJ1BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  varCodigoNome  :string;
  varFiltro      :string;

  end;

var
  frmRelatorioClientes: TfrmRelatorioClientes;

implementation

uses
  UDados, URelCliente;

{$R *.dfm}

procedure TfrmRelatorioClientes.ordena;
begin
  case rgFiltro2.ItemIndex of
    0:
      varCodigoNome := 'CL_CODIGO';
    1:
      varCodigoNome := 'CL_NOME';
  end;
end;

procedure TfrmRelatorioClientes.relClientesBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  try
    DataModule1.cdsRelCliente.IndexFieldNames := '' + varCodigoNome + '';
    DataModule1.cdsRelCliente.Filter := 'CL_ATIVO = ' + QuotedStr(varFiltro);
    if varFiltro = 'T' then
    begin
      DataModule1.cdsRelCliente.Filtered := False;
    end
    else
      DataModule1.cdsRelCliente.Filtered := True;
  finally
      DataModule1.cdsRelCliente.Open;
  end;
end;

procedure TfrmRelatorioClientes.rldbStatusBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
    if DataModule1.cdsRelCliente.FieldByName('CL_ATIVO').AsString = 'S'  then
       AText := 'Ativo'
    else
       AText := 'Inativo'
end;

procedure TfrmRelatorioClientes.rldbtxtCL_CNPJ1BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
    if DataModule1.cdsRelCliente.FieldByName('CL_TIPOSUJEITO').AsString = 'F'  then
       AText := 'Física'
    else
       AText := 'Júridica'
end;

procedure TfrmRelatorioClientes.filtrar;
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

procedure TfrmRelatorioClientes.btnImprimirClick(Sender: TObject);
begin
    try
      ordena;
      filtrar;
    finally
      relClientes.Prepare;
      relClientes.Preview();
    end;
end;

end.
