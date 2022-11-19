unit calculator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
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

  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddValueToField(AddValue: Char);
    procedure CalcResult();
  end;

var
  Form1: TForm1;
  IsContainsOnlyNull: Boolean = True; // ������������ ������������� ���������� ������ ��� ����������� ���������.
  IsCommaExists: Boolean = False;
  IsResultPressFirst: Boolean = True;
  IsEraseEnable: Boolean = True; // ���� �� ������������. ���� ��������.
  NeedToClearCalcField: Boolean = False;

  Value1: Real;
  Value2: Real;
  CalcOperation: Char;
  ValueResult: Real;

implementation

{$R *.dfm}

{$REGION ' AddValueToField: ���� �������� � ����������� '}

procedure TForm1.AddValueToField(AddValue: Char);
begin // �������� �������� � ������
  if NeedToClearCalcField = True then
  begin
    CalcField.Text := '';
    NeedToClearCalcField := False;
    //EraseEnable := True;
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

{$endregion}

{$REGION ' btnClick: ��������� ������� ������ ������������ '}

procedure TForm1.Btn0Click(Sender: TObject);
begin
if IsContainsOnlyNull = False then
  AddValueToField('0');
end;

procedure TForm1.Btn1Click(Sender: TObject);
begin
  AddValueToField('1');
end;

procedure TForm1.Btn2Click(Sender: TObject);
begin
  AddValueToField('2');
end;

procedure TForm1.Btn3Click(Sender: TObject);
begin
  AddValueToField('3');
end;

procedure TForm1.Btn4Click(Sender: TObject);
begin
  AddValueToField('4');
end;

procedure TForm1.Btn5Click(Sender: TObject);
begin
  AddValueToField('5');
end;

procedure TForm1.Btn6Click(Sender: TObject);
begin
  AddValueToField('6');
end;

procedure TForm1.Btn7Click(Sender: TObject);
begin
  AddValueToField('7');
end;

procedure TForm1.Btn8Click(Sender: TObject);
begin
  AddValueToField('8');
end;

procedure TForm1.Btn9Click(Sender: TObject);
begin
  AddValueToField('9');
end;

procedure TForm1.BtnCommaClick(Sender: TObject);
begin
// ���������, ������ �� ������������ ������� �����. ���� ��� - ������ � ��������� ������� ��� �������
if (IsCommaExists=False) then
  begin
    CalcField.Text := CalcField.Text + ',';
    IsCommaExists := True;
    IsContainsOnlyNull := False;
  end;
end;

procedure TForm1.BtnClearClick(Sender: TObject);
begin
  CalcField.Text := '0';
  JournalField.Text:= '';
  NeedToClearCalcField  := False;
  IsCommaExists := False;
  IsContainsOnlyNull := True;
  IsEraseEnable := True;

  Value1 := 0;
  Value2 := 0;
  CalcOperation := ' ';
end;

procedure TForm1.BtnClearEditClick(Sender: TObject);
begin
  CalcField.Text := '0';
  Value1 := 0;
  IsContainsOnlyNull := True;
  IsCommaExists := False;
end;

procedure TForm1.BtnEraseClick(Sender: TObject);
var
  CalcFieldValue: String;

begin
  if (CalcField.Text <> '') and (IsEraseEnable = True) then
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

procedure TForm1.btnPlusClick(Sender: TObject);
begin
  Value1 := StrToFloat(CalcField.Text);
  CalcOperation := '+';
  NeedToClearCalcField := True;
end;

procedure TForm1.BtnMinusClick(Sender: TObject);
begin
  Value1 := StrToFloat(CalcField.Text);
  CalcOperation := '-';
  NeedToClearCalcField := True;
end;

procedure TForm1.BtnMultiplyClick(Sender: TObject);
begin
  Value1 := StrToFloat(CalcField.Text);
  CalcOperation := '*';
  NeedToClearCalcField := True;
end;

procedure TForm1.BtnDivideClick(Sender: TObject);
begin
  Value1 := StrToFloat(CalcField.Text);
  CalcOperation := '/';
  NeedToClearCalcField := True;
end;

procedure TForm1.BtnResultClick(Sender: TObject);
begin
  if IsResultPressFirst = True then
  begin
    Value2 := StrToFloat(CalcField.Text); // ��� ��������� ������� "�����" �������� ������ �� ������
    CalcResult;
    Value1 := ValueResult;
    CalcField.Text := FloatToStr(ValueResult);
    IsResultPressFirst := False;
  end else
  begin
    CalcResult;
    Value1 := ValueResult;
    CalcField.Text := FloatToStr(ValueResult);
  end;
  NeedToClearCalcField := True;
  //IsEraseEnable := False;

  if CalcField.Text = '0' then
  begin
    IsContainsOnlyNull  := True;
    IsCommaExists := False;
  end;
end;

{$endregion}

{$REGION ' �alcResult: ������� �������� ���������� '}

procedure TForm1.CalcResult();
begin
  case CalcOperation of
    '+' : begin
      ValueResult := Value1 + Value2;
    end;

    '-' : begin
      ValueResult := Value1 - Value2;
    end;

    '*' : begin
      ValueResult := Value1 * Value2;
    end;

    '/' : begin
    if Value2<>0 then
    begin
      ValueResult := Value1 / Value2;
    end else
    begin
      ShowMessage('������� �� 0!');
      CalcField.Text := '0'
    end;

    end;
  end;
end;

{$endregion}

end.
