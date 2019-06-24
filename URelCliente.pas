unit URelCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, Vcl.StdCtrls;

type
  TfrmRelCliente = class(TForm)
    btn1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
   varCodigoNome :String;
   varFiltro     :String;

  end;

var
  frmRelCliente: TfrmRelCliente;

implementation

uses
  UDados, URelatorioClientes;

{$R *.dfm}


end.
