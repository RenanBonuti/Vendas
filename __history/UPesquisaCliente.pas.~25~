unit UPesquisaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesquisaCliente = class(TForm)
    pnlPesquisaCliente: TPanel;
    dsCliente: TDataSource;
    dbgrdPesquisar: TDBGrid;
    btnPesquisar2: TBitBtn;
    rgPesquisar: TRadioGroup;
    lblPesquisa: TLabel;
    edtPesquisa: TEdit;
    procedure btnPesquisar2Click(Sender: TObject);
    procedure dbgrdPesquisarDblClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    varcodigoCliente:  integer;

  end;

var
  frmPesquisaCliente: TfrmPesquisaCliente;

implementation

uses
  UDados, UCadastroClientes;

{$R *.dfm}

procedure TfrmPesquisaCliente.btnPesquisar2Click(Sender: TObject);
begin
    if edtPesquisa.Text = ('')  then
    begin
      ShowMessage('Campo de pesquisa vazio!');
        Exit;
    end;
with DataModule1.sqlCliente do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM CLIENTE');

    case rgPesquisar.ItemIndex of
      0:
      begin;
        SQL.Add('WHERE CL_CODIGO = :codigo ');
        ParamByName('codigo').Value :=  (edtPesquisa.Text);
      end;
      1:
      begin;
        SQL.Add('WHERE UPPER (CL_NOME) LIKE :nome');
        ParamByName('nome').Value := UpperCase('%' + edtPesquisa.Text + '%');
      end;
      2:
      begin
        SQL.Add('WHERE CL_CPF = :cpf');
        ParamByName('cpf').Value := edtPesquisa.Text;
      end;

    end;
  end;
  with  DataModule1.cdsCliente do
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
procedure TfrmPesquisaCliente.dbgrdPesquisarDblClick(Sender: TObject);

begin
    varcodigoCliente := dbgrdPesquisar.Columns[0].Field.Value;
    ModalResult := mrOk;
end;

procedure TfrmPesquisaCliente.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  case rgPesquisar.ItemIndex of
    0:
    begin
      if((Key in['0'..'9'] = False) and (word (Key) <>  VK_BACK))  then
      begin
        ShowMessage('Opção de pesquisa com código é permitido apenas números!');
        Key := #0;
      end;
    end;
    1:
    begin;
      if((Key in['0'..'9'] = True) and (word (Key) <>  VK_BACK))  then
      begin
       ShowMessage('Opção de pesquisa com nome é permitido apenas letras!');
       Key := #0;
      end;
    end;
    2:
    begin;
      if((Key in['0'..'9'] = False) and (word (Key) <>  VK_BACK))  then
      begin
       ShowMessage('Opção de pesquisa com CPF é permitido apenas números!');
       Key := #0;
      end;
    end;
    end;

end;

end.
