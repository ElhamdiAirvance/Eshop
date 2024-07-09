query 57006 "AVI E-Shop Invoices"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Invoices', NLD = 'E-Shop Facturen';
    EntityName = 'aviEShopInvoiceQuery';
    EntitySetName = 'aviEShopInvoicesQuery';

    elements
    {
        dataitem(Sales_Invoice_Header; "Sales Invoice Header")
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
                DataItemLink = "Customer No." = Sales_Invoice_Header."Bill-to Customer No.", "Document No." = Sales_Invoice_Header."No.";
                DataItemTableFilter = "Document Type" = const(Invoice);
                column(isOpen; Open) { }
            }
        }
    }
}