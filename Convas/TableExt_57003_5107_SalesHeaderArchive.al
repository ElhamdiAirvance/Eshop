tableextension 57003 AVIEShopSalesHeaderArchive extends "Sales Header Archive"
{
    fields
    {
        field(57000; "AVI Is E-Shop Order"; Boolean)
        {
            DataClassification = CustomerContent;
            CaptionML = ENU = 'Is E-Shop Order', NLD = 'Is E-Shop Order';
            Editable = false;
        }
        field(57001; "AVI Order Id"; Text[40])
        {
            DataClassification = CustomerContent;
            CaptionML = ENU = 'E-Shop Order Id', NLD = 'E-Shop Order Id';
            Editable = false;
            TableRelation = "AVI E-Shop Order Header"."Order Id";
        }
    }
}
