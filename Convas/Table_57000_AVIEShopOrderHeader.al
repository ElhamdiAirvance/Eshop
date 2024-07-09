table 57000 "AVI E-Shop Order Header"
{
    DataClassification = CustomerContent;
    LookupPageId = "AVI E-Shop Orders";

    fields
    {
        field(2; "Sell-to Customer No."; Code[20])
        {
            CaptionML = ENU = 'Sell-to Customer No.', NLD = 'Verkoopklantnr.';
            DataClassification = CustomerContent;
            TableRelation = "Customer"."No.";
            ValidateTableRelation = false;
        }
        field(3; "No."; Code[20])
        {
            CaptionML = ENU = 'No.', NLD = 'Nr.';
            DataClassification = CustomerContent;
            TableRelation = "Sales Header"."No." where("Document Type" = const(Order));
            ValidateTableRelation = false;
        }
        field(84; "Sell-to Contact"; Text[100])
        {
            CaptionML = ENU = 'Contact', NLD = 'Contactpersoon';
            DataClassification = CustomerContent;
        }
        field(171; "Sell-to Phone No."; Text[30])
        {
            CaptionML = ENU = 'Phone No.', NLD = 'Telefoon';
            DataClassification = CustomerContent;
        }
        field(172; "Sell-to E-Mail"; Text[80])
        {
            CaptionML = ENU = 'E-Mail', NLD = 'E-Mail';
            DataClassification = CustomerContent;
        }
        field(13; "Ship-to Name"; Text[100])
        {
            CaptionML = ENU = 'Name', NLD = 'Naam';
            DataClassification = CustomerContent;
        }
        field(15; "Ship-to Address"; Text[100])
        {
            CaptionML = ENU = 'Address', NLD = 'Adres';
            DataClassification = CustomerContent;
        }
        field(17; "Ship-to City"; Text[30])
        {
            CaptionML = ENU = 'City', NLD = 'Plaats';
            DataClassification = CustomerContent;
        }
        field(91; "Ship-to Post Code"; Code[20])
        {
            CaptionML = ENU = 'Post Code', NLD = 'Postcode';
            DataClassification = CustomerContent;
        }
        field(93; "Ship-to Country/Region Code"; Code[10])
        {
            CaptionML = ENU = 'Country Code', NLD = 'Landcode';
            DataClassification = CustomerContent;
            TableRelation = "Country/Region".Code;
            ValidateTableRelation = false;
        }
        field(18; "Ship-to Contact"; Text[100])
        {
            CaptionML = ENU = 'Contact', NLD = 'Contactpersoon';
            DataClassification = CustomerContent;
        }
        field(11; "Your Reference"; Text[35])
        {
            CaptionML = ENU = 'Your Reference', NLD = 'Uw Referentie';
            DataClassification = CustomerContent;
        }
        field(19; "Order Date"; Date)
        {
            CaptionML = ENU = 'Order Date', NLD = 'Orderdatum';
            DataClassification = CustomerContent;
        }
        field(21; "Shipment Date"; Date)
        {
            CaptionML = ENU = 'Shipment Date', NLD = 'Verzenddatum';
            DataClassification = CustomerContent;
        }
        field(27; "Shipment Method Code"; Text[10])
        {
            CaptionML = ENU = 'Shipment Method Code', NLD = 'Verzendcode';
            DataClassification = CustomerContent;
            TableRelation = "Shipment Method".Code;
            ValidateTableRelation = false;
        }
        field(170; "IsTest"; Boolean)
        {
            CaptionML = ENU = 'Is Test', NLD = 'Is Test';
            DataClassification = CustomerContent;
        }
        field(55000; "Session Id"; Guid)
        {
            CaptionML = ENU = 'Session Id', NLD = 'Sessie Id';
            DataClassification = CustomerContent;
            TableRelation = "AVI E-Shop Session"."Session Id";
            ValidateTableRelation = true;
        }
        field(55001; "Order Id"; Text[40])
        {
            CaptionML = ENU = 'Order Id', NLD = 'Order Id';
            DataClassification = CustomerContent;
        }
        field(55002; "Created At"; DateTime)
        {
            CaptionML = ENU = 'Created At', NLD = 'Aangemaakt Op';
            DataClassification = CustomerContent;
        }
        field(55003; "Error Message"; Text[250])
        {
            CaptionML = ENU = 'Error Message', NLD = 'Foutmelding';
            DataClassification = CustomerContent;
        }
        field(55004; "Has Error"; Boolean)
        {
            CaptionML = ENU = 'Has Error', NLD = 'Heeft Fout';
            DataClassification = CustomerContent;
        }
        field(55005; "On Hold"; Boolean)
        {
            CaptionML = ENU = 'On Hold', NLD = 'On Hold';
            DataClassification = CustomerContent;
        }
        field(55006; "Hold Reason"; Text[250])
        {
            CaptionML = ENU = 'Hold Reason', NLD = 'Hold Reden';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(orderId; "Order Id")
        {
            Clustered = true;
        }
        key(orderDate; "Order Date")
        {
        }
    }
}
