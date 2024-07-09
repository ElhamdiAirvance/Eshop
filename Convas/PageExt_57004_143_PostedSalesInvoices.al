pageextension 57004 AVIEShopPostedSalesInvoices extends "Posted Sales Invoices"
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
