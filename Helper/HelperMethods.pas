unit HelperMethods;

interface
uses
System.RegularExpressions;
type
THelper=class
  function IsValidEmail(const Email: string): Boolean;
end;

implementation
function THelper.IsValidEmail(const Email: string): Boolean;
const
  // Basic email pattern
  EmailPattern = '^[\w.-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,4}$';
begin
  Result := TRegEx.IsMatch(Email, EmailPattern);
end;


end.
