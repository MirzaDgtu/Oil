object ProductFrameModalForm: TProductFrameModalForm
  Left = 271
  Top = 176
  Width = 1622
  Height = 863
  Caption = #1058#1086#1074#1072#1088#1099
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
  inline ProductFrame: TProductFrame
    Left = 0
    Top = 0
    Width = 1614
    Height = 832
    Align = alClient
    TabOrder = 0
    inherited PanelSplitter: TSplitter
      Height = 781
    end
    inherited SB: TStatusBar
      Top = 813
      Width = 1614
    end
    inherited GroupGB: TGroupBox
      Height = 781
      inherited GroupTV: TTreeView
        Height = 739
      end
      inherited GroupBottomTB: TToolBar
        Top = 754
      end
    end
    inherited ProductsGB: TGroupBox
      Width = 1410
      Height = 781
      inherited ProductsGrid: TDBGrid
        Width = 1406
        Height = 720
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        OnDblClick = ProductFrameProductsGridDblClick
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'COD_ARTIC'
            Title.Alignment = taCenter
            Title.Caption = #1040#1088#1090#1080#1082#1091#1083
            Title.Color = clSkyBlue
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NAME_ARTIC'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Title.Color = clSkyBlue
            Width = 288
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CENA_ARTC'
            Title.Alignment = taCenter
            Title.Caption = #1062#1077#1085#1072
            Title.Color = clSkyBlue
            Width = 64
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NDS_ARTIC'
            Title.Alignment = taCenter
            Title.Caption = #1053#1044#1057
            Title.Color = clSkyBlue
            Width = 64
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'EDIN_IZMER'
            Title.Alignment = taCenter
            Title.Caption = #1045#1076#1080#1085'. '#1080#1079#1084#1077#1088
            Title.Color = clSkyBlue
            Width = 91
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'KON_KOLCH'
            Title.Alignment = taCenter
            Title.Caption = #1054#1089#1090#1072#1090#1086#1082
            Title.Color = clSkyBlue
            Width = 64
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VES_EDINIC'
            Title.Alignment = taCenter
            Title.Caption = #1042#1077#1089
            Title.Color = clSkyBlue
            Width = 64
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'EDN_V_UPAK'
            Title.Alignment = taCenter
            Title.Caption = #1045#1076#1085'. '#1074' '#1091#1087#1072#1082
            Title.Color = clSkyBlue
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NGROUP_TVR'
            Title.Alignment = taCenter
            Title.Caption = #1043#1088#1091#1087#1087#1072
            Title.Color = clSkyBlue
            Width = 129
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NGROUP_TV2'
            Title.Alignment = taCenter
            Title.Caption = #1055#1086#1076#1075#1088#1091#1087#1087#1072' 1'
            Title.Color = clSkyBlue
            Width = 113
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NGROUP_TV3'
            Title.Alignment = taCenter
            Title.Caption = #1055#1086#1076#1075#1088#1091#1087#1087#1072' 2'
            Title.Color = clSkyBlue
            Width = 106
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NGROUP_TV4'
            Title.Alignment = taCenter
            Title.Caption = #1055#1086#1076#1075#1088#1091#1087#1087#1072' 3'
            Title.Color = clSkyBlue
            Width = 115
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NGROUP_TV5'
            Title.Alignment = taCenter
            Title.Caption = #1055#1086#1076#1075#1088#1091#1087#1087#1072' 4'
            Title.Color = clSkyBlue
            Width = 119
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NGROUP_TV6'
            Title.Alignment = taCenter
            Title.Caption = #1055#1086#1076#1075#1088#1091#1087#1087#1072' 5'
            Title.Color = clSkyBlue
            Width = 115
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TYPE_TOVR'
            Title.Alignment = taCenter
            Title.Caption = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072
            Title.Color = clSkyBlue
            Width = 76
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FAMILY'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CREATE_DATE'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'WHO_CORR'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CORR_DATE'
            Title.Alignment = taCenter
            Title.Color = clSkyBlue
            Visible = False
          end>
      end
      inherited ProductBottomTB: TToolBar
        Top = 754
        Width = 1406
        inherited AddProdTBI: TToolButton
          OnClick = ProductFrameAddProdTBIClick
        end
      end
      inherited ProdSB: TStatusBar
        Top = 735
        Width = 1406
      end
    end
    inherited Panel1: TPanel
      Width = 1614
    end
  end
end
