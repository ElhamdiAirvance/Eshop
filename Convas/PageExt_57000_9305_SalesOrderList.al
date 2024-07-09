pageextension 57000 AVIEShopSalesOrders extends "Sales Order List"
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

    views
    {
        addfirst
        {
            view(latestFirst)
            {
                CaptionML = ENU = 'Latest first', NLD = 'Laatste eerst';
                OrderBy = descending("No.");
            }
        }
    }
}
