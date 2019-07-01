unit UBaixaCancelamentoParcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, frxClass, frxDBSet;

type
  TfrmBaixaCancelamentoParcelas = class(TForm)
    edtCodigoCliente: TDBEdit;
    edtNomeCliente: TDBEdit;
    btnPesquisar: TBitBtn;
    dbgrdParcela: TDBGrid;
    btnParcela: TBitBtn;
    PopMenuParcela: TPopupMenu;
    mniBaixar: TMenuItem;
    mniCancelar: TMenuItem;
    lblCodigoCliente: TLabel;
    lblCliente: TLabel;
    frxrprtRecibo: TfrxReport;
    frxdbdtstRecibo: TfrxDBDataset;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnParcelaClick(Sender: TObject);
    procedure mniBaixarClick(Sender: TObject);
    procedure mniCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopMenuParcelaPopup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    varParcelaCliente   :integer;
  public
    { Public declarations }
  end;

var
  frmBaixaCancelamentoParcelas: TfrmBaixaCancelamentoParcelas;

implementation

uses
  UPesquisaCliente, UDados;

{$R *.dfm}

procedure TfrmBaixaCancelamentoParcelas.btnParcelaClick(Sender: TObject);
begin

    DataModule1.cdsParcela.CommandText :=
                                      ' Select X.PA_VENDA_ID, ' +
                                      '        X.PA_PARCELA, ' +
                                      '        X.PA_DATA_VENCIMENTO, ' +
                                      '        X.PA_DATA_PGTO, ' +
                                      '        X.PA_PAGO, ' +
                                      '        X.PA_VALOR ' +
                                      ' from PARCELA X ' +
                                      ' INNER JOIN VENDA L ' +
                                      ' ON L.VD_NUMERO = X.PA_VENDA_ID ' +
                                      ' LEFT JOIN CLIENTE R ' +
                                      ' ON R.CL_CODIGO = L.VD_CLIENTE ' +
                                      ' WHERE R.CL_CODIGO = ' + IntToStr(varParcelaCliente);
    DataModule1.cdsParcela.Close;
    DataModule1.cdsParcela.Open;

end;

procedure TfrmBaixaCancelamentoParcelas.btnPesquisarClick(Sender: TObject);
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
          varParcelaCliente := frmPesquisaCliente.varcodigoCliente;
          DataModule1.cdsCliente.Open;
          btnParcela.Enabled := True;
          edtCodigoCliente.Enabled := True;
          edtNomeCliente.Enabled   := True;
       end;
  finally
    frmPesquisaCliente.Free;
  end;
end;

procedure TfrmBaixaCancelamentoParcelas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataModule1.cdsParcela.Close;
    DataModule1.cdsCliente.Close;
end;

procedure TfrmBaixaCancelamentoParcelas.FormCreate(Sender: TObject);
begin
    btnParcela.Enabled := False;
end;

procedure TfrmBaixaCancelamentoParcelas.mniBaixarClick(Sender: TObject);
var
    varVenda, varParcela, varData :string;
    registroSelecionado           :Integer;
begin

      try
        varVenda   := dbgrdParcela.Columns[0].Field.Value;
        varParcela := dbgrdParcela.Columns[1].Field.Value;
        varData    := FormatDateTime('MM/DD/YYYY', now);
        registroSelecionado  := DataModule1.cdsParcela.RecNo;
        DataModule1.sqlParcela.Close;
        DataModule1.sqlParcela.SQL.Clear;
        DataModule1.sqlParcela.SQL.Text := 'UPDATE PARCELA SET PA_PAGO =' + QuotedStr('S') +
        ', PA_DATA_PGTO = ' + QuotedStr(varData) + 'WHERE PA_VENDA_ID =' +
        QuotedStr(varVenda) + ' AND PA_PARCELA = ' + QuotedStr(varParcela);
        DataModule1.sqlParcela.ExecSQL(true);
      finally
        ShowMessage('Parcela Baixada com sucesso');
        DataModule1.cdsParcela.Close;
        DataModule1.cdsParcela.Open;
        DataModule1.cdsParcela.RecNo := registroSelecionado;
      end;

      if Application.MessageBox('Deseja imprimir um recibo de pagamento?','Impress�o de Recibo',MB_YESNO+MB_ICONQUESTION)= mrYes then
      else
        Abort;
      DataModule1.cdsBaixaParcela.Close;
      DataModule1.sqlBaixaParcela.SQL.Clear;
      DataModule1.sqlBaixaParcela.SQL.Text := ' Select ' +
                                                '         R.CL_CODIGO, ' +
                                                '         R.CL_NOME, ' +
                                                '         X.PA_VENDA_ID, ' +
                                                '         X.PA_PARCELA, ' +
                                                '         X.PA_DATA_VENCIMENTO, ' +
                                                '         X.PA_DATA_PGTO, ' +
                                                '         X.PA_VALOR ' +
                                                ' FROM PARCELA X ' +
                                                ' INNER JOIN VENDA L ' +
                                                ' ON L.VD_NUMERO = X.PA_VENDA_ID ' +
                                                ' INNER JOIN CLIENTE R ' +
                                                ' ON R.CL_CODIGO = L.VD_CLIENTE ' +
                                                ' WHERE r.cl_codigo = :cliente ' +
                                                ' AND X.pa_venda_id = :venda ' +
                                                ' AND X.pa_parcela = :parcela ';

     DataModule1.sqlBaixaParcela.ParamByName('cliente').AsString :=  IntToStr(varParcelaCliente);
     DataModule1.sqlBaixaParcela.ParamByName('venda').AsString   :=  varVenda;
     DataModule1.sqlBaixaParcela.ParamByName('parcela').AsString :=  varParcela;
     DataModule1.cdsBaixaParcela.Open;
     frxrprtRecibo.ShowReport();
end;

procedure TfrmBaixaCancelamentoParcelas.mniCancelarClick(Sender: TObject);
var
     varVenda, varParcela :string;
     registroSelecionado  :Integer;

begin
      try
        varVenda   := dbgrdParcela.Columns[0].Field.Value;
        varParcela := dbgrdParcela.Columns[1].Field.Value;
        registroSelecionado  := DataModule1.cdsParcela.RecNo;
        DataModule1.sqlParcela.Close;
        DataModule1.sqlParcela.SQL.Clear;
        DataModule1.sqlParcela.SQL.Text := 'UPDATE PARCELA SET PA_PAGO =' + QuotedStr('N') +
        ', PA_DATA_PGTO = NULL WHERE PA_VENDA_ID =' +
        QuotedStr(varVenda) + ' AND PA_PARCELA = ' + QuotedStr(varParcela);
        DataModule1.sqlParcela.ExecSQL(true);
      finally
        ShowMessage('Parcela cancelada com sucesso');
        DataModule1.cdsParcela.Close;
        DataModule1.cdsParcela.Open;
        DataModule1.cdsParcela.RecNo := registroSelecionado;
      end;
end;

procedure TfrmBaixaCancelamentoParcelas.PopMenuParcelaPopup(Sender: TObject);
begin
  if dbgrdParcela.Columns[3].Field.Value = 'S' then
  begin
    mniBaixar.Visible := false;
    mniCancelar.Visible := true;
    mniBaixar.Enabled := false;
    mniCancelar.Enabled := true;
  end
  else if dbgrdParcela.Columns[3].Field.Value = 'N' then
  begin
    mniCancelar.Visible := false;
    mniBaixar.Visible := true;
    mniCancelar.Enabled := false;
    mniBaixar.Enabled := true;
  end;
end;

end.
