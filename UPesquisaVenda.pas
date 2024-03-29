unit UPesquisaVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, Vcl.Mask;

type
  TfrmPesquisaVenda = class(TForm)
    dbgrdPesquisar: TDBGrid;
    btnPesquisar2: TBitBtn;
    rgTipoPesquisa: TRadioGroup;
    dsPesquisaVenda: TDataSource;
    grp1: TGroupBox;
    edtVenIni: TEdit;
    lblVenIni: TLabel;
    lblVenFin: TLabel;
    edtVenFim: TEdit;
    grp2: TGroupBox;
    medtDataIni: TMaskEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    medtDatafim: TMaskEdit;
    procedure btnPesquisar2Click(Sender: TObject);
    procedure dbgrdPesquisarDblClick(Sender: TObject);
    procedure rgTipoPesquisaClick(Sender: TObject);
    procedure dbgrdPesquisarDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure medtDataIniExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    varCodigoVenda:  Integer;
  end;

var
  frmPesquisaVenda: TfrmPesquisaVenda;

implementation

uses
  UDados, UVendas;

{$R *.dfm}

procedure TfrmPesquisaVenda.btnPesquisar2Click(Sender: TObject);
var
    varDataInicio   :string;
    varDataFim      :string;
begin
    with DataModule1.sqlVenda do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM VENDA');

      case rgTipoPesquisa.ItemIndex of
      0:
      begin
        SQL.Add('WHERE VD_NUMERO BETWEEN :vendainicio AND :vendafim');
        ParamByName('vendainicio').AsString :=  (edtVenIni.Text);
        ParamByName('vendafim').AsString    :=  (edtVenFim.Text);
      end;
      1:
      begin;
        varDataInicio := FormatDateTime('MM/DD/YYYY',StrToDate(medtDataIni.Text));
        varDataFim    := FormatDateTime('MM/DD/YYYY',StrToDate(medtDataFim.Text));
        SQL.Add('WHERE VD_DATA_EMISSAO BETWEEN :datainicio AND :datafim');
        ParamByName('datainicio').AsString  :=  varDataInicio;
        ParamByName('datafim').AsString     :=  varDataFim;
      end;
      end;
    end;
    with  DataModule1.cdsVenda do
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
procedure TfrmPesquisaVenda.dbgrdPesquisarDblClick(Sender: TObject);
begin
    varcodigoVenda := dbgrdPesquisar.Columns[0].Field.Value;
    ModalResult := mrOk;
end;

procedure TfrmPesquisaVenda.dbgrdPesquisarDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

    { if dbgrdPesquisar.Columns[4].Field.Value = 'A' then
       dbgrdPesquisar.Canvas.Font.Color := clBlue;
       dbgrdPesquisar.DefaultDrawDataCell(Rect, dbgrdPesquisar.columns[datacol].field, State);     }

end;

procedure TfrmPesquisaVenda.FormShow(Sender: TObject);
begin
    DataModule1.cdsVenda.Open;
end;

procedure TfrmPesquisaVenda.medtDataIniExit(Sender: TObject);
begin
  {  if (StrToDate(medtDataIni.Text) > Now) or (StrToDate(medtDataIni.Text) > StrToDate(medtDatafim.Text)) then
        begin
            ShowMessage('Data Inv�lida');
            medtDataIni.SetFocus;
            Abort;
        end;  }
end;

procedure TfrmPesquisaVenda.rgTipoPesquisaClick(Sender: TObject);
begin
      case rgTipoPesquisa.ItemIndex of
    0:
    begin
        edtVenIni.Enabled  := True;
        edtVenFim.Enabled  := True;
        medtDataIni.Clear;
        medtDatafim.Clear;
    end;
    1:
    begin
        medtDataIni.Enabled  := True;
        medtDatafim.Enabled  := True;
        edtVenIni.Clear;
        edtVenFim.Clear;
    end;

    end;
end;

end.
