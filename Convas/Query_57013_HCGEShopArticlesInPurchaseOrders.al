query 57013 "AVI E-Shop Art. In P.Orders"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Articles In Purchase Orders', NLD = 'E-Shop Artikelen in Inkooporders';
    EntityName = 'aviEShopArticleInPurchaseOrdersQuery';
    EntitySetName = 'aviEShopArticlesInPurchaseOrdersQuery';

    elements
    {
        dataitem(Purchase_Header; "Purchase Header")
        {
            DataItemTableFilter = "Document Type" = const(Order);
            column(orderNo; "No.") { }
            //todo column(workflowStatusCode; "GAC Status Code") { ColumnFilter = workflowStatusCode = filter('30 CONFIRMED'); }
            dataitem(Purchase_Line; "Purchase Line")
            {
                DataItemLink = "Document Type" = Purchase_Header."Document Type", "Document No." = Purchase_Header."No.";
                DataItemTableFilter = Type = const(Item), "Sales Order No." = filter(''), Finished = const(false), "Location Code" = filter('MAIN_WH');
                column(lineNo; "Line No.") { }
                column(articleNumber; "No.") { }
                column(dlvDate; "Expected Receipt Date") { }
                column(outstandingQuantity; "Outstanding Quantity") { }
                column(reservedQuantity; "Reserved Quantity") { }
                column(quantity; Quantity) { }
                // column(cancelled; "GAC Cancel") { ColumnFilter = cancelled = const(false); }
            }
        }
    }
}
