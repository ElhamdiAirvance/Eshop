codeunit 57000 "AVI E-Shop Helpers"
{
    local procedure getStock(article: JsonObject; item: Record Item; warehouses: JsonArray)
    var
        stockItem: Record Item;
        token: JsonToken;
        stocks: JsonArray;
        stock: JsonObject;
        w: Integer;
        warehouse: Text;
    begin
        stockItem.SetRange("No.", item."No.");

        for w := 0 to (warehouses.Count() - 1) do begin
            warehouses.Get(w, token);
            warehouse := token.AsValue().AsText();

            clear(stock);
            stock.add('warehouse', warehouse);

            stockItem.SetRange("Location Filter", warehouse);

            if stockItem.FindFirst() then begin
                stockItem.CalcFields(
                    Inventory,
                    "Qty. on Asm. Component",
                    "Qty. on Component Lines",
                    "Qty. on Job Order",
                    "Qty. on Sales Order",
                    "Qty. on Service Order"/*,
                    "Qty. on Purch. Order"*/
                );

                stock.add('freeStock',
                    stockItem.Inventory -
                    stockItem."Qty. on Asm. Component" -
                    stockItem."Qty. on Component Lines" -
                    stockItem."Qty. on Job Order" -
                    stockItem."Qty. on Sales Order" -
                    stockItem."Qty. on Service Order"/* +
                    stockItem."Qty. on Purch. Order"*/
                );
            end
            else begin
                stock.add('freeStock', 0);
            end;

            stocks.add(stock.clone());
        end;

        article.add('stocks', stocks);
    end;

    procedure getArticlesInfo(request: Text) response: Text
    var
        json: JsonObject;
        token: JsonToken;
        session: record "AVI E-Shop Session";
        user: Record "AVI E-Shop User";
        customer: Record Customer;
        includeNetPrices: Boolean;
        articleNumbers: JsonArray;
        warehouses: JsonArray;
        data: JsonObject;
        articles: JsonArray;
        article: JsonObject;
        i: Integer;
        item: Record Item;
        articleNumber: Text;
        discountHeader: record "Price List Header";
        discountLine: record "Price List Line";
        listPrice: Decimal;
        salesHelpers: Codeunit "AVI Sales Helpers";
    begin
        json.ReadFrom(request);

        data.Add('succeeded', false);

        if json.Get('sessionId', token) and session.get(token.AsValue().AsText()) then begin
            user.Get(session."User Name");
            customer.get(user."Customer No.");

            if json.get('includeNetPrices', token) then
                includeNetPrices := token.AsValue().AsBoolean()
            else
                includeNetPrices := true;

            if json.get('articleNumbers', token) and token.IsArray() then begin
                articleNumbers := token.AsArray();

                if (json.get('warehouses', token)) and token.IsArray() then begin
                    warehouses := token.AsArray();

                    data.Replace('succeeded', true);

                    for i := 0 to (articleNumbers.Count() - 1) do begin
                        articleNumbers.Get(i, token);
                        articleNumber := token.AsValue().AsText();

                        clear(article);
                        article.add('articleNumber', articleNumber);
                        article.Add('environmentalTax', 0.0);

                        if item.Get(articleNumber) then begin
                            article.add('baseUOM', item."Base Unit of Measure");

                            listPrice := salesHelpers.getListPrice(item);
                            article.add('listPrice', listPrice);

                            if includeNetPrices then
                                salesHelpers.getNetPrice(article, item, customer, listPrice, 1)
                            else
                                article.add('netPrice', -1);

                            article.add('vatRate', salesHelpers.getVatRate(item, customer));
                            getStock(article, item, warehouses);
                        end
                        else begin
                            article.add('baseUOM', '');
                            article.add('listPrice', -1);
                            article.add('netPrice', -1);
                            article.add('vatRate', -1);
                        end;

                        articles.Add(article.Clone());
                    end;

                    data.Add('articles', articles);
                end
                else
                    data.Add('errorMessage', 'Missing warehouses array');
            end
            else
                data.Add('errorMessage', 'Missing articleSINs array');
        end
        else
            data.Add('errorMessage', 'Unknown session');

        data.WriteTo(response);
    end;

    procedure getDeliveryCosts(request: Text) response: Text
    var
        json: JsonObject;
        token: JsonToken;
        data: JsonObject;
        session: record "AVI E-Shop Session";
        orderType: text;
        netTotal: Decimal;
        eShopOrders: Codeunit "AVI E-Shop Orders";
        deliveryCosts: Decimal;
        freeDeliveryThreshold: Decimal;
    begin
        json.ReadFrom(request);

        data.Add('succeeded', false);

        if json.Get('sessionId', token) and session.get(token.AsValue().AsText()) then begin
            if (json.get('orderType', token)) then begin
                orderType := token.AsValue().AsText();

                if (json.get('netTotal', token)) then begin
                    netTotal := token.AsValue().AsDecimal();

                    eShopOrders.getDeliveryCosts(session, netTotal, orderType, deliveryCosts, freeDeliveryThreshold);

                    data.add('deliveryCosts', deliveryCosts);
                    data.add('freeDeliveryThreshold', freeDeliveryThreshold);
                    data.Replace('succeeded', true);
                end
                else
                    data.Add('errorMessage', 'Missing netTotal');
            end
            else
                data.Add('errorMessage', 'Missing orderType');
        end
        else
            data.Add('errorMessage', 'Unknown session');

        data.WriteTo(response);
    end;
}
