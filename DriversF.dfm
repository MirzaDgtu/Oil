object DriversForm: TDriversForm
  Left = 281
  Top = 275
  Width = 1305
  Height = 675
  Caption = #1042#1086#1076#1080#1090#1077#1083#1080
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
  inline DriversFrame1: TDriversFrame
    Left = 0
    Top = 0
    Width = 1297
    Height = 644
    Align = alClient
    TabOrder = 0
    inherited SB: TStatusBar
      Top = 472
      Width = 1297
    end
    inherited BtnsPanel: TPanel
      Left = 1159
      Height = 447
      inherited FindGB: TGroupBox
        inherited FindEdit: TEdit
          OnChange = nil
          OnKeyPress = nil
        end
        inherited FindBtn: TBitBtn
          OnClick = nil
        end
      end
    end
    inherited HeaderPanel: TPanel
      Width = 1297
    end
    inherited DriversGrid: TDBGrid
      Width = 1159
      Height = 447
      Columns = <
        item
          Expanded = False
          FieldName = 'UID'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Family'
          Title.Alignment = taCenter
          Title.Caption = #1060#1072#1084#1080#1083#1080#1103
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 209
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Name'
          Title.Alignment = taCenter
          Title.Caption = #1048#1084#1103
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 166
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LastName'
          Title.Alignment = taCenter
          Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BirthDay'
          Title.Alignment = taCenter
          Title.Caption = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Pass_Serial'
          Title.Alignment = taCenter
          Title.Caption = #1057#1077#1088#1080#1103' '#1087#1072#1089#1087'.'
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Pass_Num'
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088' '#1087#1072#1089#1087'.'
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Pass_Gave'
          Title.Alignment = taCenter
          Title.Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085' ('#1087#1072#1089#1087'.)'
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'License_Serial'
          Title.Alignment = taCenter
          Title.Caption = #1057#1077#1088#1080#1103' '#1074#1086#1076'. '#1091#1076#1086#1089#1090'.'
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'License_Num'
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088' '#1074#1086#1076'. '#1091#1076#1086#1089#1090'.'
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'License_BegDate'
          Title.Alignment = taCenter
          Title.Caption = #1042#1099#1076#1072#1085' ('#1074#1086#1076'. '#1091#1076#1086#1089#1090'.)'
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'License_EndDate'
          Title.Alignment = taCenter
          Title.Caption = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1077#1085' '#1076#1086'('#1074#1086#1076'. '#1091#1076#1086#1089#1090'.)'
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'License_Gave'
          Title.Alignment = taCenter
          Title.Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085'('#1074#1086#1076'. '#1091#1076#1086#1089#1090'.)'
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'License_Access'
          Title.Alignment = taCenter
          Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1074#1086#1076'. '#1091#1076#1086#1089#1090'.'
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Adress'
          Title.Alignment = taCenter
          Title.Caption = #1040#1076#1088#1077#1089
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 285
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UID_Car'
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
          Expanded = False
          FieldName = 'Date_Hiring'
          Title.Alignment = taCenter
          Title.Caption = #1055#1088#1080#1085#1103#1090' '#1085#1072' '#1088#1072#1073#1086#1090#1091
          Title.Color = clSkyBlue
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Available'
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
          Visible = False
        end>
    end
    inherited DriverInfoPanel: TPanel
      Top = 491
      Width = 1297
      inherited PassGB: TGroupBox
        inherited PassSerialLbl: TLabel
          Width = 39
        end
      end
    end
  end
end
