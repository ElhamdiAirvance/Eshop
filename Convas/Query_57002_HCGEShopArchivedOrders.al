query 57002 "AVI E-Shop Archived Orders"
{
    QueryType = API;
    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';
    CaptionML = ENU = 'E-Shop Orders', NLD = 'E-Shop Orders';
    EntityName = 'aviEShopArchivedOrderQuery';
    EntitySetName = 'aviEShopArchivedOrdersQuery';

    elements
    {
        dataitem(Sales_Header_Archive; "Sales Header Archive")
        {
            DataItemTableFilter = "Document Type" = const(Order);
            column(id; "No.") { }
            column(accountNumber; "Sell-to Customer No.") { }
            column(erpOrderNumber; "No.") { }
            column(yourReference; "Your Reference") { }
            column(externalDocumentNo; "External Document No.") { }
            column(dlvContactPerson; "Ship-to Contact") { }
            column(stamp; "Order Date") { }
            column(deliveryDate; "Shipment Date") { }
            //todo  column(processStatus; "GAC Status Code") { ColumnFilter = processStatus = filter('70 %'); }
            column(orderType; "Shipment Method Code") { }
            column(orderTypeDiscountPercentage; "Invoice Discount Value") { }
            column(dlvName; "Ship-to Name") { }
            column(dlvAddress1; "Ship-to Address") { }
            column(dlvTown; "Ship-to City") { }
            column(dlvCountry; "Ship-to Country/Region Code") { }
            column(dlvZipCode; "Ship-to Post Code") { }
            column(dlvPhone; "Sell-to Phone No.") { }
            column(dlvEMail; "Sell-to E-Mail") { }
            column(versionNo; "Version No.") { }
            column(aviOrderId; "AVI Order Id") { }
        }
    }
}