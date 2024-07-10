codeunit 57001 "AVI E-Shop Orders"
{
    procedure getDeliveryCosts(session: record "AVI E-Shop Session"; netTotal: Decimal; orderType: text; var deliveryCosts: Decimal; var freeDeliveryThreshold: Decimal)
    var
        //todo orderSurcharge: record "GAC Order Surcharge";
        customer: record Customer;
        user: record "AVI E-Shop User";
        shipmentMethod: Record "Shipment Method";
    begin
        deliveryCosts := 0.0;
        freeDeliveryThreshold := 0.0;

        if not user.get(session."User Name") then exit;
        if not customer.get(user."Customer No.") then exit;
        //todo if not customer."GAC Order Surcharge" then exit;
        if not shipmentMethod.get(orderType) then exit;
        //todo if not shipmentMethod."GAC Order Surcharge" then exit;
        //todo if not orderSurcharge.get('SMALL ORDER') then exit;

        //todo  if netTotal < orderSurcharge."Threshold Amount" then begin
        //todo   deliveryCosts := orderSurcharge."Surcharge Amount";
        //todo  freeDeliveryThreshold := orderSurcharge."Threshold Amount";
        //todo  end;
    end;

    [TryFunction]
    procedure pushOrder(eShopOrderHeader: record "AVI E-Shop Order Header"; var erpOrderNo: Text)
    var
        salesHeader: record "Sales Header";
        salesLine: record "Sales Line";
        salesCommentLine: record "Sales Comment Line";
        eShopOrderLine: record "AVI E-Shop Order Line";
        eShopOrderComment: record "AVI E-Shop Order Comment";
        tmpSalesHeader: record "Sales Header" temporary;
        tmpSalesLine: record "Sales Line" temporary;
        tmpSalesCommentLine: record "Sales Comment Line" temporary;
        NoSeriesMgt: Codeunit NoSeriesMgt;
    begin
        // do a dry run on temporary tables

        tmpSalesHeader.Init();
        tmpSalesHeader."Document Type" := tmpSalesHeader."Document Type"::Order;
        tmpSalesHeader."No." := 'AVI-TEMP';//todo

        tmpSalesHeader.SuspendStatusCheck(true);
        tmpSalesHeader.SetHideValidationDialog(true);
        tmpSalesHeader.SetHideCreditCheckDialogue(true);
        tmpSalesHeader.validate("Sell-to Customer No.", eShopOrderHeader."Sell-to Customer No.");
        tmpSalesHeader.validate("Sell-to Contact", eShopOrderHeader."Sell-to Contact");
        tmpSalesHeader.validate("Sell-to Phone No.", eShopOrderHeader."Sell-to Phone No.");
        tmpSalesHeader.validate("Sell-to E-Mail", eShopOrderHeader."Sell-to E-Mail");
        tmpSalesHeader.validate("Ship-to Name", eShopOrderHeader."Ship-to Name");
        tmpSalesHeader.validate("Ship-to Address", eShopOrderHeader."Ship-to Address");
        tmpSalesHeader.validate("Ship-to City", eShopOrderHeader."Ship-to City");
        tmpSalesHeader.validate("Ship-to Post Code", eShopOrderHeader."Ship-to Post Code");
        tmpSalesHeader.validate("Ship-to Country/Region Code", eShopOrderHeader."Ship-to Country/Region Code");
        tmpSalesHeader.validate("Ship-to Contact", eShopOrderHeader."Ship-to Contact");
        tmpSalesHeader.validate("Your Reference", eShopOrderHeader."Your Reference");
        tmpSalesHeader.validate("External Document No.", eShopOrderHeader."Your Reference");
        tmpSalesHeader.validate("Order Date", eShopOrderHeader."Order Date");
        tmpSalesHeader.validate("Shipment Date", eShopOrderHeader."Shipment Date");
        tmpSalesHeader.validate("Shipment Method Code", eShopOrderHeader."Shipment Method Code");
        // tmpSalesHeader.Validate("IsTest", eShopOrderHeader."IsTest");
        tmpSalesHeader."AVI Is E-Shop Order" := true;
        tmpSalesHeader."AVI Order Id" := eShopOrderHeader."Order Id";

        eShopOrderLine.SetRange("Order Id", eShopOrderHeader."Order Id");

        if eShopOrderLine.FindSet() then begin
            repeat
                tmpSalesLine.Init();
                tmpSalesLine.SetSalesHeader(tmpSalesHeader);
                tmpSalesLine.SuspendStatusCheck(true);
                tmpSalesLine.SetHideValidationDialog(true);
                tmpSalesLine."Document Type" := tmpSalesHeader."Document Type"::Order;
                tmpSalesLine."Document No." := 'AVI-TEMP';
                tmpSalesLine.Type := salesLine.Type::Item;
                tmpSalesLine.validate("Line No.", eShopOrderLine."Line No.");
                tmpSalesLine.validate("No.", eShopOrderLine."Item No.");
                tmpSalesLine.Validate(Quantity, eShopOrderLine.Quantity);
                tmpSalesLine.Validate("Shipment Date", eShopOrderHeader."Shipment Date");
            until eShopOrderLine.Next(1) = 0;
        end;

        eShopOrderComment.SetRange("Order Id", eShopOrderHeader."Order Id");
        eShopOrderComment.SetRange("Order Line No.", 0);

        if eShopOrderComment.FindSet() then begin
            repeat
                tmpSalesCommentLine.Init();
                tmpSalesCommentLine."Document Type" := tmpSalesCommentLine."Document Type"::Order;
                tmpSalesCommentLine."No." := salesHeader."No.";
                tmpSalesCommentLine."Document Line No." := 0;
                tmpSalesCommentLine."Line No." := eShopOrderComment."Comment Line No.";
                tmpSalesCommentLine.Code := 'ESHOP';
                tmpSalesCommentLine.Comment := eShopOrderComment."Comment Line";
                tmpSalesCommentLine.Date := today;
                tmpSalesCommentLine.Insert(true);
            until eShopOrderComment.Next(1) = 0;
        end;

        // if no errors, then continue

        salesHeader."No." := '';
        salesHeader.Init();
        salesHeader."Document Type" := salesHeader."Document Type"::Order;
        //REH 10072024 start
        NoSeriesMgt.InitSeries('COMSHOP', '', 0D, salesHeader."No.", salesHeader."No. Series");
        //REH 10072024 start
        salesHeader.validate("Sell-to Customer No.", eShopOrderHeader."Sell-to Customer No.");
        salesHeader.validate("Sell-to Contact", eShopOrderHeader."Sell-to Contact");
        salesHeader.validate("Sell-to Phone No.", eShopOrderHeader."Sell-to Phone No.");
        salesHeader.validate("Sell-to E-Mail", eShopOrderHeader."Sell-to E-Mail");
        salesHeader.validate("Ship-to Name", eShopOrderHeader."Ship-to Name");
        salesHeader.validate("Ship-to Address", eShopOrderHeader."Ship-to Address");
        salesHeader.validate("Ship-to City", eShopOrderHeader."Ship-to City");
        salesHeader.validate("Ship-to Post Code", eShopOrderHeader."Ship-to Post Code");
        salesHeader.validate("Ship-to Country/Region Code", eShopOrderHeader."Ship-to Country/Region Code");
        salesHeader.validate("Ship-to Contact", eShopOrderHeader."Ship-to Contact");
        salesHeader.validate("Your Reference", eShopOrderHeader."Your Reference");
        salesHeader.validate("External Document No.", eShopOrderHeader."Your Reference");
        salesHeader.validate("Order Date", eShopOrderHeader."Order Date");
        salesHeader.validate("Shipment Date", eShopOrderHeader."Shipment Date");
        salesHeader.validate("Shipment Method Code", eShopOrderHeader."Shipment Method Code");
        salesHeader."AVI Is E-Shop Order" := true;
        salesHeader."AVI Order Id" := eShopOrderHeader."Order Id";
        salesHeader.Insert(true);

        eShopOrderLine.SetRange("Order Id", eShopOrderHeader."Order Id");

        if eShopOrderLine.FindSet() then begin
            repeat
                salesLine.Init();
                salesLine."Document Type" := salesHeader."Document Type"::Order;
                salesLine."Document No." := salesHeader."No.";
                salesLine.Type := salesLine.Type::Item;
                salesLine.Validate("Line No.", eShopOrderLine."Line No.");
                salesLine.Validate("No.", eShopOrderLine."Item No.");
                salesLine.Validate(Quantity, eShopOrderLine.Quantity);
                salesLine.Validate("Shipment Date", eShopOrderHeader."Shipment Date");
                salesLine.Insert(true);
            until eShopOrderLine.Next(1) = 0;
        end;

        eShopOrderComment.SetRange("Order Id", eShopOrderHeader."Order Id");
        eShopOrderComment.SetRange("Order Line No.", 0);

        if eShopOrderComment.FindSet() then begin
            repeat
                salesCommentLine.Init();
                salesCommentLine."Document Type" := salesCommentLine."Document Type"::Order;
                salesCommentLine."No." := salesHeader."No.";
                salesCommentLine."Document Line No." := 0;
                salesCommentLine."Line No." := eShopOrderComment."Comment Line No.";
                salesCommentLine.Code := 'ESHOP';
                salesCommentLine.Comment := eShopOrderComment."Comment Line";
                salesCommentLine.Date := today;
                salesCommentLine.Insert(true);
            until eShopOrderComment.Next(1) = 0;
        end;

        erpOrderNo := salesHeader."No.";
    end;
}
