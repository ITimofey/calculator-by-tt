unit ITim.Calculator.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TFormCalculator = class(TForm)
    CalcField: TEdit;
    FormulaField: TEdit;
    Btn0: TButton;
    Btn1: TButton;
    Btn2: TButton;
    Btn3: TButton;
    Btn4: TButton;
    Btn5: TButton;
    Btn6: TButton;
    Btn7: TButton;
    Btn8: TButton;
    Btn9: TButton;
    BtnComma: TButton;
    BtnPlus: TButton;
    BtnMinus: TButton;
    BtnMultiply: TButton;
    BtnDivide: TButton;
    BtnResult: TButton;
    BtnErase: TButton;
    BtnClear: TButton;
    BtnClearEdit: TButton;
    BtnNegative: TButton;
    BtnSquaring: TButton;
    BtnSquaringRoot: TButton;
    BtnPercent: TButton;
    BtnOneDividedByX: TButton;
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
    procedure BtnOneDividedByXClick(Sender: TObject);
    procedure BtnSquaringClick(Sender: TObject);
    procedure BtnSquaringRootClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddValueToCalcField(AddValue: Char);
    procedure UpdateFormulaField(CalcOperationType: Char);
    procedure PressAryphmeticOperation(OperationSymbol: Char);
    function CalcResult() : Real;
  end;

var
  FormCalculator: TFormCalculator;
  IsContainsOnlyNull: Boolean = True;
  IsCommaExists: Boolean = False;
  IsResultPressFirst: Boolean = True;
  IsOperationFirst: Boolean = True;
  NeedToClearCalcField: Boolean = False;

  Value1: Real;
  Value2: Real;
  CalcOperation: Char = ' ';

implementation

{$R *.dfm}

{$Region ' AddValueToCalcField: Процедура ввода значений в калькулятор '}

procedure TFormCalculator.AddValueToCalcField(AddValue: Char);
begin // Добавить значение в строку
  if NeedToClearCalcField = True then
  begin
    CalcField.Text := '';
    NeedToClearCalcField := False;
  end;

  if IsContainsOnlyNull = True then
  begin
      CalcField.Text := '';
      CalcField.Text := CalcField.Text + AddValue;
      IsContainsOnlyNull := False;
  end
  else begin
    CalcField.Text := CalcField.Text + AddValue;
  end;
  IsResultPressFirst := True;
end;

{$EndRegion}

{$Region ' UpdateFormulaField: Процедура обновления поля с формулой '}

procedure TFormCalculator.UpdateFormulaField(CalcOperationType: Char);
begin
  case CalcOperationType of
    'A' : begin // Арифметический тип операции
      FormulaField.Text := FloatToStr(Value1) + ' ' + CalcOperation;
    end;

    'R' : begin // Результирующий тип операции
      FormulaField.Text := FloatToStr(Value1) + ' '
      + CalcOperation + ' ' + FloatToStr(Value2) + ' = ';
    end;
  end;
end;

{$EndRegion}

{$Region ' PressAryphmeticOperation: Процедура обработки нажатия математической операции '}

procedure TFormCalculator.PressAryphmeticOperation(OperationSymbol: Char);
begin
  Value1 := StrToFloat(CalcField.Text);
  CalcOperation := OperationSymbol;
  UpdateFormulaField('A');
  NeedToClearCalcField := True;
end;

{$EndRegion}

{$Region ' BtnClick: Обработка нажатий кнопок калькулятора '}

{$Region ' BtnClick: Кнопки 0 - 9 '}

procedure TFormCalculator.Btn0Click(Sender: TObject);
begin
if IsContainsOnlyNull = False then
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

{$Region ' BtnClick: Математические операции '}

// Простые математические операции
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
  ValueResult : Real;
begin
  if CalcOperation <> ' ' then
  begin
    if IsResultPressFirst = True then
    begin
      Value2 := StrToFloat(CalcField.Text); // При повторном нажатии "Равно" значение берётся из строки
      ValueResult := CalcResult;
      CalcField.Text := FloatToStr(ValueResult);
      IsResultPressFirst := False;
    end else
    begin
      ValueResult := CalcResult;
      CalcField.Text := FloatToStr(ValueResult);
    end;
    NeedToClearCalcField := True;

    if CalcField.Text = '0' then
    begin
      IsContainsOnlyNull  := True;
      IsCommaExists := False;
    end;
  end;
end;

procedure TFormCalculator.BtnOneDividedByXClick(Sender: TObject);
var
  CalcFieldValue: Real;
begin
  CalcFieldValue := StrToFloat(CalcField.Text);
  if CalcFieldValue <>0 then
  begin
    //CalcFieldValue := 1 / CalcFieldValue; // В данном случае результат получается неточным ! ! !
    CalcFieldValue := exp((-1) * ln(CalcFieldValue));
    CalcField.Text := FloatToStr(CalcFieldValue);
  end else
  begin
    ShowMessage('ОШИБКА! Деление на ноль.');
  end;
end;

procedure TFormCalculator.BtnSquaringClick(Sender: TObject);
var
  CalcFieldValue: Real;
