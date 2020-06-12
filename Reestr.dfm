object ReestrForm: TReestrForm
  Left = 328
  Top = 177
  Width = 1239
  Height = 675
  Caption = #1056#1077#1077#1089#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object SB: TStatusBar
    Left = 0
    Top = 613
    Width = 1223
    Height = 23
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 150
      end>
  end
  object HeaderPanel: TPanel
    Left = 0
    Top = 0
    Width = 1223
    Height = 25
    Align = alTop
    TabOrder = 1
  end
  object DocReestrGB: TGroupBox
    Left = 0
    Top = 25
    Width = 1096
    Height = 588
    Align = alClient
    Caption = '&'#1044#1086#1082#1091#1084#1077#1085#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 2
      Top = 478
      Width = 1092
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object NaklGrid: TDBGrid
      Left = 2
      Top = 15
      Width = 1092
      Height = 463
      Align = alClient
      DataSource = AppData.DS_Nakl
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      PopupMenu = NaklPopMenu
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'UNICUM_NUM'
          Title.Alignment = taCenter
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUM_DOC'
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATE_DOC'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SUM_DOC'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CAR_UID'
          Title.Alignment = taCenter
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'REG_SYMBOL'
          Title.Alignment = taCenter
          Title.Caption = #1056#1077#1075'. '#1089#1080#1084#1074#1086#1083
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'VIN'
          Title.Alignment = taCenter
          Title.Caption = 'VIN '#1085#1086#1084#1077#1088
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'MODEL'
          Title.Alignment = taCenter
          Title.Caption = #1052#1086#1076#1077#1083#1100
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 135
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'COLOR'
          Title.Alignment = taCenter
          Title.Caption = #1062#1074#1077#1090
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 122
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FAMILY'
          Title.Alignment = taCenter
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'sFamily'
          Title.Alignment = taCenter
          Title.Caption = #1057#1086#1079#1076#1072#1083
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 135
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CREATE_DATE'
          Title.Alignment = taCenter
          Title.Caption = #1057#1086#1079#1076#1072#1085#1086
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'WHO_CORR'
          Title.Alignment = taCenter
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'sWHO_CORR'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1083
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 123
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CORR_DATE'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1085#1086
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TYPE_DOC'
          Title.Alignment = taCenter
          Title.Caption = #1058#1080#1087' '#1076'-'#1090#1072
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 77
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PRIMECH'
          Title.Alignment = taCenter
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'OTMETKA'
          Title.Alignment = taCenter
          Title.Caption = #1054#1090#1084#1077#1090#1082#1072
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Archive'
          Title.Alignment = taCenter
          Title.Caption = #1040#1088#1093#1080#1074
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
    object MoveGB: TGroupBox
      Left = 2
      Top = 481
      Width = 1092
      Height = 105
      Align = alBottom
      Caption = '&'#1057#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1076'-'#1090#1072
      TabOrder = 1
      object MoveGrid: TDBGrid
        Left = 2
        Top = 15
        Width = 1088
        Height = 88
        Align = alClient
        DataSource = AppData.DS_Move
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        PopupMenu = MovePopMenu
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ROWID'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNICUM_NUM'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_DOC'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_PREDM'
            Title.Alignment = taCenter
            Title.Caption = #1040#1088#1090#1080#1082#1083
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 91
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NAME_PREDM'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 258
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'KOLC_PREDM'
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 117
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SUM_PREDM'
            Title.Alignment = taCenter
            Title.Caption = #1062#1077#1085#1072
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 104
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Res_Sum'
            Title.Alignment = taCenter
            Title.Caption = #1057#1091#1084#1084#1072
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 91
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FAMILY'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'sFamily'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CREATE_DATE'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'WHO_CORR'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'sWho_Corr'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CORR_DATE'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Primech'
            Title.Alignment = taCenter
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.Color = clSkyBlue
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 278
            Visible = True
          end>
      end
    end
  end
  object BtnsRightPanel: TPanel
    Left = 1096
    Top = 25
    Width = 127
    Height = 588
    Align = alRight
    TabOrder = 3
    object Bevel1: TBevel
      Left = 7
      Top = 15
      Width = 112
      Height = 178
    end
    object NewNaklBtn: TBitBtn
      Left = 13
      Top = 22
      Width = 100
      Height = 23
      Caption = '&'#1044#1086#1073#1072#1074#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00CF7809EFCE7708FFCC7406FFCB7306FFC87104FFC76F03FFC56D
        02FFC46C01FFC26A00FFC26A00FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D27B0BFFF6E7DAFFF4E2D1FFF3DFCCFFF1D9C3FFEFD6BEFFEDD0
        B4FFECCDAEFFE9C39FFFF5E0C9FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D47C0CFFF7EADEFFF5E5D6FFF4E2D1FFF2DDC8FFF1DAC3FFEED3
        B9FFEDD0B4FFEBCAA9FFF9F0E7FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D67F0EFFF9EFE6FFF7EADEFFF6E8DAFFF4E2D1FFF3E0CDFFF1DA
        C4FFF0D7BFFFEDD1B4FFFAF2EAFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D8810FFFFAF1E9FFF8EDE2FFF7EADEFFF5E5D6FFF4E3D2FFF2DD
        C9FFF1DAC4FFEED4BAFFFAF3ECFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00DB8411FFFBF5F0FFFAF1E9FFF9EFE6FFF7EBDFFFF6E8DBFFF4E3
        D2FFF3E0CEFFF1DAC4FFFBF4EEFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00DC8512FFFCF7F3FFFAF3EDFFFAF1E9FFF8EDE3FFF7EBDFFFF5E6
        D7FFF4E3D2FFF2DDC9FFFBF5F0FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00DF8813FFFDFBF8FFFCF7F3FFFBF6F0FFFAF2EAFFF9EFE6FFF7EB
        DFFFE3D8CDFFE2D4C7FFF7F3EFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E18A14FFFEFCFAFFFCF9F6FFFCF7F3FFFAF4EDFFFAF2EAFFF2CA
        ACFFB9977FFFB8957DFFD2AD8FFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E38D16FFFFFEFEFFFEFCFAFFFDFBF8FFFCF8F3FFFBF6F0FFE87B
        2DFFFFE0BBFFE87D2FFFE2771ECFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E58E17FFFFFFFEFFFEFDFCFFFEFCFAFFFDF9F6FFFCF8F3FFEC8B
        43FFFBD7B4FFE68431CFD67F0E0FFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E89119FFFFFEFEFFFFFEFCFFFFFDFCFFFFFFFEFFFFFEFDFFF5AA
        6EFFEE9F56CFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E9931AEFE89219FFE68F18FFE58E17FFE28C16FFE18B15FFF3AD
        68CFDE87130FFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object CheckNaklBtn: TBitBtn
      Left = 13
      Top = 120
      Width = 100
      Height = 23
      Caption = '&'#1054#1090#1084#1077#1090#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FCFDF800CEDB8E00C6D57B00C6D57B00CEDB
        8E00FCFDF800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00F9FBF200D1DD9400ABC13C00A6BE3200A6BE3200A6BE3200A6BE
        3200ABC13C00D1DE9600FAFBF300FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00ABC13C00A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
        3200A6BE3200A6BE3200A6BE3200ABC23D00FF00FF00FF00FF00FF00FF00F9FA
        F100A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
        3200A6BE3200A6BE3200A6BE3200A6BE3200F9FBF200FF00FF00FF00FF00D0DD
        9300A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
        3200A6BE3200A6BE3200A6BE3200A6BE3200D2DE9600FF00FF00FAFCF500A9C0
        3900A6BE3200A6BE3200A6BE3200A6BE3200DEE7B300B9CC5D00A6BE3200A6BE
        3200A6BE3200A6BE3200A6BE3200A6BE3200AAC13B00FBFCF600CEDB8E00A6BE
        3200A6BE3200A6BE3200A7BF3400DCE6AF00F8FAF000FF00FF00DAE4AB00A6BE
        3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200CFDC9100C5D57A00A6BE
        3200A6BE3200AAC13C00E6ECC400FF00FF00ACC34000EBF0D100FF00FF00CBD9
        8700A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200C6D57B00C6D57B00A6BE
        3200A6BE3200BFD16D00FF00FF00DFE7B400A6BE3200AFC44600F6F8E900FFFF
        FE00A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200C6D57C00CEDC8F00A6BE
        3200A6BE3200A6BE3200B0C54900A6BE3200A6BE3200A6BE3200B4C85200F5F8
        E800DCE6AF00ADC34300A6BE3200A6BE3200A6BE3200CFDC9100FAFCF500A9C0
        3900A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
        3200C5D57A00E0E9B800B4C85200A6BE3200AAC13B00FBFCF600FF00FF00CDDB
        8C00A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
        3200A6BE3200A6BE3200A6BE3200A6BE3200CEDB8E00FF00FF00FF00FF00F9FA
        F100A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
        3200A6BE3200A6BE3200A6BE3200A6BE3200F9FBF200FF00FF00FF00FF00FF00
        FF00ABC13C00A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
        3200A6BE3200A6BE3200A6BE3200ABC23D00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00F9FBF100CDDB8D00A8C03700A6BE3200A6BE3200A6BE3200A6BE
        3200A8C03700CEDB8E00F9FBF200FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00F9FBF100CEDB8E00C6D57B00C6D57B00CEDB
        8E00F9FBF200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object UnCheckNaklBtn: TBitBtn
      Left = 13
      Top = 144
      Width = 100
      Height = 23
      Caption = '&'#1057#1085#1103#1090#1100' '#1086#1090#1084#1077#1090#1082#1091
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00F1EAEF00B099B000AA93AB00AD95AE00BAA6
        B900FDFDFD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00DDD1DB00A193B20097CAEE0097D3F600ACC5D500ACA2B300B3D6DD00A2B0
        CA0097D2F5009CA9CA00B9A4B800FDFDFD00FF00FF00FF00FF00FF00FF00FF00
        FF009F97B60097D2F5009DD5F300B3949D00E5B68600E8BA8700F7CA8500DCAD
        8800A6BFD60097D3F6009AB6D900B8A2B600FF00FF00FF00FF00FF00FF00F9F6
        F80097D0F300A09EBB00ECCB9000F2C48600F8CB8500F8CB8500F8CB8500F8CB
        8500F8CB8500ABA1B30098C9EC009DA5C700FF00FF00FF00FF00FF00FF00BFAB
        BC009CACCD00CFAA9400F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB
        8500F8CB8500EFC18600A291AF0097D2F500FDFDFD00FF00FF00EEE6EB009EA4
        C400CCA79400F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB
        8500F8CB8500F8CB8500F3C68600A099B600BAA7BA00FF00FF00E2D4DD009CB3
        D400E7B98600F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB
        8500F8CB8500F8CB8500F8CB8500A693AB00B299AD00FF00FF00DBCAD400AAC2
        DB00EBBE8600F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB
        8500F8CB8500F8CB8500F8CB8500AF94A300B69AAC00FF00FF00E6D8E100ABB8
        CF00E2B38700F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB
        8500F8CB8500F8CB8500F8CB8500B094A300BA9DAF00FF00FF00FF00FF00B497
        AA00AE91A200F2C58600F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB
        8500F8CB8500F8CB8500BA959700ACD5EC00F2EBEF00FF00FF00FF00FF00DDCC
        D600ACCEE500B9919500F8CA8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB
        8500F8CB8500D9AE8B00ABA7BC00ADDBF100FF00FF00FF00FF00FF00FF00FF00
        FF00ACD3EA00ADBDD300B8909400F2C58600F8CB8500F8CB8500F8CB8500F8CB
        8500E2BA8E00AD9CAF00AEE1F800AC96AB00FF00FF00FF00FF00FF00FF00FF00
        FF00B395A800ABD2EA00ACCCE400AE91A200DFB08700E6B88600E6B88700ECC4
        8D00B5E0ED00AEE1F700AD9EB300E2D4DD00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FFFEFF00DDCCD500B394A800ACB8CE00AAC3DC00AABCD300ACAA
        BE00C6ACBB00F9F6F800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00E8DCE400DFCFD900E4D6DF00F1E9
        EE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object RefreshReestrBtn: TBitBtn
      Left = 13
      Top = 96
      Width = 100
      Height = 23
      Caption = '&'#1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 3
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000078001F0075006F006D007F0069007F0062
        002FFF00FF00FF00FF00FF00FF000053002FFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000087000F007E00FF007E04FF008B18FF008A1CFF0066
        00FF006300DFFF00FF00FF00FF00005300EFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00009500CF009402FF00BE3BFF00CC51FF00E173FF00E97FFF00F4
        91FF00F896FF007109FF006400FF005C00FFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00009800FF00A311FF00A419FF009F16FF00B135FF00C653FF00F6
        94FF00F999FF00C763FF00871EFF006300FFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00009900FF0099007FFF00FF00FF00FF00FF00FF00008C001F0088
        00FF00B23BFF00FEA0FF00FFA1FF007200FFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000099005FFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00008F
        00DF00A01EFF00FEA1FF00FFA2FF007900FFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000079001F009900CF0098
        00FF009700FF009000FF008D00FF008600FFFF00FF00FF00FF00FF00FF000085
        00FF008000FF007700FF007200FF006900FF006400FFFF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000090
        00FF00FFA2FF00FEA1FF00FEA0FF007500DF0070000FFF00FF00FF00FF00FF00
        FF00FF00FF000053005F0053006FFF00FF00FF00FF00FF00FF00FF00FF000095
        00FF00FFA2FF00FEA0FF00FD9FFF007B00FF007700AFFF00FF00FF00FF00FF00
        FF000059000F005300FF0053007FFF00FF00FF00FF00FF00FF00FF00FF000099
        00FF00F897FF00D663FF00FC9DFF00F795FF00F38FFF00A835FF008D1BFF008B
        1AFF00981EFF005B00FF0056003FFF00FF00FF00FF00FF00FF00FF00FF000099
        00FF00AC1EFF009E09FF00E77EFF00F491FF00F08AFF00E274FF00D865FF00C0
        3DFF00AC23FF006100CFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF000099
        00EF0099002FFF00FF000099005F009600FF00A217FF009E19FF009714FF007C
        00FF007700BFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000099
        002FFF00FF00FF00FF00FF00FF000098002F0096007F008E007F0089007F0081
        001FFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object DelNaklBtn: TBitBtn
      Left = 13
      Top = 72
      Width = 100
      Height = 23
      Caption = '&'#1059#1076#1072#1083#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000883FFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000883FFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000004969F00059DFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00030691FF00018C9FFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000889F008BF4FF003ED8FF00059DFF0000899FFF00FF00FF00FF000B10
        919F7899DBFF4A82EFFF0024BAFF00018D9FFF00FF00FF00FF00FF00FF000000
        883F4246A9FF4DB1F8FF008CF5FF000CB5FF00059DFFFF00FF00FF00FF004D89
        DBFF91C8FBFF0055EAFF0039D0FF00028FFF0000883FFF00FF00FF00FF00FF00
        FF00FF00FF00A1B2E0FFA4DBFEFF008EF5FF005CE1FF00059BFF006ADBFF1D87
        F4FF006AEEFF0027BEFF000DA1FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF001314929F83A6E0FF1A9FF9FF008FF5FF000BB1FF0035BDFF0076
        F0FF005FE5FF0013A8FF00008A9FFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF002A83E0FF029CFAFF0091F6FF008CF5FF005D
        E2FF0021B0FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00003EB2FF00A2F9FF0097F7FF0092F6FF0061
        E4FF0023B2FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000889F0047B4FF00B4FCFF00AEFBFF00A4F9FF069FFAFF0094
        F6FF006FE9FF001CB7FF0002929FFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000048B4FF00C0FFFF00BAFDFF00B5FDFF0040B3FF0976E0FF2BAA
        FAFF0096F7FF003BD4FF0018B8FFFF00FF00FF00FF00FF00FF00FF00FF000000
        883F0F3FB2FF2EC8FFFF00C0FFFF00C0FFFF0047B4FFFF00FF00FF00FF00689D
        E0FFACE0FEFF0098F7FF006BE7FF000DB5FF0000883FFF00FF00FF00FF00FF00
        FF000000889FA0E6FEFF4AD2FFFF0048B4FF0000889FFF00FF00FF00FF000E12
        929F8EACE0FF51BCFAFF0099F7FF0004989FFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000889F4A56B2FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF002834A3FF0000889FFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000883FFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000883FFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object CorrNaklBtn: TBitBtn
      Left = 13
      Top = 47
      Width = 100
      Height = 23
      Caption = '&'#1048#1079#1084#1077#1085#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF001564844F1564841FFF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DF72
        0004DF72001C156484CF218CB2FF31C3EFFF156484FFFF00FF00FF00FF00FF00
        FF00FF00FF00CE7708FFCD7507FFCB7306FFCA7205FFC76F03FFC66E03FFCA6D
        01FFBF6C08FF228DB2FF36D1FFFF1B789BFF1564849FFF00FF00FF00FF00FF00
        FF00FF00FF00F6E7DAFFF5E5D5FFF3DFCDFFF2DCC8FFEFD5BAFFEABB8CFF3C72
        82FF2B91B2FF41D0F7FF1C799BFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00F7EADEFFF6E8DAFFF1D1B1FFEEC69EFFECBC8CFFDDB384FF2F93
        B2FF55DFFFFF1F7A9BFF566753FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00F9EFE6FFF5DFC8FF748E8CFF156484FF156484FF3797B2FF60DF
        F7FF237C9BFFFAF2EAFFC66F03FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FAF1E9FFF3D5B6FF3791AAFF73E1EFFF7BF1FFFF76EFFFFF257D
        9BFF678F9AFFFAF3ECFFC87004FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FBF5F0FF88ACB9FF156484FFA3BABFFF3088A2FF7FF3FFFF769A
        A3FFF2DDC9FFFBF4EEFFCB7306FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FCF7F3FFA5BFC8FFDDE0DDFFF7E8D9FF226A85FF65CFE0FF6893
        A1FFF3E0CEFFFBF5F0FFCC7507FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FDFBF8FFFCF9F6FFFBF6F0FFCFD9D9FF59BED0FF3D99B2FFE3D8
        CDFFE3D6CAFFF7F3EFFFC47809FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FEFCFAFFFDFBF8FFFCF7F3FF156484FF317590FF87AAB5FFB997
        7FFFB9967EFFD2AD8FFFBB7207FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FFFEFEFFFEFDFCFFFDFBF8FFFCF9F6FFFBF6F0FFFBF4EDFFFFE0
        BBFFFAC894FFE2771ECFD47D0C0FFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FFFFFEFFFFFEFEFFFEFCFAFFFDFBF8FFFCF8F3FFFBF6F1FFFBD7
        B4FFED8E48FFD67F0E0FFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FDFCFAFFFEFDFDFFFFFDFCFFFEFCF9FFFEFBF9FFFCF4EBFFEE9F
        56CFDC85110FFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E89219FFE79119FFE58E17FFE38D16FFE18B15FFE08914FFDE87
        130FFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object ArchiveChB: TCheckBox
      Left = 14
      Top = 170
      Width = 98
      Height = 17
      Alignment = taLeftJustify
      Caption = '&'#1040#1088#1093#1080#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object PrintGB: TGroupBox
      Left = 6
      Top = 304
      Width = 113
      Height = 73
      Caption = '&'#1055#1077#1095#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object PrintDocBtn: TBitBtn
        Left = 8
        Top = 42
        Width = 100
        Height = 23
        Caption = '&'#1044#1086#1082#1091#1084#1077#1085#1090
        TabOrder = 0
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFD7D0C8D7D0C8D7D0C8D7D0C8D7D0C8D7D0C8D7D0C8D7D0C8D7D0C8D7D0
          C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D0C8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D0C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFD7D0C8FFFFFFE3DED9D7D1C9D7D1C9D7D1C9D7D1C9E3DED9FFFFFFD7D0
          C8FFFFFFFFFFFFFFFFFFE6E1DEBCAD9FBDAC9FC7BDB2FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFC7BDB2BDAC9FBDAD9FE8E3DEC6B9AED4C1B0
          D1BEACCFC2B6F4EEE6DBD2C7D0C7BAD0C7BAD0C7BAD0C7BADBD2C7F4EEE6CFC2
          B6D1BEACD4C1B0C6B9ADC8BAAED4C1B0B4A08E9F8B79C7B9ABC7B9ABC7B9ABC7
          B9ABC7B9ABC7B9ABC7B9ABC7B9AB9F8B79B5A08ED4C1B0C8BAAEC8BAAED4C1B0
          D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1
          B0D4C1B0D4C1B0C8BAAEC8BAAED4C1B0D4C1B0D1BAA7CCA88DCCA88DCCA88DCC
          A88DCCA88DCCA88DCCA88DCCA88DD2BAA8D4C1B0D4C1B0C8BAAEC8BAAED4C1B0
          D4C1B0CD9E7AEEB68AF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BEEB68ACD9E
          7AD4C1B0D4C1B0C8BAAEC8BAAED4C1B0D4C1B0D1A07BF0B78BF0B78BF0B78BF0
          B78BF0B78BF0B78BF0B78BF0B78BD1A07BCFC6B9CFC6B9C8BAAEC8BAAFD4C1B0
          D4C1B0D1A07BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BD1A0
          7BCFC6B9CFC6B9C8BAAFDAD2CABFAD9EC2AE9FC69570D9A47AD9A47AD9A47AD9
          A47AD9A47AD9A47AD9A47AD9A47AC69570C2AE9FC0AE9FDAD3CCFFFFFFFFFFFF
          ECE8E5C5BBAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5BB
          AEECE8E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D0C8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D0C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFD7D0C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D0
          C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D0C8D7D0C8D7D0C8D7D0C8D7
          D0C8D7D0C8D7D0C8D7D0C8D7D0C8D7D0C8FFFFFFFFFFFFFFFFFF}
      end
      object PrintReestrBtn: TBitBtn
        Left = 8
        Top = 18
        Width = 100
        Height = 23
        Caption = '     &'#1056#1077#1077#1089#1090#1088
        TabOrder = 1
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000C5BEB0C5BEB0
          C5BEB0DFDBD3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDB
          D3C5BEB0C5BEB0C5BEB0C5BEB0DFDBD3ECE9E5F4F3F0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F3F0ECE9E5DFDBD3C5BEB0C5BEB0ECE9E5
          FFFFFFEFEEFFDCD8FFDCD8FFDCD8FFDCD8FFDCD8FFDCD8FFDCD8FFDCD8FFEFEE
          FFFFFFFFECE9E5C5BEB0DFDBD3F4F3F0FFFFFFEBE9FFD2CDFFD2CDFFD2CDFFD2
          CDFFD2CDFFD2CDFFD2CDFFD2CDFFEBE9FFFFFFFFF4F3F0DFDBD3FFFFFFFFFFFF
          FFFFFFEBE9FFD2CDFFD2CDFFD2CDFFD2CDFFD2CDFFD2CDFFD2CDFFD2CDFFEBE9
          FFFFFFFFFFFFFFFFFFFF547DFF547DFF547DFF4E76FD4970FE4970FE4970FE49
          70FE4970FE4970FE4970FE4970FE4E76FD547DFF547DFF547DFFC6D4FFC6D4FF
          C6D4FFC3C1D8C1ABA9C1ABA9C1ABA9C1ABA9C1ABA9C1ABA9C1ABA9C1ABA9C3C1
          D8C6D4FFC6D4FFC6D4FFFFFFFFFFFFFFFFFFFFFCE7CDF6C284D67F25D67F25D6
          7F25D67F25D67F25D67F25F6C284FCE7CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFCE7CDF8C98EF5C183F5C183F5C183F5C183F5C183F5C183F8C98EFCE7
          CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE7CDF5C386DB8834DB8834DB
          8834DB8834DB8834DB8834F5C386FCE7CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFCE7CDF9CA90F9CA90F9CA90F9CA90F9CA90FAD19FFBD5A6FACE98FCE7
          CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE7CDF9CA90F9CA90F9CA90F9
          CA90F9CA90FCE6C6FDEACDFAD19FFEF8EFFFFFFFFFFFFFFFFFFFDFDBD3F4F3F0
          FFFFFFFCE7CDF9CA90F9CA90F9CA90F9CA90F9CA90FBDAAFFAD09BFEF6ECFFFF
          FFFFFFFFF4F3F0DFDBD3C5BEB0ECE9E5FFFFFFFDECD7FAD5A6FAD5A6FAD5A6FA
          D5A6FAD5A6FAD6AAFEF7EFFFFFFFFFFFFFFFFFFFECE9E5C5BEB0C5BEB0DFDBD3
          ECE9E5F4F3F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F3
          F0ECE9E5DFDBD3C5BEB0C5BEB0C5BEB0C5BEB0DFDBD3FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDBD3C5BEB0C5BEB0C5BEB0}
      end
    end
    object RangeGB: TGroupBox
      Left = 8
      Top = 196
      Width = 112
      Height = 101
      Caption = '&'#1055#1077#1088#1080#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object RangeLbl: TLabel
        Left = 8
        Top = 17
        Width = 95
        Height = 48
        AutoSize = False
        Caption = 'RangeLbl'
        WordWrap = True
      end
      object RangeBtn: TBitBtn
        Left = 16
        Top = 72
        Width = 75
        Height = 25
        Caption = '&'#1055#1077#1088#1080#1086#1076
        TabOrder = 0
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FDFAF8F4E7DA
          F4E7DAF4E7DAF4E7DAF4E7DAF4E7DAF4E7DAF4E7DAF4E7DAF4E7DAF4E7DAF4E7
          DAF4E7DAF4E7DAFDFAF8F4E7DAF7D9B8FCDEBDFCDEBDFCDEBDFCDEBDFCDEBDFC
          DEBDFCDEBDFCDEBDFCDEBDFCDEBDFCDEBDFCDEBDF7D9B8F4E7DAF4E7DAF7E4CF
          FFF1E2FFF1E2FFF1E2FFF1E2FFF1E2FFF1E2FFF1E2FFF1E2FFF1E2FFF1E2FFF1
          E2FFF1E2F7E4CFF4E7DAF4E7DAF4E7DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DAF4E7DAF4E7DAF4E7DA
          FFFFFFFFFCF9FFFCF9FFFAF4FFFEFCFFFBF6FFFBF6FFFEFCFFFAF4FFFFFFFFFF
          FFFFFFFFF4E7DAF4E7DAF4E7DAF4E7DAFFFFFFFFF7EEFFF7EEFFEEDCFFFBF6FF
          F2E5FFF2E5FFFBF6FFEEDCFFFFFFFFFFFFFFFFFFF4E7DAF4E7DAF4E7DAF4E7DA
          FFFFFFFFF7EEFFF7EEFFEEDCFFFBF6FFF2E5FFF2E5FFFBF6FFEEDCFFF7EEFFF7
          EEFFFFFFF4E7DAF4E7DAF4E7DAF4E7DAFFFFFFFFFCF9FFFCF9FFFAF4FFFEFCFF
          FBF6FFFBF6FFFEFCFFFAF4FFFCF9FFFCF9FFFFFFF4E7DAF4E7DAF4E7DAF4E7DA
          FFFFFFFFF4E8FFF4E8FEE8D0FFFAF4FFEEDCFFEEDCFFFAF4FEE8D0FFF4E8FFF4
          E8FFFFFFF4E7DAF4E7DAF4E7DAF4E7DAFFFFFFFFFFFFFFFFFFFFF4E8FFFCF9FF
          F7EEFFF7EEFFFCF9FFF4E8FFFAF4FFFAF4FFFFFFF4E7DAF4E7DAF4E7DAF4E7DA
          FFFFFFFFFFFFFFFFFFFFF4E8FFFCF9FFF7EEFFF7EEFFFCF9FFF4E8FFFAF4FFFA
          F4FFFFFFF4E7DAF4E7DAF4E7DAF4E7DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E7DAF4E7DAF2E3D4EBD4BC
          F4E7DAF4E7DAF4E7DAF4E7DAF4E7DAF4E7DAF4E7DAF4E7DAF4E7DAF4E7DAF4E7
          DAF4E7DAEBD4BCF2E3D4EBD4BCEABE8EF3CBA0F3CBA0F3CBA0F3CBA0F3CBA0F3
          CBA0F3CBA0F3CBA0F3CBA0F3CBA0F3CBA0F3CBA0EABE8EEBD4BCEBD4BCEABE8E
          F3CBA0F3CBA0F3CBA0F3CBA0F3CBA0F3CBA0F3CBA0F3CBA0F3CBA0F3CBA0F3CB
          A0F3CBA0EABE8EEBD4BCFBF5F1EBD4BCEBD4BCEBD4BCEBD4BCEBD4BCEBD4BCEB
          D4BCEBD4BCEBD4BCEBD4BCEBD4BCEBD4BCEBD4BCEBD4BCFBF5F1}
      end
    end
  end
  object AL: TActionList
    Left = 784
    Top = 192
    object AddAction: TAction
      Category = 'Nakl'
      Caption = 'AddAction'
    end
    object CorrAction: TAction
      Category = 'Nakl'
      Caption = 'CorrAction'
    end
  end
  object IL: TImageList
    Left = 824
    Top = 192
    Bitmap = {
      494C01011F002200040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F1EAEF00B099B000AA93AB00AD95AE00BAA6B900FDFDFD000000
      0000000000000000000000000000000000000000000000000000FFFCFE00FFF0
      FB00FFF0FB00FFF0FB00FFF0FB00FFF0FB00FFF0FB00FFF0FB00FFF0FB00FFF0
      FB00FFF0FB00FFFCFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDD1DB00A193
      B20097CAEE0097D3F600ACC5D500ACA2B300B3D6DD00A2B0CA0097D2F5009CA9
      CA00B9A4B800FDFDFD0000000000000000000000000000000000FF5CC700FF71
      CE00FF71CE00FF71CE00FF71CE00FF71CE00FF71CE00FF71CE00FF71CE00FF71
      CE00FF71CE00FF5CC70000000000000000000000000000000000757320007573
      1C0057574B00C8C8C80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009F97B60097D2
      F5009DD5F300B3949D00E5B68600E8BA8700F7CA8500DCAD8800A6BFD60097D3
      F6009AB6D900B8A2B60000000000000000000000000000000000FFD0EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFCFEC0000000000000000000000000000000000747212007573
      1E006C6B48006F6E4E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9F6F80097D0F300A09E
      BB00ECCB9000F2C48600F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500ABA1
      B30098C9EC009DA5C70000000000000000000000000000000000FFE5F3000000
      0000FFDBEE00FF70BD00FF77C000FF77C000FF77C000FF77C000FF70BD00FFDC
      EF0000000000FFE5F3000000000000000000000000000000000072724F006969
      4E0075741A007472140000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFABBC009CACCD00CFAA
      9400F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500EFC1
      8600A291AF0097D2F500FDFDFD00000000000000000000000000FFE6F2000000
      0000FFB4D700FF6AB000FF7AB900FF7AB900FF7AB900FF7AB900FF6AB000FFB4
      D70000000000FFE6F200000000000000000000000000000000006F6F56007472
      12007472120074721200DEDEDE0000000000EBEBEB00CDCDCD00BCBCBC00E6E6
      E600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EEE6EB009EA4C400CCA79400F8CB
      8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB
      8500F3C68600A099B600BAA7BA00000000000000000000000000FFE7EF000000
      0000FFB7D000FFCFDF00FFECF200FFB5CA00FFB5CA00FFEDF200FFCFDF00FFB7
      D00000000000FFE7EF000000000000000000000000000000000000000000E8E8
      E8007E7D6F00787628006D6C4F00757421006C6B43007877510084834F007877
      51006F6E41006C6B590000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2D4DD009CB3D400E7B98600F8CB
      8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB
      8500F8CB8500A693AB00B299AD00000000000000000000000000FFE8EE000000
      0000FFB9CB00FFD0DD00FFDCD100FFBAA400FFBAA400FFDCD100FFD0DD00FFB9
      CB0000000000FFE8EE0000000000000000000000000000000000000000000000
      0000FDFDFD0060605A0067664D007F7E4B00868451008D8D6300838265007E7C
      5C008A894A006D6C4E00FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DBCAD400AAC2DB00EBBE8600F8CB
      8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB
      8500F8CB8500AF94A300B69AAC00000000000000000000000000FFE8ED000000
      0000FFBBC800FFD2DA00FFF7EE00FFCD9700FFCD9800FFF7EF00FFD2DA00FFBB
      C80000000000FFE8ED0000000000000000000000000000000000000000000000
      0000E7E7E7006C6C46007B7A4E0094936C00CCC97500CFCC7400CFCC7400CFCC
      7400A6A471008C8A480097979600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E6D8E100ABB8CF00E2B38700F8CB
      8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB
      8500F8CB8500B094A300BA9DAF00000000000000000000000000FFE9EB000000
      0000FFC3CA00FFC2C800FFF3F400FFF3F400FFF3F400FFF3F400FFC2C800FFC4
      CA0000000000FFE9EB0000000000000000000000000000000000000000000000
      0000B4B4B40066664D00BBB87500CFCC7400CFCC7400CFCC7400CFCC7400CFCC
      7400CFCC74008C8B670074746500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B497AA00AE91A200F2C5
      8600F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB
      8500BA959700ACD5EC00F2EBEF00000000000000000000000000FFEAE9000000
      0000FFF9F900FFA09A00FFA09A00FFA09A00FFA09A00FFA09A00FFA09A00FFF9
      F90000000000FFEAE90000000000000000000000000000000000000000000000
      0000AFAFAF0083834B00CFCC7400CFCC7400CFCC7400CFCC7400CFCC7400CFCC
      7400CFCC740096946C0077777000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DDCCD600ACCEE500B991
      9500F8CA8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500F8CB8500D9AE
      8B00ABA7BC00ADDBF10000000000000000000000000000000000FFEBE7000000
      0000FFFEFE00FFF5F300FFF5F300FFF5F300FFF5F300FFF5F300FFF5F300FFFE
      FE0000000000FFD2CB0000000000000000000000000000000000000000000000
      0000D1D1D10081804A00CFCC7400CFCC7400CFCC7400CFCC7400CFCC7400CFCC
      7400CFCC740082805C00CBCBCB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ACD3EA00ADBD
      D300B8909400F2C58600F8CB8500F8CB8500F8CB8500F8CB8500E2BA8E00AD9C
      AF00AEE1F800AC96AB0000000000000000000000000000000000FFEBE6000000
      0000FFE3DC00FF8A6C00FF957A00FF957A00FF957A00FF957A00FF8A6C00FFE4
      DC00FFE5DE00FF91750000000000000000000000000000000000000000000000
      00000000000088876000CFCC7400CFCC7400CFCC7400CFCC7400CFCC7400CFCC
      7400A2A16F008E8D460000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B395A800ABD2
      EA00ACCCE400AE91A200DFB08700E6B88600E6B88700ECC48D00B5E0ED00AEE1
      F700AD9EB300E2D4DD0000000000000000000000000000000000FFE6DC000000
      0000FFC5B000FFC5B00000000000000000000000000000000000FFC5B000FFAA
      8C00FF946C00FFF6F30000000000000000000000000000000000000000000000
      000000000000C2C2C00086856600CFCC7400CFCC7400CFCC7400CFCC7400B0AF
      740082804D007D7C660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFE
      FF00DDCCD500B394A800ACB8CE00AAC3DC00AABCD300ACAABE00C6ACBB00F9F6
      F800000000000000000000000000000000000000000000000000FFFAF700FFEC
      E200FFEBE100FFEBE100FFEBE100FFEBE100FFEBE100FFEBE100FFF0E800FFFE
      FD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEDEDE008888750083814C0086854A0084844A008D8D
      7E00F4F4F4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E8DCE400DFCFD900E4D6DF00F1E9EE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0F0F000C7C7C700EEEEEE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001564844F1564841F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000053000F005800CF0053003F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DF720004DF72001C1564
      84CF218CB2FF31C3EFFF156484FF000000000000000000000000000000000000
      0000000000000078001F0075006F006D007F0069007F0062002F000000000000
      0000000000000053002F00000000000000000000000000000000000000000000
      00000000000000000000D4AE9200FEFDFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000005600CF009330FF005700DF0053000F00000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE77
      08FFCD7507FFCB7306FFCA7205FFC76F03FFC66E03FFCA6D01FFBF6C08FF228D
      B2FF36D1FFFF1B789BFF1564849F000000000000000000000000000000000000
      00000087000F007E00FF007E04FF008B18FF008A1CFF006600FF006300DF0000
      000000000000005300EF000000000000000000000000FDFBFA00D1A27F00D2A0
      7A00D3A07A00D3A07A00E0AA8000EEB58900D1A17B00EFE1D600D9B69C00D3A0
      7A00D3A27D00D6AB890000000000000000000000000000000000000000000053
      000F005500CF00EE88FF00FB9CFF00E47DFF006308FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000F6E7
      DAFFF5E5D5FFF3DFCDFFF2DCC8FFEFD5BAFFEABB8CFF3C7282FF2B91B2FF41D0
      F7FF1C799BFF0000000000000000000000000000000000000000000000000095
      00CF009402FF00BE3BFF00CC51FF00E173FF00E97FFF00F491FF00F896FF0071
      09FF006400FF005C00FF0000000000000000FFFEFE00D1A58400F0B78B00F0B7
      8B00F0B78B00F0B78B00F0B78B00F0B78B00E3AB8000D3AB8D00D8B39700F0B7
      8B00F0B78B00F0B78B00DDBFA800000000000000000000000000000000000054
      00CF009230FF00FDA0FF00FFA2FF00FA9BFF00C760FF0053000F000000000000
      000000000000000000000000000000000000000000000000000000000000F7EA
      DEFFF6E8DAFFF1D1B1FFEEC69EFFECBC8CFFDDB384FF2F93B2FF55DFFFFF1F7A
      9BFF566753FF0000000000000000000000000000000000000000000000000098
      00FF00A311FF00A419FF009F16FF00B135FF00C653FF00F694FF00F999FF00C7
      63FF00871EFF006300FF0000000000000000E9D8CA00DFA77D00D3A17A00D6AF
      9200D6AF9200D6AF9200D49E7600DCA67E00DDBEA70000000000EBD9CB00D6AF
      9200D6AE9100D4A17A00D6A27A00F6EFE900000000000053000F005400CF00F7
      96FF00FFA2FF0FFFA7FF6BDAA9FF1EFEB2FF00FC9EFF006D0FFF0053004F0000
      000000000000000000000000000000000000000000000000000000000000F9EF
      E6FFF5DFC8FF748E8CFF156484FF156484FF3797B2FF60DFF7FF237C9BFFFAF2
      EAFFC66F03FF0000000000000000000000000000000000000000000000000099
      00FF0099007F000000000000000000000000008C001F008800FF00B23BFF00FE
      A0FF00FFA1FF007200FF0000000000000000DAB89D00EDB38800EDDED3000000
      00000000000000000000C18B6300EAD5C6000000000000000000000000000000
      000000000000EEDED200EAB18400E0C3AD0000000000005300CF009032FF00FF
      A2FF00FFA2FFBFF4DDFF0F5D0FFF5AEEC9FF06FCA1FF00C861FF005700EF0000
      000000000000000000000000000000000000000000000000000000000000FAF1
      E9FFF3D5B6FF3791AAFF73E1EFFF7BF1FFFF76EFFFFF257D9BFF678F9AFFFAF3
      ECFFC87004FF0000000000000000000000000000000000000000000000000099
      005F0000000000000000000000000000000000000000008F00DF00A01EFF00FE
      A1FF00FFA2FF007900FF0000000000000000D8B39700F0B78B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0B78B00D8B3970000000000005300BF9FBE9FFF4FFF
      BFFFEFFFF9FF0053009F0000000037915CDF61EECBFF00F694FF00EE87FF0053
      006F00000000000000000000000000000000000000000000000000000000FBF5
      F0FF88ACB9FF156484FFA3BABFFF3088A2FF7FF3FFFF769AA3FFF2DDC9FFFBF4
      EEFFCB7306FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000079001F009900CF009800FF009700FF0090
      00FF008D00FF008600FF0000000000000000D8B39700F0B78B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0B78B00D8B39700000000000053000F005300CFFFFF
      FFFF8FB38FFF0053000F0000000010651A5F5AC8A5FF00F491FF00F18CFF0059
      00EF0053001F000000000000000000000000000000000000000000000000FCF7
      F3FFA5BFC8FFDDE0DDFFF7E8D9FF226A85FF65CFE0FF6893A1FFF3E0CEFFFBF5
      F0FFCC7507FF00000000000000000000000000000000008500FF008000FF0077
      00FF007200FF006900FF006400FF000000000000000000000000000000000000
      000000000000000000000000000000000000D8B39700F0B78B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0B78B00D8B397000000000000000000000000000053
      00AF0053003F00000000000000000000000010651A5F61F9D4FF0CEE8EFF00E1
      73FF007311FF000000000000000000000000000000000000000000000000FDFB
      F8FFFCF9F6FFFBF6F0FFCFD9D9FF59BED0FF3D99B2FFE3D8CDFFE3D6CAFFF7F3
      EFFFC47809FF00000000000000000000000000000000009000FF00FFA2FF00FE
      A1FF00FEA0FF007500DF0070000F000000000000000000000000000000000053
      005F0053006F000000000000000000000000D8B39700F0B78B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0B78B00D8B397000000000000000000000000000000
      0000000000000000000000000000000000000000000061EAC6FF48F3BCFF00DE
      6EFF00C754FF0053002F0000000000000000000000000000000000000000FEFC
      FAFFFDFBF8FFFCF7F3FF156484FF317590FF87AAB5FFB9977FFFB9967EFFD2AD
      8FFFBB7207FF00000000000000000000000000000000009500FF00FFA2FF00FE
      A0FF00FD9FFF007B00FF007700AF0000000000000000000000000059000F0053
      00FF0053007F000000000000000000000000DFC0AA00EAB18500EDDED3000000
      000000000000000000000000000000000000EAD5C600C18B6300000000000000
      000000000000EEDED200EAB18400E0C3AD000000000000000000000000000000
      00000000000000000000000000000000000000000000298145DF61E0BBFF06D6
      66FF00CC52FF00740DFF0053007F00000000000000000000000000000000FFFE
      FEFFFEFDFCFFFDFBF8FFFCF9F6FFFBF6F0FFFBF4EDFFFFE0BBFFFAC894FFE277
      1ECFD47D0C0F00000000000000000000000000000000009900FF00F897FF00D6
      63FF00FC9DFF00F795FF00F38FFF00A835FF008D1BFF008B1AFF00981EFF005B
      00FF0056003F000000000000000000000000F6EEE900D6A27C00D3A17A00DAB4
      9700DBBAA000EDDDD00000000000DDBFA700DCA67E00D49F7700DBBAA000DBBA
      A000DAB49700D4A17A00D6A37C00F6EFE9000000000000000000000000000000
      000000000000000000000000000000000000000000000053005F54B891FF3CE2
      98FF00C648FF00A622FF005D01FF00000000000000000000000000000000FFFF
      FEFFFFFEFEFFFEFCFAFFFDFBF8FFFCF8F3FFFBF6F1FFFBD7B4FFED8E48FFD67F
      0E0F0000000000000000000000000000000000000000009900FF00AC1EFF009E
      09FF00E77EFF00F491FF00F08AFF00E274FF00D865FF00C03DFF00AC23FF0061
      00CF0000000000000000000000000000000000000000DEC0A900F0B78B00F0B7
      8B00F0B78B00D8B39700D3AB8D00E3AB8000F0B78B00F0B78B00F0B78B00F0B7
      8B00F0B78B00F0B78B00DEC0AA00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000053003F61E9
      BAFF54C999FF0053009F0053000F00000000000000000000000000000000FDFC
      FAFFFEFDFDFFFFFDFCFFFEFCF9FFFEFBF9FFFCF4EBFFEE9F56CFDC85110F0000
      00000000000000000000000000000000000000000000009900EF0099002F0000
      00000099005F009600FF00A217FF009E19FF009714FF007C00FF007700BF0000
      0000000000000000000000000000000000000000000000000000D5A78500D6A4
      7D00D5A27A00D9B59B00EFE2D800D2A17B00EEB58900E3AC8100D5A27A00D5A2
      7A00D6A47D00D4A6850000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000054B4
      8EFF38925DBF000000000000000000000000000000000000000000000000E892
      19FFE79119FFE58E17FFE38D16FFE18B15FFE08914FFDE87130F000000000000
      000000000000000000000000000000000000000000000099002F000000000000
      0000000000000098002F0096007F008E007F0089007F0081001F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFDFC00D4AE9200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DFDB
      D300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DFDBD3000000000000000000000000000000000000000000000000000000
      0000FCFBF900D8D3C000B8AF8E00A69B7100A69B7100B8AF8E00D8D3C000FCFB
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFDBD300ECE9E500F4F3
      F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F4F3F000ECE9E500DFDBD30000000000000000000000000000000000D9D5
      C30090834E008071350080713500807135008071350080713500807135009184
      5000DBD6C5000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008453210F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECE9E500FFFFFF00EFEE
      FF00DCD8FF00DCD8FF00DCD8FF00DCD8FF00DCD8FF00DCD8FF00DCD8FF00DCD8
      FF00EFEEFF00FFFFFF00ECE9E500000000000000000000000000C7C1A6008172
      370080713500807135008E814D00A49A7000A49A70008E814D00807135008071
      350081723700C8C2A80000000000000000000000000000000000000000000000
      00000000000000000000000000009F6027FC0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CF78
      09EFCE7708FFCC7406FFCB7306FFC87104FFC76F03FFC56D02FFC46C01FFC26A
      00FFC26A00FF000000000000000000000000DFDBD300F4F3F000FFFFFF00EBE9
      FF00D2CDFF00D2CDFF00D2CDFF00D2CDFF00D2CDFF00D2CDFF00D2CDFF00D2CD
      FF00EBE9FF00FFFFFF00F4F3F000DFDBD30000000000DCD7C700817237008071
      35008D804A00D6D2C200F7F7F700F7F7F700F7F7F700F7F7F700D6D2C2008D80
      4A008071350081733700DEDACA00000000000000000000000000000000000000
      00000000000098551A2F98591FEFA8672DFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D27B
      0BFFF6E7DAFFF4E2D1FFF3DFCCFFF1D9C3FFEFD6BEFFEDD0B4FFECCDAEFFE9C3
      9FFFF5E0C9FF000000000000000000000000FFFFFF00FFFFFF00FFFFFF00EBE9
      FF00D2CDFF00D2CDFF00D2CDFF00D2CDFF00D2CDFF00D2CDFF00D2CDFF00D2CD
      FF00EBE9FF00FFFFFF00FFFFFF00FFFFFF00FCFCFA0091845100807135008D80
      4A00EBE9E300F6F6F600CCC7B100A9A07800AAA07900CDC8B300F7F7F700EBE9
      E3008D804A008071350093865300FCFCFA000000000000000000000000000000
      000000000000A15C21FFCE874AFFA5642AFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D47C
      0CFFF7EADEFFF5E5D6FFF4E2D1FFF2DDC8FFF1DAC3FFEED3B9FFEDD0B4FFEBCA
      A9FFF9F0E7FF000000000000000000000000547DFF00547DFF00547DFF004E76
      FD004970FE004970FE004970FE004970FE004970FE004970FE004970FE004970
      FE004E76FD00547DFF00547DFF00547DFF00D8D4C1008071350080713500D5D1
      C000F7F7F700A89E760080713500807135008071350080713500A9A07800F7F7
      F700D5D0BF008071350080713500DAD5C400000000000000000000000000AC57
      127FAF601FFFE46F1BFFDF5B00FFA16228FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D67F
      0EFFF9EFE6FFF7EADEFFF6E8DAFFF4E2D1FFF3E0CDFFF1DAC4FFF0D7BFFFEDD1
      B4FFFAF2EAFF000000000000000000000000C6D4FF00C6D4FF00C6D4FF00C3C1
      D800C1ABA900C1ABA900C1ABA900C1ABA900C1ABA900C1ABA900C1ABA900C1AB
      A900C3C1D800C6D4FF00C6D4FF00C6D4FF00B4AB8700807135008F824E00F7F7
      F700CEC8B300807135008071350080713500807135008071350080713500CFCA
      B600F7F7F70090834F0080713500B5AD8A00000000000000000000000000BB6A
      27FFE08D4AFFE05F06FFDF5C01FFA5652CFFA06128FF99612BFF96612CFF8F60
      2EFF8C6030FF855F32FF8D551EFF00000000000000000000000000000000D881
      0FFFFAF1E9FFF8EDE2FFF7EADEFFF5E5D6FFF4E3D2FFF2DDC9FFF1DAC4FFEED4
      BAFFFAF3ECFF000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FCE7
      CD00F6C28400D67F2500D67F2500D67F2500D67F2500D67F2500D67F2500F6C2
      8400FCE7CD00FFFFFF00FFFFFF00FFFFFF00A59A700080713500A59B7200F7F7
      F700A89E7700807135008071350080713500807135008071350080713500A9A0
      7800F7F7F700A59B720080713500A69B710000000000C0580BCFC26016FFF5AA
      6DFFF19C5BFFEE914BFFEC8B43FFE97E32FFE77829FFE36A16FFE1640DFFDF5C
      01FFDF5B00FFDF5B00FF90541CFF00000000000000000000000000000000DB84
      11FFFBF5F0FFFAF1E9FFF9EFE6FFF7EBDFFFF6E8DBFFF4E3D2FFF3E0CEFFF1DA
      C4FFFBF4EEFF000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FCE7
      CD00F8C98E00F5C18300F5C18300F5C18300F5C18300F5C18300F5C18300F8C9
      8E00FCE7CD00FFFFFF00FFFFFF00FFFFFF00A59B700080713500A59B7200F7F7
      F700ADA37E00807135008071350080713500807135008071350080713500A9A0
      7800F7F7F700A59B720080713500A69B710000000000C2590A9FC35E12FFF8B7
      80FFF7B077FFF4A76AFFF2A162FFEF9753FFEE914BFFEA853BFFE97E32FFE571
      1FFFE36A16FFE1630BFF90541CFF00000000000000000000000000000000DC85
      12FFFCF7F3FFFAF3EDFFFAF1E9FFF8EDE3FFF7EBDFFFF5E6D7FFF4E3D2FFF2DD
      C9FFFBF5F0FF000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FCE7
      CD00F5C38600DB883400DB883400DB883400DB883400DB883400DB883400F5C3
      8600FCE7CD00FFFFFF00FFFFFF00FFFFFF00B4AB88008071350090834F00F7F7
      F700CEC8B300807135008071350080713500807135008071350080713500C8C2
      AB00F6F6F6008F824D0080713500B5AD8A00000000000000000000000000BE58
      0CFFE59F65FFFDC696FFFCC392FFF3B681FFE49E65FFE0985DFFDE9458FFDA8C
      4EFFD88849FFD37F3DFF92551DFF00000000000000000000000000000000DF88
      13FFFDFBF8FFFCF7F3FFFBF6F0FFFAF2EAFFF9EFE6FFF7EBDFFFE3D8CDFFE2D4
      C7FFF7F3EFFF000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FCE7
      CD00F9CA9000F9CA9000F9CA9000F9CA9000F9CA9000FAD19F00FBD5A600FACE
      9800FCE7CD00FFFFFF00FFFFFF00FFFFFF00D6D1BD008071350080713500D7D3
      C300F6F6F600A79D7500807135008E814D0086783F008071350080713500B1A8
      8500C1BA9F008071350080713500D7D2C000000000000000000000000000C058
      0B9FBD580CFFFFCC9EFFFECC9DFFA35615FFA75614FF9F5617FF9C5518FF9455
      1BFF90541CFF89541FFF855320FF00000000000000000000000000000000E18A
      14FFFEFCFAFFFCF9F6FFFCF7F3FFFAF4EDFFFAF2EAFFF2CAACFFB9977FFFB895
      7DFFD2AD8FFF000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FCE7
      CD00F9CA9000F9CA9000F9CA9000F9CA9000F9CA9000FCE6C600FDEACD00FAD1
      9F00FEF8EF00FFFFFF00FFFFFF00FFFFFF00FCFBF90090834E00807135009083
      4F00EEECE700F6F6F600CFCAB500CBC5AF00EBEAE300ABA27C00807236008071
      3500807135008071350091845000FCFCFA000000000000000000000000000000
      000000000000BC580CFFE5A168FFA65A19FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E38D
      16FFFFFEFEFFFEFCFAFFFDFBF8FFFCF8F3FFFBF6F0FFE87B2DFFFFE0BBFFE87D
      2FFFE2771ECF000000000000000000000000DFDBD300F4F3F000FFFFFF00FCE7
      CD00F9CA9000F9CA9000F9CA9000F9CA9000F9CA9000FBDAAF00FAD09B00FEF6
      EC00FFFFFF00FFFFFF00F4F3F000DFDBD30000000000D8D3C000807236008071
      35008E814D00D5D1C000F6F6F600F7F7F700F7F7F700F7F7F700C8C2AA008071
      35008071350081723700D9D5C300000000000000000000000000000000000000
      000000000000BE580C9FBB580DFFBA7031FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E58E
      17FFFFFFFEFFFEFDFCFFFEFCFAFFFDF9F6FFFCF8F3FFEC8B43FFFBD7B4FFE684
      31CFD67F0E0F00000000000000000000000000000000ECE9E500FFFFFF00FDEC
      D700FAD5A600FAD5A600FAD5A600FAD5A600FAD5A600FAD6AA00FEF7EF00FFFF
      FF00FFFFFF00FFFFFF00ECE9E500000000000000000000000000C7C0A5008172
      370080713500807135008E814D00C3BDA300F2F1EE00B7AF8E00827439008071
      350081723700C8C1A70000000000000000000000000000000000000000000000
      0000000000000000000000000000B9580DFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E891
      19FFFFFEFEFFFFFEFCFFFFFDFCFFFFFFFEFFFFFEFDFFF5AA6EFFEE9F56CF0000
      00000000000000000000000000000000000000000000DFDBD300ECE9E500F4F3
      F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F4F3F000ECE9E500DFDBD30000000000000000000000000000000000D9D5
      C30090834E008071350080713500968A58008E814C0080713500807135009184
      5000DBD6C5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BC580C9F0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E993
      1AEFE89219FFE68F18FFE58E17FFE28C16FFE18B15FFF3AD68CFDE87130F0000
      000000000000000000000000000000000000000000000000000000000000DFDB
      D300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DFDBD3000000000000000000000000000000000000000000000000000000
      0000FCFBF900D5D0BC00B0A68100A4996E00A4996E00B0A78200D5D0BC00FCFB
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D7D0
      C800D7D0C800D7D0C800D7D0C800D7D0C800D7D0C800D7D0C800D7D0C800D7D0
      C800D7D0C8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5CCDA008BB1C5008BB1C5008BB1
      C5008BB1C5008BB1C5008BB1C5008BB1C5008BB1C5008BB1C5008BB1C5008BB1
      C5008BB1C5008BB1C500CAD9E30000000000000000000000000000000000D7D0
      C800000000000000000000000000000000000000000000000000000000000000
      0000D7D0C80000000000000000000000000000000000CFC0D100C3ACC300C3AC
      C300C3ACC300C3ACC300C3ACC300C3ACC300C3ACC300C3ACC300C3ACC300C3AC
      C300C3ACC300C4ADC300EEE8EE0000000000D6C4D400AD8FB000AE91B100AE91
      B100AE91B100AE91B100AE91B100AE91B100AE91B100AE91B100AE91B100AE91
      B100AE91B100AE91B100AD8FB000D6C5D4006FA1BC0085CDF40085CEF50085CE
      F50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CE
      F50085CEF50085CEF50077A8C00000000000000000000000000000000000D7D0
      C80000000000E3DED900D7D1C900D7D1C900D7D1C900D7D1C900E3DED9000000
      0000D7D0C80000000000000000000000000000000000AC95B400A597C200A69C
      C800A69CC800A597C100A597C100A597C100A69CC800A69CC800A597C100A597
      C100A597C100A9A6CE00C4AEC30000000000C4A9BF00A597C100A69CC800A69C
      C800A597C100A597C100A597C100A69CC800A69CC800A597C100A597C100A597
      C100A69CC800A69CC800A597C100C4A9BF007AA8BF007AC1E60085CEF50085CE
      F50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CE
      F50085CEF50085CEF50074A8C40000000000E6E1DE00BCAD9F00BDAC9F00C7BD
      B200000000000000000000000000000000000000000000000000000000000000
      0000C7BDB200BDAC9F00BDAD9F00E8E3DE0000000000B7A7C000B8C4DD00BBCF
      E600BBCFE600B8C4DD00B8C4DD00B8C4DD00BBCFE600BBCFE600B8C4DD00B8C4
      DD00B8C4DD00BED8EF00C7B0C40000000000C4A9BF00A597C100A69CC800A69C
      C800A597C100A597C100A597C100A69CC800A69CC800A597C100A597C100A597
      C100A69CC800A69CC800A597C100C4A9BF0088B1C7006DB0D30085CEF50085CE
      F50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CE
      F50085CEF50085CEF50070AAC70000000000C6B9AE00D4C1B000D1BEAC00CFC2
      B600F4EEE600DBD2C700D0C7BA00D0C7BA00D0C7BA00D0C7BA00DBD2C700F4EE
      E600CFC2B600D1BEAC00D4C1B000C6B9AD0000000000B7A7C000BED8EF00BED8
      EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8
      EF00BED8EF00BED8EF00C7B0C40000000000C3A8BF00B0AAD500B0AAD500B0AA
      D500B0AAD500AFA5D000B498B500BBA2BB00BBA2BB00B69AB600AFA7CF00B0AA
      D500B0AAD500B0AAD500B0AAD500C3A8BF008EB6CC0064A6C80085CEF50085CE
      F50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CE
      F50085CEF50085CEF50071AFD000F6F9FA00C8BAAE00D4C1B000B4A08E009F8B
      7900C7B9AB00C7B9AB00C7B9AB00C7B9AB00C7B9AB00C7B9AB00C7B9AB00C7B9
      AB009F8B7900B5A08E00D4C1B000C8BAAE0000000000B7A7C000BED8EF00BED8
      EF00BED8EF00AFA5C100AE9FBB00AE9FBB00AE9FBB00AE9FBB00B8C3DB00BED8
      EF00BED8EF00BED8EF00C7B0C40000000000CDB4C500B490A600B798AE00BDA6
      BE00BDA6BD00C4B1C500DEE8F300EFF6FF00F0F7FF00EBEEF700C3AEC400BCA3
      BC00BCA3BC00B799B000B490A600CDB4C5008EB6CC0061A3C60085CEF50085CE
      F50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CE
      F50085CEF50085CEF50078BDE200D5E2E900C8BAAE00D4C1B000D4C1B000D4C1
      B000D4C1B000D4C1B000D4C1B000D4C1B000D4C1B000D4C1B000D4C1B000D4C1
      B000D4C1B000D4C1B000D4C1B000C8BAAE0000000000B7A7C000BED8EF00BED8
      EF00BED8EF00BED8EF00B0A8C300BED8EF00BED8EF00B0A8C300BED8EF00BED8
      EF00BED8EF00BED8EF00C7B0C40000000000EEE6EB00C4A4AC00BC9DA900E3F2
      FC00E7F3FC00ECF5FE00EBF4FD00E3F1FB00EFF6FF00F0F7FF00F1F7FF00F0F7
      FF00F0F7FF00C0A4B200C4A5AE00EFE6EC008EB6CC005E9FC40085CEF50085CE
      F50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CE
      F50085CEF50085CEF50082CAF000ADC9D700C8BAAE00D4C1B000D4C1B000D1BA
      A700CCA88D00CCA88D00CCA88D00CCA88D00CCA88D00CCA88D00CCA88D00CCA8
      8D00D2BAA800D4C1B000D4C1B000C8BAAE0000000000B7A7C000BED8EF00BED8
      EF00BED8EF00BCD1E900AD9EBB00BED6EC00BCD1E800AD9EBB00BED6EC00BED8
      EF00BED8EF00BED8EF00C7B0C4000000000000000000C5A5B600B897A600DEEF
      FA00E7F4FC00F9FCFE00ECF5FE00EBF4FD00E3F1FB00EFF6FF00F2F8FF00F0F7
      FF00F0F7FF00BC9DAD00C4A5B500000000008EB6CC005CA0C60081C9F00085CE
      F50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CE
      F50085CEF50085CEF50085CEF50099BED200C8BAAE00D4C1B000D4C1B000CD9E
      7A00EEB68A00F0B78B00F0B78B00F0B78B00F0B78B00F0B78B00F0B78B00EEB6
      8A00CD9E7A00D4C1B000D4C1B000C8BAAE0000000000B7A7C000BED8EF00BED8
      EF00BED8EF00B4B5CF00A889A700BDD4EB00B3B5CE00A889A700BDD4EB00BED8
      EF00BED8EF00BED8EF00C7B0C4000000000000000000F0E7EC00A87C9700DEEF
      FA00DEEFFA00E7F4FC00E7F3FC00ECF5FE00EBF4FD00E3F1FB00F0F6FF00F0F7
      FF00F0F7FF00A97D9900F0E8ED00000000008EB6CC0060A9D00074B8DC0085CE
      F50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CEF50085CE
      F50085CEF50085CEF50085CEF5008EBAD200C8BAAE00D4C1B000D4C1B000D1A0
      7B00F0B78B00F0B78B00F0B78B00F0B78B00F0B78B00F0B78B00F0B78B00F0B7
      8B00D1A07B00CFC6B900CFC6B900C8BAAE0000000000B7A7C000BED8EF00BED8
      EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8
      EF00BED8EF00BED8EF00C7B0C400000000000000000000000000CBB3C500DEEF
      FA00C0B1C700BDAAC000BFABC100C1ABC100E7ECF600EBF4FD00E4F1FB00F7FA
      FF00F0F7FF00CAB2C50000000000000000008EB6CC0065AFDA005B9EC2005C9E
      C2005C9EC2005C9EC2005C9DC1006EB1D5007CC3E8007CC3E8007CC3E8007CC3
      E8007CC3E8007CC3E8007CC3E80079ACC800C8BAAF00D4C1B000D4C1B000D1A0
      7B00F0B78B00F0B78B00F0B78B00F0B78B00F0B78B00F0B78B00F0B78B00F0B7
      8B00D1A07B00CFC6B900CFC6B900C8BAAF0000000000B7A7C000BED8EF00BED8
      EF00BED8EF00BED8EF00B8C5DE00AFA5C100B2ACC800BED8EF00BED8EF00BED8
      EF00BED8EF00BED8EF00C7B0C400000000000000000000000000CBB3C500DEEF
      FA00C0B1C700BDAAC000C0B1C700D6D8E600C1ABC100DDDAE700EBF4FD00E4F1
      FB00F0F6FF00CAB2C50000000000000000008EB6CC0065B0DB0065B0DB0065B0
      DB0065B0DB0065B0DB0065B0DB0062AAD4005FA5CD005FA5CD005FA5CD005FA5
      CD005FA5CD005FA5CD008FB2C500DAE5EA00DAD2CA00BFAD9E00C2AE9F00C695
      7000D9A47A00D9A47A00D9A47A00D9A47A00D9A47A00D9A47A00D9A47A00D9A4
      7A00C6957000C2AE9F00C0AE9F00DAD3CC0000000000B6A7C000BED8EF00BED8
      EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8
      EF00BED8EF00BED7EE00C8B1C500000000000000000000000000D4C0CF00C3B2
      C700C2B2C700C2B2C700C2B2C700C2B2C700C5B3C800C6B4C900C7B5C900C6B4
      C900C4B3C800D2BFCF0000000000000000008EB6CC0065B0DB0065B0DB0065B0
      DB0065B0DB0064ADD80061A9D20061A9D20061A9D20061A9D20061A9D20061A9
      D20061A9D20061A9D200A1C0D000000000000000000000000000ECE8E500C5BB
      AE00000000000000000000000000000000000000000000000000000000000000
      0000C5BBAE00ECE8E500000000000000000000000000B99AB100B395AE00BCA8
      BE00BCA8BE00BCA8BE00BCA8BE00AE8AA600BCA8BE00BCA8BE00C0B0C700D1D3
      E200C0B0C700C3B1C600E9E0E80000000000000000000000000000000000B6A6
      C000BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8EF00BED8
      EF00B6A6C0000000000000000000000000008EB6CC0065B0DB0065B0DB0065B0
      DB0063ACD60085AFC600DAE4EA00DAE4EA00DAE4EA00DAE4EA00DAE4EA00DAE4
      EA00DAE4EA00DAE4EA00F0F5F70000000000000000000000000000000000D7D0
      C800000000000000000000000000000000000000000000000000000000000000
      0000D7D0C80000000000000000000000000000000000FDFDFD00CFB9CA00C4B3
      C700C4B3C800C4B3C800C4B3C800B290AA00C4B3C800C4B3C800C4B3C800C4B3
      C800C4ACC000EEE5EB000000000000000000000000000000000000000000B696
      B000AE9FBB00AE9FBB00AE9FBB00AE9FBB00AE9FBB00AE9FBB00AE9FBB00AE9F
      BB00B696B000000000000000000000000000C9DBE400A1C0D000A1C0D000A1C0
      D000AAC6D400FDFDFE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D7D0
      C800000000000000000000000000000000000000000000000000000000000000
      0000D7D0C8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D0BE
      CE00B8ABC400B8ABC400B8ABC400B8ABC400B8ABC400B8ABC400B8ABC400B8AB
      C400D0BECE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D7D0
      C800D7D0C800D7D0C800D7D0C800D7D0C800D7D0C800D7D0C800D7D0C800D7D0
      C800D7D0C8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DEDEDE00B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200C4C4C400000000000000000000000000FBF6F100F8EF
      E600F8EFE600F8EFE600F8EFE600F8EFE600F5E8DA00FAF2EA00E9C9AA00E7BA
      8C00E8B78500E7BC9000F1DFCB00000000000000000000000000FEF2E400FCE6
      CA00FEF6EC00FEF6ED00FEF6ED00FEF6ED00FEF6ED00FEF6ED00FEF6ED00FEF6
      ED00FEF6ED00FEFAF60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1EAF000BB9A
      C300AB87BF00B18CBF00CFB8D000FFFEFF000000000000000000000000000000
      00000000000000000000D0D0D000929292009292920092929200929292009292
      92009292920092929200ACACAC00000000000000000000000000E6CAAD00F4E7
      DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F5E9DF00E9CAA900F4C28D00FDCC
      9800FEDCB900FDCC9800ECBB8600F2E0CD0000000000FCE8D000F3A44300EF9E
      3C00F8BF7A00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDE
      BB00FBDEBB00FBDFBD00FEF7EF0000000000B59BB400B2A2BC00B2A2BC00B2A2
      BC00B2A2BC00B2A2BC00B2A2BC00B2A2BC00B2A2BC00B09BB600A27CAD009978
      EC009978ED009978ED009D79D800D0BAD1000000000000000000000000000000
      00000000000000000000EAEAEA00B9B9B900B9B9B900EAEAEA0000000000FAFA
      FA00C5C5C500AFAFAF00D8D8D800000000000000000000000000E8CFB5000000
      000000000000000000000000000000000000FEFDFC00E7B88700FDCC9800FDCC
      9800FFF5EA00FDCC9800FDCC9800E7BD910000000000F9C68700E18A2A00D57B
      1D00F6A94A00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDE
      BB00FBDEBB00FBDEBB00FDEBD60000000000BEACC200BBB6CC00BBB6CC00BBB6
      CC00C5CCE000C5CCE000BBB6CC00BBB6CC00BBB6CC00B8AFCD009A77DF00AD99
      F100B4A7F200C0BBF4009978ED00B18DC1000000000000000000000000000000
      00000000000000000000C4C4C4006464640060606000C3C3C30000000000EBEB
      EB006C6C6C005B5B5B0095959500000000000000000000000000E8CFB5000000
      000000000000000000000000000000000000F7EDE400EFBD8800FEE4C900FFF5
      EA00FFFDFB00FFF5EA00FEDCB900E8B8870000000000F8BE7700E6913100DB83
      2400F5AD5100FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDE
      BB00FBDEBB00FBDEBB00FDEDDA0000000000C3AFC400DEEFFA00DEEFFA00DEEF
      FA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00BBA9C9009977E7009F81
      EE00CBCEF600B6AAF3009978ED00AC87C1000000000000000000000000000000
      0000000000000000000000000000ACACAC005B5B5B00C2C2C200DEDEDE00DDDD
      DD006E6E6E007575750000000000000000000000000000000000E8CFB5000000
      0000FCF9F600E5C7A900E5C7A900E5C7A900ECD6BF00E7B68000FDCC9800FDCC
      9800FFF5EA00FDCC9800FDCC9800E7BC8E0000000000FAD7AA00F6AD5400F6AB
      4F00F9CD9700FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDE
      BB00FBDEBC00FCE5CA00FFFCF90000000000C3AFC400DEEFFA00DEEFFA00DEEF
      FA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00D0D2E500A07BCA00AA95
      F0009E80EE00AF9DF1009978EC00B997C00000000000A6A6A6008E8E8E009191
      9100EEEEEE000000000000000000E6E6E6005B5B5B0061616100666666006363
      63005B5B5B00B1B1B10000000000000000000000000000000000E8CFB5000000
      0000FDFBF900ECD7C200ECD7C200ECD7C200EDD9C500E2B88D00FAC89400FDCC
      9800FEE4C900FDCC9800F4C28C00EBCFB00000000000FBDCB500F9CA9000F0B8
      7500ECAE6800ECAE6800F0B87500F0B87500ECAE6800ECAE6800F9CA9000F9CA
      900000000000000000000000000000000000C3AFC400DEEFFA00DEEFFA00DEEF
      FA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00B9A4C600A07B
      CA009A77E4009A76DE00A67FAD00F3ECF20000000000C5C5C5005D5D5D007C7C
      7C00F9F9F90000000000F8F8F800EDEDED007D7D7D006A6A6A00FCFCFC009D9D
      9D005C5C5C00EAEAEA0000000000000000000000000000000000E8CFB5000000
      0000FEFDFB00F8EFE600F8EFE600F8EFE600F8EFE600F6EBDF00E3BB9000EBBA
      8700F0C08C00E8B78400EACBAA00FFFFFE0000000000FBDCB500F9CA9000F0B8
      7500ECAE6800ECAE6800F0B87500F0B87500ECAE6800ECAE6800F9CA9000F9CA
      900000000000000000000000000000000000C3AFC400DEEFFA00DEEFFA00DEEF
      FA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00D1D3
      E400BCABCA00C1B7D000C0A9BF000000000000000000000000008B8B8B006161
      6100A8A8A800A8A8A80094949400B2B2B200B8B8B8005B5B5B00CCCCCC006767
      6700828282000000000000000000000000000000000000000000E8CFB5000000
      0000FEFEFD00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F6EBE000FDFC
      F900F9F1EA00F6EBE200000000000000000000000000FBDCB500F9CA9000E8A5
      5B00E8A55B00F0B87500DF924000E8A55B00F0B87500DF924000F9CA9000F9CA
      900000000000000000000000000000000000C3AFC400DEEFFA00DEEFFA00DEEF
      FA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEF
      FA00DEEFFA00DEEFFA00C3AFC400000000000000000000000000C6C6C6005B5B
      5B007E7E7E009D9D9D00696969007C7C7C00F1F1F1005E5E5E006B6B6B005B5B
      5B00BEBEBE000000000000000000000000000000000000000000E8CFB5000000
      0000FDFAF800E9CFB500E9CFB500E9CFB500E9CFB500F4E7DA00000000000000
      000000000000DFBB9600000000000000000000000000FBDCB500F9CA9000E8A5
      5B00DF924000F0B87500E8A55B00DF924000DF924000DF924000F9CA9000F9CA
      900000000000000000000000000000000000C3AFC400DEEFFA00DEEFFA00DEEF
      FA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEFFA00DEEF
      FA00DEEFFA00DEEFFA00C3AFC400000000000000000000000000F7F7F7006161
      61008D8D8D00F5F5F500616161009393930000000000898989005B5B5B005E5E
      5E00F2F2F2000000000000000000000000000000000000000000E8CFB5000000
      0000FCF9F600E5C7A900E5C7A900E5C7A900E5C7A900E5C7A900E5C7A900FCF9
      F60000000000E7CEB300000000000000000000000000FBDCB500F9CA9000F0B8
      7500ECAE6800ECAE6800ECAE6800F5C18300F0B87500ECAE6800F9CA9000F9CA
      900000000000000000000000000000000000B28FAA00C3B2C800C3B2C800C3B2
      C800C3B2C800C3B2C800C3B2C800C3B2C800C3B2C800C3B2C800C3B2C800C7BA
      CF00D6D9E800C7BACF00C3AFC400000000000000000000000000000000009595
      95005F5F5F00B2B2B2005B5B5B00CDCDCD0000000000C6C6C6005B5B5B008F8F
      8F00000000000000000000000000000000000000000000000000E8CFB5000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E8CFB500000000000000000000000000FBDCB500F9CA9000F0B8
      7500ECAE6800ECAE6800ECAE6800F5C18300F0B87500ECAE6800F9CA9000F9CA
      900000000000000000000000000000000000C7B1C600F0F7FF00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7FF00F0F7
      FF00F0F7FF00F0F7FF00C5AEC40000000000000000000000000000000000D1D1
      D1005B5B5B005E5E5E0069696900FCFCFC0000000000F9F9F90095959500DCDC
      DC00000000000000000000000000000000000000000000000000E8CFB5000000
      00000000000000000000000000000000000000000000EDD8C200E4C29F00E4C2
      9F00E1BB9400DCB38800000000000000000000000000FBDCB500F9CA9000F9CA
      9000F9CA9000F9CA9000F9CA9000F9CA9000F9CA9000F9CA9000F9CA9000F9CA
      900000000000000000000000000000000000C7B1C600F0F7FF00F0F7FF00F0F7
      FF00EEF4FD00C0A7BD00C1ACC000C1ACC000B89BB300B497B100BBA7BE00BBA7
      BE00AE89A600C5ACBF00D9C8D60000000000000000000000000000000000FCFC
      FC00696969005B5B5B009E9E9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8CFB5000000
      00000000000000000000000000000000000000000000E9CDB100FEF0DF00FCEC
      D800DCB18600FBF7F300000000000000000000000000FBDFBB00FDF0E000FAD6
      A800FAD6A900FDEFDD00F9CC9500FCE4C700FCE4C700F9CD9600FDF0E000FAD6
      A80000000000000000000000000000000000C5AEC400F0F7FF00F0F7FF00EFF6
      FE00C9B7CB00B9A0B700C4B3C800C4B2C700AD86A200B5A7C000B6A9C300B6A9
      C200CDB8CA000000000000000000000000000000000000000000000000000000
      0000A2A2A2005B5B5B00DADADA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8CFB5000000
      00000000000000000000000000000000000000000000E9CDB100FCECD800DDB4
      8900FBF7F30000000000000000000000000000000000FFFDFA0000000000FFFD
      FA00FFFDFA0000000000FEFAF5000000000000000000FEFAF50000000000FFFD
      FA0000000000000000000000000000000000D9C7D500C7AFC200C7AFC200C7AF
      C200E4D7E1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F5F5F500D4D4D40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7CCB000F8EF
      E600F8EFE600F8EFE600F8EFE600F8EFE600F8EFE600E5C5A400DDB38900FDFB
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F8F1E900F4E7
      DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F1E0CF00FDFDFB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E8E8E800E1E1E100E1E1
      E100E1E1E100E0E0E000DFDFDF00E0E0E000E1E1E100E1E1E100E0E0E000DFDF
      DF00E0E0E000E1E1E100E1E1E100E1E1E1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009167570091675700916757009167
      5700916757009167570091675700916757009167570091675700916757009167
      5700916757009167570091675700916757000000000000000000000000000000
      00000000883F0000000000000000000000000000000000000000000000000000
      883F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE7708FFCD7507FFCB7306FFCA7205FFC76F03FFC66E03FFC46C
      01FFC36B00FFC26A00FFC26A00EF0000000093695900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00946A5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00946A5A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00936959000000000000000000000000000004
      969F00059DFF0000000000000000000000000000000000000000000000000306
      91FF00018C9F00000000000000000000000000000000F8F1E900F8EFE600F8EF
      E600F8EFE600F8EFE600F8EFE600F8EFE600F8EFE600F8EFE600F8EFE600F8EF
      E600F8EFE600F8EFE600F8F1E900000000000000000000000000000000000000
      000000000000F6E7DAFFF4E0CDFFF0CEADFFF1DAC4FFEFD6BEFFEED3B9FFECCD
      AEFFEBCAA9FFF5E0C9FFC36A00FF000000009A6F5F00FEFBF600FEFAF600FEFA
      F500FEF9F5009B705F00FEF9F300FEF8F200FEF8F200FEF7F1009B705F00FEF7
      F000FEF6F000FEF6EF00FEF6EE009A6F5F0000000000000000000000889F008B
      F4FF003ED8FF00059DFF0000899F00000000000000000B10919F7899DBFF4A82
      EFFF0024BAFF00018D9F0000000000000000EACCAD00EFBB8600F2BE8800F2BE
      8800F2BE8800F2BE8800F2BE8800F2BE8800F2BE8800F2BE8800F2BE8800F2BE
      8800F2BE8800F2BE8800EFBC8700EBCEB0000000000000000000000000000000
      880F00000000F4DFC8FFE0BA9BFFEEC092FFEEC49AFFF1DAC3FFF0D7BEFFEDD0
      B4FFECCDAFFFF9F0E7FFC46C01FF00000000A0756400FFFDFB00FFFDFB00FFFC
      FA00FFFCF900A2776500FEFBF800FEFBF800FEFBF700FEFBF700A2776500FEFA
      F500FEFAF500FEF9F500FEF9F400A0756400000000000000883F4246A9FF4DB1
      F8FF008CF5FF000CB5FF00059DFF00000000000000004D89DBFF91C8FBFF0055
      EAFF0039D0FF00028FFF0000883F00000000E7C39C00FDCC9800FDCC9800FDCC
      9800FDCC9800FDD7AF00FED9B200FDCC9800FDCE9D00FEE6CD00FEE5CA00FDCD
      9B00FDCC9800FDCC9800FDCC9800E7C39C0000000000000088C9001295FF0054
      CBFF000088CF2D258CFF0039C6FF00169AFF543E75FFC3A480FFC2A27EFFC2A0
      7BFFD7B999FFFAF2EAFFC66F03FF00000000A67B6900FFFFFE00FFFEFE00FFFE
      FE00FFFEFD00A87D6B00FFFEFC00FFFDFC00FFFDFB00FFFCFB00A87D6B00FEFC
      FA00FEFCF900FEFCF900FEFBF900A67B6900000000000000000000000000A1B2
      E0FFA4DBFEFF008EF5FF005CE1FF00059BFF006ADBFF1D87F4FF006AEEFF0027
      BEFF000DA1FF000000000000000000000000E7C39C00FDCC9800FDCC9800FDCC
      9800FDCC9800FDCD9B00FEF1E200FDCE9D00FEE5CA00FEE1C300FEE2C400FEE3
      C600FDCC9800FDCC9800FDCC9800E7C39C000000000000000000001494E90090
      F5FF0055CBFF0047C9FF007EF0FF2E2D8FFFF2D1B1FFF4E3D2FFF3E0CDFFF1DA
      C4FFF0D7BFFFFAF3ECFFC87004FF000000000E16C0000C13BD000A10BA00080C
      B7000609B5000202AF000202AF000202AF000202AF000202AF000202AF000202
      AF000202AF000202AF000202AF000202AF000000000000000000000000001314
      929F83A6E0FF1A9FF9FF008FF5FF000BB1FF0035BDFF0076F0FF005FE5FF0013
      A8FF00008A9F000000000000000000000000E7C39C00FDCC9800FDCC9800FDCC
      9800FDCC9800FDCC9800FDD8B100FEE8D100FEE7CF00FEDCB800FEDAB500FEE8
      D000FDCC9800FDCC9800FDCC9800E7C39C000000000000000000000000000000
      88EF009FF8FF00D1FBFF0C3B9BFFCD9960FFC6A076FFC4A785FFC4A684FFC3A4
      80FFDAC0A4FFFBF4EEFFCB7306FF000000001928D000E8E8FD00E8E8FD00E8E8
      FD00E8E8FD000D15BF00E8E8FD00E8E8FD00E8E8FD00E8E8FD000D15BF00E8E8
      FD00E8E8FD00E8E8FD00E8E8FD000202AF000000000000000000000000000000
      0000000000002A83E0FF029CFAFF0091F6FF008CF5FF005DE2FF0021B0FF0000
      000000000000000000000000000000000000E7C39C00FDCC9800FDCC9800FDCC
      9800FDCC9800FDCC9800FDCC9800FEEAD500FEDCB800FEEEDD00FEF0E000FDD4
      A700FDCC9800FDCC9800FDCC9800E7C39C0000000000000000000000880F0072
      D1FF00ACFBFF009CF7FF00C1EDFFE2BEA1FFF1C9A1FFF7EBDFFFF6E8DBFFF4E3
      D2FFF3E0CEFFFBF5F0FFCC7507FF00000000243BDF00B8B8FA00B8B8FA00B8B8
      FA00B8B8FA001A2BD200B8B8FA00B8B8FA00B8B8FA00B8B8FA001A2BD200B8B8
      FA00B8B8FA00B8B8FA00B8B8FA000608B4000000000000000000000000000000
      000000000000003EB2FF00A2F9FF0097F7FF0092F6FF0061E4FF0023B2FF0000
      000000000000000000000000000000000000E7C39C00FDCC9800FDCC9800FDCC
      9800FDD3A700FEF0E000FEEEDC00FDD5A900FEF0E200FDCD9A00FDCC9800FDCC
      9800FDCC9800FDCC9800FDCC9800E7C39C0000000000000088C9001896FF0048
      B4FF000088CF31309EFF003CB2FF001295FF59457FFFCBB295FFE1CFBBFFE3D8
      CDFFE3D6CAFFF7F3EFFFC47809FF000000002943E600B8B8FA00B8B8FA00B8B8
      FA00B8B8FA002841E400B8B8FA00B8B8FA00B8B8FA00B8B8FA002841E400B8B8
      FA00B8B8FA00B8B8FA00B8B8FA00111AC4000000000000000000000000000000
      889F0047B4FF00B4FCFF00AEFBFF00A4F9FF069FFAFF0094F6FF006FE9FF001C
      B7FF0002929F000000000000000000000000E7C39C00FDCC9800FDCC9800FDCC
      9800FEE8D100FEDBB500FEDBB500FEE7CF00FEDEBC00FEE3C600FDCC9800FDCC
      9800FDCC9800FDCC9800FDCC9800E7C39C000000000000000000000088D60000
      88CF00000000FEFCFAFF31309EFF282491FFFAEEE3FFFAF2EAFFF9EFE6FFB997
      7FFFB9967EFFD2AD8FFFBB7207FF000000002943E600B8B8FA00B8B8FA00B8B8
      FA00B8B8FA002943E600B8B8FA00B8B8FA00B8B8FA00B8B8FA002943E600B8B8
      FA00B8B8FA00B8B8FA00B8B8FA001C2DD3000000000000000000000000000048
      B4FF00C0FFFF00BAFDFF00B5FDFF0040B3FF0976E0FF2BAAFAFF0096F7FF003B
      D4FF0018B8FF000000000000000000000000E7C39C00FDCC9800FDCC9800FDCC
      9800FEE3C700FEE2C500FEE1C300FEE5CA00FDCC9800FEEEDD00FDD2A500FDCC
      9800FDCC9800FDCC9800FDCC9800E7C39C000000000000000000000000000000
      000000000000FFFEFEFFE3D6C7FFC7AE90FFC7AD90FFFBF6F0FFFBF4EDFFFFFA
      F3FFFCE3C8FFE2771ECFD47D0C0F000000002943E6002943E6002943E6002943
      E6002943E6002943E6002943E6002943E6002943E6002943E6002943E6002943
      E6002943E6002943E6002943E600273FE300000000000000883F0F3FB2FF2EC8
      FFFF00C0FFFF00C0FFFF0047B4FF0000000000000000689DE0FFACE0FEFF0098
      F7FF006BE7FF000DB5FF0000883F00000000E7C39C00FDCC9800FDCC9800FDCC
      9800FDCD9B00FEE5CA00FEE6CD00FDCF9D00FDCC9800FDD2A500FEE1C200FDCC
      9800FDCC9800FDCC9800FDCC9800E7C39C000000000000000000000000000000
      000000000000FFFFFEFFFFFEFEFFFEFCFAFFFDFBF8FFFCF8F3FFFBF6F1FFFBD7
      B4FFED8E48FFD67F0E0F0000000000000000D2A48E00FCF4EB00FBEEE000F9E8
      D500F7E1CA00D7A99300FCF4EB00FBEEE000F9E8D500F7E1CA00D7A99300FCF4
      EB00FBEEE000F9E8D500F7E1CA00D2A48E0000000000000000000000889FA0E6
      FEFF4AD2FFFF0048B4FF0000889F00000000000000000E12929F8EACE0FF51BC
      FAFF0099F7FF0004989F0000000000000000E9CAAB00F0BE8900F6C38D00F6C3
      8D00F6C38D00F6C38D00F6C38D00F6C38D00F6C38D00F6C38D00F6C38D00F6C3
      8D00F6C38D00F6C38D00F0BE8900EACCAD000000000000000000000000000000
      000000000000FEFBF7FFFEFEFEFFFEFDFBFFFEFDFBFFFEFDFBFFFEFDFDFFEE9F
      56CFDC85110F000000000000000000000000D9AB9400FDF7F100FBF1E600FAEB
      DB00F8E5CF00DEB09900FDF7F100FBF1E600FAEBDB00F8E5CF00DEB09900FDF7
      F100FBF1E600FAEBDB00F8E5CF00D9AB94000000000000000000000000000000
      889F4A56B2FF0000000000000000000000000000000000000000000000002834
      A3FF0000889F00000000000000000000000000000000F7EDE400F4E7DA00F4E7
      DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7
      DA00F4E7DA00F4E7DA00F7EDE400000000000000000000000000000000000000
      000000000000E89219FFE79119FFE58E17FFE38D16FFE18B15FFE08914FFDE87
      130F00000000000000000000000000000000DFB09900FEFAF700FCF4EB00FBEE
      E000F9E8D500E5B69E00FEFAF700FCF4EB00FBEEE000F9E8D500E5B69E00FEFA
      F700FCF4EB00FBEEE000F9E8D500DFB099000000000000000000000000000000
      00000000883F0000000000000000000000000000000000000000000000000000
      883F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5B69E00E5B69E00E5B69E00E5B6
      9E00E5B69E00E5B69E00E5B69E00E5B69E00E5B69E00E5B69E00E5B69E00E5B6
      9E00E5B69E00E5B69E00E5B69E00E5B69E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFDF800CEDB8E00C6D57B00C6D57B00CEDB8E00FCFDF8000000
      000000000000000000000000000000000000D8C3D100CEB6C600C4ABBB00C7AE
      BE00D2BACA00D2BACA00D2BACA00D2BACA00D2BACA00D2BACA00D2BACA00D2BA
      CA00C7AEBE00C4ABBB00CEB6C600D8C3D1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9FB
      F200D1DD9400ABC13C00A6BE3200A6BE3200A6BE3200A6BE3200ABC13C00D1DE
      9600FAFBF30000000000000000000000000000000000C4ABBB00988C8B00A788
      9900000000000000000000000000000000000000000000000000000000000000
      0000A7899A00998B8C00C4ABBB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FDFDFD007A7C7600DCDCDC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000ABC13C00A6BE
      3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
      3200A6BE3200ABC23D00000000000000000000000000C3A7B800A6899B00A77F
      9900C8ACC800C8ACC800C8ACC800C8ACC800C8ACC800C8ACC800C8ACC800C8AC
      C800A77F9900A6899B00C3A7B80000000000FBDEBB00FBDEBB00FBDEBB00FBDE
      BB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDE
      BB00FBDEBB00FBDEBB00FBDEBB00FBDEBB000000000000000000000000000000
      0000000000008A8D85007EAB4900757C6D000000000000000000000000000000
      00000000000000000000000000000000000000000000F9FAF100A6BE3200A6BE
      3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
      3200A6BE3200A6BE3200F9FBF2000000000000000000AE88B8009978EC009978
      ED009978ED009978ED009978ED009978ED009978ED009978ED009978ED009978
      ED009978ED009978EC00AE89B80000000000FBDEBB00FBDEBB00FBDEBB00FBDE
      BB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDE
      BB00FBDEBB00FBDEBB00FBDEBB00FBDEBB000000000000000000000000000000
      00009B9E97007AA34A007CB33A0079A04B00AFB0AE0000000000000000000000
      00000000000000000000000000000000000000000000D0DD9300A6BE3200A6BE
      3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
      3200A6BE3200A6BE3200D2DE96000000000000000000A983C0009B72C0009B75
      D8009B72C0009C72BA009C72BA009C72BA009C72BA009C72BA009C72BA009C73
      BF009B76D9009C73BF00AA83C00000000000FBDEBB00FBDEBB00AA6A8A00C762
      AF00C762AF00AE589600FBDEBB00FBDEBB00F6D3A900EDBB8500EDBB8500EDBB
      8500EDBB8500F6D3A900FBDEBB00FBDEBB00000000000000000000000000B6B8
      B500789A50007CAF40006B7F54007CB33A0074885C00E8E8E800000000000000
      000000000000000000000000000000000000FAFCF500A9C03900A6BE3200A6BE
      3200A6BE3200A6BE3200DEE7B300B9CC5D00A6BE3200A6BE3200A6BE3200A6BE
      3200A6BE3200A6BE3200AAC13B00FBFCF60000000000A380A500A89BC000A798
      BE00A283C9009F77C9009F77C9009F7ADC009F7ADC009F77C9009F77C900A283
      C900A798BE00A89BC000A380A50000000000FBDEBB00FBDEBB00AA6DBA00AA6B
      BC00C053AF009280C800F0C3B800FBDEBB00F6D3A900EDBB8500EDBB8500EDBB
      8500EDBB8500F6D3A900FBDEBB00FBDEBB000000000000000000A7A9A5007795
      52007CB33A0074826300B0B1B00079A04B007DB23B007D857300FCFCFC000000
      000000000000000000000000000000000000CEDB8E00A6BE3200A6BE3200A6BE
      3200A7BF3400DCE6AF00F8FAF00000000000DAE4AB00A6BE3200A6BE3200A6BE
      3200A6BE3200A6BE3200A6BE3200CFDC910000000000A480A700A791BE00A58A
      BE00A587E900A583F200A583F200A583F200A583F200A583F200A583F200A687
      E900A58ABE00A791BE00A480A70000000000FBDEBB00FBDEBB00E4A8B600DD9C
      C500EBC1D300D27DB500FBDEBB00FBDEBB00F2C79700E0984F00E0984F00E098
      4F00E0984F00E0984F00F2C79700FBDEBB00000000000000000093988E007CB3
      3A0078915C00D9D9D900000000007E8773007CB33A007CAC420083897B00FDFD
      FD0000000000000000000000000000000000C5D57A00A6BE3200A6BE3200AAC1
      3C00E6ECC40000000000ACC34000EBF0D10000000000CBD98700A6BE3200A6BE
      3200A6BE3200A6BE3200A6BE3200C6D57B0000000000A982BD00A583F200A583
      F200A583F200A583F200A583F200A583F200A583F200A583F200A583F200A583
      F200A583F200A583F200AC85BC0000000000FBDEBB009A88C500A591C400E8B2
      B600E6ACB600D0B3BE006A5ECA00FBDEBB00F2C79700E0984F00E0984F00E098
      4F00E0984F00F2C79700FBDEBB00FBDEBB000000000000000000C2C2C2006A7A
      5600BFC0BE000000000000000000DADADA00769057007CB33A007BAA4300868B
      7F00FBFBFB00000000000000000000000000C6D57B00A6BE3200A6BE3200BFD1
      6D0000000000DFE7B400A6BE3200AFC44600F6F8E900FFFFFE00A6BE3200A6BE
      3200A6BE3200A6BE3200A6BE3200C6D57C00DCC8D300B68EAB00AE84AB00C39D
      AE00C7A3B000C39DAE00C7A3B000C7A3B000C39DAE00B1849C00C7A3AF00B58B
      A100C39EAC00B388AA00BC96AA00DCC9D300FBDEBB00F4D8BC006A5ECA005E54
      CB009180C6003E37CE00DAC0BE00FBDEBB00F6D3A900EDBB8500EDBB8500EDBB
      8500EDBB8500EDBB8500F6D3A900FBDEBB000000000000000000FAFAFA00D4D4
      D40000000000000000000000000000000000959891007CAC42007CB33A007CAD
      4100767F6B00EDEDED000000000000000000CEDC8F00A6BE3200A6BE3200A6BE
      3200B0C54900A6BE3200A6BE3200A6BE3200B4C85200F5F8E800DCE6AF00ADC3
      4300A6BE3200A6BE3200A6BE3200CFDC9100DCC9D300C6A4B000B3889F00F6DB
      BA00FBE3C500FDEBD300FAE1C200FEEEDA00FCE8CF00EED1BD00CAA7B100D6B8
      BC00FCEBDB00B2889E00C6A4B000DDC8D300FBDEBB00FBDEBB00FBDEBB00A996
      C300574DCC00F4D8BC00FBDEBB00FBDEBB00F6D3A900EDBB8500EDBB8500EDBB
      8500EDBB8500EDBB8500F6D3A900FBDEBB000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900747E68007CB33A007CB3
      3A007CB33C00767A72000000000000000000FAFCF500A9C03900A6BE3200A6BE
      3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200C5D57A00E0E9
      B800B4C85200A6BE3200AAC13B00FBFCF6000000000000000000E7DBE100E1C1
      B000F9DEBB00FBE3C600FDEAD200FAE2C200FFEEDB00FCE7CD00FBE3C600FFEF
      DE00E5CBC700E8DAE1000000000000000000FBDEBB00FBDEBB00FBDEBB00FBDE
      BB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDE
      BB00FBDEBB00FBDEBB00FBDEBB00FBDEBB000000000000000000000000000000
      00000000000000000000000000000000000000000000E2E2E200758A5D007CB3
      3A007AA24B00C0C0C000000000000000000000000000CDDB8C00A6BE3200A6BE
      3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
      3200A6BE3200A6BE3200CEDB8E00000000000000000000000000FDFCFC00CDAA
      AD00F9DEBB00F9DEBB00FBE3C400E1C5BE00DEBCB200FEEFDA00FCE9CE00FBE4
      C500CFADB400FDFDFD000000000000000000FBDEBB00FBDEBB00FBDEBB00FBDE
      BB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDEBB00FBDE
      BB00FBDEBB00FBDEBB00FBDEBB00FBDEBB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9CAC9007085
      57006E7E5C00FEFEFE00000000000000000000000000F9FAF100A6BE3200A6BE
      3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
      3200A6BE3200A6BE3200F9FBF20000000000000000000000000000000000D2B7
      C200E4C5B300F7DCBA00F9DEBB00FBE3C400FDEBD300FAE1C200FCECD900E6CA
      BE00D3B9C2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEDE
      DE00B1B2B0000000000000000000000000000000000000000000ABC13C00A6BE
      3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE3200A6BE
      3200A6BE3200ABC23D000000000000000000000000000000000000000000FFFE
      FF00E2D1DA00CDB1BF00CBAFBE00CBAFBE00CBAEBD00CBAFBD00CEB1C000E2D3
      DB00FFFEFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F9FB
      F100CDDB8D00A8C03700A6BE3200A6BE3200A6BE3200A6BE3200A8C03700CEDB
      8E00F9FBF2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9FBF100CEDB8E00C6D57B00C6D57B00CEDB8E00F9FBF2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D8B39700D8B39700D8B3
      9700D8B39700D8B3970000000000FFFFFF00FFFFFF00CBCBF0009393E2009393
      E2009393E2009393E2009393E200CBCBF0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F4E7DA00F4E7DA00F4E7
      DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7
      DA00F4E7DA00F4E7DA00F4E7DA000000000093695900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00946A5A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00946A5A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0093695900D8B39700F0B78B00F0B78B00F0B7
      8B00F0B78B00F0B78B00D8B39700FFFFFF00FFFFFF009393E2008F8FF7008F8F
      F7008F8FF7008F8FF7008F8FF7009393E2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4E7DA00F7D9B800FCDEBD00FCDE
      BD00FCDEBD00FCDEBD00FCDEBD00FCDEBD00FCDEBD00FCDEBD00FCDEBD00FCDE
      BD00FCDEBD00FCDEBD00F7D9B800F4E7DA009A6F5F00FEFBF600FEFAF600FEFA
      F500FEF9F5009B705F00FEF9F300FEF8F200FEF8F200FEF7F1009B705F00FEF7
      F000FEF6F000FEF6EF00FEF6EE009A6F5F00D8B39700F0B78B00998E84005244
      3B009A8F8600F1C19B00D8B39700FFFFFF00FFFFFF009393E200A2A1F300988E
      850052443B00998F86008F8FF7009393E2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4E7DA00F7E4CF00FFF1E200FFF1
      E200FFF1E200FFF1E200FFF1E200FFF1E200FFF1E200FFF1E200FFF1E200FFF1
      E200FFF1E200FFF1E200F7E4CF00F4E7DA00A0756400FFFDFB00FFFDFB00FFFC
      FA00FFFCF900A2776500FEFBF800FEFBF800FEFBF700FEFBF700A2776500FEFA
      F500FEFAF500FEF9F500FEF9F400A0756400D8B39700F0B78B0054483E004D40
      360055493E00F1CEB200D8B39700FFFFFF00FFFFFF009393E200BCB9ED005448
      3E004D40360055493E008F8FF7009393E200E3E3FF005E5EFF005252FF005252
      FF005252FF005252FF005252FF005252FF005252FF005252FF005252FF005252
      FF005252FF005252FF005E5EFF00E4E4FF00F4E7DA00F4E7DA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F4E7DA00F4E7DA00A67B6900FFFFFE00FFFEFE00FFFE
      FE00FFFEFD00A87D6B00FFFEFC00FFFDFC00FFFDFB00FFFCFB00A87D6B00FFFC
      FA00FEFCF900FEFCF900FEFBF900A67B6900D8B39700F0B78B00998E8400584C
      41009A8F8600F1C19B00D8B39700FFFFFF00FFFFFF009393E200A2A1F300988E
      8500584C4100998F86008F8FF7009393E200C5C5FF005252FF005252FF005252
      FF005252FF005252FF006464FF005252FF005252FF005252FF005252FF005252
      FF005252FF005252FF005252FF00C5C5FF00F4E7DA00F4E7DA00FFFFFF00FFFC
      F900FFFCF900FFFAF400FFFEFC00FFFBF600FFFBF600FFFEFC00FFFAF400FFFF
      FF00FFFFFF00FFFFFF00F4E7DA00F4E7DA0000800200007E0200007C0200007A
      02000078020000710200007402000072020000700200006E020000710200006D
      0200006D0200006D0200006D0200006D0200D8B39700F0B78B00F0C29D00F1CE
      B100F0C19C00F0B78B00D8B39700FFFFFF00FFFFFF009393E2008F8FF700A3A2
      F300BCB9ED00A2A1F3008F8FF7009393E200C5C5FF005252FF005252FF005252
      FF005252FF005252FF00C7C7FF006767FF006565FF00E1E1FF00C7C7FF005252
      FF005252FF005252FF005252FF00C5C5FF00F4E7DA00F4E7DA00FFFFFF00FFF7
      EE00FFF7EE00FFEEDC00FFFBF600FFF2E500FFF2E500FFFBF600FFEEDC00FFFF
      FF00FFFFFF00FFFFFF00F4E7DA00F4E7DA0000840300DCF5E200DCF5E200DCF5
      E200DCF5E20000770200DCF5E200DCF5E200DCF5E200DCF5E20000770200DCF5
      E200DCF5E200DCF5E200DCF5E200006D0200D8B39700F0B78B00F8DBC500F8DB
      C500F8DBC500F0B78B00D8B39700FFFFFF00FFFFFF009393E2008F8FF700C7C7
      FB00C7C7FB00C7C7FB008F8FF7009393E200C5C5FF005252FF005252FF005252
      FF005252FF005252FF007272FF00BDBDFF008989FF00A6A6FF00DBDBFF005252
      FF005252FF005252FF005252FF00C5C5FF00F4E7DA00F4E7DA00FFFFFF00FFF7
      EE00FFF7EE00FFEEDC00FFFBF600FFF2E500FFF2E500FFFBF600FFEEDC00FFF7
      EE00FFF7EE00FFFFFF00F4E7DA00F4E7DA000089030093E1A60093E1A60093E1
      A60093E1A600007D020093E1A60093E1A60093E1A60093E1A600007D020093E1
      A60093E1A60093E1A60093E1A600006D0200D8B39700F0B78B00FFFFFF00FFFF
      FF00FFFFFF00F0B78B00D8B39700FFFFFF00FFFFFF009393E2008F8FF700FFFF
      FF00FFFFFF00FFFFFF008F8FF7009393E200C5C5FF005252FF005252FF005252
      FF005252FF005252FF005252FF00C1C1FF008484FF00DCDCFF00C5C5FF005252
      FF005252FF005252FF005252FF00C5C5FF00F4E7DA00F4E7DA00FFFFFF00FFFC
      F900FFFCF900FFFAF400FFFEFC00FFFBF600FFFBF600FFFEFC00FFFAF400FFFC
      F900FFFCF900FFFFFF00F4E7DA00F4E7DA00008E030093E1A60093E1A60093E1
      A60093E1A6000082020093E1A60093E1A60093E1A60093E1A6000082020093E1
      A60093E1A60093E1A60093E1A60000700200D8B39700F0B78B00FFFFFF00FFFF
      FF00FFFFFF00F0B78B00D8B39700FFFFFF00FFFFFF009393E2008F8FF700FFFF
      FF00FFFFFF00FFFFFF008F8FF7009393E200C5C5FF005252FF005252FF005252
      FF005252FF00C6C6FF00E0E0FF007F7FFF00C5C5FF005252FF005252FF005252
      FF005252FF005252FF005252FF00C5C5FF00F4E7DA00F4E7DA00FFFFFF00FFF4
      E800FFF4E800FEE8D000FFFAF400FFEEDC00FFEEDC00FFFAF400FEE8D000FFF4
      E800FFF4E800FFFFFF00F4E7DA00F4E7DA0000930300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000088030093E1A60093E1A60093E1A60093E1A6000088030093E1
      A60093E1A60093E1A60093E1A60000740200D8B39700F0B78B00FFFFFF00FFFF
      FF00FFFFFF00F0B78B00D8B39700FFFFFF00FFFFFF009393E2008F8FF700FFFF
      FF00FFFFFF00FFFFFF008F8FF7009393E200C5C5FF005252FF005252FF005252
      FF005252FF00DCDCFF00A6A6FF008888FF00BABAFF007878FF005252FF005252
      FF005252FF005252FF005252FF00C5C5FF00F4E7DA00F4E7DA00FFFFFF00FFFF
      FF00FFFFFF00FFF4E800FFFCF900FFF7EE00FFF7EE00FFFCF900FFF4E800FFFA
      F400FFFAF400FFFFFF00F4E7DA00F4E7DA0000970300FFFFFF0023B743000071
      0200FFFFFF00008D0300008B0300008903000087030000850300008302000081
      0200007F0200007D0200007B020000790200D8B39700F0B78B00FFFFFF00FFFF
      FF00FFFFFF00F0B78B00D8B39700FFFFFF00FFFFFF009393E2008F8FF700FFFF
      FF00FFFFFF00FFFFFF008F8FF7009393E200C5C5FF005252FF005252FF005252
      FF005252FF00C7C7FF00DCDCFF006666FF006565FF00CECEFF005252FF005252
      FF005252FF005252FF005252FF00C5C5FF00F4E7DA00F4E7DA00FFFFFF00FFFF
      FF00FFFFFF00FFF4E800FFFCF900FFF7EE00FFF7EE00FFFCF900FFF4E800FFFA
      F400FFFAF400FFFFFF00F4E7DA00F4E7DA00FFFFFF00FFFFFF0025BA45000077
      0200FFFFFF00FFFFFF00FFFFFF00FBEEE000F9E8D500F7E1CA00D7A99300FCF4
      EB00FBEEE000F9E8D500F7E1CA00D2A48E00D8B39700F0B78B00FFFFFF00FFFF
      FF00FFFFFF00F0B78B00D8B39700FFFFFF00FFFFFF009393E2008F8FF700FFFF
      FF00FFFFFF00FFFFFF008F8FF7009393E200C5C5FF005252FF005252FF005252
      FF005252FF005252FF005252FF005252FF005252FF006A6AFF005252FF005252
      FF005252FF005252FF005252FF00C5C5FF00F4E7DA00F4E7DA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F4E7DA00F4E7DA00006D0200006D020025BB4500007D
      02000087030000900300FFFFFF00FBF1E600FAEBDB00F8E5CF00DEB09900FDF7
      F100FBF1E600FAEBDB00F8E5CF00D9AB9400D8B39700F0B78B00FFFFFF00FFFF
      FF00FFFFFF00F0B78B00D8B39700FFFFFF00FFFFFF009393E2008F8FF700FFFF
      FF00FFFFFF00FFFFFF008F8FF7009393E200E3E3FF006060FF005252FF005252
      FF005252FF005252FF005252FF005252FF005252FF005252FF005252FF005252
      FF005252FF005252FF006060FF00E5E5FF00F2E3D400EBD4BC00F4E7DA00F4E7
      DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7DA00F4E7
      DA00F4E7DA00F4E7DA00EBD4BC00F2E3D40024B8440025BC470029C44E0025BE
      470025BF470024BE4400FFFFFF00FCF4EB00FBEEE000F9E8D500E5B69E00FEFA
      F700FCF4EB00FBEEE000F9E8D500DFB09900D8B39700F0B78B00FFFFFF00FFFF
      FF00FFFFFF00F0B78B00D8B39700FFFFFF00FFFFFF009393E2008F8FF700FFFF
      FF00FFFFFF00FFFFFF008F8FF7009393E2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EBD4BC00EABE8E00F3CBA000F3CB
      A000F3CBA000F3CBA000F3CBA000F3CBA000F3CBA000F3CBA000F3CBA000F3CB
      A000F3CBA000F3CBA000EABE8E00EBD4BC00FFFFFF00FFFFFF0025BC4500008A
      0300FFFFFF00FFFFFF00FFFFFF00E5B69E00E5B69E00E5B69E00E5B69E00E5B6
      9E00E5B69E00E5B69E00E5B69E00E5B69E00D8B39700F0B78B00F0B78B00F0B7
      8B00F0B78B00F0B78B00D8B39700FFFFFF00FFFFFF009393E2008F8FF7008F8F
      F7008F8FF7008F8FF7008F8FF7009393E2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EBD4BC00EABE8E00F3CBA000F3CB
      A000F3CBA000F3CBA000F3CBA000F3CBA000F3CBA000F3CBA000F3CBA000F3CB
      A000F3CBA000F3CBA000EABE8E00EBD4BC00FFFFFF00FFFFFF0023BB43000090
      0300F9F9F900FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000D8B39700D8B39700D8B3
      9700D8B39700D8B3970000000000FFFFFF00FFFFFF00CBCBF0009393E2009393
      E2009393E2009393E2009393E200CBCBF0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBF5F100EBD4BC00EBD4BC00EBD4
      BC00EBD4BC00EBD4BC00EBD4BC00EBD4BC00EBD4BC00EBD4BC00EBD4BC00EBD4
      BC00EBD4BC00EBD4BC00EBD4BC00FBF5F100424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF0000F81FC003FFFF0000
      C003C003C3FF0000C003DFFBC3FF00008003D00BC3FF00008001D00BC10F0000
      0001D00BE00300000001D00BF00100000001D00BF00100000001D00BF0010000
      8001D00BF00100008003D00BF0010000C003D003F8030000C003D3C3F8030000
      E00FC00FFC070000FC3FFFFFFF1F0000FFFFFFF9FFFFFFFFF8FFFF81F83BFCFF
      F87FE001F01B8003E07FE007E0030001E03FE007E0030040801FE007E7031CF8
      801FE007EF833FFC820FE007FE033FFC8207E00781FF3FFCE707E00781E73FFC
      FF83E00781C71F38FF81E00780070200FF81E00F800F8001FFC1E01F901FC003
      FFE7E03FB83FFF3FFFFFFFFFFFFFFFFFE007F00FFFFFFFFF8001E007FEFFFFFF
      8001C003FEFFE00700008001F8FFE00700000000F8FFE00700000000E0FFE007
      00000000E001E007000000008001E007000000008001E00700000000E001E007
      00000000E001E00700000000F8FFE00700008001F8FFE0078001C003FEFFE01F
      8001E007FEFFE01FE007F00FFFFFFFFFFFFFE007FFFFFFFF0001EFF780010000
      0001E8178001000000010FF08001000000010000800100000000000080010000
      000000008001000000000000800180010000000080018001000000008001C003
      000000008001C003000000008001C0030001CFF38001E0070001EFF78003E007
      03FFEFF7FFFFE007FFFFE007FFFFFFFFFFFFFFFFFC01C001C003FFC0FC01C000
      80010000FC21DF0080010000FC21DF0080010000FE03D000800100008603D000
      800F00008403D000800F0001C007D003800F0001C007D03B800F0001C087D00B
      800F0001E08FDFFB800F0001E08FDF83800F0001E1FFDF83800F0007F1FFDF87
      A5AF07FFF3FFC00FFFFFFFFFFFFFC01FFFFF8000FFFFFFFFFFFF0000F7EFFFFF
      F8010000E7E78001F8010000C1830000E80100008181000080010000E0070000
      C0010000E0070000E0010000F81F0000C0010000F81F000080010000E0070000
      C8010000E0070000F801000081810000F8030000C1830000F8070000E7E78001
      F80F0000F7EFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF81F0000FFFFFFFFE007
      8FF1FFFFF8FFC00380010000F8FF800180010000F07F800180010000E03F0000
      80010000C01F010080010000C20F048080010000C607080000000000CF030000
      00000000FF030000C0030000FF838001C0030000FFC38001E007FFFFFFE7C003
      E007FFFFFFFFE007FFFFFFFFFFFFF81FFFFF8200FFFF800100000000FFFF0000
      00000000FFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FFFF0000
      00000000FFFF000000008200FFFF0000}
  end
  object NaklPopMenu: TPopupMenu
    Left = 736
    Top = 192
  end
  object MovePopMenu: TPopupMenu
    Left = 736
    Top = 256
  end
end
