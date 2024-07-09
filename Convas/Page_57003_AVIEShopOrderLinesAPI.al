page 57003 "AVI E-Shop Order Lines API"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'AVI';
    APIGroup = 'EShop';

    EntityCaptionML = ENU = 'E-Shop Order Line', NLD = 'E-Shop Order Regel';
    EntitySetCaptionML = ENU = 'E-Shop Order Lines', NLD = 'E-Shop Order Regels';
    EntityName = 'aviEShopOrderLine';
    EntitySetName = 'aviEShopOrderLines';

    ODataKeyFields = "Order Line Id";
    SourceTable = "AVI E-Shop Order Line";

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
                field(lineNo; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(itemNo; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(quantity; Rec."Quantity")
                {
                    ApplicationArea = All;
                }
                field(grossPrice; Rec."Gross Price")
                {
                    ApplicationArea = All;
                }
                field(netPrice; Rec."Net Price")
                {
                    ApplicationArea = All;
                }
                field(netTotal; Rec."Net Total")
                {
                    ApplicationArea = All;
                }
                field(orderId; Rec."Order Id")
                {
                    ApplicationArea = All;
                }
                field(orderLineId; Rec."Order Line Id")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
