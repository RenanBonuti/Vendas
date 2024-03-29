unit UCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ComCtrls,Data.DBXCommon;

type
  TfrmCadastroProdutos = class(TForm)
    pnl1: TPanel;
    btnGravar: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnDeletar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    dbcbbAtivoInativo: TDBComboBox;
    dbedtValor: TDBEdit;
    dbedtCodigo: TDBEdit;
    dbedtProduto: TDBEdit;
    btnPesquisar: TBitBtn;
    lblAtivoInativo: TLabel;
    lblValor: TLabel;
    lblId: TLabel;
    lblProduto: TLabel;
    btnSalvarEdicao: TBitBtn;
    edtEstoque: TDBEdit;
    dsProduto: TDataSource;
    lbl1: TLabel;
    procedure PegaUltimoProduto;
    procedure ativaComponetes;
    procedure desativaComponetes;
    procedure verificaCamposVazios;
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnSalvarEdicaoClick(Sender: TObject);
    procedure edtEstoqueExit(Sender: TObject);
  private
    { Private deClarations }
    Transaction:  TDBXTransaction;

  public
    { Public declarations }
    varUltimoProduto   :Integer;
  end;

var
  frmCadastroProdutos: TfrmCadastroProdutos;

implementation

uses
  UDados, UPesquisaProduto;

{$R *.dfm}

procedure TfrmCadastroProdutos.verificaCamposVazios;
begin
   if dbedtProduto.Text = '' then
    begin
      ShowMessage('Campo "Produto" obrigat�rio !!!');
      dbedtProduto.SetFocus;
      Abort;
    end;

   if dbedtValor.Text = '' then
    begin
      ShowMessage('Campo "Valor" obrigat�rio !!!');
      dbedtValor.SetFocus;
      Abort;
    end;

   if edtEstoque.Text = '' then
    begin
      ShowMessage('Campo "Estoque" obrigat�rio !!!');
      edtEstoque.SetFocus;
      Abort;
    end;
end;

procedure TfrmCadastroProdutos.ativaComponetes;
begin
   dbedtValor.Enabled        := True;
   dbedtProduto.Enabled      := True;
   edtEstoque.Enabled        := True;
   dbcbbAtivoInativo.Enabled := True;
end;

procedure TfrmCadastroProdutos.desativaComponetes;
begin

   dbedtValor.Enabled        := False;
   dbedtProduto.Enabled      := False;
   edtEstoque.Enabled        := False;
   dbcbbAtivoInativo.Enabled := False;
end;


procedure TfrmCadastroProdutos.edtEstoqueExit(Sender: TObject);
begin
    if (StrToInt(edtEstoque.Text) < 0 )then
    begin
    ShowMessage(' Estoque minimo � de 1 ');
    edtEstoque.SetFocus;
    Abort;
    end;
end;

procedure TfrmCadastroProdutos.PegaUltimoProduto;
begin
   try
      Transaction := DataModule1.sqlProduto.SQLConnection.BeginTransaction;
      DataModule1.sqlProduto.SQL.Clear;
      DataModule1.sqlProduto.SQL.Text := 'INSERT INTO PRODUTO(PR_CODIGO) VALUES(NULL)';
      DataModule1.sqlProduto.ExecSQL(true);
      DataModule1.sqlProduto.SQL.Clear;
      DataModule1.sqlProduto.SQL.Text :=
        'SELECT * FROM PRODUTO WHERE PR_CODIGO = (SELECT MAX(PR_CODIGO) FROM PRODUTO)';
      DataModule1.sqlProduto.Open;
      varUltimoProduto := DataModule1.sqlProduto.FieldByName('PR_CODIGO').Value;
      DataModule1.sqlProduto.Close;
    except
      DataModule1.sqlProduto.SQLConnection.RollbackFreeAndNil(Transaction);
    raise;
    end;
end;

procedure TfrmCadastroProdutos.btnCancelarClick(Sender: TObject);
begin
    DataModule1.cdsProduto.Cancel;
    DataModule1.cdsProduto.Close;
    desativaComponetes;
    btnPesquisar.Enabled     := True;
    btnGravar.Enabled        := False;
    btnGravar.Enabled        := False;
    btnSalvarEdicao.Visible  := False;
    btnCancelar.Enabled      := False;
    btnDeletar.Enabled       := False;
    btnEditar.Enabled        := False;
    btnNovo.Enabled          := true;
    btnSair.Enabled          := True;
end;

