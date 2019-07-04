unit UVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.DBXCommon,
  RDprint, acPNG, System.RegularExpressions, dateUtils,System.Math, Data.FMTBcd,
  Data.SqlExpr;

type
  TfrmVendas = class(TForm)
    pnl1: TPanel;
    edtProduto: TDBEdit;
    edtCliente: TDBEdit;
    btnCliente: TBitBtn;
    btnProduto: TBitBtn;
    dbgVenda: TDBGrid;
    editQuantidade: TEdit;
    lblCliente: TLabel;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    edtDataVenda: TDBEdit;
    edtTotal: TDBEdit;
    lblTotal: TLabel;
    btnAdicionar: TBitBtn;
    btnObservacao: TBitBtn;
    memo: TDBMemo;
    edtCodigoCliente: TDBEdit;
    edtCodigoProduto: TDBEdit;
    btnGravarObservacao: TBitBtn;
    btnFinalizar: TBitBtn;
    edtCodigoVenda: TDBEdit;
    lblVenda: TLabel;
    btnPesquisar: TBitBtn;
    btnCupom: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    lblTitulo: TLabel;
    btnRemover: TBitBtn;
    lblEmissao: TLabel;
    btnNovo: TBitBtn;
    edtValUni: TDBEdit;
    lblValorUni: TLabel;
    lblSatus: TLabel;
    rdpCupom: TRDprint;
    img1: TImage;
    sqlVendaParcela: TSQLQuery;
    grpCondicao: TGroupBox;
    edtCondicaoPGTO: TDBEdit;
    lbl1: TLabel;
    btnConfirmaCond: TBitBtn;
    procedure btnProdutoClick(Sender: TObject);
    procedure btnObservacaoClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnGravarObservacaoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure PegaUltimaVenda;
    procedure ControlaVariaveis;
    procedure SubtrairTotal;
    procedure PegaUltimoItem;
    procedure PegaDescricaoProduto;
    procedure ControlaTransacao;
    procedure ParaTransacao;
    procedure RegularExpressions;
    procedure quebraParcela;
    procedure verificaCamposVazios;
    procedure desativaComponentes;
    procedure confimaCondicao;
    procedure finalizaVenda;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCupomClick(Sender: TObject);
    procedure edtCondicaoPGTOEnter(Sender: TObject);
    procedure edtCondicaoPGTOExit(Sender: TObject);
    procedure btnConfirmaCondClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  Transaction:  TDBXTransaction;
  varsomaquantidade    :integer;
  vartotalvenda        :Double;
  varUltimo            :Integer;
  varVencodigoCliente  :Integer;
  varVencodigoProduto  :Integer;
  varVenDataVenda      :string;
  varVenObservacao     :string;
  varVenSituacao       :string;
  varSubtrairTotal     :Double;
  varVenCodigoVenda    :integer;
  varVendaDataEmissao  :string;
  varClienteNome       :string;
  varProdutoItem       :integer;
  varProdutoDescricao  :string;
  varCodigoCliente     :Integer;
  varCodigoVenda       :Integer;
  varPrimeiroItem      :integer;
  varUltimoItem        :integer;
  varlinha             :integer;
  varSubtotal          :double;
  varEmTransacao       :Boolean;
  t                    :TDBXTransaction;
  varCondicaopagamento :string;
  VarTotalCupom        :double;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendas: TfrmVendas;



implementation

uses
  UPesquisaProduto, UPesquisaCliente, UDados, UPesquisaVenda, UPrincipal;

{$R *.dfm}

procedure TfrmVendas.quebraParcela;
var
  varstrLinha          :String;
  varParte             :TStringList;
  varContador          :Integer;
  varVazia             :Boolean;
  varQuantidadeParcela :Integer;
  varValorParcela      :Double;
  varTotalDasParcelas  :Double;
  varDiferenca         :Double;
  varVencimento        :Tdate;
  Vardata              :string;
