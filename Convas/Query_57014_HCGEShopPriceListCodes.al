query 57014 "AVI E-Shop Price List Codes"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Price List Codes', NLD = 'E-Shop Prijslijst Codes';
    EntityName = 'aviEShopPriceListCodeQuery';
    EntitySetName = 'aviEShopPriceListCodesQuery';

    elements
    {
        dataitem(Price_List_Header; "Price List Header")
        {
            column(amountType; "Amount Type") { ColumnFilter = amountType = filter('Any|Price'); }
            column(sourceGroup; "Source Group") { ColumnFilter = sourceGroup = const(Customer); }
            column(sourceType; "Source Type") { ColumnFilter = sourceType = const("All Customers"); }
            column(priceType; "Price Type") { ColumnFilter = priceType = const(Sale); }
            column(status; Status) { ColumnFilter = status = const(Active); }
            column(startingDate; "Starting Date") { }
            column(endingDate; "Ending Date") { }

            column(code; Code) { }
        }
    }

    trigger OnBeforeOpen()
    begin
        currQuery.SETFILTER(startingDate, '<=%1', Today);
        currQuery.SETFILTER(endingDate, '>=%1|%2', Today, 0D);
    end;
}
