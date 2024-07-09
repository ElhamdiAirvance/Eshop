pageextension 57002 AVIEShopSalesQuoteList extends "Sales Quotes"
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