begin
  varParte := TStringList.Create;
  varParte.Delimiter := '/';
  varParte.DelimitedText := edtCondicaoPGTO.text;
  varContador := 0;
  while  varVazia = False do
  begin
    if varParte[varContador].isEmpty then
    begin
      varVazia := True;
    end
    else
    begin
      varQuantidadeParcela := varContador;
      Inc(varContador);
    end;
  end;
  varContador     := 0;
  varValorParcela := SimpleRoundTo(vartotalvenda /(varQuantidadeParcela+1),-2);
  while   varContador <= varQuantidadeParcela do
  begin
    if varContador = varQuantidadeParcela then
    begin
      varTotalDasParcelas := varValorParcela * (varQuantidadeParcela + 1);
      varDiferenca := SimpleRoundTo((vartotalvenda - varTotalDasParcelas), -2);
      varValorParcela := varDiferenca + varValorParcela;
    end;
    varVencimento := IncDay(StrToDate(edtDataVenda.Text),StrToInt(varParte[varContador]));
    Vardata       := FormatDateTime('MM/DD/YYYY', varVencimento);
    DataModule1.sqlParcela.SQL.Clear;
    DataModule1.sqlParcela.SQL.Text := 'INSERT INTO PARCELA  (PA_VENDA_ID, PA_PARCELA, PA_DATA_VENCIMENTO, PA_VALOR)  VALUES ('
                                      + QuotedStr(edtCodigoVenda.text) + ',' + IntToStr(varContador + 1) + ',' +  QuotedStr(Vardata)  + ','
                                      + QuotedStr(StringReplace(FloatToStr(varValorParcela),',','.', [rfReplaceAll])) +')';
    DataModule1.sqlParcela.ExecSQL(True);
    if varParte[varContador] = '0' then
    begin
      DataModule1.sqlParcela.Close;
      DataModule1.sqlParcela.SQL.Clear;
      DataModule1.sqlParcela.SQL.Text := 'UPDATE PARCELA SET PA_PAGO =' + QuotedStr('S') +
        ', PA_DATA_PGTO = ' + QuotedStr(Vardata) + 'WHERE PA_VENDA_ID =' +
        QuotedStr(edtCodigoVenda.text) + ' AND PA_PARCELA = ' + QuotedStr(IntToStr(varContador + 1));
      DataModule1.sqlParcela.ExecSQL(true);
    end
    else
    begin
      DataModule1.sqlParcela.Close;
      DataModule1.sqlParcela.SQL.Clear;
      DataModule1.sqlParcela.SQL.Text := 'UPDATE PARCELA SET PA_PAGO =' + QuotedStr('N') +
        ' WHERE PA_VENDA_ID =' + QuotedStr(edtCodigoVenda.text) + ' AND PA_PARCELA = ' +
        QuotedStr(IntToStr(varContador + 1));
      DataModule1.sqlParcela.ExecSQL(true);
    end;
    inc(varContador);
  end;
      ShowMessage('Foi gerado ' + IntToStr(varContador) + ' parcela(as) para essa venda, no valor de ' + FloatToStr(varValorParcela) + ' cada!');
End;

procedure TfrmVendas.Regularexpressions;
var
   condpgto   :string;
begin
    condpgto := edtCondicaoPGTO.text;

    if TRegEx.IsMatch(condpgto, '^([0-9]+\/)+$') = False then
      begin
          ShowMessage('Condição de pagamento inválida, uma condição sempre deve ter a parcela segudia pela /');
          edtCondicaoPGTO.SetFocus;
      end
end;

procedure TfrmVendas.ParaTransacao;
begin
    DataModule1.sqlVenda.SQLConnection.RollbackFreeAndNil(Transaction);
    varEmTransacao := false;
end;

procedure TfrmVendas.confimaCondicao;
begin
     if Application.MessageBox('Deseja preencher a condição de pagamento neste momento ?','Aviso',MB_YESNO+MB_ICONQUESTION)= mrYes then
       begin
         desativaComponentes;
         edtCondicaoPGTO.Enabled := True;
         btnConfirmaCond.Enabled := True;
         edtCondicaoPGTO.SetFocus;
       end
      else
      btnCancelar.Enabled     := True;
      btnNovo.Enabled         := True;
      btnPesquisar.Enabled    := True;
      btnConfirmaCond.Enabled := True;
      edtCondicaoPGTO.Enabled := True;
     Abort;
end;

procedure TfrmVendas.desativaComponentes;
begin
    btnPesquisar.Enabled     := False;
    btnNovo.Enabled          := False;
    btnCupom.Enabled         := False;
    btnGravar.Enabled        := False;
    btnCliente.Enabled       := False;
    btnCancelar.Enabled      := False;
    btnProduto.Enabled       := False;
    btnRemover.Enabled       := False;
    btnObservacao.Enabled    := False;
    btnAdicionar.Enabled     := False;
end;

