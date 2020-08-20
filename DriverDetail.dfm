object DriverDetailDialog: TDriverDetailDialog
  Left = 711
  Top = 218
  BorderStyle = bsToolWindow
  Caption = #1044#1077#1090#1072#1083#1080#1079#1072#1094#1080#1103' '#1074#1086#1076#1080#1090#1077#1083#1103
  ClientHeight = 592
  ClientWidth = 510
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
  object DriverGB: TGroupBox
    Left = 0
    Top = 0
    Width = 510
    Height = 122
    Align = alTop
    Caption = '&'#1042#1086#1076#1080#1090#1077#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 25
      Width = 61
      Height = 13
      Caption = '&'#1060#1072#1084#1080#1083#1080#1103':'
    end
    object Label2: TLabel
      Left = 8
      Top = 50
      Width = 30
      Height = 13
      Caption = '&'#1048#1084#1103':'
    end
    object Label3: TLabel
      Left = 8
      Top = 75
      Width = 60
      Height = 13
      Caption = '&'#1054#1090#1095#1077#1089#1090#1074#1086':'
    end
    object Label4: TLabel
      Left = 312
      Top = 28
      Width = 97
      Height = 13
      Caption = '&'#1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
    end
    object Label17: TLabel
      Left = 8
      Top = 100
      Width = 37
      Height = 13
      Caption = '&'#1040#1076#1088#1077#1089
    end
    object Label18: TLabel
      Left = 312
      Top = 53
      Width = 91
      Height = 13
      Caption = '&'#1055#1088#1080#1085#1103#1090' '#1085#1072' '#1088#1072#1073'.'
    end
    object FamilyEdit: TEdit
      Left = 110
      Top = 24
      Width = 195
      Height = 21
      TabOrder = 0
    end
    object NameEdit: TEdit
      Left = 110
      Top = 48
      Width = 195
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object LastNameEdit: TEdit
      Left = 110
      Top = 72
      Width = 195
      Height = 21
      TabOrder = 2
    end
    object BirthDayDP: TDateTimePicker
      Left = 414
      Top = 25
      Width = 91
      Height = 21
      Date = 44060.690885787040000000
      Time = 44060.690885787040000000
      TabOrder = 3
    end
    object AvailableChB: TCheckBox
      Left = 312
      Top = 75
      Width = 80
      Height = 17
      Alignment = taLeftJustify
      Caption = '&'#1059#1074#1086#1083#1077#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object AdressEdit: TEdit
      Left = 110
      Top = 96
      Width = 390
      Height = 21
      TabOrder = 5
    end
    object HiringDP: TDateTimePicker
      Left = 414
      Top = 50
      Width = 91
      Height = 21
      Date = 44060.690885787040000000
      Time = 44060.690885787040000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
  object PassportGB: TGroupBox
    Left = 0
    Top = 122
    Width = 510
    Height = 104
    Align = alTop
    Caption = '&'#1055#1072#1089#1087#1086#1088#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label5: TLabel
      Left = 104
      Top = 20
      Width = 41
      Height = 13
      Caption = '&'#1057#1077#1088#1080#1103':'
    end
    object Label6: TLabel
      Left = 248
      Top = 20
      Width = 44
      Height = 13
      Caption = '&'#1053#1086#1084#1077#1088':'
    end
    object PassSerialEdit: TEdit
      Left = 162
      Top = 16
      Width = 71
      Height = 21
      TabOrder = 0
    end
    object PassNumEdit: TEdit
      Left = 306
      Top = 16
      Width = 95
      Height = 21
      TabOrder = 1
    end
    object PassGaveGB: TGroupBox
      Left = 2
      Top = 38
      Width = 506
      Height = 64
      Align = alBottom
      Caption = '&'#1050#1077#1084' '#1074#1099#1076#1072#1085
      TabOrder = 2
      object PassGaveMemo: TMemo
        Left = 2
        Top = 15
        Width = 502
        Height = 47
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object BtnsPanel: TPanel
    Left = 0
    Top = 560
    Width = 510
    Height = 32
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 2
    object OkBtn: TBitBtn
      Left = 176
      Top = 2
      Width = 59
      Height = 23
      Caption = '&'#1054#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFDFDFD7A7C76DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8D857EAB4975
        7C6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9B9E977AA34A7CB33A79A04BAFB0AEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B8B5789A507CAF406B7F547C
        B33A74885CE8E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        A7A9A57795527CB33A748263B0B1B079A04B7DB23B7D8573FCFCFCFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF93988E7CB33A78915CD9D9D9FFFFFF7E
        87737CB33A7CAC4283897BFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C2C2C26A7A56BFC0BEFFFFFFFFFFFFDADADA7690577CB33A7BAA43868B7FFBFB
        FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAD4D4D4FFFFFFFFFFFFFFFFFFFF
        FFFF9598917CAC427CB33A7CAD41767F6BEDEDEDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9747E687CB33A7CB33A7CB3
        3C767A72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE2E2E2758A5D7CB33A7AA24BC0C0C0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9CAC97085576E7E
        5CFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFDEDEDEB1B2B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object CancelBtn: TBitBtn
      Left = 272
      Top = 2
      Width = 75
      Height = 23
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
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFB4B4EC8E8EE68080
        E58F8FE6C9C9F0FFFFFFEFECE9CAC1B7D1C9C0D1C9C0D1C9C0D1C9C0D1C9C0D1
        C9C0D3CAC1948FCC8585EF9090F78F8FF79090F77C7BE5BFBDE2EBE8E4EBE8E4
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFE8080E49898F8E5E5FDAAAA
        F9E2E2FD9090F78786DDEBE8E4EBE8E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFE3E3F78181EB8F8FF7C1C1FBFFFFFFAAAAF98F8FF77F7EE0EBE8E4EBE8E4
        FFFFFFFDF4EDFFFFFFFAE8DAF9E2D1F9E2D1F3DECB7F7CDF9898F8EBEBFEC0C0
        FBE5E5FD9090F78483DDEBE8E4EBE8E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF9191E38B8BF49999F88F8FF79999F88585EEA19FD8EBE8E4EBE8E4
        FFFFFFFDF4EDFFFFFFFAE8DAF9E2D1F9E2D1F9E2D0F3DECB938BD2817FE18584
        EB8181E69C9AD9E7E2DEEBE8E4EBE8E4FFFFFFFDF4EDFFFFFFFAE8DAF9E2D1F9
        E2D1F9E2D1F9E2D1F9E2D1F5DFD1E8E0E9FEFEFFEAE7E3ECE8E4EBE8E4EBE8E4
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFEBE8E4EBE8E4EBE8E4EBE8E4FFFFFFFDF4EDFFFFFFFAE8DAF9E2D1F9
        E2D1F9E2D1F9E2D1F9E2D1F9E2D1FDF4EDFFFFFFEBE8E4EBE8E4EBE8E4EBE8E4
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFEBE8E4EBE8E4EBE8E4EBE8E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE8E4EBE8E4E1DDD7BBB0A2
        C3B9ADC3B9ADC3B9ADC3B9ADC3B9ADC3B9ADC3B9ADC3B9ADC3B9ADC3B9ADC3B9
        ADC3B9ADBBB0A2E1DDD7DBD5CE9C8B789C8B789C8B789C8B789C8B789C8B789C
        8B789C8B789C8B789C8B789C8B789C8B789C8B789C8B78DBD5CEE1DCD7A59684
        A69886A69886A69886A69886A69886A69886A69886A69886A69886A69886A698
        86A69886A59684E1DCD7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object CarGB: TGroupBox
    Left = 0
    Top = 385
    Width = 510
    Height = 107
    Align = alTop
    Caption = '&'#1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label7: TLabel
      Left = 104
      Top = 34
      Width = 143
      Height = 13
      Caption = '&'#1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1079#1085#1072#1082':'
    end
    object Label8: TLabel
      Left = 104
      Top = 13
      Width = 50
      Height = 13
      Caption = '&'#1052#1086#1076#1077#1083#1100':'
    end
    object Label9: TLabel
      Left = 104
      Top = 57
      Width = 27
      Height = 13
      Caption = '&'#1058#1080#1087':'
    end
    object Label10: TLabel
      Left = 296
      Top = 84
      Width = 26
      Height = 13
      Caption = '&'#1043#1086#1076':'
    end
    object Label11: TLabel
      Left = 104
      Top = 84
      Width = 30
      Height = 13
      Caption = '&'#1062#1074#1077#1090
    end
    object CarBtn: TBitBtn
      Left = 396
      Top = 9
      Width = 27
      Height = 21
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
      Left = 200
      Top = 10
      Width = 193
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object RegSymbolEdit: TEdit
      Left = 256
      Top = 34
      Width = 137
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object TypeEdit: TEdit
      Left = 168
      Top = 58
      Width = 225
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object ColorEdit: TEdit
      Left = 168
      Top = 82
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object YearEdit: TEdit
      Left = 328
      Top = 82
      Width = 65
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
  end
  object PrimechGB: TGroupBox
    Left = 0
    Top = 492
    Width = 510
    Height = 68
    Align = alClient
    Caption = '&'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object PrimechMemo: TMemo
      Left = 2
      Top = 15
      Width = 506
      Height = 51
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object LicenseGB: TGroupBox
    Left = 0
    Top = 226
    Width = 510
    Height = 159
    Align = alTop
    Caption = '&'#1042#1086#1076#1080#1090#1077#1083#1100#1089#1082#1086#1077' '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object Label12: TLabel
      Left = 104
      Top = 19
      Width = 41
      Height = 13
      Caption = '&'#1057#1077#1088#1080#1103':'
    end
    object Label13: TLabel
      Left = 248
      Top = 19
      Width = 44
      Height = 13
      Caption = '&'#1053#1086#1084#1077#1088':'
    end
    object Label14: TLabel
      Left = 104
      Top = 45
      Width = 67
      Height = 13
      Caption = '&'#1050#1072#1090#1077#1075#1086#1088#1080#1080':'
    end
    object Label15: TLabel
      Left = 103
      Top = 71
      Width = 13
      Height = 13
      Caption = '&'#1057':'
    end
    object Label16: TLabel
      Left = 268
      Top = 71
      Width = 22
      Height = 13
      Caption = '&'#1044#1086':'
    end
    object LicenseGaveGB: TGroupBox
      Left = 2
      Top = 96
      Width = 506
      Height = 61
      Align = alBottom
      Caption = '&'#1050#1077#1084' '#1074#1099#1076#1072#1085
      TabOrder = 0
      object LicenseGaveMemo: TMemo
        Left = 2
        Top = 15
        Width = 502
        Height = 44
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object LicenseSerialEdit: TEdit
      Left = 162
      Top = 16
      Width = 71
      Height = 21
      TabOrder = 1
    end
    object LicenseNumEdit: TEdit
      Left = 306
      Top = 16
      Width = 96
      Height = 21
      TabOrder = 2
    end
    object LicenseCategoriesEdit: TEdit
      Left = 182
      Top = 43
      Width = 219
      Height = 21
      TabOrder = 3
    end
    object LicenseBegDP: TDateTimePicker
      Left = 140
      Top = 68
      Width = 91
      Height = 21
      Date = 44060.726182141200000000
      Time = 44060.726182141200000000
      TabOrder = 4
    end
    object LicenseEndDP: TDateTimePicker
      Left = 311
      Top = 68
      Width = 91
      Height = 21
      Date = 44060.727741863430000000
      Time = 44060.727741863430000000
      TabOrder = 5
    end
  end
end
