unit ITim.Calculator.Main;

interface

{$Region 'Uses'}

uses
  // WinAPI
  Winapi.Windows,
  Winapi.Messages,

  // System
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Math,

  // VCL
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons;

{$EndRegion}

type

{$Region 'TFormCalculator: Базовый класс формы калькулятора'}

  TFormCalculator = class(TForm)
  {$Region 'Константы пользовательского интерфейса'}
    CalcField: TEdit;
    FormulaField: TEdit;
    BtnOneByX: TSpeedButton;
    BtnClearEdit: TSpeedButton;
    BtnClear: TSpeedButton;
    BtnErase: TSpeedButton;
    BtnPercent: TSpeedButton;
    BtnSquaring: TSpeedButton;
    BtnSquaringRoot: TSpeedButton;
    BtnDivide: TSpeedButton;
    Btn7: TSpeedButton;
    Btn8: TSpeedButton;
    Btn9: TSpeedButton;
    BtnMultiply: TSpeedButton;
    Btn4: TSpeedButton;
    Btn5: TSpeedButton;
    Btn6: TSpeedButton;
    BtnMinus: TSpeedButton;
    Btn1: TSpeedButton;
    Btn2: TSpeedButton;
    Btn3: TSpeedButton;
    BtnPlus: TSpeedButton;
    BtnNegative: TSpeedButton;
    Btn0: TSpeedButton;
    BtnComma: TSpeedButton;
    BtnResult: TSpeedButton;
  {$EndRegion}
  {$Region 'BtnClick - Обработка нажатий кнопок калькулятора'}
    procedure Btn0Click(Sender: TObject);
    procedure Btn1Click(Sender: TObject);
    procedure Btn2Click(Sender: TObject);
    procedure Btn3Click(Sender: TObject);
    procedure Btn4Click(Sender: TObject);
    procedure Btn5Click(Sender: TObject);
    procedure Btn6Click(Sender: TObject);
    procedure Btn7Click(Sender: TObject);
    procedure Btn8Click(Sender: TObject);
    procedure Btn9Click(Sender: TObject);
    procedure BtnCommaClick(Sender: TObject);
    procedure btnPlusClick(Sender: TObject);
    procedure BtnEraseClick(Sender: TObject);
    procedure BtnMinusClick(Sender: TObject);
    procedure BtnMultiplyClick(Sender: TObject);
    procedure BtnDivideClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnResultClick(Sender: TObject);
    procedure BtnClearEditClick(Sender: TObject);
    procedure BtnNegativeClick(Sender: TObject);
    procedure BtnPercentClick(Sender: TObject);
    procedure BtnOneByXClick(Sender: TObject);
    procedure BtnSquaringClick(Sender: TObject);
    procedure BtnSquaringRootClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  {$EndRegion}
  public
    procedure AddValueToCalcField(AddValue: Char);
    procedure UpdateFormulaField(CalcOperationType: Char);
    procedure PressAryphmeticOperation(OperationSymbol: Char);
    function CalcResult(): Extended;
  end;

{$EndRegion}

{$Region 'Глобальные переменные модуля'}

var
  FormCalculator: TFormCalculator;
  IsContainsOnlyNull: Boolean = True;
  IsCommaExists: Boolean = False;
  IsResultPressFirst: Boolean = True;
  IsOperationFirst: Boolean = True;
  NeedToClearCalcField: Boolean = False;
  LastOperationIsPressAryphmeticOperation: Boolean = False;
  Value1: Extended;
  Value2: Extended;
  CalcOperation: Char = ' ';

{$EndRegion}

implementation

{$R *.dfm}

{$Region ' AddValueToCalcField: Процедура ввода значений в калькулятор '}

procedure TFormCalculator.AddValueToCalcField(AddValue: Char);
begin
  if NeedToClearCalcField then
  begin
    CalcField.Text:='';
    NeedToClearCalcField:=False;
  end;
  if IsContainsOnlyNull then
  begin
    CalcField.Text:='';
    CalcField.Text:=CalcField.Text + AddValue;
    IsContainsOnlyNull:=False;
  end else
    CalcField.Text:=CalcField.Text + AddValue;
  IsResultPressFirst:=True;
  LastOperationIsPressAryphmeticOperation:=False;
end;

{$EndRegion}

{$Region ' UpdateFormulaField: Процедура обновления поля с формулой '}