procedure Tfrmvendas.verificaCamposVazios;
begin
    if edtCliente.Text = '' then
    begin
      ShowMessage('Cliente não selecionado !!!');
      btnCliente.SetFocus;
      Abort;
    end;


    if edtProduto.Text = '' then
    begin
      ShowMessage('Produto não selecionado !');
      btnProduto.SetFocus;
      Abort;
    end;

    if editQuantidade.Text = '' then
    begin
      ShowMessage('Informe a quatidade do produto !');
      editQuantidade.SetFocus;
      Abort
    end;


    if dbgVenda.DataSource.DataSet.RecordCount = 0 then
    begin
      ShowMessage('Nenhum produto adicionado a essa venda !');
      btnAdicionar.SetFocus;
      Abort;
    end;
end;

procedure TfrmVendas.ControlaTransacao;
begin
  if varEmTransacao = true then
  begin
    case MessageDlg('Desejar deixar essa venda em aberto?', mtConfirmation,
    [mbYes, mbNo], 0) of
      6:
        begin
          ShowMessage('Venda registrada em aberto!');
          DataModule1.cdsItem.Close;
          DataModule1.sqlVenda.SQLConnection.CommitFreeAndNil(Transaction);
          varEmTransacao := false;
        end;
      7:
        begin
          DataModule1.sqlVenda.SQLConnection.RollbackFreeAndNil(Transaction);
          varEmTransacao := false;
          Exit;
        end;
    end;
  end;

end;

procedure TfrmVendas.SubtrairTotal;
begin
    varSubtrairTotal := StrToFloat(dbgVenda.columns.items[5].field.text)
end;

procedure TfrmVendas.PegaUltimoItem;
begin
    DataModule1.sqlItemCupom.close;
    DataModule1.sqlItemCupom.SQL.Clear;
    DataModule1.sqlItemCupom.SQL.Text := 'SELECT MAX(IV_ITEM) FROM ITEM WHERE IV_VENDA = ' +
    QuotedStr(IntToStr(varVenCodigoVenda));
    DataModule1.sqlItemCupom.ExecSQL(true);
    DataModule1.sqlItemCupom.Open;
    if DataModule1.sqlItemCupom['MAX'] = null then
    begin
      varUltimoItem := 0
    end
    else
    begin
      varUltimoItem := DataModule1.sqlItemCupom['MAX'];
    end;
    Close;
end;

procedure TfrmVendas.finalizaVenda;
begin
        try
          quebraParcela;
          varCondicaopagamento := edtCondicaoPGTO.Text;
          DataModule1.sqlVenda.Close;
          DataModule1.sqlVenda.SQL.Clear;
          DataModule1.sqlVenda.SQL.text :='UPDATE VENDA SET VD_SITUACAO =' + QuotedStr('F') + 'WHERE VD_NUMERO =' + edtCodigoVenda.text;
          DataModule1.sqlVenda.ExecSQL(true);
        finally
          ShowMessage('Venda finalizada com sucesso, aguarde a impressão do cupom');
          lblSatus.Caption := 'FINALIZADA';
          lblSatus.Font.Color   := clGreen;
          btnCupom.Enabled      := True;
          btnCancelar.Enabled   := False;
          btnObservacao.Enabled := False;
          btnFinalizar.Enabled  := False;
          btnGravar.Enabled     := False;
          btnAdicionar.Enabled  := False;
          btnRemover.Enabled    := False;
          btnCliente.Enabled    := False;
          btnProduto.Enabled    := False;
          btncupom.Click;
          DataModule1.cdsItemCupom.Open;
        end
end;

procedure TfrmVendas.PegaDescricaoProduto;
begin
  with DataModule1.sqlProduto do
  begin
    SQL.Clear;
    SQL.Text := 'SELECT PR_DESCRICAO FROM PRODUTO WHERE PR_CODIGO = ' +
      QuotedStr(IntToStr(varProdutoItem));
    ExecSQL(true);
    Open;
    varProdutoDescricao := DataModule1.sqlProduto['PR_DESCRICAO'];
    Close;
  end;
end;



procedure TfrmVendas.ControlaVariaveis;
begin
  varVenCodigoProduto := frmPesquisaProduto.varcodigoproduto;
  varVenDataVenda     := FormatDateTime('MM/DD/YYYY',now);
  varVenObservacao    := memo.Text;
  varVenCodigoVenda   := StrToInt(edtCodigoVenda.Text);
  varCodigoCliente    := StrToInt(edtCodigoCliente.Text);
  varVendaDataEmissao := edtDataVenda.Text;
  varClienteNome      := edtCliente.text;
  vartotalvenda       := StrToFloat(StringReplace(EdtTotal.Text, '.', '', [rfReplaceAll]));
