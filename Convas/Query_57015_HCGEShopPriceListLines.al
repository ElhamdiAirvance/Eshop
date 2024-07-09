query 57015 "AVI E-Shop Price List Lines"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Price List Lines', NLD = 'E-Shop Prijslijst Regels';
    EntityName = 'aviEShopPriceListLineQuery';
    EntitySetName = 'aviEShopPriceListLinesQuery';

    elements
    {
        dataitem(Price_List_Line; "Price List Line")
        {
            column(priceListCode; "Price List Code") { }
            column(sourceType; "Source Type") { ColumnFilter = sourceType = const("All Customers"); }
            column(assetType; "Asset Type") { ColumnFilter = assetType = const(Item); }
            column(amountType; "Amount Type") { ColumnFilter = amountType = const(Price); }
            column(priceType; "Price Type") { ColumnFilter = priceType = const(Sale); }
            column(status; Status) { ColumnFilter = status = const(Active); }
            column(articleNumber; "Asset No.") { }
            column(minimumQuantity; "Minimum Quantity") { ColumnFilter = minimumQuantity = filter(<= 1); }
            column(buyUnit; "Unit of Measure Code") { }
            column(grossPrice; "Unit Price") { ColumnFilter = grossPrice = filter(> 0); }
            column(startingDate; "Starting Date") { }
            column(endingDate; "Ending Date") { }
        }
    }
}