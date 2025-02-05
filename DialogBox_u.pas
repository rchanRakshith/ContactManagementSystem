unit DialogBox_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Edit_u, Vcl.Grids,
  ContactInfo_u,
  Vcl.ExtCtrls;

type
  TfrmDialogBox = class(TForm)
    btnEdit: TButton;
    btnDelete: TButton;

    procedure btnEditClick(Sender: TObject);
    procedure getRowNumber(ARNum: Integer);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    class var rowNumber: Integer;
    { Public declarations }
  end;

var
  frmDialogBox: TfrmDialogBox;

  frmMainForm: TfrmMainForm;
  frmEditForm: TfrmEditForm;

implementation

{$R *.dfm}

procedure TfrmDialogBox.btnDeleteClick(Sender: TObject);
var
  FileLines: TStringList;
begin
  FileLines := TStringList.Create;
  try
    FileLines.LoadFromFile('Contact.txt');
    FileLines.Delete(rowNumber - 1);
    FileLines.SaveToFile('Contact.txt');
    frmMainForm.LoadDataFromFileToGrid('Contact.txt');
    frmMainForm.lblSuccessCaaption.Caption := 'Contact Deleted successfully';
    frmMainForm.Timer1.Enabled := True;
    if frmMainForm.cbxSortBtn.Checked then
      frmMainForm.LoadAndSortData;
    frmDialogBox.Hide;

  finally
    FileLines.Free;
  end;

end;

procedure TfrmDialogBox.btnEditClick(Sender: TObject);
begin
  try
    // MainForm:=TMainForm.Create(Self);
    frmEditForm := TfrmEditForm.Create(Self);
    frmEditForm.LoadRowData(frmMainForm.sgdStringGrid, rowNumber,
      'Contact.txt');
    frmEditForm.ShowModal;
  finally
    frmEditForm.Free;
  end;
end;

procedure TfrmDialogBox.getRowNumber(ARNum: Integer);
begin
  rowNumber := ARNum;
end;

end.