end;


procedure TfrmVendas.edtCondicaoPGTOEnter(Sender: TObject);
begin
    DataModule1.cdsVenda.Edit;
end;

procedure TfrmVendas.edtCondicaoPGTOExit(Sender: TObject);
begin
    RegularExpressions;
end;

procedure TfrmVendas.PegaUltimaVenda;
begin
    try
      Transaction := DataModule1.sqlVenda.SQLConnection.BeginTransaction;
      DataModule1.sqlVenda.SQL.Clear;
      DataModule1.sqlVenda.SQL.Text := 'INSERT INTO VENDA(VD_NUMERO) VALUES(NULL)';
      DataModule1.sqlVenda.ExecSQL(true);
      DataModule1.sqlVenda.SQL.Clear;
      DataModule1.sqlVenda.SQL.Text :=
        'SELECT * FROM VENDA WHERE VD_NUMERO = (SELECT MAX(VD_NUMERO) FROM VENDA)';
      DataModule1.sqlVenda.Open;
      varUltimo := DataModule1.sqlVenda.FieldByName('VD_NUMERO').Value;
      DataModule1.sqlVenda.Close;
    except
      DataModule1.sqlVenda.SQLConnection.RollbackFreeAndNil(Transaction);
    raise;
    end;
end;

procedure TfrmVendas.btnConfirmaCondClick(Sender: TObject);
begin
      if Application.MessageBox('Confirma essa condição de pagamento ? ','Aviso',MB_YESNO+MB_ICONQUESTION)= mrYes then
      begin
          edtCondicaoPGTO.Enabled := False;
          btnConfirmaCond.Enabled := False;
          btnFinalizar.Enabled    := True;
          btnFinalizar.SetFocus;
      end
      else
      Abort;

end;

procedure TfrmVendas.btnAdicionarClick(Sender: TObject);
begin

    if (editQuantidade.Text = '') or (editQuantidade.Text < '1')  then
      begin
        ShowMessage('O campo quantidade está vazio ou com valor 0 !');
      abort
      end
    else;
    DataModule1.sqlProduto.Close;
    DataModule1.sqlProduto.SQL.Clear;
    DataModule1.sqlProduto.SQL.Text := 'SELECT PR_ESTOQUE FROM PRODUTO WHERE PR_CODIGO =' + QuotedStr(edtCodigoProduto.text);
    DataModule1.sqlProduto.Open;
    if (DataModule1.sqlProduto.FieldByName('PR_ESTOQUE').AsInteger >  StrToInt(editQuantidade.text)) then
    begin
        varsomaquantidade := varsomaquantidade + 1;
        dbgVenda.Columns[0].Field.Value := edtCodigoVenda.Text;
        dbgVenda.Columns[1].Field.Value := varsomaquantidade;
        dbgVenda.Columns[2].Field.Value := edtCodigoProduto.Text;
        dbgVenda.Columns[3].Field.Value := edtValUni.Text;
        dbgVenda.Columns[4].Field.Value := editQuantidade.Text;
        dbgVenda.Columns[5].Field.Value := FloatToStr(StrToFloat(edtValUni.text)*StrToFloat(editQuantidade.text));
        vartotalvenda := vartotalvenda + dbgVenda.Columns[5].Field.Value;
        edtTotal.Text := FloatToStr(vartotalvenda);
        edtTotal.Text := FormatFloat('#,##0.00',StrToFloat(edtTotal.Text));
        Datamodule1.sqlProduto.SQL.Text :=  'UPDATE PRODUTO SET PR_ESTOQUE = (SELECT PR_ESTOQUE FROM PRODUTO WHERE PR_CODIGO ='
        + QuotedStr(edtCodigoProduto.Text) + ') - ' + editQuantidade.text
        + 'WHERE PR_CODIGO =' + QuotedStr(edtCodigoProduto.text);
        DataModule1.sqlProduto.ExecSQL(TRUE);
        DataModule1.cdsItem.Append;
        end
    else
    begin
        ShowMessage('Quantidade do produto selecionada maior que a quantidade em estoque do produto !!!');
        Abort;
    end;
end;

