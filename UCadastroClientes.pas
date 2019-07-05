unit UCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Datasnap.DBClient, Data.Win.ADODB,
  JvADOQuery, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Data.FMTBcd, Data.SqlExpr,
  Data.DBXCommon;

type
  TfrmCadastroClientes = class(TForm)
    pgc1: TPageControl;
    TabSheetCadastro: TTabSheet;
    lblId: TLabel;
    lblNome: TLabel;
    lblCpf: TLabel;
    lblDatasNas: TLabel;
    lblAtivoInativo: TLabel;
    btnGravar: TBitBtn;
    btnSair: TBitBtn;
    btnCancelar: TBitBtn;
    dsCliente: TDataSource;
    btnDeletar: TBitBtn;
    dbedtNome: TDBEdit;
    dbedtCodigo: TDBEdit;
    dbedtCpf: TDBEdit;
    dbedtDataNas: TDBEdit;
    dbcbbAtivoInativo: TDBComboBox;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnSalvarEdicao: TBitBtn;
    lblTipo: TLabel;
    cbTipo: TDBComboBox;
    lblUF: TLabel;
    cbUF: TDBComboBox;
    edtEndereco: TDBEdit;
    lblEndereco: TLabel;
    edtNumero: TDBEdit;
    lblNumero: TLabel;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    lbl1: TLabel;
    edtCidade: TDBEdit;
    lblCep: TLabel;
    edtCep: TDBEdit;
    lbl2: TLabel;
    edtCnpj: TDBEdit;
    lblCnpj: TLabel;
    edtRG: TDBEdit;
    lbl3: TLabel;
    lblIE: TLabel;
    edtIE: TDBEdit;
    sqlClienteTipo: TSQLQuery;
    procedure PegaUltimoCliente;
    procedure ativaComponentes;
    procedure desativaComponentes;
    procedure verificaCamposVazios;
  //  procedure validaCnpg;
    procedure edtNascimentoKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure ControlarBotoes;
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure dbedtCpfExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure dbedtCodigoEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarEdicaoClick(Sender: TObject);
    procedure dbedtDataNasExit(Sender: TObject);
    procedure cbTipoChange(Sender: TObject);

  private
   Transaction:  TDBXTransaction;
   varTipoSujeito   :string;

    { Private declarations }
  public
   varUltimoCliente  :Integer;
    { Public declarations }
  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

uses
  UDados, UValidaCpf, UPesquisaCliente;

{$R *.dfm}

procedure TfrmCadastroClientes.verificaCamposVazios;
begin
    if dbedtNome.Text = '' then
    begin
      ShowMessage('Campo "Nome" obrigatório !!!');
      dbedtNome.SetFocus;
      Abort;
    end;

    if dbedtDataNas.Text = '' then
    begin
      ShowMessage('Campo "Data de Nascimento" obrigatório !!!');
      dbedtDataNas.SetFocus;
      Abort;
    end;

    if cbTipo.Text = '' then
    begin
      ShowMessage('Escolha o tipo de cliente !!!');
      cbTipo.SetFocus;
      Abort;
    end;

    if edtEndereco.Text = '' then
    begin
      ShowMessage('Campo "Endereço" obrigatório !!!');
      edtEndereco.SetFocus;
      Abort;
    end;

    if edtNumero.Text = '' then
    begin
      ShowMessage('Campo "Numero" obrigatório !!!');
      edtNumero.SetFocus;
      Abort;
    end;

    if edtBairro.Text = '' then
    begin
      ShowMessage('Campo "Bairro" obrigatório !!!');
      edtBairro.SetFocus;
      Abort;
    end;

    if edtCidade.Text = '' then
    begin
      ShowMessage('Campo "Cidade" obrigatório !!!');
      edtCidade.SetFocus;
      Abort;
    end;

    if cbUF.Text = '' then
    begin
      ShowMessage('Escolha um estado !!!');
      cbUF.SetFocus;
      Abort;
    end;

    if (cbTipo.ItemIndex = 0) and (edtRG.Text = '         ') then
    begin
      ShowMessage('O campo RG obrigatório !!!');
      edtRG.SetFocus;
      Abort;
    end;
end;

function imprimeCNPJ(CNPJ: string): string;
begin
{ máscara do CNPJ: 99.999.999.9999-99 }
  imprimeCNPJ := copy(CNPJ, 1, 2) + '.' + copy(CNPJ, 3, 3) + '.' +
    copy(CNPJ, 6, 3) + '.' + copy(CNPJ, 9, 4) + '-' + copy(CNPJ, 13, 2);
end;

