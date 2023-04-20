codeunit 73903 "CGI OPP Proxy"
{
    trigger OnRun()
    var
        IntegrationPublishers: Codeunit "CGI Integration Event Pub.";
    begin

    end;

    local procedure ProcessDCDocument(IntegrationID: Text; ProductCode: Text; PrimaryKey: Text; var Data: JsonObject)
    var

        DocumentString: text;
    begin
        data.WriteTo(DocumentString);
        Message('It arrived! : ' + DocumentString);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CGI Integration Event Pub.", 'OnDataEntityCreate', '', true, true)]
    local procedure OnDataEntityCreate(IntegrationID: Text; ProductCode: Text; PrimaryKey: Text)
    var
        IntegrationMgt: Codeunit "CGI Integration Mgt.";
        IntegrationEvents: Codeunit "CGI Integration Event Pub.";
        Data: JsonObject;
    begin
        if IntegrationMgt.IsItegrationActive(IntegrationID) then begin
            IntegrationEvents.OnGetDataEntity(IntegrationID, ProductCode, PrimaryKey, Data);

        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CGI Integration Event Pub.", 'OnGetDataEntityIsReady', '', false, false)]
    local procedure OnGetDataEntityIsReady(IntegrationID: Text; ProductCode: Text; PrimaryKey: Text; var Data: JsonObject)
    begin
        ProcessDCDocument(IntegrationID, ProductCode, PrimaryKey, Data);
    end;
}