procedure TfrmVendas.btnCancelarClick(Sender: TObject);
begin
      if Application.MessageBox('Deseja realmente cancelar essa venda?','Aviso',MB_YESNO+MB_ICONQUESTION)= mrYes then
      else
        Abort;
        try
          DataModule1.sqlVenda.Close;
          DataModule1.sqlVenda.SQL.Clear;
          DataModule1.sqlVenda.SQL.text :='UPDATE VENDA SET VD_SITUACAO =' + QuotedStr('C') + 'WHERE VD_NUMERO =' + edtCodigoVenda.text;
          DataModule1.sqlVenda.ExecSQL(true);
        finally
          ShowMessage('Venda cancelada com sucesso, aguarde para impressão do cupom fiscal');
          DataModule1.cdsVenda.Close;
          lblSatus.Caption :=  'CANCELADA';
          lblSatus.Font.Color   := clRed;
          btnCupom.Enabled      := False;
          btnCancelar.Enabled   := False;
          btnObservacao.Enabled := False;
          btnFinalizar.Enabled  := False;
          btnGravar.Enabled     := False;
          btnAdicionar.Enabled  := False;
          btnRemover.Enabled    := False;
          btnCliente.Enabled    := False;
          btnProduto.Enabled    := False;
          btnNovo.Enabled       := True;
        end
end;

procedure TfrmVendas.btnClienteClick(Sender: TObject);
begin
      frmPesquisaCliente := TfrmPesquisaCliente.Create(Self);
  try
    if frmPesquisaCliente.ShowModal= mrOk then
      with DataModule1.sqlCliente do
      begin
        Close;
        DataModule1.cdsCliente.Close;
        DataModule1.sqlCliente.SQL.Text := 'SELECT * FROM CLIENTE WHERE CL_CODIGO ='
        + QuotedStr(IntToStr(frmPesquisaCliente.varcodigoCliente));
          DataModule1.cdsCliente.Open;
          edtCodigoCliente.Text := IntToStr(frmPesquisaCliente.varcodigoCliente);
          varVenCodigoCliente := frmPesquisaCliente.varcodigoCliente;
      end;
  finally
      frmPesquisaCliente.Free;
  end;

end;

procedure TfrmVendas.btnCupomClick(Sender: TObject);
var
  varTotal         :Integer;
  varCerrilhado    :string;
  VarLinha         :integer;
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
    while not (DataModule1.cdsItem.Eof) do
//    while varPrimeiroItem <= varUltimoItem do
    begin
      with rdpCupom do
      varProdutoItem := DataModule1.cdsItemIV_PRODUTO.Value;
      PegaDescricaoProduto;
      imp(VarLinha, 06, IntToStr(varPrimeiroItem));
      impC(VarLinha, 15, varProdutoDescricao, [Comp12]);
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
      sqlVendaParcela.SQL.Clear;
      sqlVendaParcela.SQL.Text := ' Select ' +
                                          'X.PA_VENDA_ID, ' +
                                          'X.PA_PARCELA, ' +
                                          'X.PA_DATA_VENCIMENTO, ' +
                                          'X.PA_VALOR, ' +
                                          'CASE X.pa_pago ' +
                                          '     WHEN ''S'' THEN ''Sim'' ' +
                                          '     WHEN ''N'' THEN ''Não'' ' +
                                          'END AS PA_PAGO ' +
                                          'FROM PARCELA X ' +
                                          'WHERE X.pa_venda_id = :venda ';

      sqlVendaParcela.ParamByName('venda').AsString :=  IntToStr(varVenCodigoVenda);
      sqlVendaParcela.Open;
      impc(varlinha,01, 'Parcela | ', [Comp12]);
      impc(varlinha,27, 'Vencimento| ', [Comp12]);
      impc(varlinha,47, 'Valor | ', [Comp12]);
      impc(varlinha,62, 'Pago | ', [Comp12]);
      sqlVendaParcela.First;
      inc(varLinha);
      while not (sqlVendaParcela.Eof) do
        begin
          impc(varlinha, 01, sqlVendaParcela['PA_PARCELA'], [Comp12]);
          impc(varlinha, 25, sqlVendaParcela['PA_DATA_VENCIMENTO'], [Comp12]);
          impc(varlinha, 45, sqlVendaParcela['PA_VALOR'], [Comp12]);
          impc(varlinha, 60, sqlVendaParcela['PA_PAGO'], [Comp12]);
          inc(varlinha);
          sqlVendaParcela.Next;
        end;
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
       datamodule1.cdsVenda.close;
       datamodule1.cdsCliente.close;
       datamodule1.cdsProduto.close;
       datamodule1.cdsItem.close;
       btnCupom.Enabled     := False;
       btnFinalizar.Enabled := False;
       btnNovo.Enabled      := True;
