query 57005 "AVI E-Shop Order Comments"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Order Comments', NLD = 'E-Shop Order Opmerkingen';
    EntityName = 'aviEShopOrderCommentQuery';
    EntitySetName = 'aviEShopOrderCommentsQuery';

    elements
    {
        dataitem(AVI_E_Shop_Order_Comment; "AVI E-Shop Order Comment")
        {
            DataItemTableFilter = "Order Line No." = filter(0);
            column(aviOrderId; "Order Id") { }
            column(line; "Comment Line") { }
            column(lineNo; "Comment Line No.") { }
        }
    }
}
