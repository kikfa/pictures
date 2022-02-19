unit unit12;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    CalcBtn: TButton;
    CheckBox1: TCheckBox;
    AnswerEdit: TEdit;
    TimeEdit: TEdit;
    SpeedEdit: TEdit;
    AccEdit: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure AccEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure SpeedEditChange(Sender: TObject);
    procedure TimeEditChange(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: char);
    procedure TimeEditClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

  Time: Real = 0;
  Speed: Real = 0;
  Acc : Real = 0;
  Time_koef : Integer = 1;
  FinalTime : Real;
  LastAcc : Real;

implementation

{$R *.lfm}

{ TForm1 }



Function MyFunc(LaslAcc, Acc : Real) : Real;
 begin
   if  Form1.CheckBox1.True then
    LastAcc := Acc-5
   else
   LastlAcc := Acc
 end;

procedure TForm1.TimeEditChange(Sender: TObject);
begin
  if (Form1.TimeEdit.Text = '') then
     exit;

  Form1.TimeEdit.Color := clDefault;
  try
     Time :=  StrToFloat(Form1.TimeEdit.Text);
  except
     Time := 0;
     Form1.TimeEdit.Color := clRed;
  end;
end;

procedure TForm1.SpeedEditChange(Sender: TObject);
begin
      if (Form1.SpeedEdit.Text = '') then
         exit;

      Form1.SpeedEdit.Color := clDefault;
      try
         Speed :=  StrToFloat(Form1.SpeedEdit.Text);
      except
         Speed := 0;
         Form1.SpeedEdit.Color := clRed;
      end;
end;


procedure TForm1.AccEditChange(Sender: TObject);
begin
      if (Form1.AccEdit.Text = '') then
         exit;

      Form1.AccEdit.Color := clDefault;
      try
         Acc :=  StrToFloat(Form1.AccEdit.Text);
      except
         Acc := 0;
         Form1.AccEdit.Color := clRed;
      end;
end;

procedure TForm1.CalcBtnClick(Sender: TObject);
begin

end;

procedure TForm1.EditKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8, '.']) then
     Key := #0;
end;

procedure TForm1.TimeEditClick(Sender: TObject);
begin
    if (Form1.TimeEdit.Text = 'Время') then
     Form1.TimeEdit.Text := '';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DecimalSeparator := '.';
end;

procedure TForm1.RadioButton1Change(Sender: TObject);
begin
  Form1.RadioButton2.Checked := not Form1.RadioButton1.Checked;
  if (Form1.RadioButton1.Checked) then Time_koef:=0,001;
end;

procedure TForm1.RadioButton2Change(Sender: TObject);
begin
  Form1.RadioButton1.Checked := not Form1.RadioButton2.Checked;
  if (Form1.RadioButton2.Checked) then Time_koef:=1;
end;

end.

