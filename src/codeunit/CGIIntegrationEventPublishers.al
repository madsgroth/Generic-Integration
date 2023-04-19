codeunit 73900 "CGI Integration Event Pub."
{

    [IntegrationEvent(false, false)]
    local procedure OnDataEntityCreate(IntegrationID: Text; ProductCode: Text; PrimaryKey: Text);
    var

        IntegrationMgt: Codeunit "CGI Integration Mgt.";



    begin
        if not IntegrationMgt.IsItegrationActive(IntegrationID))
        then exit;


    end;

}