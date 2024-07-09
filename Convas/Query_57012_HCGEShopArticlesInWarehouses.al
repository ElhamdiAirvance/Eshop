query 57012 "AVI E-Shop Art. In W.houses"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Articles In Warehouses', NLD = 'E-Shop Artikelen in Magazijnen';
    EntityName = 'aviEShopArticleInWarehousesQuery';
    EntitySetName = 'aviEShopArticlesInWarehousesQuery';

    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            DataItemTableFilter = "Location Code" = filter('MAIN_WH'), Quantity = filter('<> 0');
            column(articleNumber; "Item No.") { }
            column(quantity; Quantity) { Method = sum; }
        }
    }
}