procedure TfrmCadastroClientes.ativaComponentes;
begin
    dbedtNome.Enabled        := True;
    edtEndereco.Enabled      := True;
    edtNumero.Enabled        := True;
    edtBairro.Enabled        := True;
    edtCidade.Enabled        := True;
    edtCep.Enabled           := True;
    dbedtDataNas.Enabled     := True;
    cbTipo.Enabled           := True;
    cbUF.Enabled             := True;
end;

procedure TfrmCadastroClientes.desativaComponentes;
begin
    dbedtNome.Enabled         := False;
    dbedtCpf.Enabled          := False;
    edtEndereco.Enabled       := False;
    edtNumero.Enabled         := False;
    edtBairro.Enabled         := False;
    edtCidade.Enabled         := False;
    edtIE.Enabled             := False;
    edtCnpj.Enabled           := False;
    edtCep.Enabled            := False;
    edtRG.Enabled             := False;
    dbedtDataNas.Enabled      := False;
    cbTipo.Enabled            := False;
    dbcbbAtivoInativo.Enabled := False;
    cbUF.Enabled              := False;
end;

procedure TfrmCadastroClientes.PegaUltimoCliente;
begin
    try
      Transaction := DataModule1.sqlCliente.SQLConnection.BeginTransaction;
      DataModule1.sqlCliente.SQL.Clear;
      DataModule1.sqlCliente.SQL.Text := 'INSERT INTO CLIENTE(CL_CODIGO) VALUES(NULL)';
      DataModule1.sqlCliente.ExecSQL(true);
      DataModule1.sqlCliente.SQL.Clear;
      DataModule1.sqlCliente.SQL.Text :=
        'SELECT * FROM CLIENTE WHERE CL_CODIGO = (SELECT MAX(CL_CODIGO) FROM CLIENTE)';
      DataModule1.sqlCliente.Open;
      varUltimoCliente := DataModule1.sqlCliente.FieldByName('CL_CODIGO').Value;
      DataModule1.sqlCliente.Close;
    except
      DataModule1.sqlCliente.SQLConnection.RollbackFreeAndNil(Transaction);
    raise;
    end;
end;

procedure TfrmCadastroClientes.btn1Click(Sender: TObject);
begin
    DataModule1.cdsCliente.Active := True;
end;

procedure TfrmCadastroClientes.btnCancelarClick(Sender: TObject);
begin
    DataModule1.cdsCliente.Cancel;
    DataModule1.cdsCliente.Close;
    desativaComponentes;
    btnNovo.Enabled         := True;
    btnPesquisar.Enabled    := True;
    btnSair.Enabled         := True;
    btnEditar.Enabled       := False;
    btnDeletar.Enabled      := False;
    btnGravar.Enabled       := False;
    btnCancelar.Enabled     := False;
    btnSalvarEdicao.Enabled := False;
    btnSalvarEdicao.Visible := False;
end;

procedure TfrmCadastroClientes.ControlarBotoes;
begin
    btnNovo.Enabled     := DataModule1.cdsCliente.State in [dsBrowse];
    btnEditar.Enabled   := DataModule1.cdsCliente.State in [dsBrowse];
    btnDeletar.Enabled  := DataModule1.cdsCliente.State in [dsBrowse];
    btnDeletar.Enabled  := DataModule1.cdsCliente.State in [dsBrowse];
    btnGravar.Enabled   := DataModule1.cdsCliente.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := DataModule1.cdsCliente.State in [dsInsert, dsEdit];
end;

procedure TfrmCadastroClientes.dbedtCodigoEnter(Sender: TObject);
begin
    btnCancelar.Enabled := True;
end;

procedure TfrmCadastroClientes.dbedtCpfExit(Sender: TObject);
begin
   if not isCPF(dbedtCpf.Text) then
   begin
      dbedtCpf.SetFocus;
      dbedtCpf.Clear;
      ShowMessage('CPF Inválido!!!');
   end;
end;

procedure TfrmCadastroClientes.dbedtDataNasExit(Sender: TObject);
begin
    if (StrToDate(dbedtDataNas.Text) > Now) then
        begin
            ShowMessage('Data Inválida');
            dbedtDataNas.SetFocus;
        Abort;
        end;
end;

procedure TfrmCadastroClientes.btnDeletarClick(Sender: TObject);
begin
    case Application.MessageBox('Deseja realmente excluir esse registro?','Exclusão de Registro',MB_YESNO + MB_ICONQUESTION ) of
      IDYES:
        begin
          DataModule1.cdsCliente.Delete;
          DataModule1.cdsCliente.ApplyUpdates(0);
          ShowMessage('Registro deletado com sucesso!!!');
          btnDeletar.Enabled   := False;
          btnEditar.Enabled    := False;
          btnNovo.Enabled      := True;
          btnCancelar.Enabled  := False;
          btnPesquisar.Enabled := True;
        end;
      IDNO:
        Exit;
    end;
