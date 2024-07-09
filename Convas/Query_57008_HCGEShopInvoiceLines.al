query 57008 "AVI E-Shop Invoice Lines"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Invoice Lines', NLD = 'E-Shop Factuurregels';
    EntityName = 'aviEShopInvoiceLineQuery';
    EntitySetName = 'aviEShopInvoiceLinesQuery';

    elements
    {
        dataitem(Sales_Invoice_Line; "Sales Invoice Line")
        {
            column(invoiceNumber; "Document No.") { }
            column(lineNo; "Line No.") { }
            column(articleNumber; "No.") { }
            column(quantity; Quantity) { ColumnFilter = quantity = filter(<> 0); }
            column(description; Description) { }
            column(buyUnits; "Unit of Measure") { }
            column(nettTotal; Amount) { }
            column(nettTotalInclVAT; "Amount Including VAT") { }
            column(vatPercentage; "VAT %") { }
            column(lineType; Type) { }
        }
    }
}
