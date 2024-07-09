query 57000 "AVI E-Shop Login Info"
{
    QueryType = API;
    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';
    CaptionML = ENU = 'E-Shop Login Info', NLD = 'E-Shop Login Info';
    EntityName = 'aviEShopLoginInfoQuery';
    EntitySetName = 'aviEShopLoginInfoQuery';

    elements
    {
        dataitem(aviEShopUser; "AVI E-Shop User")
        {
            column(systemId; SystemId) { }
            column(userName; "User Name") { }
            column(fullName; "Full name") { }
            column(eMail; "E-Mail") { }
            column(administrator; Administrator) { }
            column(orderLimit; "Order Limit") { }
            column(customerNo; "Customer No.") { }

            dataitem(aviEShopUserType; "AVI E-Shop User Type")
            {
                DataItemLink = Code = aviEShopUser."User Type";
                SqlJoinType = LeftOuterJoin;

                column(showLiveStock; "Show Live Stock") { }
                column(showGrossPrices; "Show Gross Prices") { }
                column(showNetPrices; "Show Net Prices") { }
                column(showInvoices; "Show Invoices") { }
                column(showOrderHistory; "Show Order History") { }
                column(showAccountInfo; "Show Account Info") { }
                column(showVAT; "Show VAT") { }
                column(mayPlaceOrders; "May Place Orders") { }
                column(sendOrderEMail; "Send Order E-Mail") { }

                dataitem(customer; Customer)
                {
                    DataItemLink = "No." = aviEShopUser."Customer No.";
                    SqlJoinType = LeftOuterJoin;

                    column(customerName; Name) { }
                    column(customerAddress; Address) { }
                    column(customerPostCode; "Post Code") { }
                    column(customerCity; City) { }
                    column(customerCountryCode; "Country/Region Code") { }
                    column(customerVAT; "VAT Registration No.") { }
                    column(customerPhone; "Phone No.") { }
                    column(customerContact; Contact) { }
                    column(customerEMail; "E-Mail") { }
                }
            }
        }
    }
}