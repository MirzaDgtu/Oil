object InsuranceDetailForm: TInsuranceDetailForm
  Left = 715
  Top = 141
  BorderStyle = bsToolWindow
  Caption = #1057#1090#1088#1072#1093#1086#1074#1086#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
  ClientHeight = 447
  ClientWidth = 364
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
  object DocGB: TGroupBox
    Left = 0
    Top = 0
    Width = 364
    Height = 97
    Align = alTop
    Caption = '&'#1055#1072#1088#1072#1084#1077#1090#1088#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 41
      Height = 13
      Caption = '&'#1057#1077#1088#1080#1103':'
    end
    object Label2: TLabel
      Left = 176
      Top = 24
      Width = 44
      Height = 13
      Caption = '&'#1053#1086#1084#1077#1088':'
    end
    object Label3: TLabel
      Left = 16
      Top = 55
      Width = 102
      Height = 13
      Caption = '&'#1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
    end
    object ReserveChB: TCheckBox
      Left = 112
      Top = 74
      Width = 129
      Height = 17
      Alignment = taLeftJustify
      Caption = '&'#1056#1077#1079#1077#1088#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object SerialEdit: TEdit
      Left = 64
      Top = 20
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object NumberEdit: TEdit
      Left = 224
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object DocDP: TDateTimePicker
      Left = 224
      Top = 48
      Width = 122
      Height = 21
      Date = 43977.660543622680000000
      Time = 43977.660543622680000000
      TabOrder = 3
    end
  end
  object DateDocGB: TGroupBox
    Left = 0
    Top = 97
    Width = 364
    Height = 56
    Align = alTop
    Caption = #1057#1088#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 27
      Width = 9
      Height = 13
      Caption = '&'#1057
    end
    object Label5: TLabel
      Left = 192
      Top = 27
      Width = 17
      Height = 13
      Caption = '&'#1055#1086
    end
    object BegDP: TDateTimePicker
      Left = 64
      Top = 24
      Width = 92
      Height = 21
      Date = 43977.662924340280000000
      Time = 43977.662924340280000000
      TabOrder = 0
      OnChange = BegDPChange
    end
    object EndDP: TDateTimePicker
      Left = 224
      Top = 24
      Width = 121
      Height = 21
      Date = 43977.662933784720000000
      Time = 43977.662933784720000000
      TabOrder = 1
      OnChange = BegDPChange
    end
  end
  object PrimechGB: TGroupBox
    Left = 0
    Top = 273
    Width = 364
    Height = 141
    Align = alClient
    Caption = '&'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object PrimechMemo: TMemo
      Left = 2
      Top = 24
      Width = 360
      Height = 115
      Align = alBottom
      TabOrder = 0
    end
  end
  object BtnsPnl: TPanel
    Left = 0
    Top = 414
    Width = 364
    Height = 33
    Align = alBottom
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object OkBtn: TBitBtn
      Left = 64
      Top = 3
      Width = 97
      Height = 28
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FCFEFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FB
        FFF0FBFFF0FBFFFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF4FF69D4FF8B
        DDFF8BDDFF8BDDFF8BDDFF8BDDFF8BDDFF8BDDFF8BDDFF8BDDFF8BDDFF8BDDFF
        8BDDFF69D4FFDCF5FFFFFFFFFFFFFFFFFFFFFFFFFF98DCFF5CC7FF71CEFF71CE
        FF71CEFF71CEFF71CEFF71CEFF71CEFF71CEFF71CEFF71CEFF71CEFF71CEFF5C
        C7FF99DCFFFFFFFFFFFFFFFFFFFFFFFFFF96D5FFD0ECFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFECFF96D5
        FFFFFFFFFFFFFFFFFFFFFFFFFF99D0FFE5F3FFFFFFFFDBEEFF70BDFF77C0FF77
        C0FF77C0FF77C0FF77C0FF77C0FF70BDFFDCEFFFFFFFFFE5F3FF99D0FFFFFFFF
        FFFFFFFFFFFFFFFFFF9BCAFFE6F2FFFFFFFFB4D7FF6AB0FF7AB9FF7AB9FF7AB9
        FF7AB9FF7AB9FF7AB9FF6AB0FFB4D7FFFFFFFFE6F2FF9BCAFFFFFFFFFFFFFFFF
        FFFFFFFFFF9DC5FFE7F1FFFFFFFFB6D4FFCEE2FFFFFFFFFFFFFFFAFDFFFAFDFF
        FFFFFFFFFFFFCEE2FFB6D4FFFFFFFFE7F1FF9DC5FFFFFFFFFFFFFFFFFFFFFFFF
        FFA0C0FFE7EFFFFFFFFFB7D0FFCFDFFFFFFFFFECF2FFB5CAFFB5CAFFEDF2FFFF
        FFFFCFDFFFB7D0FFFFFFFFE7EFFFA0C0FFFFFFFFFFFFFFFFFFFFFFFFFFA2BAFF
        E8EEFFFFFFFFB9CBFFD0DDFFFFFFFFDCD1FFBAA4FFBAA4FFDCD1FFFFFFFFD0DD
        FFB9CBFFFFFFFFE8EEFFA2BAFFFFFFFFFFFFFFFFFFFFFFFFFFA4B5FFE8EDFFFF
        FFFFBBC8FFD2DAFFFFFFFFF7EEFFCD97FFCD98FFF7EFFFFFFFFFD2DAFFBBC8FF
        FFFFFFE8EDFFA4B5FFFFFFFFFFFFFFFFFFFFFFFFFFA6B0FFE9EBFFFFFFFFC3CA
        FFC2C8FFF3F4FFF3F4FFF3F4FFF3F4FFF3F4FFF3F4FFC2C8FFC4CAFFFFFFFFE9
        EBFFA6B0FFFFFFFFFFFFFFFFFFFFFFFFFFA9ABFFE9EAFFFFFFFFF8F8FFB1B3FF
        A3A5FFA3A5FFA3A5FFA3A5FFA3A5FFA3A5FFB2B4FFF9F9FFFFFFFFE9EAFFA9AB
        FFFFFFFFFFFFFFFFFFFFFFFFFFABA5FFEAE9FFFFFFFFF9F9FFA09AFFA09AFFA0
        9AFFA09AFFA09AFFA09AFFA09AFFA09AFFF9F9FFFFFFFFEAE9FFABA5FFFFFFFF
        FFFFFFFFFFFFFFFFFFADA0FFEBE7FFFFFFFFFEFEFFF5F3FFF5F3FFF5F3FFF5F3
        FFF5F3FFF5F3FFF5F3FFF5F3FFFEFEFFFFFFFFD2CBFFBBB0FFFFFFFFFFFFFFFF
        FFFFFFFFFFAF9BFFEBE6FFFFFFFFE3DCFF8A6CFF7856FF957AFF957AFF957AFF
        957AFF7856FF8A6CFFE4DCFFE5DEFF9175FFF8F6FFFFFFFFFFFFFFFFFFFFFFFF
        FFB59AFFE6DCFFFFFFFFC5B0FFC5B0FFB296FFFFFFFFFFFFFFFFFFFFFFFFFFB2
        96FFC5B0FFAA8CFF946CFFF6F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4D7FF
        9360FFB897FF9B6CFF9B6CFF915DFFB998FFB998FFB998FFB998FF915DFF9B6C
        FF8C56FFF6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF7FFEC
        E2FFEBE1FFEBE1FFEBE1FFEBE1FFEBE1FFEBE1FFEBE1FFEBE1FFF0E8FFFEFDFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
    end
    object CancelBtn: TBitBtn
      Left = 189
      Top = 3
      Width = 113
      Height = 28
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
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
  object CarGB: TGroupBox
    Left = 0
    Top = 153
    Width = 364
    Height = 120
    Align = alTop
    Caption = '&'#1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Label6: TLabel
      Left = 16
      Top = 40
      Width = 143
      Height = 13
      Caption = '&'#1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1079#1085#1072#1082':'
    end
    object Label7: TLabel
      Left = 16
      Top = 19
      Width = 50
      Height = 13
      Caption = '&'#1052#1086#1076#1077#1083#1100':'
    end
    object Label8: TLabel
      Left = 16
      Top = 63
      Width = 27
      Height = 13
      Caption = '&'#1058#1080#1087':'
    end
    object Label9: TLabel
      Left = 208
      Top = 90
      Width = 26
      Height = 13
      Caption = '&'#1043#1086#1076':'
    end
    object Label10: TLabel
      Left = 16
      Top = 90
      Width = 30
      Height = 13
      Caption = '&'#1062#1074#1077#1090
    end
    object CarBtn: TBitBtn
      Left = 320
      Top = 14
      Width = 42
      Height = 25
      TabOrder = 0
      OnClick = CarBtnClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFD8C3D1CEB6C6C4ABBBC7AEBED2BACAD2BACAD2BACAD2
        BACAD2BACAD2BACAD2BACAD2BACAC7AEBEC4ABBBCEB6C6D8C3D1FFFFFFC4ABBB
        988C8BA78899FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA789
        9A998B8CC4ABBBFFFFFFFFFFFFC3A7B8A6899BA77F99C8ACC8C8ACC8C8ACC8C8
        ACC8C8ACC8C8ACC8C8ACC8C8ACC8A77F99A6899BC3A7B8FFFFFFFFFFFFAE88B8
        9978EC9978ED9978ED9978ED9978ED9978ED9978ED9978ED9978ED9978ED9978
        ED9978ECAE89B8FFFFFFFFFFFFA983C09B72C09B75D89B72C09C72BA9C72BA9C
        72BA9C72BA9C72BA9C72BA9C73BF9B76D99C73BFAA83C0FFFFFFFFFFFFA380A5
        A89BC0A798BEA283C99F77C99F77C99F7ADC9F7ADC9F77C99F77C9A283C9A798
        BEA89BC0A380A5FFFFFFFFFFFFA480A7A791BEA58ABEA587E9A583F2A583F2A5
        83F2A583F2A583F2A583F2A687E9A58ABEA791BEA480A7FFFFFFFFFFFFA982BD
        A583F2A583F2A583F2A583F2A583F2A583F2A583F2A583F2A583F2A583F2A583
        F2A583F2AC85BCFFFFFFDCC8D3B68EABAE84ABC39DAEC7A3B0C39DAEC7A3B0C7
        A3B0C39DAEB1849CC7A3AFB58BA1C39EACB388AABC96AADCC9D3DCC9D3C6A4B0
        B3889FF6DBBAFBE3C5FDEBD3FAE1C2FEEEDAFCE8CFEED1BDCAA7B1D6B8BCFCEB
        DBB2889EC6A4B0DDC8D3FFFFFFFFFFFFE7DBE1E1C1B0F9DEBBFBE3C6FDEAD2FA
        E2C2FFEEDBFCE7CDFBE3C6FFEFDEE5CBC7E8DAE1FFFFFFFFFFFFFFFFFFFFFFFF
        FDFCFCCDAAADF9DEBBF9DEBBFBE3C4E1C5BEDEBCB2FEEFDAFCE9CEFBE4C5CFAD
        B4FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2B7C2E4C5B3F7DCBAF9DEBBFB
        E3C4FDEBD3FAE1C2FCECD9E6CABED3B9C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFFE2D1DACDB1BFCBAFBECBAFBECBAEBDCBAFBDCEB1C0E2D3DBFFFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object ModelEdit: TEdit
      Left = 80
      Top = 16
      Width = 237
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object RegSymbolEdit: TEdit
      Left = 168
      Top = 40
      Width = 149
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object TypeEdit: TEdit
      Left = 80
      Top = 64
      Width = 237
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object ColorEdit: TEdit
      Left = 80
      Top = 88
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object YearEdit: TEdit
      Left = 240
      Top = 88
      Width = 77
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
  end
end
