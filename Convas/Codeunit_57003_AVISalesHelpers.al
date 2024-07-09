codeunit 57003 "AVI Sales Helpers"
{
    procedure getListPrice(item: record Item) listPrice: Decimal
    var
        priceListLine: record "Price List Line";
    begin
        priceListLine.SetFilter("Source Type", '%1', priceListLine."Source Type"::"All Customers");
        priceListLine.SetFilter("Asset Type", '%1', priceListLine."Asset Type"::Item);
        priceListLine.SetFilter("Amount Type", '%1', priceListLine."Amount Type"::Price);
        priceListLine.SetFilter("Price Type", '%1', priceListLine."Price Type"::Sale);
        priceListLine.SetFilter(Status, '%1', priceListLine.Status::Active);
        priceListLine.SetFilter("Asset No.", '%1', item."No.");
        priceListLine.SetFilter("Minimum Quantity", '<=1');
        priceListLine.SetFilter("Unit of Measure Code", '%1|%2', item."Sales Unit of Measure", '');
        priceListLine.SetFilter("Starting Date", '<=%1', Today);
        priceListLine.SetFilter("Ending Date", '>=%1|%2', Today, 0D);
        priceListLine.SetFilter("Unit Price", '>0');

        if priceListLine.FindFirst() then
            listPrice := priceListLine."Unit Price"
        else begin
            if item."Unit Price" <> 0 then
                listPrice := item."Unit Price"
            else
                listPrice := -1;
        end;
    end;

    procedure getVatRate(item: Record Item; customer: record Customer) vatRate: Decimal
    var
        vatPostingSetup: record "VAT Posting Setup";
    begin
        if vatPostingSetup.get(customer."VAT Bus. Posting Group", item."VAT Prod. Posting Group") then
            vatRate := vATPostingSetup."VAT %"
        else
            vatRate := -1;
    end;

    // procedure getNetPrice(article: JsonObject; item: record Item; customer: record Customer; listPrice: Decimal; quantity: Decimal)
    // var
    //     tmpSalesHeader: Record "Sales Header";
    //     tmpSalesLine: Record "Sales Line";
    //     orderNumber: Text;
    //     lineAmount: Decimal;
    //     lineDiscountPercent: Decimal;
    //     lineDiscountAmount: Decimal;
    //     priceTiers: JsonArray;
    //     priceTiersLine: JsonObject;
    //     priceListLine: record "Price List Line";
    //     quantities: List of [Decimal];
    //     listHelpers: Codeunit "AVI List Helpers";
    //     prevDiscountPercent: Decimal;
    // begin
    //     if listPrice <> -1 then begin
    //         orderNumber := 'AVI-TEMP';

    //         if not tmpSalesHeader.Get(tmpSalesHeader."Document Type"::Order, orderNumber) then begin
    //             tmpSalesHeader.Init();
    //             tmpSalesHeader.SuspendStatusCheck(true);
    //             tmpSalesHeader.SetHideValidationDialog(true);
    //             tmpSalesHeader.SetHideCreditCheckDialogue(true);
    //             tmpSalesHeader.Validate("Document Type", tmpSalesHeader."Document Type"::Order);
    //             tmpSalesHeader.Validate("No.", orderNumber);
    //             tmpSalesHeader.Validate("Allow Line Disc.", true);
    //             tmpSalesHeader.Validate("Sell-to Customer No.", customer."No.");
    //             tmpSalesHeader.Validate("Customer Price Group", customer."Customer Price Group");
    //             tmpSalesHeader.Validate("Customer Disc. Group", customer."Customer Disc. Group");
    //             tmpSalesHeader.Insert();
    //         end
    //         else begin
    //             tmpSalesHeader.SuspendStatusCheck(true);
    //             tmpSalesHeader.SetHideValidationDialog(true);
    //             tmpSalesHeader.SetHideCreditCheckDialogue(true);
    //             tmpSalesHeader.Validate("Allow Line Disc.", true);
    //             tmpSalesHeader.Validate("Sell-to Customer No.", customer."No.");
    //             tmpSalesHeader.Validate("Customer Price Group", customer."Customer Price Group");
    //             tmpSalesHeader.Validate("Customer Disc. Group", customer."Customer Disc. Group");
    //         end;

    //         if not tmpSalesLine.Get(tmpSalesHeader."Document Type"::Order, orderNumber, 10000) then begin
    //             tmpSalesLine.Init();
    //             tmpSalesLine.SetSalesHeader(tmpSalesHeader);
    //             tmpSalesLine.SuspendStatusCheck(true);
    //             tmpSalesLine.SetHideValidationDialog(true);
    //             tmpSalesLine.Validate("Document Type", tmpSalesLine."Document Type"::Order);
    //             tmpSalesLine.Validate("Document No.", orderNumber);
    //             tmpSalesLine.Validate("Line No.", 10000);
    //             tmpSalesLine.Validate("Allow Line Disc.", true);
    //             tmpSalesLine.Validate("Prepayment Line", true);
    //             tmpSalesLine.Validate("Sell-to Customer No.", customer."No.");
    //             tmpSalesLine.Validate("Customer Price Group", customer."Customer Price Group");
    //             tmpSalesLine.Validate("Customer Disc. Group", customer."Customer Disc. Group");
    //             tmpSalesLine.Validate(Type, tmpSalesLine.Type::Item);
    //             tmpSalesLine.Validate("No.", item."No.");
    //             tmpSalesLine.Validate("Unit of Measure Code", Item."Base Unit of Measure");
    //             tmpSalesLine.Validate(Quantity, quantity);
    //             tmpSalesLine.Insert();
    //         end else begin
    //             tmpSalesLine.SetSalesHeader(tmpSalesHeader);
    //             tmpSalesLine.SuspendStatusCheck(true);
    //             tmpSalesLine.SetHideValidationDialog(true);
    //             tmpSalesLine.Validate("Allow Line Disc.", true);
    //             tmpSalesLine.Validate("Prepayment Line", true);
    //             tmpSalesLine.Validate("Sell-to Customer No.", customer."No.");
    //             tmpSalesLine.Validate("Customer Price Group", customer."Customer Price Group");
    //             tmpSalesLine.Validate("Customer Disc. Group", customer."Customer Disc. Group");
    //             tmpSalesLine.Validate("No.", item."No.");
    //             tmpSalesLine.Validate("Unit of Measure Code", Item."Base Unit of Measure");
    //             tmpSalesLine.Validate(Quantity, quantity);
    //         end;

    //         lineAmount := tmpSalesLine."Unit Price" * tmpSalesLine.Quantity;
    //         lineDiscountPercent := tmpSalesLine."Line Discount %";
    //         lineDiscountAmount := lineAmount * (lineDiscountPercent / 100.0);

    //         article.add('netPrice', lineAmount - lineDiscountAmount);
    //         article.add('lineAmount', tmpSalesLine."Line Amount");
    //         article.add('discountPercent', lineDiscountPercent);
    //         article.add('discountAmount', lineDiscountAmount);

    //         priceListLine.Reset();
    //         priceListLine.SetFilter("Asset Type", '%1', priceListLine."Asset Type"::"Item Discount Group");
    //         priceListLine.SetFilter("Asset No.", '%1', item."Item Disc. Group");
    //         priceListLine.SetFilter("Unit of Measure Code", '%1|%2', item."Sales Unit of Measure", '');
    //         priceListLine.SetFilter("Amount Type", '%1|%2', priceListLine."Amount Type"::Discount, priceListLine."Amount Type"::Any);
    //         priceListLine.SetFilter("Price Type", '%1', priceListLine."Price Type"::Sale);
    //         priceListLine.SetFilter(Status, '%1', priceListLine.Status::Active);
    //         priceListLine.SetFilter("Minimum Quantity", '>0');
    //         priceListLine.SetFilter("Line Discount %", '>0');
    //         priceListLine.SetFilter("Starting Date", '<=%1', Today);
    //         priceListLine.SetFilter("Ending Date", '>=%1|%2', Today, 0D);

    //         if priceListLine.FindFirst() then begin
    //             repeat
    //                 if not quantities.Contains(priceListLine."Minimum Quantity") then
    //                     quantities.Add(priceListLine."Minimum Quantity");
    //             until priceListLine.Next(1) = 0;
    //         end;

    //         priceListLine.Reset();
    //         priceListLine.SetFilter("Asset Type", '%1', priceListLine."Asset Type"::Item);
    //         priceListLine.SetFilter("Asset No.", '%1', item."No.");
    //         priceListLine.SetFilter("Unit of Measure Code", '%1|%2', item."Sales Unit of Measure", '');
    //         priceListLine.SetFilter("Amount Type", '%1|%2', priceListLine."Amount Type"::Discount, priceListLine."Amount Type"::Any);
    //         priceListLine.SetFilter("Price Type", '%1', priceListLine."Price Type"::Sale);
    //         priceListLine.SetFilter(Status, '%1', priceListLine.Status::Active);
    //         priceListLine.SetFilter("Minimum Quantity", '>0');
    //         priceListLine.SetFilter("Line Discount %", '>0');
    //         priceListLine.SetFilter("Starting Date", '<=%1', Today);
    //         priceListLine.SetFilter("Ending Date", '>=%1|%2', Today, 0D);

    //         if priceListLine.FindFirst() then begin
    //             repeat
    //                 if not quantities.Contains(priceListLine."Minimum Quantity") then
    //                     quantities.Add(priceListLine."Minimum Quantity");
    //             until priceListLine.Next(1) = 0;
    //         end;

    //         listHelpers.sortAscending(quantities);
    //         prevDiscountPercent := -1;

    //         foreach quantity in quantities do begin
    //             tmpSalesLine.Validate(Quantity, quantity);

    //             if prevDiscountPercent <> tmpSalesLine."Line Discount %" then begin
    //                 Clear(priceTiersLine);
    //                 priceTiersLine.Add('quantity', tmpSalesLine.Quantity);
    //                 priceTiersLine.Add('discountPercent', tmpSalesLine."Line Discount %");
    //                 priceTiers.Add(priceTiersLine);

    //                 prevDiscountPercent := tmpSalesLine."Line Discount %";
    //             end;
    //         end;

    //         if priceTiers.Count() > 0 then
    //             article.add('priceTiers', priceTiers);
    //     end
    //     else begin
    //         article.add('netPrice', -1);
    //         article.add('lineAmount', -1);
    //         article.add('discountPercent', 0);
    //         article.add('discountAmount', 0);
    //     end;
    // end;
    procedure getNetPrice(article: JsonObject; item: record Item; customer: record Customer; listPrice: Decimal; quantity: Decimal)
    var
        tmpSalesHeader: Record "Sales Header" temporary;
        tmpSalesLine: Record "Sales Line" temporary;
        orderNumber: Text;
        lineAmount: Decimal;
        lineDiscountPercent: Decimal;
        lineDiscountAmount: Decimal;
        priceTiers: JsonArray;
        priceTiersLine: JsonObject;
        priceListLine: record "Price List Line";
        quantities: List of [Decimal];
        listHelpers: Codeunit "AVI List Helpers";
        prevDiscountPercent: Decimal;
    begin
        if listPrice <> -1 then begin
            orderNumber := 'HCG-TEMP';

            tmpSalesHeader.Init();
            tmpSalesHeader.SuspendStatusCheck(true);
            tmpSalesHeader.SetHideValidationDialog(true);
            tmpSalesHeader."Document Type" := tmpSalesHeader."Document Type"::Order;
            tmpSalesHeader."No." := orderNumber;
            tmpSalesHeader."Sell-to Customer No." := customer."No.";
            tmpSalesHeader."Bill-to Customer No." := customer."No.";
            tmpSalesHeader."Customer Disc. Group" := customer."Customer Disc. Group";
            tmpSalesHeader."Customer Price Group" := customer."Customer Price Group";

            tmpSalesLine.Init();
            tmpSalesLine.SetSalesHeader(tmpSalesHeader);
            tmpSalesLine.SuspendStatusCheck(true);
            tmpSalesLine.SetHideValidationDialog(true);
            tmpSalesLine."Document Type" := tmpSalesHeader."Document Type"::Order;
            tmpSalesLine."Document No." := orderNumber;
            tmpSalesLine."Line No." := 10000;
            tmpSalesLine."Prepayment Line" := true;
            tmpSalesLine."Sell-to Customer No." := customer."No.";
            tmpSalesLine."Bill-to Customer No." := customer."No.";
            tmpSalesLine."Customer Disc. Group" := customer."Customer Disc. Group";
            tmpSalesLine."Customer Price Group" := customer."Customer Price Group";
            tmpSalesLine.Validate(Type, tmpSalesLine.Type::Item);
            tmpSalesLine.Validate("No.", item."No.");
            tmpSalesLine.Validate("Unit of Measure Code", Item."Base Unit of Measure");
            tmpSalesLine.Validate(Quantity, quantity);

            lineAmount := tmpSalesLine."Unit Price" * tmpSalesLine.Quantity;
            lineDiscountPercent := tmpSalesLine."Line Discount %";
            lineDiscountAmount := lineAmount * (lineDiscountPercent / 100.0);

            article.add('netPrice', lineAmount - lineDiscountAmount);
            article.add('lineAmount', tmpSalesLine."Line Amount");
            article.add('discountPercent', lineDiscountPercent);
            article.add('discountAmount', lineDiscountAmount);

            quantities.Add(1);

            priceListLine.Reset();
            priceListLine.SetFilter("Asset Type", '%1', priceListLine."Asset Type"::"Item Discount Group");
            priceListLine.SetFilter("Asset No.", '%1', item."Item Disc. Group");
            priceListLine.SetFilter("Unit of Measure Code", '%1|%2', item."Sales Unit of Measure", '');
            priceListLine.SetFilter("Amount Type", '%1|%2', priceListLine."Amount Type"::Discount, priceListLine."Amount Type"::Any);
            priceListLine.SetFilter("Price Type", '%1', priceListLine."Price Type"::Sale);
            priceListLine.SetFilter(Status, '%1', priceListLine.Status::Active);
            priceListLine.SetFilter("Minimum Quantity", '>0');
            priceListLine.SetFilter("Line Discount %", '>0');
            priceListLine.SetFilter("Starting Date", '<=%1', Today);
            priceListLine.SetFilter("Ending Date", '>=%1|%2', Today, 0D);

            if priceListLine.FindFirst() then begin
                repeat
                    quantity := priceListLine."Minimum Quantity";
                    if not quantities.Contains(quantity) then
                        quantities.Add(quantity);
                until priceListLine.Next(1) = 0;
            end;

            priceListLine.Reset();
            priceListLine.SetFilter("Asset Type", '%1', priceListLine."Asset Type"::Item);
            priceListLine.SetFilter("Asset No.", '%1', item."No.");
            priceListLine.SetFilter("Unit of Measure Code", '%1|%2', item."Sales Unit of Measure", '');
            priceListLine.SetFilter("Amount Type", '%1|%2', priceListLine."Amount Type"::Discount, priceListLine."Amount Type"::Any);
            priceListLine.SetFilter("Price Type", '%1', priceListLine."Price Type"::Sale);
            priceListLine.SetFilter(Status, '%1', priceListLine.Status::Active);
            priceListLine.SetFilter("Minimum Quantity", '>0');
            priceListLine.SetFilter("Line Discount %", '>0');
            priceListLine.SetFilter("Starting Date", '<=%1', Today);
            priceListLine.SetFilter("Ending Date", '>=%1|%2', Today, 0D);

            if priceListLine.FindFirst() then begin
                repeat
                    quantity := priceListLine."Minimum Quantity";
                    if not quantities.Contains(quantity) then
                        quantities.Add(quantity);
                until priceListLine.Next(1) = 0;
            end;

            listHelpers.sortAscending(quantities);
            prevDiscountPercent := -1;

            // if hcgSettings."Net Price Calculation Version" = hcgSettings."Net Price Calculation Version"::Classic then begin
            foreach quantity in quantities do begin
                tmpSalesLine.Validate(Quantity, quantity);

                if prevDiscountPercent <> tmpSalesLine."Line Discount %" then begin
                    Clear(priceTiersLine);
                    priceTiersLine.Add('quantity', tmpSalesLine.Quantity);
                    priceTiersLine.Add('discountPercent', tmpSalesLine."Line Discount %");
                    priceTiers.Add(priceTiersLine);

                    prevDiscountPercent := tmpSalesLine."Line Discount %";
                end;
            end;
            // end else begin
            //     foreach quantity in quantities do begin
            //         salesLine.Validate(Quantity, quantity);

            //         if prevDiscountPercent <> salesLine."Line Discount %" then begin
            //             Clear(priceTiersLine);
            //             priceTiersLine.Add('quantity', salesLine.Quantity);
            //             priceTiersLine.Add('discountPercent', salesLine."Line Discount %");
            //             priceTiers.Add(priceTiersLine);

            //             prevDiscountPercent := salesLine."Line Discount %";
            //         end;
            //     end;
            //end;

            if priceTiers.Count() > 1 then
                article.add('priceTiers', priceTiers);
        end
        else begin
            article.add('netPrice', -1);
            article.add('lineAmount', -1);
            article.add('discountPercent', 0);
            article.add('discountAmount', 0);
        end;
    end;

    var
        salesLine: Record "Sales Line";

}
