unit Add_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,HelperMethods;

type
  TfrmAddForm = class(TForm)
    edtAddName: TEdit;
    edtAddPhoneNumber: TEdit;
    edtAddEmail: TEdit;
    lblLabel1: TLabel;
    lblLabel2: TLabel;
    lblLabel3: TLabel;
    btnOK: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure edtAddEmailChange(Sender: TObject);
    procedure PhoneNumberValidation(Sender: TObject; var Key: Char);
    procedure NameValidation(Sender: TObject; var Key: Char);


  end;

var
  frmAddForm: TfrmAddForm;
  Helper:THelper;
implementation

{$R *.dfm}


procedure TfrmAddForm.btnOKClick(Sender: TObject);
var
  vName, vPhoneNumber, vEmail, vLine: string;
  vFile: TextFile;
  vLastID, vNewID: Integer;
  vIDFileName: string;
begin
  vIDFileName := 'LastID.txt';
  if FileExists(vIDFileName) then
  begin
    AssignFile(vFile, vIDFileName);
    Reset(vFile);
    ReadLn(vFile, vLastID);
    CloseFile(vFile);
  end
  else
    vLastID := 0;

  vNewID := vLastID + 1;
  AssignFile(vFile, vIDFileName);
  Rewrite(vFile);
  WriteLn(vFile, vNewID);
  CloseFile(vFile);

  vName := edtAddName.Text;
  vPhoneNumber := edtAddPhoneNumber.Text;
  vEmail := edtAddEmail.Text;
  vLine := IntToStr(vNewID) + ',' + vName + ',' + vPhoneNumber + ',' + vEmail;

  AssignFile(vFile, 'Contact.txt');
  if FileExists('Contact.txt') then
    Append(vFile)
  else
    Rewrite(vFile);

  WriteLn(vFile, vLine);
  CloseFile(vFile);
  close;
end;


procedure TfrmAddForm.edtAddEmailChange(Sender: TObject);
begin
helper:=THelper.Create;
try
  if helper.IsValidEmail(EdtAddEmail.Text) then
  begin
    EdtAddEmail.Color := clWhite;
    btnOK.Enabled:=True;
  end
  else
  begin
    EdtAddEmail.Color := clRed;
    btnOK.Enabled:=False;

  end;
finally
    helper.free;
end;
end;




procedure TfrmAddForm.NameValidation(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', 'A'..'Z', 'a'..'z', #8]) then
      Key := #0;
end;

procedure TfrmAddForm.PhoneNumberValidation(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9', #8]) then
  begin

    if (Key = '-') and (Pos('-', TEdit(Sender).Text) = 0) and (TEdit(Sender).SelStart = 0) then
      Exit
    else
      Key := #0;
  end;
end;

end.
