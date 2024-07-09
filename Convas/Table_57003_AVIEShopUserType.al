table 57003 "AVI E-Shop User Type"
{
    DataClassification = CustomerContent;
    LookupPageId = "AVI E-Shop User Types";

    fields
    {
        field(1; "Code"; Code[40])
        {
            CaptionML = ENU = 'Code', NLD = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; "Description"; Text[50])
        {
            CaptionML = ENU = 'Description', NLD = 'Omschrijving';
            DataClassification = CustomerContent;
        }
        field(3; "Show Live Stock"; Boolean)
        {
            CaptionML = ENU = 'Show Live Stock', NLD = 'Actuele Voorraad tonen';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(4; "Show Gross Prices"; Boolean)
        {
            CaptionML = ENU = 'Show Gross Prices', NLD = 'Bruto Prijzen Tonen';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(5; "Show Net Prices"; Boolean)
        {
            CaptionML = ENU = 'Show Net Prices', NLD = 'Netto Prijzen Tonen';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(6; "Show Invoices"; Boolean)
        {
            CaptionML = ENU = 'Show Invoices', NLD = 'Facturen Tonen';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(7; "Show Order History"; Boolean)
        {
            CaptionML = ENU = 'Show Order History', NLD = 'Order Historie Tonen';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(8; "Show Account Info"; Boolean)
        {
            CaptionML = ENU = 'Show Account Info', NLD = 'Account Info Tonen';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(9; "Show VAT"; Boolean)
        {
            CaptionML = ENU = 'Show VAT', NLD = 'BTW Tonen';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(10; "May Place Orders"; Boolean)
        {
            CaptionML = ENU = 'May Place Orders', NLD = 'Mag Orders Plaatsen';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        field(11; "Send Order E-Mail"; Boolean)
        {
            CaptionML = ENU = 'Send Order E-Mail', NLD = 'Order E-Mail Verzenden';
            DataClassification = CustomerContent;
            InitValue = true;
        }
    }

    keys
    {
        key(code; "Code")
        {
            Clustered = true;
        }
    }
}
