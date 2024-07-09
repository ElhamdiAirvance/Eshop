page 57005 "AVI E-Shop User Types"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "AVI E-Shop User Type";
    CardPageId = "AVI E-Shop User Type";
    CaptionML = ENU = 'E-Shop User Types', NLD = 'E-Shop Gebruikerstypes';
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater("List")
            {
                field(code; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