begin
  CalcFieldValue := StrToFloat(CalcField.Text);
  CalcFieldValue := sqr(CalcFieldValue);
  CalcField.Text := FloatToStr(CalcFieldValue);
end;

procedure TFormCalculator.BtnSquaringRootClick(Sender: TObject);
var
  CalcFieldValue: Real;
begin
  CalcFieldValue := StrToFloat(CalcField.Text);
  if CalcFieldValue >= 0 then
  begin
    CalcFieldValue := sqrt(CalcFieldValue);
    CalcField.Text := FloatToStr(CalcFieldValue);
  end else
  begin
    ShowMessage('ОШИБКА! Квадратный корень отрицательного значения.');
    BtnClearClick(nil);
  end;
end;

{$EndRegion}

{$Region ' BtnClick: Прочие операции '}

procedure TFormCalculator.BtnNegativeClick(Sender: TObject); // Перенести в CalcResult
var
  CalcFieldValue: Real;
begin
  CalcFieldValue := StrToFloat(CalcField.Text);
  CalcFieldValue := CalcFieldValue * (-1);
  CalcField.Text := FloatToStr(CalcFieldValue);
end;

procedure TFormCalculator.BtnCommaClick(Sender: TObject);
begin
// Проверить, вводил ли пользователь запятую ранее. Если нет - ввести и запретить ставить ещё запятую
if (IsCommaExists=False) then
  begin
    CalcField.Text := CalcField.Text + ',';
    IsCommaExists := True;
    IsContainsOnlyNull := False;
  end;
end;

procedure TFormCalculator.BtnClearClick(Sender: TObject);
begin
  CalcField.Text := '0';
  FormulaField.Text:= '';
  NeedToClearCalcField  := False;
  IsCommaExists := False;
  IsContainsOnlyNull := True;

  Value1 := 0;
  Value2 := 0;
  CalcOperation := ' ';
end;

procedure TFormCalculator.BtnClearEditClick(Sender: TObject);
begin
  CalcField.Text := '0';
  Value1 := 0;
  IsContainsOnlyNull := True;
  IsCommaExists := False;
end;

procedure TFormCalculator.BtnEraseClick(Sender: TObject);
var
  CalcFieldValue: String;

begin
  if (CalcField.Text <> '') then
  begin
    CalcFieldValue := CalcField.Text;

    // Проверить, является ли удаляемый символ запятой.
    if CalcFieldValue[Length(CalcFieldValue)] = ',' then
    begin
      IsCommaExists := False;
    end;
    delete(CalcFieldValue, Length(CalcFieldValue), 1);
    CalcField.Text := CalcFieldValue;

    if CalcField.Text = '0' then
    begin
      IsContainsOnlyNull  := True;
    end;
  end;

  if CalcField.Text = '' then
  begin
    CalcField.Text := '0';
    IsContainsOnlyNull := True;
  end;
end;

{$EndRegion}

{$Region ' FormKeyPress: Обработка нажатий клавиш '}

procedure TFormCalculator.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0':
    begin
      Btn0Click(Btn0);
    end;

    '1':
    begin
      Btn1Click(Btn1);
    end;

    '2':
    begin
      Btn2Click(Btn2);
    end;

    '3':
    begin
      Btn3Click(Btn3);
    end;

    '4':
    begin
      Btn4Click(Btn4);
    end;

    '5':
    begin
      Btn5Click(Btn5);
    end;

    '6':
    begin
      Btn6Click(Btn6);
    end;

    '7':
    begin
      Btn7Click(Btn7);
    end;

    '8':
    begin
      Btn8Click(Btn8);
    end;

    '9':
    begin
      Btn9Click(Btn9);
    end;

    '+':
    begin
      BtnPlusClick(BtnPlus);
    end;

    '-':
    begin
      BtnMinusClick(BtnMinus);
    end;

    '*':
    begin
      BtnMultiplyClick(BtnMultiply);
    end;

    '/':
    begin
      BtnDivideClick(BtnDivide);
    end;

    '.':
    begin
      BtnCommaClick(BtnComma);
    end;

    #13:
    begin
      BtnResultClick(BtnResult);
    end;

    #8:
    begin
      BtnEraseClick(BtnErase);
    end;
  end;
end;

{$EndRegion}

{$EndRegion}

{$Region ' СalcResult: Функция подсчёта результата '}

function TFormCalculator.CalcResult() : Real;
var
  ResultValue: Real;
begin
  ResultValue := 0;
  case CalcOperation of
    '+' : begin
      ResultValue := Value1 + Value2;
    end;

    '-' : begin
      ResultValue := Value1 - Value2;
    end;

    '*' : begin
      ResultValue := Value1 * Value2;
    end;

    '/' : begin
      if Value2<>0 then
        begin
          ResultValue := Value1 / Value2;
        end else
        begin
          ShowMessage('ОШИБКА! Деление на ноль.');
          BtnClearClick(nil);
        end;
    end;

    '%' : begin
      ResultValue := Value1 / 100 * Value2;
    end;
  end;
  UpdateFormulaField('R');
  Value1 := ResultValue;
  Result := ResultValue;
end;

{$EndRegion}

end.
