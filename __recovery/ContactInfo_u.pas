unit ContactInfo_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Add_u, Vcl.Grids, System.Generics.Collections,
  Vcl.ExtCtrls,StrUtils;

type
  TfrmMainForm = class(TForm)
    btnAdd: TButton;
    lblLabel1: TLabel;
    sgdStringGrid: TStringGrid;
    MainPanel: TPanel;
    lblSuccessCaaption: TLabel;
    Timer1: TTimer;
    edtEdit1: TEdit;
    Label2: TLabel;
    cbxSortBtn: TCheckBox;
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LoadDataFromFileToGrid(const FileName: string);
     procedure  LoadAndSortData;
    //procedure LoadDataFromFile(const FileName: string);
    procedure StringGridClick(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure EditChange(Sender: TObject);

    procedure FilterNames(const AFilterText: string);
    procedure cbxSortBtnClick(Sender: TObject);
  end;

var
  frmMainForm: TfrmMainForm;


implementation

{$R *.dfm}
uses
DialogBox_u,Edit_u;



procedure TfrmMainForm.btnAddClick(Sender: TObject);
var
vSecondForm:TfrmAddForm;
begin
    vSecondForm:=TfrmAddForm.Create(self);
       try
    vSecondForm.ShowModal;
  finally
    vSecondForm.Free;
    LoadDataFromFileToGrid('Contact.txt');
  if cbxSortBtn.Checked then
      LoadAndSortData
  end;
end;



procedure TfrmMainForm.FilterNames(const AFilterText: string);
var
  vIterator, vRow: Integer;
  Lines: TStringList;
  Parts: TArray<string>;
begin
  sgdStringGrid.RowCount := 1; // Reset grid (keep header row)
  vRow := 1;

  
  Lines := TStringList.Create;

  try
    if AFilterText = '' then
    begin
      LoadDataFromFileToGrid('Contact.txt');
    end
    else
    begin
      Lines.LoadFromFile('Contact.txt');
      for vIterator := 0 to Lines.Count - 1 do
      begin
        Parts := SplitString(Lines[vIterator], ',');
        if ContainsText(Trim(Parts[1]), AFilterText) then
        begin
          sgdStringGrid.RowCount := vRow + 1;
          sgdStringGrid.Cells[0, vRow] := Trim(Parts[0]);
          sgdStringGrid.Cells[1, vRow] := Trim(Parts[1]);
          sgdStringGrid.Cells[2, vRow] := Trim(Parts[2]);
          sgdStringGrid.Cells[3, vRow] := Trim(Parts[3]);
          Inc(vRow);
        end;
      end;
    end;
  finally
    Lines.Free;
  end;
end;

            
procedure TfrmMainForm.EditChange(Sender: TObject);
begin
        FilterNames(edtEdit1.Text)
end;

procedure TfrmMainForm.FormCreate(Sender: TObject);
begin
    sgdStringGrid.Cells[0, 0] := 'ID';
  sgdStringGrid.Cells[1, 0] := 'Name';
  sgdStringGrid.Cells[2, 0] := 'Phone Number';
  sgdStringGrid.Cells[3, 0] := 'Email';
  sgdStringGrid.ColWidths[0] := 50;
  sgdStringGrid.ColWidths[1] := 300;
  sgdStringGrid.ColWidths[2] := 300;
  sgdStringGrid.ColWidths[3] := 350;
  sgdStringGrid.Width := 1000;
  sgdStringGrid.Height := 775;
  LoadDataFromFileToGrid('Contact.txt');

end;

procedure TfrmMainForm.LoadDataFromFileToGrid(const FileName: string);
var
  vFile: TextFile;
  Line: string;
  vRowIndex, vColIndex: Integer;
  Values: TArray<string>;
begin
  // Initialize the grid
  sgdStringGrid.RowCount := 1;

  // Open the file for reading
  AssignFile(vFile, FileName);
  Reset(vFile);

  vRowIndex := 1;

  while not Eof(vFile) do
  begin
    ReadLn(vFile, Line);
    Values := Line.Split([',']);
    sgdStringGrid.RowCount := sgdStringGrid.RowCount + 1;

    for vColIndex := Low(Values) to High(Values) do
    begin
      sgdStringGrid.Cells[vColIndex, vRowIndex] := Values[vColIndex];
    end;

    Inc(vRowIndex);
  end;
  CloseFile(vFile);
end;



procedure TfrmMainForm.cbxSortBtnClick(Sender: TObject);
begin
  if cbxSortBtn.Checked then
    LoadAndSortData
  else
    LoadDataFromFileToGrid('Contact.txt');
end;

 procedure TfrmMainForm.LoadAndSortData;
var
  vIterator,vIterator2, vRow: Integer;
  Lines: TStringList;
  Parts: TArray<string>;
  SortedList: TList<TStringList>;
  RowData: TStringList;
  Temp: TStringList;
begin
  
  Lines := TStringList.Create;
  SortedList := TList<TStringList>.Create;

  try
   
    Lines.LoadFromFile('Contact.txt');
    for vIterator := 0 to Lines.Count - 1 do
    begin
      Parts := SplitString(Lines[vIterator], ',');
      if Length(Parts) > 1 then
      begin
        RowData := TStringList.Create;
        try
         
          RowData.Add(Trim(Parts[1]));
          RowData.Add(Trim(Parts[0])); 
          RowData.Add(Trim(Parts[2]));
          RowData.Add(Trim(Parts[3]));
      
              SortedList.Add(RowData);
        except
          RowData.Free;
          raise;
        end;
      end;
    end;

  // Bubble sort
for vIterator := 0 to SortedList.Count - 2 do
    begin
      for vIterator2 := vIterator + 1 to SortedList.Count - 1 do
      begin
        if CompareText(SortedList[vIterator][0], SortedList[vIterator2][0]) > 0 then
        begin
          
          Temp := SortedList[vIterator];
          SortedList[vIterator] := SortedList[vIterator2];
          SortedList[vIterator2] := Temp;
        end;
      end;
    end;


    // Clear the grid and repopulate with sorted data
    sgdStringGrid.RowCount := 1; // Reset grid (keep header row)
    vRow := 1;

    for vIterator := 0 to SortedList.Count - 1 do
    begin
      sgdStringGrid.RowCount := vRow + 1; // Increase row count for each new row
      sgdStringGrid.Cells[0, vRow] := SortedList[vIterator][1]; // Part before comma
      sgdStringGrid.Cells[1, vRow] := SortedList[vIterator][0]; // Part after comma (the name)
      sgdStringGrid.Cells[2, vRow] := SortedList[vIterator][2];
      sgdStringGrid.Cells[3, vRow] := SortedList[vIterator][3];
      Inc(vRow);
    end;
  finally
    // Free memory
    for vIterator := 0 to SortedList.Count - 1 do
      SortedList[vIterator].Free;
    SortedList.Free;
    Lines.Free;
  end;
end;



procedure TfrmMainForm.StringGridClick(Sender: TObject; ACol, ARow: LongInt;
  var CanSelect: Boolean);
  var
  vRowIndex: Integer;
    frmDialogBox:TfrmDialogBox ;
begin
  vRowIndex := sgdStringGrid.Row;


  if vRowIndex>0 then
  begin

  frmDialogBox.rowNumber:= vRowIndex;
  frmDialogBox:=TfrmDialogBox.Create(self);
  frmDialogBox.ShowModal;
  end;

end;


procedure TfrmMainForm.Timer1Timer(Sender: TObject);
begin
lblSuccessCaaption.Caption:='';
Timer1.Enabled:=False;
end;

{procedure TfrmMainForm.LoadDataFromFile(const FileName: string);
var
  vFile: TextFile;
  Line: string;
  vRowIndex: Integer;
begin
try


  sgdStringGrid.ColCount := 4;
  sgdStringGrid.RowCount := 1;
 // Open the file for reading
  AssignFile(vFile, FileName);
  Reset(vFile);


  vRowIndex := 1;
  while not Eof(vFile) do
  begin
    ReadLn(vFile, Line);
    // Increase the number of rows in the grid
    sgdStringGrid.RowCount := vRowIndex + 1;

    sgdStringGrid.Cells[0, vRowIndex] := IntToStr(vRowIndex);
    sgdStringGrid.Cells[1, vRowIndex] := Line.Split([','])[1];
    sgdStringGrid.Cells[2, vRowIndex] := Line.Split([','])[2];
    sgdStringGrid.Cells[3, vRowIndex] := Line.Split([','])[3];

    Inc(vRowIndex);
  end;
    finally
     CloseFile(vFile);
end;

end;}


end.
