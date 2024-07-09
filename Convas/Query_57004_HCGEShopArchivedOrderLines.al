query 57004 "AVI E-Shop Arch. Order Lines"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Order Archived Lines', NLD = 'E-Shop Order Regels Archief';
    EntityName = 'aviEShopArchivedOrderLineQuery';
    EntitySetName = 'aviEShopArchivedOrderLinesQuery';

    elements
    {
        dataitem(Sales_Line_Archive; "Sales Line Archive")
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
            column(versionNo; "Version No.") { }
        }
    }
}
