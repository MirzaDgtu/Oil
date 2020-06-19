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
      end
      inherited ProductBottomTB: TToolBar
        Top = 754
        Width = 1406
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