end;

procedure TfrmCadastroClientes.btnEditarClick(Sender: TObject);
begin
    DataModule1.cdsCliente.Edit;
    sqlClienteTipo.close;
    sqlClienteTipo.SQL.Clear;
    sqlClienteTipo.SQL.Text := 'SELECT ' +
                                       'CL_TIPOSUJEITO ' +
                                       'FROM CLIENTE ' +
                                       'WHERE CL_CODIGO =' + QuotedStr(dbedtCodigo.Text);

    sqlClienteTipo.Open;
    if sqlClienteTipo.FieldByName('CL_TIPOSUJEITO').Value = 'F'  then
      begin
          dbedtCpf.Enabled         := True;
          edtRG.Enabled            := True;
      end
    else if sqlClienteTipo.FieldByName('CL_TIPOSUJEITO').Value = 'J' then
      begin
          edtIE.Enabled            := True;
          edtCnpj.Enabled          := True;
      end;

    btnSalvarEdicao.Visible   := True;
    btnSalvarEdicao.Left      := 432;
    btnGravar.Enabled         := False;
    btnNovo.Enabled           := False;
    btnDeletar.Enabled        := False;
    dbedtNome.Enabled         := True;
    dbedtDataNas.Enabled      := True;
    btnCancelar.Enabled       := True;
    dbedtNome.Enabled         := True;
    edtEndereco.Enabled       := True;
    edtNumero.Enabled         := True;
    edtBairro.Enabled         := True;
    edtCidade.Enabled         := True;
    edtCep.Enabled            := True;
    dbedtDataNas.Enabled      := True;
    dbcbbAtivoInativo.Enabled := True;
    cbTipo.Enabled            := True;
    cbUF.Enabled              := True;
end;

procedure TfrmCadastroClientes.btnGravarClick(Sender: TObject);
var
   varData          :string;
begin
      if Application.MessageBox('Deseja realmente gravar esse cadastro?','Aviso',MB_YESNO+MB_ICONQUESTION)= mrYes then
      else
        Abort;
       try
       verificaCamposVazios;
        try
          varData := FormatDateTime('MM/DD/YYYY',strtodate(dbedtDataNas.Text));
          DataModule1.sqlCliente.SQL.Clear;
          DataModule1.sqlCliente.SQL.Text := 'UPDATE CLIENTE SET CL_NOME =' + QuotedStr(dbedtNome.text) +', CL_DATA_NASCIMENTO ='
          + QuotedStr(varData) +', CL_CPF =' + QuotedStr(dbedtCpf.text) +', CL_ATIVO =' + QuotedStr('S') +', CL_RG =' + QuotedStr(edtRG.text)
          + ', CL_TIPOSUJEITO =' + QuotedStr(varTipoSujeito) + ', Cl_CNPJ =' + QuotedStr(edtCnpj.Text)  + ', CL_IE = ' + QuotedStr(edtIE.Text)
          + ', CL_ENDERECO =' + QuotedStr(edtEndereco.Text) + ', CL_NUMERO =' + QuotedStr(edtNumero.Text) + ', CL_BAIRRO =' + QuotedStr(edtBairro.text)
          + ', CL_CIDADE =' + QuotedStr(edtCidade.text) + ', CL_UF =' + QuotedStr(cbUF.Text) + ', CL_CEP =' + QuotedStr(edtCep.Text)
          + 'WHERE CL_CODIGO =' + IntToStr(varUltimoCliente);
          DataModule1.sqlCliente.ExecSQL(true);
        finally
          DataModule1.sqlCliente.SQLConnection.CommitFreeAndNil(Transaction);
          ShowMessage('Cliente cadastrado com sucesso!');
          btnEditar.Enabled    := False;
          btnGravar.Enabled    := False;
          btnNovo.Enabled      := True;
          btnPesquisar.Enabled := True;
          btnCancelar.Enabled  := False;
          btnSair.Enabled      := True;
          desativaComponentes;
          DataModule1.cdsCliente.Close;
        end;
       except

       end;
end;

procedure TfrmCadastroClientes.btnNovoClick(Sender: TObject);
var
    varTipoPessoa  :string;
