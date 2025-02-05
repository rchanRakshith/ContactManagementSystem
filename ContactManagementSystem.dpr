program ContactManagementSystem;

uses
  Vcl.Forms,
  ContactInfo_u in 'ContactInfo_u.pas' {frmMainForm},
  Add_u in 'Add_u.pas' {frmAddForm},
  Edit_u in 'Edit_u.pas' {frmEditForm},
  DialogBox_u in 'DialogBox_u.pas' {frmDialogBox},
  ContactInterface in 'Interfaces\ContactInterface.pas',
  ContactManagementServices in 'Services\ContactManagementServices.pas',
  HelperMethods in 'Helper\HelperMethods.pas';

{$R *.res}

begin
  Application.Initialize;
 Application.MainFormOnTaskbar := True;
 Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.CreateForm(TfrmAddForm, frmAddForm);
  Application.CreateForm(TfrmEditForm, frmEditForm);
  Application.CreateForm(TfrmDialogBox, frmDialogBox);
  Application.Run;
end.
