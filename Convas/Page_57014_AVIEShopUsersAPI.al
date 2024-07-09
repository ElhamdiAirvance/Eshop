page 57014 "AVI E-Shop Users API"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'AVI';
    APIGroup = 'EShop';

    EntityCaptionML = ENU = 'E-Shop User', NLD = 'E-Shop User';
    EntitySetCaptionML = ENU = 'E-Shop Users', NLD = 'E-Shop Users';
    EntityName = 'aviEShopUser';
    EntitySetName = 'aviEShopUsers';

    ODataKeyFields = SystemId;
    SourceTable = "AVI E-Shop User";

    Extensible = false;
    DelayedInsert = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater("List")
            {
                field(systemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                }
                field(userName; Rec."User Name")
                {
                    ApplicationArea = All;
                }
                field(fullName; Rec."Full Name")
                {
                    ApplicationArea = All;
                }
                field(password; password)
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        IsolatedStorage.Set(passwordPrefix + Rec."User Name", password, DataScope::Company);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if password <> '' then
            IsolatedStorage.Set(passwordPrefix + Rec."User Name", password, DataScope::Company);
    end;

    var
        password: Text;
        passwordPrefix: Label 'AVIEShopUser_';
}
