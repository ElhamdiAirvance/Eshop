pageextension 57001 AVIEShopSalesOrder extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field(aviIsEShopOrder; Rec."AVI Is E-Shop Order")
            {
                ApplicationArea = All;
            }
        }
    }
}
