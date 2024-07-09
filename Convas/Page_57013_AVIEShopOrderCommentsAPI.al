page 57013 "AVI E-Shop Order Comments API"
{
    PageType = API;

    APIVersion = 'v1.0';
    APIPublisher = 'AVI';
    APIGroup = 'EShop';

    EntityCaptionML = ENU = 'E-Shop Order Comment', NLD = 'E-Shop Order Opmerking';
    EntitySetCaptionML = ENU = 'E-Shop Order Comments', NLD = 'E-Shop Order Opmerkingen';
    EntityName = 'aviEShopOrderComment';
    EntitySetName = 'aviEShopOrderComments';

    ODataKeyFields = "Order Id";
    SourceTable = "AVI E-Shop Order Comment";

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
                field(orderId; Rec."Order Id")
                {
                    ApplicationArea = All;
                }
                field(orderLineNo; Rec."Order Line No.")
                {
                    ApplicationArea = All;
                }
                field(commentLineNo; Rec."Comment Line No.")
                {
                    ApplicationArea = All;
                }
                field(commentLine; Rec."Comment Line")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