end;

procedure TfrmVendas.btnFinalizarClick(Sender: TObject);
begin
      if Application.MessageBox('Deseja realmente finalizar essa venda?','Aviso',MB_YESNO+MB_ICONQUESTION)= mrYes then
      begin
        try
          quebraParcela;
          varCondicaopagamento := edtCondicaoPGTO.Text;
          DataModule1.sqlVenda.Close;
          DataModule1.sqlVenda.SQL.Clear;
          DataModule1.sqlVenda.SQL.text :='UPDATE VENDA SET VD_SITUACAO =' + QuotedStr('F') + 'WHERE VD_NUMERO =' + edtCodigoVenda.text;
          DataModule1.sqlVenda.ExecSQL(true);
        finally
          ShowMessage('Venda finalizada com sucesso, aguarde a impressão do cupom');
          lblSatus.Caption := 'FINALIZADA';
          lblSatus.Font.Color   := clGreen;
          btnCupom.Enabled      := True;
          btnCancelar.Enabled   := False;
          btnObservacao.Enabled := False;
          btnFinalizar.Enabled  := False;
          btnGravar.Enabled     := False;
          btnAdicionar.Enabled  := False;
          btnRemover.Enabled    := False;
          btnCliente.Enabled    := False;
          btnProduto.Enabled    := False;
          btncupom.Click;
          DataModule1.cdsItemCupom.Open;
        end;
      end
      else
      begin
        btnConfirmaCond.Enabled := True;
        edtCondicaoPGTO.Enabled := True;
        edtCondicaoPGTO.SetFocus;
        btnFinalizar.Enabled    := False;
      end;
      Abort;

end;

procedure TfrmVendas.btnGravarClick(Sender: TObject);
begin
      if Application.MessageBox('Deseja realmente gravar essa venda?','Aviso',MB_YESNO+MB_ICONQUESTION)= mrYes then
      else
        Abort;
        try
          verificaCamposVazios;
            try
              ControlaVariaveis;
              varEmTransacao := False;
              DataModule1.sqlVenda.Close;
              DataModule1.sqlVenda.SQL.Clear;
              DataModule1.sqlVenda.SQL.text := 'UPDATE VENDA SET VD_CLIENTE =' +
              QuotedStr(IntToStr(varVencodigoCliente)) + ', VD_DATA_EMISSAO =' +
              QuotedStr(varVenDataVenda) + ', VD_VALOR_TOTAL =' +
              StringReplace(FloatToStr(vartotalvenda), ',', '.', [rfReplaceAll]) +
              ', VD_SITUACAO =' + QuotedStr('A') + ', VD_OBSERVACAO =' +
              QuotedStr(varVenObservacao) + ', VD_CONDPGTO =' + QuotedStr(edtCondicaoPGTO.text) + 'WHERE VD_NUMERO =' +
              IntToStr(varVenCodigoVenda);
              DataModule1.sqlVenda.ExecSQL(true);
              if DataModule1.cdsItem.State in dsEditModes then
              begin
                if DataModule1.cdsItemIV_PRODUTO.IsNull then
                  DataModule1.cdsItem.Cancel
                else
                  DataModule1.cdsItem.Post;
              end;
              DataModule1.cdsItem.ApplyUpdates(0);
              DataModule1.sqlVenda.SQLConnection.CommitFreeAndNil(Transaction);
            finally
              ShowMessage('Venda gravada com sucesso!');
              lblSatus.Caption        :=  'ABERTA';
              lblSatus.Font.Color     := clBlue;
              confimaCondicao;
              btnGravar.Enabled       := False
            end;
        except
          Abort
        end;

end;

procedure TfrmVendas.btnGravarObservacaoClick(Sender: TObject);
begin
  ShowMessage('Observação gravada com sucesso!');
  memo.Visible := False;
  btnGravarObservacao.Visible := False;
end;

