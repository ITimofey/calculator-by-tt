object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Calculator by TT'
  ClientHeight = 242
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CalcField: TEdit
    Left = 8
    Top = 32
    Width = 262
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = '0'
  end
  object JournalField: TEdit
    Left = 8
    Top = 8
    Width = 262
    Height = 21
    TabOrder = 1
  end
  object Btn0: TButton
    Left = 76
    Top = 199
    Width = 54
    Height = 25
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Btn0Click
  end
  object Btn1: TButton
    Left = 8
    Top = 168
    Width = 54
    Height = 25
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Btn1Click
  end
  object Btn2: TButton
    Left = 76
    Top = 168
    Width = 54
    Height = 25
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Btn2Click
  end
  object Btn3: TButton
    Left = 144
    Top = 168
    Width = 54
    Height = 25
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Btn3Click
  end
  object Btn4: TButton
    Left = 8
    Top = 137
    Width = 54
    Height = 25
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Btn4Click
  end
  object Btn5: TButton
    Left = 76
    Top = 137
    Width = 54
    Height = 25
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Btn5Click
  end
  object Btn6: TButton
    Left = 144
    Top = 137
    Width = 54
    Height = 25
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = Btn6Click
  end
  object Btn7: TButton
    Left = 8
    Top = 106
    Width = 54
    Height = 25
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = Btn7Click
  end
  object Btn8: TButton
    Left = 76
    Top = 106
    Width = 54
    Height = 25
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = Btn8Click
  end
  object Btn9: TButton
    Left = 144
    Top = 106
    Width = 54
    Height = 25
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = Btn9Click
  end
  object BtnClearEdit: TButton
    Left = 8
    Top = 75
    Width = 54
    Height = 25
    Caption = 'CE'
    TabOrder = 12
    OnClick = BtnClearEditClick
  end
  object BtnClear: TButton
    Left = 76
    Top = 75
    Width = 54
    Height = 25
    Caption = 'C'
    TabOrder = 13
    OnClick = BtnClearClick
  end
  object BtnErase: TButton
    Left = 144
    Top = 75
    Width = 54
    Height = 25
    Caption = #8592
    TabOrder = 14
    OnClick = BtnEraseClick
  end
  object BtnDivide: TButton
    Left = 216
    Top = 75
    Width = 54
    Height = 25
    Caption = '\'
    TabOrder = 15
    OnClick = BtnDivideClick
  end
  object BtnMultiply: TButton
    Left = 216
    Top = 106
    Width = 54
    Height = 25
    Caption = '*'
    TabOrder = 16
    OnClick = BtnMultiplyClick
  end
  object BtnMinus: TButton
    Left = 216
    Top = 137
    Width = 54
    Height = 25
    Caption = '-'
    TabOrder = 17
    OnClick = BtnMinusClick
  end
  object BtnPlus: TButton
    Left = 216
    Top = 168
    Width = 54
    Height = 25
    Caption = '+'
    TabOrder = 18
    OnClick = BtnPlusClick
  end
  object BtnResult: TButton
    Left = 216
    Top = 199
    Width = 54
    Height = 25
    Caption = '='
    TabOrder = 19
    OnClick = BtnResultClick
  end
  object BtnComma: TButton
    Left = 144
    Top = 199
    Width = 54
    Height = 25
    Caption = ','
    TabOrder = 20
    OnClick = BtnCommaClick
  end
end
