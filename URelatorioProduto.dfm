object frmRelatorioProduto: TfrmRelatorioProduto
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Produtos'
  ClientHeight = 248
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 275
    Top = 8
    Width = 143
    Height = 114
    TabOrder = 0
    object rgRelatorio: TRadioGroup
      Left = 4
      Top = 2
      Width = 133
      Height = 104
      Caption = 'Status'
      Items.Strings = (
        'Ativo '
        'Inativo')
      TabOrder = 0
    end
  end
  object btnImprimir: TBitBtn
    Left = 194
    Top = 191
    Width = 111
    Height = 49
    Caption = 'Imprimir'
    Glyph.Data = {
      36100000424D3610000000000000360000002800000020000000200000000100
      2000000000000010000000000000000000000000000000000000000000000000
      00000000000000000000000000010000000D0000001500000016000000160000
      0016000000160000001600000016000000160000001600000016000000160000
      0016000000160000001600000016000000160000001600000016000000160000
      0011000000020000000000000000000000000000000000000000000000000000
      00000000000000000000000000068C8C8C7B969696AF959595B0959595B09595
      95B0959595B0959595B0959595B0959595B0959595B0959595B0959595B09595
      95B0959595B0959595B0959595B0959595B0959595B0959595B0959595B09A9A
      9A9E0000000F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000002BEBEBEA9D0D0D0FFD0D0D0FFD0D0D0FFD0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD0D0D0FFD5D5D5FFDCDCDCFFC8C8C8FFCCCC
      CCFFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFC8C8
      C8DC000000080000000000000000000000000000000000000000000000030000
      00160000002000000020000000206666665AE6E6E6FFE9E9E9FFE9E9E9FFE9E9
      E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9
      E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FF9A9A
      9A8B0000002100000020000000200000002000000013000000020E0E0E249090
      90AB979797C5979797C5979797C5999999C7BCBCBCF8D6D6D6FFD6D6D6FFD6D6
      D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6
      D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFCDCDCDFF8A8A
      8ACD989898C5989898C5989898C5989898C58989899F0000001A9B9B9B64CACA
      CAFFC9C9C9FFC9C9C9FFC9C9C9FFCECECEFF8E8E8EFFD8D8D8FFD8D8D8FFD8D8
      D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8
      D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FF9C9C9CFFB1B1
      B1FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFCBCBCBFF8E8E8E4F9D9D9D6ED0D0
      D0FFD0D0D0FFD0D0D0FFD0D0D0FFD3D3D3FF212121FF575757FF5F5F5FFF5E5E
      5EFF5E5E5EFF5D5D5DFF5D5D5DFF5C5C5CFF5C5C5CFF5C5C5CFF5B5B5BFF5B5B
      5BFF5A5A5AFF5A5A5AFF5A5A5AFF595959FF595959FF595959FF111111FF9595
      95FFD0D0D0FFD2D2D2FFD0D0D0FFD2D2D2FFD0D0D0FF9D9D9D59A9A9A97AD6D6
      D6FFD6D6D6FFD6D6D6FFD6D6D6FFD7D7D7FF181818FF020202FF020202FF0101
      01FF010101FF010101FF010101FF010101FF010101FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFACAC
      ACFFD6D6D6FFDCDCDCFFDDDDDDFFD9D9D9FFD6D6D6FF9D9D9D59A9A9A97ADDDD
      DDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFAEAEAEFF6E6E6EFF6E6E6EFF6E6E
      6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E
      6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6E6E6EFF6F6F6FFF8E8E8EFFDDDD
      DDFFDDDDDDFFDFDFDFFFE0E0E0FFDEDEDEFFDDDDDDFF9A9A9A59ABABAB7AE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3
      E3FFE3E3E3FFDADADAFFD7D7D7FFDFDFDFFFE3E3E3FF9A9A9A59ABABAB7AE9E9
      E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9
      E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9
      E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9
      E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FFE9E9E9FF97979759ABABAB7AF0F0
      F0FFF1F1F1FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF2F2F2FFF4E6D6FFEED5
      B6FFEBD3B5FFEBD5B9FFEBD7BDFFEBD7BEFFEBD7BEFFEBD6BCFFEBD4B8FFEBD1
      B3FFEBCEAEFFEBC8A8FFEBC2A2FFECBE9FFFF1CEBAFFEFEBE9FFF2F2F2FFF2F2
      F2FFF2F2F2FFF2F2F2FFF2F2F2FFF0F0F0FFF0F0F0FF97979759ADADAD7AF7F7
      F7FFFCFCFCFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFCEFE5FFDA9B65FFC07B
      3CFFC08043FFC0844AFFC0864EFFC08851FFC08750FFC0864DFFC08348FFC07F
      41FFC0783AFFC06F32FFC06629FFC05D20FFCC662FFFF3CBB6FFFDFDFDFFFDFD
      FDFFFDFDFDFFFDFDFDFFFDFDFDFFFCFCFCFFF6F6F6FF97979759ADADAD7AFDFD
      FDFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFBE8DAFFD58B54FFCE89
      4FFFCE8F55FFCE945AFFCE965EFFCE9860FFCE975FFFCE965DFFCE9359FFCE8D
      53FFCE864CFFCE7E45FFCE753DFFCE6C35FFCD632CFFEEB99FFFFEFEFEFFFEFE
      FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFDFDFDFF94949459B0B0B078FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E3D4FFE9A474FFE7A8
      75FFE3A772FFE3AC77FFE3AF7AFFE3B17BFFE3B17BFFEAB987FFE5AD79FFE3A6
      71FFE39F6BFFE39864FFE3905DFFE78D5DFFE9885AFFEDB69BFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94949454A2A2A260FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8DDCEFFD68959FFC481
      50FFC1814FFFC4844DFFC98549FFC9864BFFC9864AFFCF8E56FFC98146FFC97C
      41FFC9763CFFC97036FFC9682FFFCB642CFFD66F3EFFEAB095FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FF717171366B6B6B26F4F4
      F4FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D7C8FFE19C77FFCB9D
      81FFCB9F83FFD3A382FFE0A87FFFE0A97FFFE0A87EFFE0A67CFFDFA479FFDFA0
      76FFDF9C71FFDF986EFFE39871FFE99E7BFFEB9B78FFE8AD91FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7E80000000B00000003D3D3
      D3ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D0C1FFECB299FFEAB3
      9CFFEAB49EFFECBAA3FFECBDA2FFEABA9EFFE9B89AFFE8B698FFE8B496FFE9B3
      96FFEAB296FFECB297FFECAF94FFECAE93FFECAD92FFE6B197FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFC1C1C17900000001000000007575
      750DD1D1D180E3E3E3C6EEEEEEF9FDFDFDFFFFFFFFFFF1C8B6FFF1C2ADFFF5CB
      B8FFF5CBB8FFF3CAB6FFF3CAB5FFF3C9B4FFF3C8B3FFF2C7B2FFF2C5B0FFF2C3
      AEFFF2C1ABFFF2C0AAFFF1BFA9FFF1BEA8FFF1BEA7FFE3AF96FFFFFFFFFFEEEE
      EEFFE6E6E6FFDCDCDCE8DDDDDDB0CACACA6A0000000300000000000000000000
      000000000000000000006A6A6A0CAEAEAE9EDBDBDBFFD8B3A2FFE8AE94FFF4CC
      BBFFF7D6C7FFFADDD0FFFCE3D8FFFCE2D6FFFCE1D5FFFCE0D4FFFCE0D3FFFCDF
      D2FFFCE0D4FFF9D9CBFFF6D1C0FFF3C7B3FFEBB298FFD3A087FFE5E5E5FFBEBE
      BECA828282290000000100000000000000000000000000000000000000000000
      0000000000000000000000000001B4B4B489E9E9E9FFC2C2C2FFF9F7F6FFF2E0
      D8FFEDCFC2FFEAC4B3FFE9C3B1FFE9C8B9FFE8C9BBFFE6C7BAFFE4C5B8FFE2C2
      B4FFDDB7A6FFDCBCADFFDBC0B4FFDBC9C0FFDBD7D5FFD5D5D5FFE9E9E9FFC3C3
      C3B5000000060000000000000000000000000000000000000000000000000000
      0000000000000000000000000001B6B6B689FBFBFBFFCDCDCDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFBFBFFF7F7F7FFF4F4F4FFF1F1F1FFEEEE
      EEFFEBEBEBFFE8E8E8FFE5E5E5FFE2E2E2FFE0E0E0FFD6D6D6FFE9E9E9FFC2C2
      C2B5000000060000000000000000000000000000000000000000000000000000
      0000000000000000000000000001B8B8B889FFFFFFFFD3D3D3FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFF9F9F9FFF6F6F6FFF3F3F3FFF0F0
      F0FFEDEDEDFFEAEAEAFFE7E7E7FFE4E4E4FFE1E1E1FFD6D6D6FFE8E8E8FFC2C2
      C2B5000000060000000000000000000000000000000000000000000000000000
      0000000000000000000000000001B8B8B889FFFFFFFFD7D7D7FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFBFBFFF8F8F8FFF5F5F5FFF1F1
      F1FFEEEEEEFFEBEBEBFFE8E8E8FFE5E5E5FFE3E3E3FFD7D7D7FFE8E8E8FFC2C2
      C2B5000000060000000000000000000000000000000000000000000000000000
      0000000000000000000000000001B4B4B489FDFDFDFFDBDBDBFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFAFAFAFFF7F7F7FFF3F3
      F3FFF0F0F0FFEDEDEDFFEAEAEAFFE7E7E7FFE4E4E4FFD8D8D8FFE8E8E8FFC2C2
      C2B5000000060000000000000000000000000000000000000000000000000000
      0000000000000000000000000001A9A9A989FCFCFCFFDEDEDEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFFF9F9F9FFF5F5
      F5FFF2F2F2FFEFEFEFFFECECECFFE9E9E9FFE6E6E6FFD8D8D8FFE7E7E7FFC1C1
      C1B5000000060000000000000000000000000000000000000000000000000000
      0000000000000000000000000001AAAAAA7FFBFBFBFFE0E0E0FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFAFAFAFFF7F7
      F7FFF4F4F4FFF1F1F1FFEEEEEEFFEBEBEBFFE8E8E8FFD9D9D9FFE7E7E7FFC1C1
      C1B5000000060000000000000000000000000000000000000000000000000000
      0000000000000000000000000000737373166B6B6B39C4C4C4CEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFF9F9
      F9FFF6F6F6FFF3F3F3FFEFEFEFFFEDEDEDFFEAEAEAFFDADADAFFE7E7E7FFC1C1
      C1B5000000060000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000008CBCBCBC2FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFBFB
      FBFFF8F8F8FFF5F5F5FFF1F1F1FFEEEEEEFFEBEBEBFFDBDBDBFFE7E7E7FFC1C1
      C1B5000000060000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000007D2D2D2C1FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFFFAFAFAFFF7F7F7FFF4F4F4FFF1F1F1FFEEEEEEFFDCDCDCFFE7E7E7FFBFBF
      BFB5000000060000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000002D9D9D989EDEDEDC1EDED
      EDC1EDEDEDC1EDEDEDC1EDEDEDC1EDEDEDC1EDEDEDC1EDEDEDC1EDEDEDC1EDED
      EDC1EDEDEDC1EDEDEDC1EDEDEDC1EDEDEDC1EDEDEDC1DCDCDCD6EAEAEAFFCCCC
      CCAA000000030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AAAAAA0CD8D8D850CDCD
      CD1F000000000000000000000000000000000000000000000000}
    TabOrder = 1
    OnClick = btnImprimirClick
  end
  object btnSair: TBitBtn
    Left = 311
    Top = 191
    Width = 108
    Height = 49
    Caption = 'Sair'
    Glyph.Data = {
      36100000424D3610000000000000360000002800000020000000200000000100
      2000000000000010000000000000000000000000000000000000000000000000
      00000000000000000001000000070000000D0000000F0000000F0000000F0000
      000F0000000F0000000F0000000F0000000F0000000F0000000F0000000F0000
      000F0000000F0000000F0000000F0000000F0000000F0000000F0000000F0000
      000F0000000A0000000300000000000000000000000000000000000000000000
      0000000000060000002300000049000000600000006400000064000000640000
      0064000000640000006400000064000000640000006400000064000000640000
      0064000000640000006400000064000000640000006400000064000000640000
      0063000000580000003700000011000000010000000000000000000000000000
      000600000033080C77913035CEDF4C51E8FC5258EBFF5359ECFF545AEDFF555B
      EEFF555BF0FF555BF0FF545AF1FF5359F3FF5258F4FF5156F5FF5054F6FF4F53
      F7FF4E52F7FF4E51F7FF4D50F7FF4C4FF8FF4B4DF8FF4C4FF5FF4D50F2FF4E52
      EFFF3C40DBF30D0E9DC100001E5C000000160000000100000000000000010000
      00230C0FA3A5494BDEFE3232C4FF1313BFFF0E0EC1FF0E0EC5FF0E0EC8FF0E0E
      CBFF0E0ECFFF0E0ED2FF0E0ED6FF0E0ED9FF0E0EDCFF0E0EE0FF0F0FE3FF1213
      E5FF1618E6FF1A1EE7FF1E23E8FF2229E9FF262EEAFF2A33EBFF2E39ECFF323E
      EDFF434FEFFF646FF0FF2C30C7E900002D550000000A00000000000000070000
      73633434DCFC0909B5FF0000B6FF0000B9FF0000BDFF0000C1FF0000C4FF0000
      C8FF0000CCFF0000D0FF0000D3FF0000D7FF0000DBFF0000DEFF0000E2FF0304
      E4FF080AE5FF0C11E6FF1117E7FF151CE8FF1922E9FF1D28EAFF222EEBFF2633
      ECFF2A39EDFF2E3EEEFF5361F0FF191CA9C80000001F000000000000000D0E0E
      C9B01414B5FF0000B2FF0000B6FF0000B9FF0000BDFF0000C1FF0000C4FF0000
      C8FF0000CCFF0000D0FF0000D3FF0606D8FF2929E0FF3E3EE6FF3737E8FF1C1D
      E6FF080AE5FF0C11E6FF1117E7FF151DE8FF1A23E9FF1E28EAFF222EEBFF2634
      ECFF2B3AEDFF2F3FEEFF3345EFFF3841D8FD00003D3E000000010000000F0D0D
      C7CD0000AEFF0000B1FF0000B5FF0000B9FF0000BCFF0000C0FF0000C4FF0000
      C8FF0303CCFF5A5AE0FFBBBBF3FFF9F9FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE2E2FBFF9496F4FF3238EAFF151DE8FF1A23E9FF1E28EAFF222EEBFF2734
      ECFF2B3AEDFF2F40EEFF3345EFFF3443E2FF0000715C000000010000000F0000
      BACE0000ADFF0000B1FF0000B4FF0000B8FF0000BCFF0000C0FF0000C3FF3434
      D2FFD4D4F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFAFAFEFF9296F4FF1E28E9FF1D28EAFF222EEBFF2634
      ECFF2B3AEDFF2F3FEEFF3345EFFF2C3CE0FF00006D5D000000010000000F0000
      B4CE0000ACFF0000B0FF0000B4FF0000B7FF0000BBFF0000BFFF4E4ED5FFF8F8
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6F8FFC9C9F1FFD4D4F4FFF8F8
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C6F9FF2630EAFF212DEBFF2633
      ECFF2A39EDFF2E3FEEFF3244EFFF2C3BDDFF0000685D000000010000000F0000
      AECE0000AAFF0000AFFF0000B3FF0000B6FF0000BAFF3B3BCDFFF9F9FDFFFFFF
      FFFFFFFFFFFFFEFEFEFFA1A1E4FF2D2DD0FF0000CFFF0000D6FF0000D9FF0C0D
      D8FF6465E1FFE1E1F7FFFFFFFFFFFFFFFFFFFFFFFFFFBCC0F8FF212DEAFF2532
      EBFF2937ECFF2D3DEEFF3143EFFF2A39D9FF0000655D000000010000000F0000
      A8CE0303A9FF0404AFFF0505B3FF0505B7FF0D0DBCFFDDDDF6FFFFFFFFFFFFFF
      FFFFF8F8FCFF4F4FCFFF0000CDFF0000D3FF0000D7FF0000DBFF0000DEFF0000
      E2FF0405E3FF1619DCFFBCBDF0FFFFFFFFFFFFFFFFFFFFFFFFFF7980F2FF2330
      EBFF2735ECFF2C3BEDFF3041EEFF2937D5FF00005F5D000000010000000F0000
      A2CE0808A8FF0F0FB1FF1010B5FF1111B9FF7474D7FFFFFFFFFFFFFFFFFFFFFF
      FFFF6A6AD3FF0E0ECDFF0707CFFF0000D2FF0000D5FF0000D9FF0000DDFF0000
      E0FF0203E3FF0609E4FF1418DFFFD6D6F5FFFFFFFFFFFFFFFFFFE7E8FCFF2631
      EBFF2533ECFF2A38EDFF2E3EEEFF2634D2FF00005A5D000000010000000F0000
      9BCE0C0CA6FF1616B2FF1818B6FF1919BAFFCBCBF0FFFFFFFFFFFFFFFFFFC9C9
      ECFF2020CAFF2121D0FF2323D3FF2222D6FF1818D8FF0C0CD9FF0000DBFF0000
      DFFF0000E2FF0406E4FF090CE5FF4C4FE3FFFFFFFFFFFFFFFFFFFFFFFFFF5D65
      F0FF2330EBFF2735ECFF2B3BECFF2431CFFF00005A5D000000010000000F0000
      95CE0F0FA4FF1D1DB3FF1F1FB7FF2626BCFFFBFBFEFFFFFFFFFFFFFFFFFF7C7C
      DAFF2727CDFF2929D0FF2A2AD3FF2C2CD7FF2D2DDAFF2E2EDDFF2B2BE0FF1818
      E0FF0303E1FF0202E3FF0608E4FF0B0FE3FFE5E5F8FFFFFFFFFFFFFFFFFF9095
      F4FF202BEAFF2431EBFF2836EAFF212DCDFF00005A5D000000010000000F0000
      8FCE1515A4FF2525B4FF2626B8FF4646C4FFFFFFFFFFFFFFFFFFFFFFFFFF5858
      D2FF2F2FCCFF3030CFFF3232D3FF3333D6FF3434D9FF3636DDFF3737E0FF3939
      E3FF3737E5FF1F1FE5FF0607E4FF070AE4FFB7B8F5FFFFFFFFFFFFFFFFFFACB0
      F7FF1C27E9FF202CEAFF2431E8FF1E29CBFF00005A5D000000010000000F0000
      8ACE1A1AA3FF2C2CB5FF2E2EB9FF4F4FC5FFFFFFFFFFFFFFFFFFFFFFFFFF5C5C
      D4FF3636CCFF3838CFFF3939D2FF3A3AD5FF3C3CD8FF3D3DDCFF3F3FDEFF4040
      E2FF4141E5FF4343E7FF3E3EE9FF1C1EE6FFB2B3F6FFFFFFFFFFFFFFFFFFAEB1
      F5FF1821E8FF1C26E9FF1F2BE6FF1B25C9FF00005A5D000000010000000F0000
      84CE1E1EA1FF3434B5FF3535B9FF4242BDFFFFFFFFFFFFFFFFFFFFFFFFFF7C7C
      DBFF3E3ECCFF3F3FD0FF4040D3FF4242D5FF6161DEFFA5A5EEFF7C7CE7FF4747
      E0FF4949E3FF4A4AE6FF4C4CE9FF4E4EEBFFE0E0FBFFFFFFFFFFFFFFFFFF9598
      F1FF141BE7FF1720E8FF1B24E5FF171FC7FF00005A5D000000010000000F0000
      7ECE2222A0FF3B3BB7FF3D3DBAFF3E3EBDFFE0E0F0FFFFFFFFFFFFFFFFFFBEBE
      ECFF4545CCFF4646CFFF4848D2FF4949D5FFEDEDFBFFFFFFFFFFFEFEFEFF7070
      E6FF5050E2FF5252E4FF5353E7FF6F6FECFFFFFFFFFFFFFFFFFFFFFFFFFF6265
      E9FF0E13E6FF1218E7FF151CE3FF1218C5FF00005A5D000000010000000F0000
      7BCE27279FFF4343B7FF4444BAFF4545BDFFA3A3D9FFFFFFFFFFFFFFFFFFFCFC
      FEFF7070D7FF4E4ECFFF4F4FD1FF5151D4FFFFFFFFFFFFFFFFFFFFFFFFFF8B8B
      E9FF5858E1FF5959E3FF5B5BE5FFCCCCF7FFFFFFFFFFFFFFFFFFF8F8FCFF2F31
      E1FF080BE5FF0B10E5FF0E13E1FF0D11C3FF00005A5D000000010000000F0000
      79CE2B2B9FFF4A4AB8FF4B4BBBFF4D4DBEFF5C5CBEFFF7F7FAFFFFFFFFFFFFFF
      FFFFEAEAF9FF6B6BD5FF5757D1FF5858D4FFFFFFFFFFFFFFFFFFFFFFFFFF9090
      E8FF5F5FDFFF6161E2FFB1B1F1FFFFFFFFFFFFFFFFFFFFFFFFFFBABAEAFF6767
      EDFF2223E7FF0406E4FF0709E0FF0709C0FF00005A5D000000010000000F0000
      78CE30309FFF5151B8FF5353BBFF5454BEFF5656C1FF9C9CD0FFFFFFFFFFFFFF
      FFFFFFFFFFFFF2F2FBFF7777D8FF6060D3FFFFFFFFFFFFFFFFFFFFFFFFFF9595
      E7FF6E6EE0FFCDCDF5FFFFFFFFFFFFFFFFFFFFFFFFFFECECF6FF7373E0FF7070
      EBFF6E6EECFF1B1BE3FF0000DEFF0101BDFF00005A5D000000010000000F0000
      76CE35359FFF5959B9FF5A5ABCFF5C5CBFFF5D5DC2FF5D5DC0FFBEBEDCFFFFFF
      FFFFFFFFFFFFFFFFFFFFADADE5FF6767D2FFFFFFFFFFFFFFFFFFFFFFFFFF9A9A
      E6FFAEAEECFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F9FF8787D8FF7676E7FF7777
      E8FF7878EAFF7070E9FF0D0DDBFF0000B7FF00005A5D000000010000000F0000
      74CE3E3EA2FF6060BAFF6262BDFF6363BFFF6464C2FF6666C4FF6565C0FFB1B1
      D4FFFDFDFEFFEFEFF5FF7F7FCEFF6E6ED2FFFFFFFFFFFFFFFFFFFFFFFFFF9F9F
      E6FFA2A2E1FFFFFFFFFFFFFFFFFFE9E9F2FF8888D3FF7B7BE4FF7D7DE5FF7E7E
      E6FF8080E7FF8181E8FF6262E3FF0000B1FF00005A5D000000010000000F0000
      73CE4949A6FF6868BBFF6969BDFF6A6AC0FF6C6CC2FF6D6DC5FF6E6EC7FF6E6E
      C6FF6F6FB9FF6B6BBDFF7373CFFF7575D1FFFFFFFFFFFFFFFFFFFFFFFFFFA4A4
      E5FF7979D6FF9898CFFFA4A4D2FF7D7DD0FF8181E0FF8383E2FF8484E3FF8686
      E4FF8787E5FF8989E5FF8A8AE6FF2020B3FF00005A5D000000010000000F0000
      70CE5A5AADFF6F6FBCFF7070BEFF7171C0FF7272C3FF7474C5FF7575C7FF7777
      C9FF7878CBFF7979CDFF7B7BCFFF7C7CD1FFFFFFFFFFFFFFFFFFFFFFFFFFA9A9
      E4FF8383DAFF8585DBFF8686DCFF8888DEFF8989DFFF8A8AE0FF8C8CE1FF8D8D
      E2FF8F8FE3FF9090E3FF9191E3FF3434B4FF00005A5D000000010000000E0101
      70CE7070B8FF7676BDFF7777BFFF7878C1FF7A7AC3FF7B7BC6FF7D7DC7FF7E7E
      CAFF7F7FCBFF8181CDFF8282CFFF8484D1FFFFFFFFFFFFFFFFFFFFFFFFFFAEAE
      E4FF8B8BD9FF8C8CDAFF8E8EDBFF8F8FDDFF9090DEFF9292DFFF9393DFFF9595
      E0FF9696E0FF9797E1FF9999E1FF4D4DB9FF0B0B615C000000010000000A1E1E
      83CA7C7CBBFF7D7DBEFF7E7EC0FF8080C2FF8181C4FF8383C6FF8484C8FF8585
      CAFF8787CCFF8888CEFF8A8ACFFF8B8BD1FFDBDBE9FFFFFFFFFFF2F2F6FF9797
      D4FF9292D8FF9494D9FF9595DBFF9696DBFF9898DCFF9999DDFF9B9BDEFF9C9C
      DEFF9D9DDFFF9F9FDFFFA0A0DEFF7E7EC9FF0000605500000000000000033434
      91A18888C0FF8484BFFF8686C1FF8787C3FF8989C5FF8A8AC7FF8B8BC9FF8D8D
      CBFF8E8ECDFF9090CEFF9191D0FF9393D1FF8D8DC7FF9D9DC6FF9292C7FF9898
      D7FF9A9AD8FF9B9BD9FF9C9CDAFF9E9EDBFF9F9FDCFFA1A1DCFFA2A2DDFFA3A3
      DDFFA5A5DDFFA6A6DDFFA8A8DDFF9E9ED3FD00004E2700000000000000000404
      6B398686C1FC9393C5FF8D8DC3FF8F8FC5FF9090C6FF9292C8FF9393CAFF9494
      CCFF9696CDFF9797CFFF9898D0FF9A9AD2FF9B9BD3FF9D9DD5FF9E9ED6FFA0A0
      D7FFA1A1D8FFA2A2D9FFA4A4DAFFA5A5DAFFA7A7DBFFA8A8DBFFA9A9DCFFABAB
      DCFFACACDCFFAFAFDCFFD1D1EAFF7474B7B20000000400000000000000000000
      000138389875A4A4D0FEB2B2D5FFA8A8D0FFA7A7D1FFA9A9D2FFABABD4FFADAD
      D5FFAEAED7FFB0B0D8FFB2B2DAFFB3B3DBFFB5B5DCFFB6B6DEFFB8B8DFFFB9B9
      E0FFBBBBE1FFBDBDE1FFBEBEE2FFC0C0E3FFC1C1E3FFC2C2E4FFC4C4E5FFC6C6
      E5FFD0D0E9FFE7E7F4FF9B9BCFDA00005E1B0000000000000000000000000000
      00000000000122228F497D7DBFC19C9CCEFAA7A7D4FFA9A9D5FFABABD6FFACAC
      D7FFAFAFD8FFB1B1D9FFB2B2DAFFB4B4DBFFB6B6DCFFB8B8DDFFBABADEFFBBBB
      DFFFBDBDE0FFBFBFE1FFC0C0E2FFC2C2E2FFC3C3E3FFC3C3E3FFC4C4E3FFC2C2
      E2FFAFAFD8E67272BA8E00006312000000000000000000000000000000000000
      0000000000000000000000000000000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000010000000100000001000000010000000100000001000000010000
      0001000000000000000000000000000000000000000000000000}
    TabOrder = 2
  end
  object pnl1: TPanel
    Left = 128
    Top = 8
    Width = 141
    Height = 114
    TabOrder = 3
    object rgFiltro: TRadioGroup
      Left = 5
      Top = 2
      Width = 129
      Height = 105
      Caption = 'Agrupar por'
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      TabOrder = 0
    end
  end
  object frxrprtProduto: TfrxReport
    Version = '5.6.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43622.620414884300000000
    ReportOptions.LastChange = 43622.752959085700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 104
    Top = 136
    Datasets = <
      item
        DataSet = frxdbdtstProduto
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 49.133890000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'C'#243'digo')
        end
        object Memo2: TfrxMemoView
          Left = 83.149660000000000000
          Top = 49.133890000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Produto')
        end
        object Memo3: TfrxMemoView
          Left = 491.338900000000000000
          Top = 49.133890000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Valor')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 105.826840000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        DataSet = frxdbdtstProduto
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1PR_CODIGO: TfrxMemoView
          Left = 3.779530000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PR_CODIGO'
          DataSet = frxdbdtstProduto
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PR_CODIGO"]')
        end
        object frxDBDataset1PR_DESCRICAO: TfrxMemoView
          Left = 90.708720000000000000
          Top = 15.118120000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'PR_DESCRICAO'
          DataSet = frxdbdtstProduto
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PR_DESCRICAO"]')
        end
        object frxDBDataset1PR_VALOR_UNITARIO: TfrxMemoView
          Left = 495.118430000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PR_VALOR_UNITARIO'
          DataSet = frxdbdtstProduto
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PR_VALOR_UNITARIO"]')
        end
      end
    end
  end
  object frxdbdtstProduto: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = DataModule1.sqlRelProduto
    BCDToCurrency = False
    Left = 32
    Top = 136
  end
end
