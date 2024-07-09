table 57005 "AVI E-Shop Order Comment"
{
    DataClassification = CustomerContent;
    LookupPageId = "AVI E-Shop Order Comments";

    fields
    {
        field(1; "Order Id"; Text[40])
        {
            CaptionML = ENU = 'Order Id', NLD = 'Order Id';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(2; "Order Line No."; Integer)
        {
            CaptionML = ENU = 'Order Line No.', NLD = 'Order Regelnr.';
            DataClassification = CustomerContent;
        }
        field(3; "Comment Line No."; Integer)
        {
            CaptionML = ENU = 'Comment Line No.', NLD = 'Opmerking Regelnr.';
            DataClassification = CustomerContent;
        }
        field(4; "Comment Line"; Text[250])
        {
            CaptionML = ENU = 'Comment Line', NLD = 'Opmerkingsregel';
            DataClassification = CustomerContent;
            Editable = true;
        }
    }

    keys
    {
        key(orderId_lineNo; "Order Id", "Order Line No.", "Comment Line No.")
        {
            Clustered = true;
        }
    }
}
