object frmAddForm: TfrmAddForm
  Left = 0
  Top = 0
  Caption = 'frmAddForm'
  ClientHeight = 285
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Comic Sans MS'
  Font.Style = [fsBold]
  TextHeight = 25
  object lblLabel1: TLabel
    Left = 8
    Top = 15
    Width = 49
    Height = 25
    Caption = 'Name'
  end
  object lblLabel2: TLabel
    Left = 8
    Top = 86
    Width = 124
    Height = 25
    Caption = 'Phone Number'
  end
  object lblLabel3: TLabel
    Left = 8
    Top = 160
    Width = 45
    Height = 25
    Caption = 'Email'
  end
  object edtAddName: TEdit
    Left = 152
    Top = 8
    Width = 217
    Height = 37
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = NameValidation
  end
  object edtAddPhoneNumber: TEdit
    Left = 152
    Top = 83
    Width = 217
    Height = 33
    MaxLength = 10
    TabOrder = 1
    OnKeyPress = PhoneNumberValidation
  end
  object edtAddEmail: TEdit
    Left = 152
    Top = 157
    Width = 217
    Height = 33
    TabOrder = 2
    OnChange = edtAddEmailChange
  end
  object btnOK: TButton
    Left = 208
    Top = 240
    Width = 75
    Height = 37
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOKClick
  end
end
