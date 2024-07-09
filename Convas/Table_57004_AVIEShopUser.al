table 57004 "AVI E-Shop User"
{
    DataClassification = CustomerContent;
    LookupPageId = "AVI E-Shop Users";

    fields
    {
        field(1; "User Name"; Text[40])
        {
            CaptionML = ENU = 'User Name', NLD = 'Gebruikersnaam';
            DataClassification = CustomerContent;
        }
        field(2; "Full Name"; Text[100])
        {
            CaptionML = ENU = 'Full Name', NLD = 'Volledige Naam';
            DataClassification = CustomerContent;
        }
        field(3; "E-Mail"; Text[80])
        {
            CaptionML = ENU = 'E-Mail', NLD = 'E-Mail';
            DataClassification = CustomerContent;
        }
        field(4; "User Type"; Code[40])
        {
            CaptionML = ENU = 'User Type', NLD = 'Gebruikerstype';
            DataClassification = CustomerContent;
            TableRelation = "AVI E-Shop User Type".Code;
            ValidateTableRelation = true;
        }
        field(5; "Administrator"; Boolean)
        {
            CaptionML = ENU = 'Administrator', NLD = 'Administrateur';
            DataClassification = CustomerContent;
            InitValue = false;
        }
        field(6; "Blocked"; Boolean)
        {
            CaptionML = ENU = 'Blocked', NLD = 'Geblokkeerd';
            DataClassification = CustomerContent;
            InitValue = false;
        }
        field(7; "Order Limit"; Decimal)
        {
            CaptionML = ENU = 'Order Limit', NLD = 'Orderlimiet';
            DataClassification = CustomerContent;
        }
        field(8; "Customer No."; Code[20])
        {
            CaptionML = ENU = 'Customer No.', NLD = 'Klantnr.';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
            ValidateTableRelation = true;
        }
    }

    keys
    {
        key(userName; "User Name")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        if IsolatedStorage.Contains(passwordPrefix + Rec."User Name", DataScope::Company) then
            IsolatedStorage.Delete(passwordPrefix + Rec."User Name", DataScope::Company);
    end;

    var
        passwordPrefix: Label 'AVIEShopUser_';
}
