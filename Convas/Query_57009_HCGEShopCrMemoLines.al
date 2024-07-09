query 57009 "AVI E-Shop Cr.Memo Lines"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Cr.Memo Lines', NLD = 'E-Shop Credit Nota regels';
    EntityName = 'aviEShopCrMemoLineQuery';
    EntitySetName = 'aviEShopCrMemoLinesQuery';

    elements
    {
        dataitem(Sales_Cr_Memo_Line; "Sales Cr.Memo Line")
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
