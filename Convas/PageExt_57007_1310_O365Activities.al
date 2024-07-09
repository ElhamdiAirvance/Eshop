pageextension 57007 AVIEShopO365Activities extends "O365 Activities"
{
    layout
    {
        addfirst(content)
        {
            cuegroup(eShopContainer)
            {
                CaptionML = ENU = 'E-Shop Orders', NLD = 'E-Shop Orders';

                field(pendingEShopOrders; Rec."AVI Pending E-Shop Orders")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Pending', NLD = 'Wachtend';
                    DrillDownPageId = "AVI E-Shop Orders";
                }
                field(eShopOrdersWithError; Rec."AVI E-Shop Orders With Error")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'With Error', NLD = 'Met Fout';
                    DrillDownPageId = "AVI E-Shop Orders";
                }
                field(eShopOrdersOnHold; Rec."AVI E-Shop Orders On Hold")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'On Hold', NLD = 'On Hold';
                    DrillDownPageId = "AVI E-Shop Orders";
                }
            }
        }
    }
}
