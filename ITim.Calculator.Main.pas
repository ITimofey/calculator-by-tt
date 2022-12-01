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
    JournalField: TEdit;
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

  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddValueToField(AddValue: Char);
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
  CalcOperation: Char;

implementation

{$R *.dfm}

{$Region ' AddValueToField: ��������� ����� �������� � ����������� '}
procedure TFormCalculator.AddValueToField(AddValue: Char);
begin // �������� �������� � ������
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

{$Region ' btnClick: ��������� ������� ������ ������������ '}

{$Region ' btnClick: ������ 0 - 9 '}

procedure TFormCalculator.Btn0Click(Sender: TObject);
begin
if IsContainsOnlyNull = False then
  AddValueToField('0');
end;

procedure TFormCalculator.Btn1Click(Sender: TObject);
begin
  AddValueToField('1');
end;

procedure TFormCalculator.Btn2Click(Sender: TObject);
begin
  AddValueToField('2');
end;

procedure TFormCalculator.Btn3Click(Sender: TObject);
begin
  AddValueToField('3');
end;

procedure TFormCalculator.Btn4Click(Sender: TObject);
begin
  AddValueToField('4');
end;

procedure TFormCalculator.Btn5Click(Sender: TObject);
begin
  AddValueToField('5');
end;

procedure TFormCalculator.Btn6Click(Sender: TObject);
begin
  AddValueToField('6');
end;

procedure TFormCalculator.Btn7Click(Sender: TObject);
begin
  AddValueToField('7');
end;

procedure TFormCalculator.Btn8Click(Sender: TObject);
begin
  AddValueToField('8');
end;

procedure TFormCalculator.Btn9Click(Sender: TObject);
begin
  AddValueToField('9');
end;

{$EndRegion}

{$Region ' btnClick: �������������� ������ '}

procedure TFormCalculator.BtnNegativeClick(Sender: TObject); // ��������� � CalcResult
var
  CalcFieldValue: Real;
begin
  CalcFieldValue := StrToFloat(CalcField.Text);
  CalcFieldValue := CalcFieldValue * (-1);
  CalcField.Text := FloatToStr(CalcFieldValue);
end;

procedure TFormCalculator.BtnCommaClick(Sender: TObject);
begin
// ���������, ������ �� ������������ ������� �����. ���� ��� - ������ � ��������� ������� ��� �������
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
  JournalField.Text:= '';
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

    // ���������, �������� �� ��������� ������ �������.
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

{$Region ' btnClick: �������������� �������� '}

procedure TFormCalculator.btnPlusClick(Sender: TObject);
begin
  Value1 := StrToFloat(CalcField.Text);
  CalcOperation := '+';
  NeedToClearCalcField := True;
end;

procedure TFormCalculator.BtnMinusClick(Sender: TObject);
begin
  Value1 := StrToFloat(CalcField.Text);
  CalcOperation := '-';
  NeedToClearCalcField := True;
end;

procedure TFormCalculator.BtnMultiplyClick(Sender: TObject);
begin
  Value1 := StrToFloat(CalcField.Text);
  CalcOperation := '*';
  NeedToClearCalcField := True;
end;

procedure TFormCalculator.BtnDivideClick(Sender: TObject);
begin
  Value1 := StrToFloat(CalcField.Text);
  CalcOperation := '/';
  NeedToClearCalcField := True;
end;

procedure TFormCalculator.BtnPercentClick(Sender: TObject);
begin
  Value1 := StrToFloat(CalcField.Text);
  CalcOperation := '%';
  NeedToClearCalcField := True;
end;

procedure TFormCalculator.BtnResultClick(Sender: TObject);
var
  ValueResult : Real;
begin
  if IsResultPressFirst = True then
  begin
    Value2 := StrToFloat(CalcField.Text); // ��� ��������� ������� "�����" �������� ������ �� ������
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

procedure TFormCalculator.BtnOneDividedByXClick(Sender: TObject);
var
  CalcFieldValue: Real;
begin
  CalcFieldValue := StrToFloat(CalcField.Text);
  if CalcFieldValue <>0 then
  begin
    CalcFieldValue := 1 / CalcFieldValue;
    CalcField.Text := FloatToStr(CalcFieldValue);
  end else
  begin
    ShowMessage('������! ������� �� ����.');
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
    ShowMessage('������! ���������� ������ �������������� ��������.');
    BtnClearClick(nil);
  end;
end;

{$EndRegion}

{$EndRegion}

{$Region ' �alcResult: ������� �������� ���������� '}

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
          ShowMessage('������! ������� �� ����.');
          BtnClearClick(nil);
        end;
    end;

    '%' : begin
      ResultValue := Value1 / 100 * Value2;
    end;
  end;
  Value1 := ResultValue;
  Result := ResultValue;
end;

{$EndRegion}

end.
