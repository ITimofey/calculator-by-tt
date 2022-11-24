program ITim.Calculator;

uses
  Vcl.Forms,
  ITim.Calculator.Main in 'ITim.Calculator.Main.pas' {FormCalculator};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCalculator, FormCalculator);
  Application.Run;
end.
