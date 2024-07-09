page 57008 "AVI E-Shop User"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AVI E-Shop User";
    CaptionML = ENU = 'E-Shop User', NLD = 'E-Shop Gebruiker';

    layout
    {
        area(Content)
        {
            group("General")
            {
                CaptionML = ENU = 'General', NLD = 'Algemeen';
                field(userName; Rec."User Name")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        UpdatePassword();
                    end;
                }
                field(fullName; Rec."Full Name")
                {
                    ApplicationArea = All;
                }
                field(password; password)
                {
                    CaptionML = ENU = 'Password', NLD = 'Wachtwoord';
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;

                    trigger OnValidate()
                    begin
                        UpdatePassword();
                    end;
                }
                field(eMail; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field(customerNo; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
            }
            group("Permissions")
            {
                CaptionML = ENU = 'Permissions', NLD = 'Rechten';
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

    trigger OnAfterGetRecord()
    begin
        // if IsolatedStorage.Contains(passwordPrefix + Rec."User Name", DataScope::Company) then
        // IsolatedStorage.Get(passwordPrefix + Rec."User Name", DataScope::Company, password)
        // else
        password := '';
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Customer No." := Rec.GetFilter("Customer No.");
    end;

    local procedure UpdatePassword()
    var
        cryptographyManagement: Codeunit "Cryptography Management";
        hashAlgorithmType: Option MD5,SHA1,SHA256,SHA384,SHA512;
    begin
        if password <> '' then begin
            if xRec."User Name" <> Rec."User Name" then
                if IsolatedStorage.Contains(passwordPrefix + xRec."User Name", DataScope::Company) then
                    IsolatedStorage.Delete(passwordPrefix + xRec."User Name", DataScope::Company);

            IsolatedStorage.Set(
                passwordPrefix + Rec."User Name",
                cryptographyManagement.GenerateHash(Rec."User Name" + '|' + password, hashAlgorithmType::SHA256),
                DataScope::Company
            );
        end;
    end;

    var
        password: Text;
        passwordPrefix: Label 'AVIEShopUser_';
}
