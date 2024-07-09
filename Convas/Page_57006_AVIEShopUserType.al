page 57006 "AVI E-Shop User Type"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AVI E-Shop User Type";
    CaptionML = ENU = 'E-Shop User Type', NLD = 'E-Shop Gebruikerstype';

    layout
    {
        area(Content)
        {
            group("General")
            {
                CaptionML = ENU = 'General', NLD = 'Algemeen';
                field(code; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field(description; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field(sendOrderEMail; Rec."Send Order E-Mail")
                {
                    ApplicationArea = All;
                }
            }
            group("Permissions")
            {
                CaptionML = ENU = 'Permissions', NLD = 'Rechten';
                field(showLiveStock; Rec."Show Live Stock")
                {
                    ApplicationArea = All;
                }
                field(showGrossPrices; Rec."Show Gross Prices")
                {
                    ApplicationArea = All;
                }
                field(showNetPrices; Rec."Show Net Prices")
                {
                    ApplicationArea = All;
                }
                field(showInvoices; Rec."Show Invoices")
                {
                    ApplicationArea = All;
                }
                field(showOrderHistory; Rec."Show Order History")
                {
                    ApplicationArea = All;
                }
                field(showAccountInfo; Rec."Show Account Info")
                {
                    ApplicationArea = All;
                }
                field(showVAT; Rec."Show VAT")
                {
                    ApplicationArea = All;
                }
                field(mayPlaceOrders; Rec."May Place Orders")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
