pageextension 57003 AVIEShopSalesQuote extends "Sales Quote"
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
