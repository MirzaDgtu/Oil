object ReportProductFrame: TReportProductFrame
  Left = 0
  Top = 0
  Width = 1251
  Height = 602
  Align = alClient
  TabOrder = 0
  object SB: TStatusBar
    Left = 0
    Top = 583
    Width = 1251
    Height = 19
    Panels = <
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
  object ProductReportGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 1251
    Height = 583
    Align = alClient
    DataSource = AppData.DS_ProductReport
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = PopMenu
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUM_PREDM'
        Title.Alignment = taCenter
        Title.Caption = #1040#1088#1090#1080#1082#1091#1083#1100
        Title.Color = clSkyBlue
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 97
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
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EDIN_IZMER'
        Title.Alignment = taCenter
        Title.Caption = #1045#1076#1085'. '#1080#1079#1084
        Title.Color = clSkyBlue
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 84
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EDN_V_UPAK'
        Title.Alignment = taCenter
        Title.Caption = #1045#1076#1085'. '#1074' '#1091#1087#1072#1082
        Title.Color = clSkyBlue
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'KOLC_PREDM'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083#1080#1095'.'
        Title.Color = clSkyBlue
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SUM_PREDM'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Title.Color = clSkyBlue
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 73
        Visible = True
      end>
  end
  object PopMenu: TPopupMenu
    Left = 648
    Top = 424
  end
end
