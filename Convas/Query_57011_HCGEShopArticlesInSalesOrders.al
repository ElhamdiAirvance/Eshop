query 57011 "AVI E-Shop Art. In S.Orders"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Articles In Sales Orders', NLD = 'E-Shop Artikelen in Verkooporders';
    EntityName = 'aviEShopArticleInSalesOrdersQuery';
    EntitySetName = 'aviEShopArticlesInSalesOrdersQuery';

    elements
    {
        dataitem(Sales_Line; "Sales Line")
        {
            DataItemTableFilter = "Document Type" = const(Order), Type = const(Item), "Location Code" = filter('MAIN_WH'), "Outstanding Qty. (Base)" = filter('> 0');
            column(articleNumber; "No.") { }
            column(quantity; "Outstanding Qty. (Base)") { Method = sum; }
        }
    }
}
