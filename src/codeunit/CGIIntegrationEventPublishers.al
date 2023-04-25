codeunit 73900 "CGI Integration Event Pub."
{

    [IntegrationEvent(false, false)]
    procedure OnDataEntityCreate(IntegrationID: Text; ProductCode: Text; PrimaryKey: Text);
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnDataEntityModify(IntegrationID: Text; ProductCode: Text; PrimaryKey: Text);
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnDataEntityDelete(IntegrationID: Text; ProductCode: Text; PrimaryKey: Text);
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure GetDataEntity(IntegrationID: Text; ProductCode: Text; PrimaryKey: Text; var Data: JsonObject);
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure DataEntityIsReady(IntegrationID: Text; ProductCode: Text; PrimaryKey: Text; var Data: JsonObject);
    begin
    end;

}