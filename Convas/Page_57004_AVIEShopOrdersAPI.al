page 57004 "AVI E-Shop Orders API"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'AVI';
    APIGroup = 'EShop';

    EntityCaptionML = ENU = 'E-Shop Order', NLD = 'E-Shop Order';
    EntitySetCaptionML = ENU = 'E-Shop Orders', NLD = 'E-Shop Orders';
    EntityName = 'aviEShopOrder';
    EntitySetName = 'aviEShopOrders';

    ODataKeyFields = "Order Id";
    SourceTable = "AVI E-Shop Order Header";

    Extensible = false;
    DelayedInsert = true;
    InsertAllowed = true;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field(sellToContact; Rec."Sell-to Contact")
                {
                    ApplicationArea = All;
                }
                field(sellToPhoneNo; Rec."Sell-to Phone No.")
                {
                    ApplicationArea = All;
                }
                field(sellToEMail; Rec."Sell-to E-Mail")
                {
                    ApplicationArea = All;
                }
                field(yourReference; Rec."Your Reference")
                {
                    ApplicationArea = All;
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    ApplicationArea = All;
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    ApplicationArea = All;
                }
                field(shipToAddress; Rec."Ship-to Address")
                {
                    ApplicationArea = All;
                }
                field(shipToCity; Rec."Ship-to City")
                {
                    ApplicationArea = All;
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                {
                    ApplicationArea = All;
                }
                field(shipToCountryCode; Rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field(shipToContact; Rec."Ship-to Contact")
                {
                    ApplicationArea = All;
                }
                field(shipmentDate; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                }
                field(isTest; Rec."IsTest")
                {
                    ApplicationArea = All;
                }
                field(sessionId; Rec."Session Id")
                {
                    ApplicationArea = All;
                }
                field(orderId; Rec."Order Id")
                {
                    ApplicationArea = All;
                }
                field(onHold; Rec."On Hold")
                {
                    ApplicationArea = All;
                }
                field(holdReason; Rec."Hold Reason")
                {
                    ApplicationArea = All;
                }
            }

            part(eShopOrderComments; "AVI E-Shop Order Comments API")
            {
                ApplicationArea = All;
                EntityName = 'aviEShopOrderComment';
                EntitySetName = 'aviEShopOrderComments';
                SubPageLink = "Order Id" = field("Order Id"), "Order Line No." = filter(0);
            }
            part(eShopOrderLines; "AVI E-Shop Order Lines API")
            {
                ApplicationArea = All;
                EntityName = 'aviEShopOrderLine';
                EntitySetName = 'aviEShopOrderLines';
                SubPageLink = "Order Id" = field("Order Id");
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Created At" := CurrentDateTime;
        Rec."Order Date" := Today;
        Rec."No." := 'PENDING';
    end;
}
