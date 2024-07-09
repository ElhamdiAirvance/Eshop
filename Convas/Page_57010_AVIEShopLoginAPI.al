page 57010 "AVI E-Shop Login API"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'AVI';
    APIGroup = 'EShop';

    EntityCaptionML = ENU = 'E-Shop Session', NLD = 'E-Shop Session';
    EntitySetCaptionML = ENU = 'E-Shop Sessions', NLD = 'E-Shop Sessions';
    EntityName = 'aviEShopSession';
    EntitySetName = 'aviEShopSessions';

    ODataKeyFields = "Session Id";
    SourceTable = "AVI E-Shop Session";

    Extensible = false;
    DelayedInsert = true;
    InsertAllowed = true;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(sessionId; Rec."Session Id")
                {
                    ApplicationArea = All;
                }
                field(userName; Rec."User Name")
                {
                    ApplicationArea = All;
                }
                field(password; password)
                {
                    ApplicationArea = All;
                }
                field(languageCode; Rec."Language Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        tryPassword: Text;
        eShopUser: Record "AVI E-Shop User";
        customer: Record Customer;
    begin
        if not eShopUser.Get(Rec."User Name") then begin
            error('User not found');
            exit(false);
        end;

        if eShopUser.Blocked then begin
            error('User is blocked');
            exit(false);
        end;

        if customer.Get(eShopUser."Customer No.") then begin
            if customer.IsBlocked() then begin
                error('User is blocked');
                exit(false);
            end;
        end
        else begin
            error('User is blocked');
            exit(false);
        end;

        if IsolatedStorage.Contains(passwordPrefix + Rec."User Name", DataScope::Company) then begin
            IsolatedStorage.Get(passwordPrefix + Rec."User Name", DataScope::Company, tryPassword);

            if tryPassword = password then begin
                Rec."Created At" := CurrentDateTime;
                exit(true);
            end;
        end;

        error('Invalid credentials');
        exit(false);
    end;

    var
        password: Text;
        passwordPrefix: Label 'AVIEShopUser_';
}
