query 57007 "AVI E-Shop Cr.Memos"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Credit Memos', NLD = 'E-Shop Credit Nota''s';
    EntityName = 'aviEShopCrMemoQuery';
    EntitySetName = 'aviEShopCrMemosQuery';

    elements
    {
        dataitem(Sales_Cr_Memo_Header; "Sales Cr.Memo Header")
        {
            column(invoiceNumber; "No.") { }
            column(accountNumber; "Bill-to Customer No.") { }
            column(invName; "Bill-to Name") { }
            column(invAddress1; "Bill-to Address") { }
            column(invTown; "Bill-to City") { }
            column(expireDate; "Due Date") { }
            column(invoiceDate; "Posting Date") { }
            column(invZipCode; "Bill-to Post Code") { }
            column(invCountryCode; "Bill-to Country/Region Code") { }
            column(externalDocumentNo; "External Document No.") { }
            column(yourReference; "Your Reference") { }
            dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Sales_Cr_Memo_Header."Bill-to Customer No.", "Document No." = Sales_Cr_Memo_Header."No.";
                DataItemTableFilter = "Document Type" = const("Credit Memo");
                column(isOpen; Open) { }
            }
        }
    }
}