begin
    PegaUltimoCliente;
    DataModule1.cdsCliente.Active := True;
    DataModule1.cdsCliente.Insert;
    dbcbbAtivoInativo.ItemIndex := 0;
    dbedtCodigo.Text         := IntToStr(varUltimoCliente);
    ativaComponentes;
    btnPesquisar.Enabled     := False;
    btnNovo.Enabled          := False;
    btnGravar.Enabled        := True;
    btnSair.Enabled          := False;
    dbedtNome.SetFocus;
end;

procedure TfrmCadastroClientes.btnPesquisarClick(Sender: TObject);
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
          desativaComponentes;
          btnDeletar.Enabled    := True;
          btnEditar.Enabled     := True;
          btnGravar.Enabled     := False;
          btnNovo.Enabled       := False;
          btnCancelar.Enabled   := True;
          btnPesquisar.Enabled  := False;
       end;
  finally
    frmPesquisaCliente.Free;
  end;


end;

procedure TfrmCadastroClientes.btnSairClick(Sender: TObject);
begin
    if DataModule1.cdsCliente.State in [dsInsert, dsEdit]  then
      begin
        ShowMessage('Antes de sair salve ou cancele o registro!!!');
        Exit;
      end
    else
      begin
          Close;
      end;
end;

procedure TfrmCadastroClientes.btnSalvarEdicaoClick(Sender: TObject);
begin
   try
      DataModule1.cdsCliente.Post;
      DataModule1.cdsCliente.ApplyUpdates(0);
      sqlClienteTipo.close;
      sqlClienteTipo.SQL.Clear;
      sqlClienteTipo.SQL.Text := 'SELECT ' +
                                 'CL_TIPOSUJEITO ' +
                                 'FROM CLIENTE ' +
                                 'WHERE CL_CODIGO =' + QuotedStr(dbedtCodigo.Text);
      sqlClienteTipo.Open;
        if sqlClienteTipo.FieldByName('CL_TIPOSUJEITO').Value = 'F'  then
          begin
              sqlClienteTipo.SQL.Text := 'UPDATE CLIENTE SET CL_CNPJ = NULL, CL_IE = NULL ' +
              'WHERE CL_CODIGO ='  + QuotedStr(dbedtCodigo.Text);
          end
        else if sqlClienteTipo.FieldByName('CL_TIPOSUJEITO').Value = 'J' then
          begin
              sqlClienteTipo.SQL.Text := 'UPDATE CLIENTE SET CL_CPF = NULL, CL_RG = NULL ' +
              'WHERE CL_CODIGO ='  + QuotedStr(dbedtCodigo.Text);
          end;
      sqlClienteTipo.ExecSQL(TRUE);
   finally
      ShowMessage('Cadastro atualizado com sucesso !');
      DataModule1.cdsCliente.Close;
      btnSalvarEdicao.Visible   := False;
      dbcbbAtivoInativo.Enabled := true;
      btnEditar.Enabled         := False;
      btnNovo.Enabled           := True;
      btnCancelar.Enabled       := False;
      desativaComponentes;
   end;

end;

procedure TfrmCadastroClientes.cbTipoChange(Sender: TObject);
begin
     case cbTipo.ItemIndex of
     0:
       begin
          varTipoSujeito := 'F'
       end;
     1:
       begin
         varTipoSujeito  := 'J'
       end;
     end;

     case cbTipo.ItemIndex of
     0:
       begin
          dbedtCpf.Enabled      := True;
          edtRG.Enabled         := True;
          edtCnpj.Enabled       := False;
          edtIE.Enabled         := False;
          edtCnpj.Clear;
          edtIE.Clear;
       end;
     1:
       begin
          dbedtCpf.Enabled      := False;
          edtRG.Enabled         := False;
          edtCnpj.Enabled       := True;
          edtIE.Enabled         := True;
          dbedtCpf.Clear;
          edtRG.Clear;
       end;
     end;
end;

procedure TfrmCadastroClientes.edtNascimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',#8]) then
    Key := #0;
end;

procedure TfrmCadastroClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if DataModule1.cdsCliente.State in [dsInsert, dsEdit]  then
      begin
        ShowMessage('Antes de sair salve ou cancele o registro!!!');
        Exit;
      end
 else
      begin
          Close;
      end;
    DataModule1.cdsCliente.Close;
end;

procedure TfrmCadastroClientes.FormCreate(Sender: TObject);
begin
    btnEditar.Enabled   := False;
    btnGravar.Enabled   := False;
    btnCancelar.Enabled := False;
    btnDeletar.Enabled  := False;
end;

procedure TfrmCadastroClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
    with Sender do
    if Key = #13 then
    begin
      SelectNext(Sender as tWinControl, True, True);
      Key := #0;
    end;
end;

end.