procedure TFormCalculator.UpdateFormulaField(CalcOperationType: Char);
begin
  case CalcOperationType of
    'A' :
      // Арифметический тип операции (пример отображения: 10 + )
      FormulaField.Text:=FloatToStr(Value1)+' '+CalcOperation;
    'R' :
      // Результирующий тип операции (пример отображения: 10 + 2 = 12)
      FormulaField.Text:=FloatToStr(Value1)+' '
        +CalcOperation+' '+FloatToStr(Value2)+' = ';
  end;
end;

{$EndRegion}

{$Region ' PressAryphmeticOperation: Процедура обработки нажатия арифметической операции '}

procedure TFormCalculator.PressAryphmeticOperation(OperationSymbol: Char);
var
  ValueResult: Extended;
begin
  if not LastOperationIsPressAryphmeticOperation then
  begin
    if IsOperationFirst = True then
      Value1:=StrToFloat(CalcField.Text)
    else
    begin
      Value2:=StrToFloat(CalcField.Text);
      ValueResult:=CalcResult;
      CalcField.Text:=FloatToStr(ValueResult);
    end;
    NeedToClearCalcField:=True;
    IsOperationFirst:=False;
    LastOperationIsPressAryphmeticOperation:=True;
  end;
  CalcOperation:=OperationSymbol;
  UpdateFormulaField('A');
end;

{$EndRegion}

{$Region ' СalcResult: Функция подсчёта результата '}

function TFormCalculator.CalcResult(): Extended;
var
  ResultValue: Extended;
begin
  ResultValue:=0;
  case CalcOperation of
    '+':
      ResultValue:=Value1+Value2;
    '-':
      ResultValue:=Value1-Value2;
    '*':
      ResultValue:=Value1*Value2;
    '/':
    begin
      if not IsZero(Value2) then
        ResultValue:=Value1/Value2
      else
      begin
        ShowMessage('ОШИБКА! Деление на ноль.');
        BtnClearClick(BtnClear);
      end;
    end;
    '%':
      ResultValue:=Value1/100*Value2;
  end;
  UpdateFormulaField('R');
  Value1:=ResultValue;
  Result:=ResultValue;
end;

{$EndRegion}

{$Region ' BtnClick: Обработка нажатий кнопок калькулятора '}

{$Region ' BtnClick: Кнопки 0 - 9 '}

procedure TFormCalculator.Btn0Click(Sender: TObject);
begin
if not IsContainsOnlyNull then
  AddValueToCalcField('0');
end;

procedure TFormCalculator.Btn1Click(Sender: TObject);
begin
  AddValueToCalcField('1');
end;

procedure TFormCalculator.Btn2Click(Sender: TObject);
begin
  AddValueToCalcField('2');
end;

procedure TFormCalculator.Btn3Click(Sender: TObject);
begin
  AddValueToCalcField('3');
end;

procedure TFormCalculator.Btn4Click(Sender: TObject);
begin
  AddValueToCalcField('4');
end;

procedure TFormCalculator.Btn5Click(Sender: TObject);
begin
  AddValueToCalcField('5');
end;

procedure TFormCalculator.Btn6Click(Sender: TObject);
begin
  AddValueToCalcField('6');
end;

procedure TFormCalculator.Btn7Click(Sender: TObject);
begin
  AddValueToCalcField('7');
end;

procedure TFormCalculator.Btn8Click(Sender: TObject);
begin
  AddValueToCalcField('8');
end;

procedure TFormCalculator.Btn9Click(Sender: TObject);
begin
  AddValueToCalcField('9');
end;

{$EndRegion}

{$Region ' BtnClick: Арифметические операции '}

procedure TFormCalculator.btnPlusClick(Sender: TObject);
begin
  PressAryphmeticOperation('+');
end;

procedure TFormCalculator.BtnMinusClick(Sender: TObject);
begin
  PressAryphmeticOperation('-');
end;

procedure TFormCalculator.BtnMultiplyClick(Sender: TObject);
begin
  PressAryphmeticOperation('*');
end;

procedure TFormCalculator.BtnDivideClick(Sender: TObject);
begin
  PressAryphmeticOperation('/');
end;

procedure TFormCalculator.BtnPercentClick(Sender: TObject);
begin
  PressAryphmeticOperation('%');
end;

procedure TFormCalculator.BtnResultClick(Sender: TObject);
var
  ValueResult : Extended;
begin
  if CalcOperation <> ' ' then
  begin
    if IsResultPressFirst then
    begin
      Value2:=StrToFloat(CalcField.Text);
      ValueResult:=CalcResult;
      IsResultPressFirst:=False;
    end else
      ValueResult:=CalcResult;
    CalcField.Text:=FloatToStr(ValueResult);
    NeedToClearCalcField:=True;
    if CalcField.Text = '0' then
    begin
      IsContainsOnlyNull:=True;
      IsCommaExists:=False;
    end;
    IsOperationFirst:=True;
  end;