procedure TfrmVendas.btnNovoClick(Sender: TObject);
begin
    t := DataModule1.sqlVenda.SQLConnection.BeginTransaction;
    varEmTransacao                := True;
    PegaUltimaVenda;
    DataModule1.cdsVenda.Active   := False;
    DataModule1.cdsItem.Active    := False;
    DataModule1.cdsCliente.Active := False;
    DataModule1.cdsProduto.Active := False;
    DataModule1.cdsItem.Active    := True;
    DataModule1.cdsItem.Active    := True;
    DataModule1.cdsVenda.Active   := True;
    DataModule1.cdsItem.Active    := True;
    editQuantidade.clear;
    DataModule1.cdsItem.Insert;
    dataModule1.cdsVenda.Insert;
    DataModule1.cdsVenda.Edit;
    PegaUltimaVenda;
    edtDataVenda.Text             := DatetoSTR(now);
    edtCodigoVenda.Text           := IntToStr(varUltimo);
    edtProduto.Enabled            := True;
    edtCliente.Enabled            := True;
    edtCodigoCliente.Enabled      := True;
    edtCodigoProduto.Enabled      := True;
    btnCancelar.Enabled           := True;
    btnRemover.Enabled            := True;
    btnAdicionar.Enabled          := True;
    btnCliente.Enabled            := True;
    btnProduto.Enabled            := True;
    btnObservacao.Enabled         := True;
    btnGravar.Enabled             := True;
    btnPesquisar.Enabled          := False;
    btnNovo.Enabled               := False;
    btnCancelar.Enabled           := False;
end;

procedure TfrmVendas.btnObservacaoClick(Sender: TObject);
begin
    memo.Visible := True;
    btnGravarObservacao.Visible := True;
end;

procedure TfrmVendas.btnPesquisarClick(Sender: TObject);
var
    varPesquisaCliente :Integer;
    varPesquisaItem    :Integer;
    varStatusVenda     :string;
begin
  frmPesquisaVenda := TfrmPesquisaVenda.Create(Self);

  try
    if frmPesquisaVenda.ShowModal= mrOk then
      with DataModule1.sqlVenda do
      begin
        Close;
        DataModule1.cdsVenda.Close;
        DataModule1.cdsCliente.Close;
        DataModule1.cdsItem.Close;
        DataModule1.sqlVenda.SQL.Text := 'SELECT * FROM VENDA WHERE VD_NUMERO ='
        + QuotedStr(IntToStr(frmPesquisaVenda.varCodigoVenda));
        DataModule1.cdsVenda.Open;
        varPesquisaCliente := StrToInt(edtCodigoCliente.Text);
        varPesquisaItem    := frmPesquisaVenda.varCodigoVenda;
        DataModule1.sqlCliente.SQL.Text := 'SELECT * FROM CLIENTE WHERE CL_CODIGO ='+
        QuotedStr(IntToStr(varPesquisaCliente));
        DataModule1.cdsCliente.Open;
        DataModule1.sqlItem.SQL.Text := 'SELECT * FROM ITEM I WHERE I.IV_VENDA =' +
        QuotedStr(IntToStr(varPesquisaItem));
        DataModule1.cdsItem.Open;
        varStatusVenda := DataModule1.cdsVenda.FieldByName('VD_SITUACAO').Value;
        vartotalvenda  := DataModule1.cdsVenda.FieldByName('VD_VALOR_TOTAL').Value;
        varsomaquantidade := DataModule1.cdsItem.FieldByName('IV_ITEM').Value;
        VarTotalCupom     := DataModule1.cdsVenda.FieldByName('VD_VALOR_TOTAL').Value;

        if (varStatusVenda = 'F') then
          begin
              ShowMessage('Venda finalizada !, Vendas finalizadas não podem ser alteradas, é permitido apenas reimpressão do cupom fiscal');
              btnCupom.Enabled      := True;
              btnCancelar.Enabled   := False;
              btnObservacao.Enabled := False;
              btnFinalizar.Enabled  := False;
              btnGravar.Enabled     := False;
              btnAdicionar.Enabled  := False;
              btnRemover.Enabled    := False;
              btnCliente.Enabled    := False;
              btnProduto.Enabled    := False;
          end;
          if (varStatusVenda = 'C') then
          begin
              ShowMessage('Venda cancelada !, não é permitido alterações !');
              btnCupom.Enabled      := False;
              btnCancelar.Enabled   := False;
              btnObservacao.Enabled := False;
              btnFinalizar.Enabled  := False;
              btnGravar.Enabled     := False;
              btnAdicionar.Enabled  := False;
              btnRemover.Enabled    := False;
              btnCliente.Enabled    := False;
              btnProduto.Enabled    := False;
          end;
          if  varStatusVenda = 'A' then
          begin
              btnCupom.Enabled        := False;
              btnCancelar.Enabled     := True;
              btnObservacao.Enabled   := True;
              btnFinalizar.Enabled    := True;
              btnGravar.Enabled       := True;
              btnAdicionar.Enabled    := True;
              btnRemover.Enabled      := True;
              btnCliente.Enabled      := True;
              btnProduto.Enabled      := True;
              edtCondicaoPGTO.Enabled := True;
              DataModule1.cdsItem.append;
          end;
        if (varStatusVenda = 'A') then
          begin
             lblSatus.Caption :=  'ABERTA';
             lblSatus.Font.Color   := clBlue;
          end;
        if (varStatusVenda = 'C') then
          begin
             lblSatus.Caption :=  'CANCELADA';
             lblSatus.Font.Color   := clRed;
          end;
          if (varStatusVenda = 'F') then
          begin
             lblSatus.Caption :=  'FINALIZADA';
             lblSatus.Font.Color   := clGreen;
          end;
      end;
  finally
      frmPesquisaVenda.Free;
  end;
