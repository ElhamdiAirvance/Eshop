page 57007 "AVI E-Shop Users"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "AVI E-Shop User";
    CardPageId = "AVI E-Shop User";
    CaptionML = ENU = 'E-Shop Users', NLD = 'E-Shop Gebruikers';
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater("List")
            {
                field(userName; Rec."User Name")
                {
                    ApplicationArea = All;
                }
                field(fullName; Rec."Full Name")
                {
                    ApplicationArea = All;
                }
                field(eMail; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field(userType; Rec."User Type")
                {
                    ApplicationArea = All;
                }
                field(administrator; Rec."Administrator")
                {
                    ApplicationArea = All;
                }
                field(blocked; Rec."Blocked")
                {
                    ApplicationArea = All;
                }
                field(orderLimit; Rec."Order Limit")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
