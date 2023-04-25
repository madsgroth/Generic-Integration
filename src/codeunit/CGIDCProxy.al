codeunit 73902 "CGI DC Proxy"
{
    trigger OnRun()
    var
        IntegrationPublishers: Codeunit "CGI Integration Event Pub.";
    begin
        IntegrationPublishers.OnDataEntityCreate('DC2OPP-AVIS', 'PURCHASE', 'D00001');
    end;


    procedure GetDCDoc(DocNo: text; var jDocument: JsonObject)
    var
        jLines: JsonArray;
        jLine: JsonObject;
        jHeader: JsonObject;
    begin
        clear(jDocument);
        Clear(jLines);
        clear(jHeader);

        jHeader.Add('DocumentNo', 'D00001');
        jHeader.Add('SourceID', '100000');
        jHeader.Add('SourceName', 'London Postmaster');

        clear(jLine);
        jLine.add('LineNo', 100);
        jLine.Add('No', 1000);
        jLine.Add('Qty', 3);
        jLine.Add('UnitCost', 100);
        jLine.Add('LineAmount', 300);
        jLines.Add(jLine);

        clear(jLine);
        jLine.add('LineNo', 200);
        jLine.Add('No', 1000);
        jLine.Add('Qty', 2);
        jLine.Add('UnitCost', 100);
        jLine.Add('LineAmount', 200);
        jLines.Add(jLine);
        jDocument.add('Header', jHeader);
        jDocument.add('Lines', jlines);

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CGI Integration Event Pub.", 'GetDataEntity', '', true, true)]
    local procedure OnGetDataEntity(IntegrationID: Text; ProductCode: Text; PrimaryKey: Text; var Data: JsonObject)
    var
        IntegrationMgt: Codeunit "CGI Integration Mgt.";
        Integrationevents: Codeunit "CGI Integration Event Pub.";
    begin
        if IntegrationMgt.IsItegrationActive(IntegrationID) then begin
            GetDCDoc(PrimaryKey, Data);
            Integrationevents.DataEntityIsReady(IntegrationID, ProductCode, PrimaryKey, Data);
        end;

    end;

}