page 57011 "AVI E-Shop Password API"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'AVI';
    APIGroup = 'EShop';

    EntityCaptionML = ENU = 'E-Shop Password', NLD = 'E-Shop Password';
    EntitySetCaptionML = ENU = 'E-Shop Passwords', NLD = 'E-Shop Passwords';
    EntityName = 'aviEShopPassword';
    EntitySetName = 'aviEShopPasswords';

    ODataKeyFields = SystemId;
    SourceTable = "AVI E-Shop User";

    Extensible = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(systemId; Rec.SystemId)
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
                field(sessionId; sessionId)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    var
        eShopSession: Record "AVI E-Shop Session";
    begin
        if eShopSession.get(sessionId) then begin
            if eShopSession."User Name" = Rec."User Name" then
                IsolatedStorage.Set(passwordPrefix + Rec."User Name", password, DataScope::Company)
            else
                error('Invalid User Name');
        end
        else
            error('Unknown session');

        exit(false);
    end;

    var
        password: Text;
        sessionId: Text;
        passwordPrefix: Label 'AVIEShopUser_';
}
