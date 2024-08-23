object frmMainForm: TfrmMainForm
  Left = 0
  Top = 0
  Caption = 'Contacts'
  ClientHeight = 676
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Comic Sans MS'
  Font.Style = [fsBold]
  OnCreate = FormCreate
  TextHeight = 25
  object MainPanel: TPanel
    Left = -8
    Top = -11
    Width = 777
    Height = 679
    TabOrder = 0
    object lblLabel1: TLabel
      Left = 296
      Top = 8
      Width = 117
      Height = 39
      Caption = 'Contacts'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSuccessCaaption: TLabel
      Left = 248
      Top = 209
      Width = 8
      Height = 25
    end
    object Label2: TLabel
      Left = 64
      Top = 73
      Width = 60
      Height = 25
      Caption = 'Search'
    end
    object sgdStringGrid: TStringGrid
      Left = 16
      Top = 209
      Width = 729
      Height = 425
      ColCount = 4
      DefaultColWidth = 200
      RowCount = 50
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedRowDefAlign]
      TabOrder = 0
      OnSelectCell = StringGridClick
      RowHeights = (
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24)
    end
    object btnAdd: TButton
      Left = 648
      Top = 13
      Width = 121
      Height = 57
      Caption = 'NEW'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object edtEdit1: TEdit
      Left = 16
      Top = 104
      Width = 177
      Height = 33
      TabOrder = 2
      OnChange = EditChange
    end
  end
  object cbxSortBtn: TCheckBox
    Left = 640
    Top = 101
    Width = 57
    Height = 17
    Caption = 'Sort'
    TabOrder = 1
    OnClick = cbxSortBtnClick
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 144
    Top = 152
  end
end
