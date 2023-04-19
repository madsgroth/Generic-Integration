codeunit 73901 "CGI Integration Mgt."
{
    procedure IsItegrationActive(IntegrationID: text): Boolean
    var
        myInt: Integer;
    begin
        EXIT(IntegrationID <> '')
    end;


}