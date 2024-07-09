pageextension 57005 AVIEShopPostedSalesInvoice extends "Posted Sales Invoice"
{
    layout
    {
        addafter(Closed)
        {
            field(aviIsEShopOrder; Rec."AVI Is E-Shop Order")
            {
                ApplicationArea = All;
            }
        }
    }
}
