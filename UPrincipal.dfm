object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsSingle
  Caption = 'Vendas'
  ClientHeight = 246
  ClientWidth = 1023
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 227
    Width = 1023
    Height = 19
    Panels = <
      item
        Width = 110
      end
      item
        Width = 700
      end
      item
        Width = 50
      end>
  end
  object mm1: TMainMenu
    Left = 520
    Top = 64
    object C1: TMenuItem
      Caption = 'Cadastros'
      object mnCadastroClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = mnCadastroClientesClick
      end
      object mnCadastroProdutos: TMenuItem
        Caption = 'Produtos'
        OnClick = mnCadastroProdutosClick
      end
    end
    object mnVendas: TMenuItem
      Caption = 'Vendas'
      OnClick = mnVendasClick
    end
    object r1: TMenuItem
      Caption = 'Relat'#243'rios'
      object mnRelCadastroClientes: TMenuItem
        Caption = 'Relat'#243'rios de Clientes'
        OnClick = mnRelCadastroClientesClick
      end
      object mnRelRelatoriosProdutos: TMenuItem
        Caption = 'Relat'#243'rios de Produtos'
        OnClick = mnRelRelatoriosProdutosClick
      end
      object mnRelCatalogoPrecos: TMenuItem
        Caption = 'Cat'#225'logo de Pre'#231'os'
        OnClick = mnRelCatalogoPrecosClick
      end
      object mnRelReimpressaoCupomVen: TMenuItem
        Caption = 'Reimpress'#227'o do Cupom de Venda'
        OnClick = mnRelReimpressaoCupomVenClick
      end
    end
    object s1: TMenuItem
      Caption = 'Sobre'
    end
    object S2: TMenuItem
      Caption = 'Sair'
      OnClick = S2Click
    end
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 576
    Top = 64
  end
end