end;


procedure TfrmVendas.btnProdutoClick(Sender: TObject);
begin
     frmPesquisaProduto := TfrmPesquisaProduto.Create(Self);
  try
    if frmPesquisaProduto.ShowModal= mrOk then
      with DataModule1.sqlProduto do
      begin
        Close;
        DataModule1.cdsProduto.Close;
        DataModule1.sqlProduto.SQL.Text := 'SELECT * FROM PRODUTO WHERE PR_CODIGO ='
        + QuotedStr(IntToStr(frmPesquisaProduto.varcodigoproduto));
          DataModule1.cdsProduto.Open;
          edtCodigoProduto.Text := IntToStr(frmPesquisaProduto.varcodigoproduto);
          editQuantidade.Enabled := True;
      end;
  finally
      frmPesquisaProduto.Free;
  end;

end;

procedure TfrmVendas.btnRemoverClick(Sender: TObject);
var
   vartotalquantidade   :Integer;
   varProdutoEstoque    :string;
   varQuantidadeEstoque :String;
begin


    if dbgVenda.DataSource.DataSet.RecordCount = 0 then
    begin
      ShowMessage('Não existe produtos para remover !');
      Abort;
    end;

    SubtrairTotal;
    vartotalquantidade   := 0;
    varProdutoEstoque    := dbgVenda.Columns.Items[2].Field.Text;
    varQuantidadeEstoque := dbgVenda.Columns.Items[4].Field.Text;
    DataModule1.cdsItem.Delete;
    DataModule1.cdsItem.First;
    while not DataModule1.cdsItem.Eof do
    begin
      vartotalquantidade := vartotalquantidade +1;
      DataModule1.cdsItem.Edit;
      DataModule1.cdsItem.FieldByName('IV_ITEM').asInteger := vartotalquantidade;
      DataModule1.cdsItem.Post;
      DataModule1.cdsItem.Next;
    end;
      DataModule1.cdsItem.First;
      vartotalvenda := vartotalvenda - varSubtrairTotal;
      edtTotal.Text := FloatToStr(vartotalvenda);
      DataModule1.sqlProduto.Close;
      DataModule1.sqlProduto.SQL.Clear;
      Datamodule1.sqlProduto.SQL.Text :=  'UPDATE PRODUTO SET PR_ESTOQUE = (SELECT PR_ESTOQUE FROM PRODUTO WHERE PR_CODIGO ='
      + QuotedStr(varProdutoEstoque) + ') + ' + varQuantidadeEstoque
      + 'WHERE PR_CODIGO =' + QuotedStr(varProdutoEstoque);
      DataModule1.sqlProduto.ExecSQL(TRUE);
      DataModule1.cdsItem.Append;
end;

procedure TfrmVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DataModule1.cdsItem.Cancel;
    DataModule1.cdsCliente.Close;
    DataModule1.cdsProduto.Close;
    DataModule1.cdsItem.Close;
    DataModule1.cdsVenda.Close;
end;

procedure TfrmVendas.FormShow(Sender: TObject);
begin
    btnCupom.Enabled          := False;
    btnCancelar.Enabled       := False;
    btnRemover.Enabled        := False;
    btnAdicionar.Enabled      := False;
    btnCliente.Enabled        := False;
    btnProduto.Enabled        := False;
    btnGravar.Enabled         := False;
    btnObservacao.Enabled     := False;
    btnFinalizar.Enabled      := False;
    btnConfirmaCond.Enabled   := False;
    btnNovo.SetFocus;
end;

end.
