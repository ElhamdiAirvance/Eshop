page 57001 "AVI E-Shop Orders"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "AVI E-Shop Order Header";
    SourceTableView = sorting("Order Date") order(descending);
    CardPageId = "AVI E-Shop Order";
    CaptionML = ENU = 'E-Shop Orders', NLD = 'E-Shop Orders';
    InsertAllowed = false;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater("List")
            {
                field(orderId; Rec."Order Id")
                {
                    ApplicationArea = All;
                }
                field(orderNo; Rec."No.")
                {
                    ApplicationArea = All;
                    LookupPageId = "Sales Order";
                }
                field(sellToCustomerNo; Rec."Sell-to Customer No.")
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
                field(hasError; Rec."Has Error")
                {
                    ApplicationArea = All;
                }
                field(errorMessage; Rec."Error Message")
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
            //     ApplicationArea = All;
            //     CaptionML = ENU = 'Process', NLD = 'Verwerken';
            //     Image = "Action";
            //     visible = false;

            //     trigger OnAction();
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
        area(Navigation)
        {
            action("User Types")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'User Types', NLD = 'Gebruikerstypes';
                RunObject = page "AVI E-Shop User Types";
                Image = "UserSetup";
            }
            action("Users")
            {
                ApplicationArea = All;
                CaptionML = ENU = 'Users', NLD = 'Gebruikers';
                RunObject = page "AVI E-Shop Users";
                Image = "Users";
            }
        }
    }

    views
    {
        view(pending)
        {
            CaptionML = ENU = 'Pending', NLD = 'Wachtend';
            Filters = where("No." = filter('PENDING'));
            OrderBy = descending("Order Date");
        }
        view(processed)
        {
            CaptionML = ENU = 'Processed', NLD = 'Verwerkt';
            Filters = where("No." = filter('<>PENDING'));
            OrderBy = descending("Order Date");
        }
    }
}
