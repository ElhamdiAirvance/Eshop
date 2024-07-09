query 57003 "AVI E-Shop Order Lines"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Order Lines', NLD = 'E-Shop Order Regels';
    EntityName = 'aviEShopOrderLineQuery';
    EntitySetName = 'aviEShopOrderLinesQuery';

    elements
    {
        dataitem(Sales_Line; "Sales Line")
        {
            DataItemTableFilter = "Document Type" = const(Order);
            column(orderId; "Document No.") { }
            column(sequenceNr; "Line No.") { }
            column(articleNumber; "No.") { }
            column(quantity; Quantity) { ColumnFilter = quantity = filter(> 0); }
            column(description; Description) { }
            column(buyUnits; "Unit of Measure") { }
            column(grossPrice; "Unit Price") { }
            column(nettTotal; Amount) { }
            column(nettTotalInclVAT; "Amount Including VAT") { }
            column(lineType; Type) { }
        }
    }
}
