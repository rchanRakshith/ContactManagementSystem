object frmEditForm: TfrmEditForm
  Left = 0
  Top = 0
  Caption = 'frmEditForm'
  ClientHeight = 244
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Comic Sans MS'
  Font.Style = [fsBold]
  TextHeight = 25
  object Label1: TLabel
    Left = 83
    Top = 11
    Width = 49
    Height = 25
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 124
    Height = 25
    Caption = 'Phone Number'
  end
  object Label3: TLabel
    Left = 83
    Top = 152
    Width = 45
    Height = 25
    Caption = 'Email'
  end
  object edtName: TEdit
    Left = 149
    Top = 8
    Width = 233
    Height = 33
    TabOrder = 0
    OnKeyPress = NameValidation
  end
  object edtPhone: TEdit
    Left = 149
    Top = 72
    Width = 233
    Height = 33
    TabOrder = 1
    OnKeyPress = PhoneNumberVAlidation
  end
  object edtEmail: TEdit
    Left = 149
    Top = 149
    Width = 233
    Height = 33
    TabOrder = 2
    OnChange = EmailValidation
  end
  object btnEditOK: TButton
    Left = 189
    Top = 200
    Width = 75
    Height = 36
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnEditOKClick
  end
end
