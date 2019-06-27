unit UPesquisaProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPesquisaProduto = class(TForm)
    pnlPesquisaCliente: TPanel;
    lblPesquisa: TLabel;
    btnPesquisar2: TBitBtn;
    rgPesquisar: TRadioGroup;
    edtPesquisa: TEdit;
    dsPesquisaProduto: TDataSource;
    dbgrdPesquisar: TDBGrid;
    procedure btnPesquisar2Click(Sender: TObject);
    procedure dbgrdPesquisarDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  varcodigoproduto: Integer;
    { Public declarations }
  end;

var
  frmPesquisaProduto: TfrmPesquisaProduto;

implementation

uses
  UDados;

{$R *.dfm}

procedure TfrmPesquisaProduto.btnPesquisar2Click(Sender: TObject);
begin
if edtPesquisa.Text = ('')  then
    begin
      ShowMessage('Campo de pesquisa vazio!');
        Exit;
    end;
with DataModule1.sqlProduto do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM PRODUTO');

    case rgPesquisar.ItemIndex of
      0:
      begin;
        SQL.Add('WHERE PR_CODIGO = :codigo ');
        ParamByName('codigo').Value :=  (edtPesquisa.Text);
      end;
      1:
      begin;
        SQL.Add('WHERE UPPER (PR_DESCRICAO) LIKE :produto');
        ParamByName('produto').Value := UpperCase('%' + edtPesquisa.Text + '%');
      end;
    end;
  end;
  with  DataModule1.cdsProduto do
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

procedure TfrmPesquisaProduto.dbgrdPesquisarDblClick(Sender: TObject);
begin
    varcodigoproduto := dbgrdPesquisar.Columns[0].Field.Value;
    ModalResult := mrOk;
end;

procedure TfrmPesquisaProduto.FormCreate(Sender: TObject);
begin
    edtPesquisa.Text := '%';
end;

procedure TfrmPesquisaProduto.FormKeyPress(Sender: TObject; var Key: Char);
begin
    with Sender do
    if Key = #13 then
    begin
      SelectNext(Sender as tWinControl, True, True);
      Key := #0;
    end;
end;

end.

