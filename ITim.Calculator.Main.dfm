object FormCalculator: TFormCalculator
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088
  ClientHeight = 354
  ClientWidth = 249
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object BtnOneByX: TSpeedButton
    Left = 8
    Top = 77
    Width = 54
    Height = 40
    Caption = '1/x'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnOneByXClick
  end
  object BtnClearEdit: TSpeedButton
    Left = 68
    Top = 77
    Width = 54
    Height = 40
    Caption = 'CE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnClearEditClick
  end
  object BtnClear: TSpeedButton
    Left = 128
    Top = 77
    Width = 54
    Height = 40
    Caption = 'C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnClearClick
  end
  object BtnErase: TSpeedButton
    Left = 188
    Top = 77
    Width = 54
    Height = 40
    Caption = #8592
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnEraseClick
  end
  object BtnPercent: TSpeedButton
    Left = 8
    Top = 123
    Width = 54
    Height = 40
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnPercentClick
  end
  object BtnSquaring: TSpeedButton
    Left = 68
    Top = 123
    Width = 54
    Height = 40
    Caption = 'x'#178
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnSquaringClick
  end
  object BtnSquaringRoot: TSpeedButton
    Left = 128
    Top = 123
    Width = 54
    Height = 40
    Caption = #8730
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnSquaringRootClick
  end
  object BtnDivide: TSpeedButton
    Left = 188
    Top = 123
    Width = 54
    Height = 40
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnDivideClick
  end
  object Btn7: TSpeedButton
    Left = 8
    Top = 169
    Width = 54
    Height = 40
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Btn7Click
  end
  object Btn8: TSpeedButton
    Left = 68
    Top = 169
    Width = 54
    Height = 40
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Btn8Click
  end
  object Btn9: TSpeedButton
    Left = 128
    Top = 169
    Width = 54
    Height = 40
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Btn9Click
  end
  object BtnMultiply: TSpeedButton
    Left = 188
    Top = 169
    Width = 54
    Height = 40
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnMultiplyClick
  end
  object Btn4: TSpeedButton
    Left = 8
    Top = 215
    Width = 54
    Height = 40
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Btn4Click
  end
  object Btn5: TSpeedButton
    Left = 68
    Top = 215
    Width = 54
    Height = 40
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Btn5Click
  end
  object Btn6: TSpeedButton
    Left = 128
    Top = 215
    Width = 54
    Height = 40
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Btn6Click
  end
  object BtnMinus: TSpeedButton
    Left = 188
    Top = 215
    Width = 54
    Height = 40
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnMinusClick
  end
  object Btn1: TSpeedButton
    Left = 8
    Top = 261
    Width = 54
    Height = 40
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Btn1Click
  end
  object Btn2: TSpeedButton
    Left = 68
    Top = 259
    Width = 54
    Height = 40
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Btn2Click
  end
  object Btn3: TSpeedButton
    Left = 128
    Top = 261
    Width = 54
    Height = 40
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Btn3Click
  end
  object BtnPlus: TSpeedButton
    Left = 188
    Top = 261
    Width = 54
    Height = 40
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnPlusClick
  end
  object BtnNegative: TSpeedButton
    Left = 8
    Top = 305
    Width = 54
    Height = 40
    Caption = #177
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnNegativeClick
  end
  object Btn0: TSpeedButton
    Left = 68
    Top = 307
    Width = 54
    Height = 40
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = Btn0Click
  end
  object BtnComma: TSpeedButton
    Left = 128
    Top = 307
    Width = 54
    Height = 40
    Caption = ','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnCommaClick
  end
  object BtnResult: TSpeedButton
    Left = 188
    Top = 307
    Width = 54
    Height = 40
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BtnResultClick
  end
  object CalcField: TEdit
    Left = 8
    Top = 41
    Width = 234
    Height = 27
    Alignment = taRightJustify
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = '0'
  end
  object FormulaField: TEdit
    Left = 8
    Top = 8
    Width = 234
    Height = 27
    Alignment = taRightJustify
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
end