procedure TfrmCadastroProdutos.btnDeletarClick(Sender: TObject);
begin
    case Application.MessageBox('Deseja realmente excluir esse registro?','Exclus�o de Registro',MB_YESNO + MB_ICONQUESTION ) of
      IDYES:
        begin
          DataModule1.cdsProduto.Delete;
          DataModule1.cdsProduto.ApplyUpdates(0);
          ShowMessage('Registro deletado com sucesso!!!');
          btnDeletar.Enabled     := False;
          btnEditar.Enabled      := False;
          btnCancelar.Enabled    := False;
          btnNovo.Enabled        := True;
        end;
      IDNO:
        Exit;
    end;
end;

procedure TfrmCadastroProdutos.btnEditarClick(Sender: TObject);
begin
    DataModule1.cdsProduto.Edit;
    btnSalvarEdicao.Visible   := True;
    btnSalvarEdicao.Left      := 197;
    btnGravar.Enabled         := False;
    btnNovo.Enabled           := False;
    btnDeletar.Enabled        := False;
    ativaComponetes;
end;

procedure TfrmCadastroProdutos.btnGravarClick(Sender: TObject);
begin
     if Application.MessageBox('Deseja realmente gravar esse produto?','Aviso',MB_YESNO+MB_ICONQUESTION)= mrYes then
      else
        Abort;
        try
        verificaCamposVazios;
        try
          DataModule1.sqlProduto.Close;
          DataModule1.sqlProduto.SQL.Clear;
          DataModule1.sqlProduto.SQL.Text := 'UPDATE PRODUTO SET PR_DESCRICAO ='  + QuotedStr(dbedtProduto.text) +', PR_VALOR_UNITARIO ='
          + QuotedStr(StringReplace(dbedtValor.text,',','.',[rfReplaceAll])) + ',PR_ATIVO =' +  QuotedStr('S')
          + ',PR_ESTOQUE =' + QuotedStr(edtEstoque.Text)
          + 'WHERE PR_CODIGO =' + IntToStr(varUltimoProduto);
         DataModule1.sqlProduto.ExecSQL(true);
        finally
          DataModule1.sqlProduto.SQLConnection.CommitFreeAndNil(Transaction);
          ShowMessage('Produto cadastrado com sucesso!');
          btnEditar.Enabled    := False;
          btnGravar.Enabled    := False;
          btnNovo.Enabled      := True;
          btnPesquisar.Enabled := True;
          btnCancelar.Enabled  := False;
          btnSair.Enabled      := True;
          DataModule1.cdsProduto.Close;
        end;
        except
        Abort;
        end;
end;

procedure TfrmCadastroProdutos.btnNovoClick(Sender: TObject);
begin
    PegaUltimoProduto;
    DataModule1.cdsProduto.Active := True;
    DataModule1.cdsProduto.Insert;
    dbedtProduto.Enabled          := True;
    dbedtValor.Enabled            := True;
    edtEstoque.Enabled            := True;
    btnNovo.Enabled               := False;
    btnGravar.Enabled             := True;
    btnCancelar.Enabled           := True;
    btnPesquisar.Enabled          := False;
    btnSair.Enabled               := False;
    dbedtProduto.SetFocus;
end;

procedure TfrmCadastroProdutos.btnPesquisarClick(Sender: TObject);
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
      end;

      btnEditar.Enabled   := True;
      btnDeletar.Enabled  := True;
      btnCancelar.Enabled := True;
      btnNovo.Enabled     := False;
  finally
      frmPesquisaProduto.Free;
  end;

end;

procedure TfrmCadastroProdutos.btnSairClick(Sender: TObject);
begin
    if DataModule1.cdsProduto.State in [dsInsert, dsEdit]  then
      begin
        ShowMessage('Antes de sair salve ou cancele o registro!!!');
        Exit;
      end
    else
    begin
        Close;
    end;
end;

procedure TfrmCadastroProdutos.btnSalvarEdicaoClick(Sender: TObject);
begin
   try
      DataModule1.cdsProduto.Post;
      DataModule1.cdsProduto.ApplyUpdates(0);
   finally
      ShowMessage('Produto atualizado com sucesso !');
      DataModule1.cdsProduto.Close;
      btnSalvarEdicao.Visible  := False;
      btnNovo.Enabled          := True;
      btnEditar.Enabled        := False;
      btnCancelar.Enabled      := False;
      desativaComponetes;
   end;
end;

procedure TfrmCadastroProdutos.FormCreate(Sender: TObject);
begin
    btnGravar.Enabled            := False;
    btnCancelar.Enabled          := False;
    btnDeletar.Enabled           := False;
    btnEditar.Enabled            := False;
end;


end.
