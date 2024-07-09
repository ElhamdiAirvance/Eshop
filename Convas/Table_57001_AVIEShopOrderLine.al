table 57001 "AVI E-Shop Order Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(4; "Line No."; Integer)
        {
            CaptionML = ENU = 'Line No.', NLD = 'Regelnr.';
            DataClassification = CustomerContent;
        }
        field(6; "Item No."; Code[20])
        {
            CaptionML = ENU = 'Item No.', NLD = 'Artikelnr.';
            DataClassification = CustomerContent;
            TableRelation = "Item"."No.";
            ValidateTableRelation = false;
        }
        field(15; "Quantity"; Decimal)
        {
            CaptionML = ENU = 'Quantity', NLD = 'Aantal';
            DataClassification = CustomerContent;
        }
        field(55001; "Order Id"; text[40])
        {
            CaptionML = ENU = 'Order Id', NLD = 'Order Id';
            DataClassification = CustomerContent;
            TableRelation = "AVI E-Shop Order Header"."Order Id";
            ValidateTableRelation = true;
        }
        field(55002; "Order Line Id"; text[40])
        {
            CaptionML = ENU = 'Order Line Id', NLD = 'Order Regel Id';
            DataClassification = CustomerContent;
        }
        field(55003; "Gross Price"; Decimal)
        {
            CaptionML = ENU = 'Gross Price', NLD = 'Bruto Prijs';
            DataClassification = CustomerContent;
        }
        field(55004; "Net Price"; Decimal)
        {
            CaptionML = ENU = 'Net Price', NLD = 'Netto Prijs';
            DataClassification = CustomerContent;
        }
        field(55005; "Net Total"; Decimal)
        {
            CaptionML = ENU = 'Net Total', NLD = 'Netto Totaal';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(orderId_LineNo; "Order Id", "Line No.")
        {
            Clustered = true;
        }
    }
}
