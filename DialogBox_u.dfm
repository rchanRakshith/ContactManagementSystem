object frmDialogBox: TfrmDialogBox
  Left = 0
  Top = 0
  Caption = 'frmDialogBox'
  ClientHeight = 137
  ClientWidth = 154
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Comic Sans MS'
  Font.Style = [fsBold]
  TextHeight = 25
  object btnEdit: TButton
    Left = 48
    Top = 32
    Width = 75
    Height = 25
    Caption = 'EDIT'
    TabOrder = 0
    OnClick = btnEditClick
  end
  object btnDelete: TButton
    Left = 48
    Top = 88
    Width = 75
    Height = 25
    Caption = 'DELETE'
    TabOrder = 1
    OnClick = btnDeleteClick
  end
end
