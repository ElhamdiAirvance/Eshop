page 57009 "AVI E-Shop Sessions"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "AVI E-Shop Session";
    SourceTableView = sorting("Created At") order(descending);
    CaptionML = ENU = 'E-Shop Sessions', NLD = 'E-Shop Sessies';
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater("List")
            {
                field(aviEShopSessionId; Rec."Session Id")
                {
                    ApplicationArea = All;
                }
                field(userName; Rec."User Name")
                {
                    ApplicationArea = All;
                }
                field(languageCode; Rec."Language Code")
                {
                    ApplicationArea = All;
                }
                field(createdAt; Rec."Created At")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
