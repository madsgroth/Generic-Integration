page 73900 "CGI Integration Runner"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Integer;
    SourceTableView = where("Number" = filter(1));

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; 'NameSource')
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RunDC2OPP)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    CGIDCProxy: Codeunit "CGI DC Proxy";
                begin

                    CGIDCProxy.run;


                end;
            }
        }
    }

    var
        myInt: Integer;
}