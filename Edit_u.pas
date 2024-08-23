
unit Edit_u;

interface

uses
  Forms, StdCtrls,Grids, Controls, ExtCtrls, ContactInfo_u,HelperMethods,System.SysUtils, System.Variants, System.Classes, Vcl.Graphics;

type
  TfrmEditForm = class(TForm)
    edtName: TEdit;
    edtPhone: TEdit;
    edtEmail: TEdit;
   btnEditOK: TButton;
   label1:TLabel;
   label2:TLabel;
   label3:TLabel;

  FGrid: TStringGrid;

   procedure btnEditOKClick(Sender: TObject);

    procedure SaveChangesToFile;
    procedure EmailValidation(Sender: TObject);
    procedure PhoneNumberVAlidation(Sender: TObject; var Key: Char);
    procedure NameValidation(Sender: TObject; var Key: Char);
  public
    procedure LoadRowData(Grid: TStringGrid; RowIndex: Integer; FileName: string);
  end;

  var
  frmEditForm:TfrmEditForm;
    Helper:THelper;
implementation

{$R *.dfm}
 var
  vRowIndex: Integer;
  vFileName: string;
procedure TfrmEditForm.EmailValidation(Sender: TObject);
begin
     helper:=THelper.Create;
try
  if helper.IsValidEmail( edtEmail.Text) then
  begin
    edtEmail.Color := clWhite;
    btnEditOK.Enabled:=True;
  end
  else
  begin
    edtEmail.Color := clRed;
    btnEditOK.Enabled:=False;

  end;
finally
    helper.free;
end;
end;

procedure TfrmEditForm.LoadRowData(Grid: TStringGrid; RowIndex: Integer; FileName: string);
begin
  vRowIndex := RowIndex;
  FGrid := Grid;
  vFileName := FileName;

  edtName.Text := Grid.Cells[1, RowIndex];
  edtPhone.Text := Grid.Cells[2, RowIndex];
  edtEmail.Text := Grid.Cells[3, RowIndex];

end;


procedure TfrmEditForm.NameValidation(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', 'A'..'Z', 'a'..'z', #8]) then
      Key := #0;
end;

procedure TfrmEditForm.PhoneNumberVAlidation(Sender: TObject; var Key: Char);
begin
     if not (Key in ['0'..'9', #8]) then
  begin

    if (Key = '-') and (Pos('-', TEdit(Sender).Text) = 0) and (TEdit(Sender).SelStart = 0) then
      Exit
    else
      Key := #0;
  end;
end;

procedure TfrmEditForm.SaveChangesToFile;
var
  vFile: TextFile;
  vIterator: Integer;
  Line: string;
vMainForm: TfrmMainForm;

begin
try

   vMainForm:=TfrmMainForm.Create(Self);
  AssignFile(vFile, vFileName);
  Rewrite(vFile);

  for vIterator := 1 to FGrid.RowCount - 1 do
  begin
    Line := IntToStr(vIterator) + ',' + FGrid.Cells[1, vIterator] + ',' + FGrid.Cells[2, vIterator] + ',' +
            FGrid.Cells[3, vIterator] ;
    WriteLn(vFile, Line);
  end;
  if vMainForm.cbxSortBtn.Checked then
          vMainForm.LoadAndSortData;
  vMainForm.LoadDataFromFileToGrid('Contact.txt');
finally
     CloseFile(vFile);
     vMainForm.Free;
end;


end;

procedure TfrmEditForm.btnEditOKClick(Sender: TObject);
begin
     // Save the changes back to the grid
  FGrid.Cells[1, vRowIndex] := edtName.Text;
  FGrid.Cells[2, vRowIndex] := edtPhone.Text;
  FGrid.Cells[3, vRowIndex] := edtEmail.Text;
  // Save changes to the file

  SaveChangesToFile;


  Close;
end;

end.

