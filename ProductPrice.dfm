object ProductPriceForm: TProductPriceForm
  Left = 888
  Top = 342
  BorderStyle = bsDialog
  Caption = #1058#1086#1074#1072#1088
  ClientHeight = 394
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ParamertGB: TGroupBox
    Left = 0
    Top = 0
    Width = 410
    Height = 105
    Align = alTop
    Caption = '&'#1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1090#1086#1074#1072#1088#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 93
      Height = 13
      Caption = '&'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object Label2: TLabel
      Left = 8
      Top = 51
      Width = 53
      Height = 13
      Caption = '&'#1040#1088#1090#1080#1082#1091#1083':'
    end
    object Label3: TLabel
      Left = 240
      Top = 51
      Width = 79
      Height = 13
      Caption = '&'#1045#1076#1080#1085'. '#1080#1079#1084#1077#1088':'
    end
    object Label4: TLabel
      Left = 8
      Top = 80
      Width = 72
      Height = 13
      Caption = '&'#1058#1080#1087' '#1090#1086#1074#1072#1088#1072':'
    end
    object Label5: TLabel
      Left = 240
      Top = 80
      Width = 27
      Height = 13
      Caption = '&'#1042#1077#1089':'
    end
    object NameEdit: TEdit
      Left = 107
      Top = 21
      Width = 294
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object ArticulEdit: TEdit
      Left = 107
      Top = 48
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object EdnIzmerEdit: TEdit
      Left = 329
      Top = 48
      Width = 71
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object TypeTovrEdit: TEdit
      Left = 107
      Top = 75
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object WeightEdit: TEdit
      Left = 328
      Top = 75
      Width = 71
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
  end
  object CountProdGB: TGroupBox
    Left = 0
    Top = 105
    Width = 410
    Height = 150
    Align = alTop
    Caption = '&'#1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1090#1086#1074#1072#1088#1072' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label6: TLabel
      Left = 8
      Top = 23
      Width = 58
      Height = 13
      Caption = '&'#1054#1089#1090#1072#1090#1086#1082': '
    end
    object Label7: TLabel
      Left = 8
      Top = 50
      Width = 70
      Height = 13
      Caption = '&'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    end
    object Label8: TLabel
      Left = 240
      Top = 23
      Width = 35
      Height = 13
      Caption = '&'#1062#1077#1085#1072':'
    end
    object Label9: TLabel
      Left = 128
      Top = 114
      Width = 40
      Height = 13
      Caption = '&'#1057#1091#1084#1084#1072
    end
    object Label10: TLabel
      Left = 240
      Top = 50
      Width = 73
      Height = 13
      Caption = '&'#1045#1076#1085'. '#1074' '#1091#1087#1072#1082':'
    end
    object ResultLabel: TLabel
      Left = 104
      Top = 78
      Width = 209
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object PowerEdit: TEdit
      Left = 107
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object PriceEdit: TEdit
      Left = 328
      Top = 20
      Width = 70
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object SummEdit: TEdit
      Left = 184
      Top = 111
      Width = 71
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object CountEdit: TSpinEdit
      Left = 154
      Top = 47
      Width = 74
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
      OnChange = CountEditChange
    end
    object EdnVUpakEdit: TEdit
      Left = 327
      Top = 47
      Width = 70
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
  end
  object BtnsPanel: TPanel
    Left = 0
    Top = 358
    Width = 410
    Height = 36
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 2
    object OkBtn: TBitBtn
      Left = 101
      Top = 2
      Width = 83
      Height = 28
      Caption = '&Ok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFCFDF8E2EABDCEDB8EC6D57BC6D57BCEDB8EE3EA
        BEFCFDF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF9FBF2D1DD94ABC13CA6BE32A6BE32A6BE32A6BE32A6BE32A6BE32ABC13C
        D1DE96FAFBF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F6E1B4C8
        51A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32B4
        C852F2F6E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF3D8ABC13CA6BE32A6BE32
        A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32ABC2
        3DEFF3DAFFFFFFFFFFFFFFFFFFF9FAF1B0C549A6BE32A6BE32A6BE32A6BE32A6
        BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32B0C64A
        F9FBF2FFFFFFFFFFFFD0DD93A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE
        32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32D2DE96FF
        FFFFFAFCF5A9C039A6BE32A6BE32A6BE32A6BE32A6BE32ACC340DEE7B3B9CC5D
        A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32AAC13BFBFCF6E2EA
        BCA6BE32A6BE32A6BE32A6BE32A6BE32A7BF34E5ECC4FFFFFFEEF3D8A8BF36A6
        BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32E3EBBFCEDB8EA6BE32
        A6BE32A6BE32A6BE32A7BF34DCE6AFFFFFFFF8FAF0FFFFFFDAE4ABA6BE32A6BE
        32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32CFDC91C5D57AA6BE32A6BE32A6
        BE32AAC13CE6ECC4FFFFFFE9EFCDACC340EBF0D1FFFFFFCBD987A6BE32A6BE32
        A6BE32A6BE32A6BE32A6BE32A6BE32C6D57BC6D57BA6BE32A6BE32A6BE32BFD1
        6DFFFFFFDFE7B4A8C038A6BE32AFC446F6F8E9FFFFFECEDB8EA6BE32A6BE32A6
        BE32A6BE32A6BE32A6BE32C6D57CCEDC8FA6BE32A6BE32A6BE32A6BE32B0C549
        A6BE32A6BE32A6BE32A6BE32B4C852F5F8E8FFFFFFDCE6AFADC343A6BE32A6BE
        32A6BE32A6BE32CFDC91E0E9B8A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6
        BE32A6BE32A6BE32A6BE32B0C549EBF0D0FFFFFFFBFCF6B7CB5AA6BE32A6BE32
        A6BE32E1E9BBFAFCF5A9C039A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE
        32A6BE32A6BE32A6BE32A7BF35C5D57AE0E9B8B4C852A6BE32A6BE32AAC13BFB
        FCF6FFFFFFCDDB8CA6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32
        A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32CEDB8EFFFFFFFFFF
        FFF9FAF1B0C549A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6
        BE32A6BE32A6BE32A6BE32A6BE32A6BE32B0C64AF9FBF2FFFFFFFFFFFFFFFFFF
        EEF3D8ABC13CA6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE
        32A6BE32A6BE32A6BE32ABC23DEFF3DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEC
        F1D4AFC446A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32
        A6BE32AFC547ECF1D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FB
        F1CDDB8DA8C037A6BE32A6BE32A6BE32A6BE32A6BE32A6BE32A8C037CEDB8EF9
        FBF2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F9FBF1E1E9B9CEDB8EC6D57BC6D57BCEDB8EE1E9BAF9FBF2FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
    end
    object CancelBtn: TBitBtn
      Left = 222
      Top = 2
      Width = 83
      Height = 28
      Caption = '&'#1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      Glyph.Data = {
        36090000424D3609000000000000360000002800000018000000180000000100
        2000000000000009000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CF7809EFCE7708FFCD75
        07FFCC7406FFCB7306FFCA7205FFC87104FFC76F03FFC66E03FFC56D02FFC46C
        01FFC36B00FFC26A00FFC26A00FFC26A00EFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1790AFFFCF7F2FFFCF8
        F3FFFCF7F2FFFBF6F1FFFBF6F0FFFBF5EFFFFBF4EEFFFAF3ECFFFAF2EBFFFAF2
        EAFFF9F1E8FFF6E0CAFFEBAE70FFC56B00FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D27B0BFFF6E7DAFFF4E0
        CDFFF0CDA9FFF0CEADFFF1DAC4FFF1D9C3FFEFD6BEFFEED3B9FFEDD0B4FFECCD
        AEFFEBCAA9FFE9C39FFFF5E0C9FFC36A00FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000088D20000880FFFFFFF00D47C0BFFF4DFC8FFE0BA
        9BFF2B238BFFEEC092FFEEC49AFFF1DBC4FFF1DAC3FFF0D7BEFFEED3B9FFEDD0
        B4FFECCDAFFFEBCAA9FFF9F0E7FFC46C01FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000088D60021A2FF000088CF0000880FD77C0BFFE1BB9CFF2D25
        8BFF0012A0FF27208BFFEEC092FFEFCBA6FFF2DDC8FFF1DAC3FFF0D7BEFFEED3
        B9FFEDD0B4FFECCDAFFFF9F1E9FFC56D02FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000088C9001295FF008EF5FF0054CBFF000088CFBD6E1BFF2D258CFF0039
        C6FF006CEDFF00169AFF543E75FFC89E70FFC3A480FFC2A27EFFC2A17DFFC2A0
        7BFFD7B999FFEDD1B4FFFAF2EAFFC66F03FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00001494E90038B1FF0090F5FF0055CBFF000088FF0047C9FF007E
        F0FF00A4DBFF2E2D8FFFF2D1B1FFF5E5D6FFF4E3D2FFF3E0CDFFF2DDC9FFF1DA
        C4FFF0D7BFFFEED4BAFFFAF3ECFFC87004FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00001293DF0039B1FF0092F6FF0088F4FF0091F4FF00A7
        DCFF2E2D90FFF1CFABFFF7EBDFFFF6E8DAFFF5E5D6FFF4E3D2FFF3E0CDFFF2DD
        C9FFF1DAC4FFF0D7BFFFFAF4EDFFC97205FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF000000880F000088EF009FF8FF0095F6FF00D1FBFF0C3B
        9BFFBE8C5FFFCD9960FFC6A076FFC4A887FFC4A785FFC4A684FFC3A582FFC3A4
        80FFDAC0A4FFF1DAC4FFFBF4EEFFCB7306FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF000000880F001191ED0072D1FF00ACFBFF0078DCFF009CF7FF00C1
        EDFF2D4C9FFFE2BEA1FFF1C9A1FFF5E1CDFFF7EBDFFFF6E8DBFFF5E6D7FFF4E3
        D2FFF3E0CEFFF2DDC9FFFBF5F0FFCC7507FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF000000880F001091EC0078D2FF00BFFEFF0045B4FF1B1079FF003BB2FF009E
        F8FF00C1EDFF2D3F99FFE2BEA1FFF3D3B2FFF8EDE3FFF7EBDFFFF6E8DBFFF5E6
        D7FFF4E3D2FFF3E0CEFFFBF6F1FFCE7608FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000088C9001896FF00B4F7FF0048B4FF000088CFDF8712FF31309EFF003C
        B2FF0097F1FF001295FF59457FFFCEB090FFCBB295FFE1CFBBFFF7EBDFFFE3D8
        CDFFE3D6CAFFE2D4C7FFF7F3EFFFC47809FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000088D6000C8FFF000088CFFFFFFF00E18A14FFFEFCFAFF3130
        9EFF000A8FFF282491FFFAEEE3FFFAF4EDFFFAF2EAFFF9EFE6FFF6DBC6FFB997
        7FFFB9967EFFB8957DFFD2AD8FFFBB7207FFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000088DEFFFFFF00FFFFFF00E28B15FFFEFDFCFFFEFC
        FAFF4040A7FFFEFEFDFFFCF7F3FFFBF6F0FFFBF4EDFFFAF2EAFFE36B17FFE36A
        15FFE36914FFE26812FFE26711FFDE690CCFFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E38D16FFFFFEFEFFE3D6
        C7FFC7AE92FFC7AE90FFC7AD90FFEEE5DAFFFBF6F0FFFBF4EDFFE87B2DFFFFFA
        F3FFFCE3C8FFE87D2FFFE2771ECFD47D0C0FFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E58E17FFFFFFFEFFFFFE
        FEFFFEFDFCFFFEFCFAFFFDFBF8FFFDF9F6FFFCF8F3FFFBF6F1FFEC8B43FFFBD7
        B4FFED8E48FFE68431CFD67F0E0FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E69018FFFFFFFFFFFFFF
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFFFFFEFEFEFFF09A58FFF19F
        60FFEA9243CFD9820F0FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E89119FFFEFBF7FFFEFE
        FEFFFEFDFCFFFEFDFBFFFEFDFBFFFDFAF6FFFEFDFBFFFEFDFDFFF5AA6EFFEE9F
        56CFDC85110FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9931AEFE89219FFE791
        19FFE68F18FFE58E17FFE38D16FFE28C16FFE18B15FFE08914FFF3AD68CFDE87
        130FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    end
  end
  object PrimechGB: TGroupBox
    Left = 0
    Top = 255
    Width = 410
    Height = 103
    Align = alClient
    Caption = '&'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object PrimechMemo: TMemo
      Left = 2
      Top = 15
      Width = 406
      Height = 86
      Align = alClient
      TabOrder = 0
    end
  end
end