end;

procedure TFormCalculator.BtnOneByXClick(Sender: TObject);
var
  CalcFieldValue: Extended;
begin
  CalcFieldValue:=StrToFloat(CalcField.Text);
  if not IsZero(CalcFieldValue) then
  begin
    CalcFieldValue:=exp((-1)*ln(CalcFieldValue));
    CalcField.Text:=FloatToStr(CalcFieldValue);
  end else
    ShowMessage('ОШИБКА! Деление на ноль.');
end;

procedure TFormCalculator.BtnSquaringClick(Sender: TObject);
var
  CalcFieldValue: Extended;
begin
  CalcFieldValue:=StrToFloat(CalcField.Text);
  CalcFieldValue:=sqr(CalcFieldValue);
  CalcField.Text:=FloatToStr(CalcFieldValue);
end;

procedure TFormCalculator.BtnSquaringRootClick(Sender: TObject);
var
  CalcFieldValue: Extended;
begin
  CalcFieldValue:=StrToFloat(CalcField.Text);
  if CalcFieldValue >= 0 then
  begin
    CalcFieldValue:=sqrt(CalcFieldValue);
    CalcField.Text:=FloatToStr(CalcFieldValue);
  end else
  begin
    ShowMessage('ОШИБКА! Квадратный корень отрицательного значения.');
    BtnClearClick(nil);
  end;
end;

{$EndRegion}

{$Region ' BtnClick: Прочие операции '}

procedure TFormCalculator.BtnNegativeClick(Sender: TObject);
var
  CalcFieldValue: Extended;
begin
  CalcFieldValue:=StrToFloat(CalcField.Text);
  CalcFieldValue:=CalcFieldValue*(-1);
  CalcField.Text:=FloatToStr(CalcFieldValue);
end;

procedure TFormCalculator.BtnCommaClick(Sender: TObject);
begin
  if not IsCommaExists then
  begin
    CalcField.Text:=CalcField.Text + ',';
    IsCommaExists:=True;
    IsContainsOnlyNull:=False;
  end;
end;

procedure TFormCalculator.BtnClearClick(Sender: TObject);
begin
  CalcField.Text:='0';
  FormulaField.Text:='';
  NeedToClearCalcField:=False;
  IsCommaExists:=False;
  IsContainsOnlyNull:=True;
  Value1:=0;
  Value2:=0;
  CalcOperation:=' ';
  IsOperationFirst:=True;
end;

procedure TFormCalculator.BtnClearEditClick(Sender: TObject);
begin
  CalcField.Text:='0';
  IsContainsOnlyNull:=True;
  IsCommaExists:=False;
end;

procedure TFormCalculator.BtnEraseClick(Sender: TObject);
var
  CalcFieldValue: String;
begin
  if (CalcField.Text <> '') then
  begin
    CalcFieldValue:=CalcField.Text;
    if CalcFieldValue[Length(CalcFieldValue)] = ',' then
      IsCommaExists:=False;
    delete(CalcFieldValue, Length(CalcFieldValue), 1);
    CalcField.Text:=CalcFieldValue;
    if CalcField.Text = '0' then
      IsContainsOnlyNull:=True;
  end;
  if CalcField.Text = '' then
  begin
    CalcField.Text:='0';
    IsContainsOnlyNull:=True;
  end;
end;

{$EndRegion}

{$Region ' FormKeyPress: Обработка нажатий клавиш '}

procedure TFormCalculator.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0':
      Btn0Click(Btn0);
    '1':
      Btn1Click(Btn1);
    '2':
      Btn2Click(Btn2);
    '3':
      Btn3Click(Btn3);
    '4':
      Btn4Click(Btn4);
    '5':
      Btn5Click(Btn5);
    '6':
      Btn6Click(Btn6);
    '7':
      Btn7Click(Btn7);
    '8':
      Btn8Click(Btn8);
    '9':
      Btn9Click(Btn9);
    '+':
      BtnPlusClick(BtnPlus);
    '-':
      BtnMinusClick(BtnMinus);
    '*':
      BtnMultiplyClick(BtnMultiply);
    '/':
      BtnDivideClick(BtnDivide);
    '.':
      BtnCommaClick(BtnComma);
    #13:
      BtnResultClick(BtnResult);
    #8:
      BtnEraseClick(BtnErase);
    #27:
      BtnClearClick(BtnClear);
  end;
end;

{$EndRegion}

{$EndRegion}

end.
