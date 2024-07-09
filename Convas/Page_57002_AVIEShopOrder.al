page 57002 "AVI E-Shop Order"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AVI E-Shop Order Header";
    CaptionML = ENU = 'E-Shop Order', NLD = 'E-Shop Order';
    InsertAllowed = false;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            group("General")
            {
                CaptionML = ENU = 'General', NLD = 'Algemeen';

                field(orderNo; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    LookupPageId = "Sales Order";
                }
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
                field(orderDate; Rec."Order Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(isTest; Rec."IsTest")
                {
                    ApplicationArea = All;
                }
                field(orderId; Rec."Order Id")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(sessionId; Rec."Session Id")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Has Error"; Rec."Has Error")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Error Message"; Rec."Error Message")
                {
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
                }
                field("On Hold"; Rec."On Hold")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field("Hold Reason"; Rec."Hold Reason")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Shipment")
            {
                CaptionML = ENU = 'Shipment', NLD = 'Levering';

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
            }

            part(orderLines; "AVI E-Shop Order Lines")
            {
                CaptionML = ENU = 'Lines', NLD = 'Regels';
                EntityName = 'eShopOrderLine';
                EntitySetName = 'eShopOrderLines';
                SubPageLink = "Order Id" = Field("Order Id");
            }

            part(orderComments; "AVI E-Shop Order Comments")
            {
                CaptionML = ENU = 'Comments', NLD = 'Opmerkingen';
                EntityName = 'eShopOrderCommentPart';
                EntitySetName = 'eShopOrderCommentsPart';
                SubPageLink = "Order Id" = field("Order Id"), "Order Line No." = filter(0);
            }
        }
    }

    actions
    {
        area(Promoted)
        {
            // actionref(processRef; "Process")
            // {
            // }
        }
        area(Processing)
        {
            // action("Process")
            // {
            //     CaptionML = ENU = 'Process', NLD = 'Verwerken';
            //     ApplicationArea = All;
            //     Image = "Action";
            //     Visible = false;

            //     trigger OnAction()
            //     var
            //         txtAlreadyProcessed: TextConst ENU = 'This order has already been processed', NLD = 'Deze order is al verwerkt';
            //         eShopOrders: Codeunit "AVI E-Shop Orders";
            //         erpOrderNo: Text;
            //     begin
            //         if Rec."No." = 'PENDING' then begin
            //             if eShopOrders.pushOrder(Rec, erpOrderNo) then begin
            //                 Rec."No." := erpOrderNo;
            //                 Rec."Has Error" := false;
            //                 Rec."Error Message" := '';
            //                 Rec.Modify();
            //             end
            //             else begin
            //                 Rec."Has Error" := true;
            //                 Rec."Error Message" := GetLastErrorText();
            //                 Rec.Modify();
            //             end;
            //         end
            //         else
            //             Message(txtAlreadyProcessed);
            //     end;
            // }
        }
    }
}
