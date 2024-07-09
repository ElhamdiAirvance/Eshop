codeunit 57002 "AVI E-Shop Push Pending Orders"
{
    trigger OnRun()
    var
        eShopOrderHeader: record "AVI E-Shop Order Header";
        eShopOrders: Codeunit "AVI E-Shop Orders";
        erpOrderNo: Text;
    begin
        eShopOrderHeader.SetRange("No.", 'PENDING');
        eShopOrderHeader.SetRange("On Hold", false);

        if eShopOrderHeader.FindSet() then begin
            repeat
                if eShopOrders.pushOrder(eShopOrderHeader, erpOrderNo) then begin
                    eShopOrderHeader."No." := erpOrderNo;
                    eShopOrderHeader."Has Error" := false;
                    eShopOrderHeader."Error Message" := '';
                    eShopOrderHeader.Modify();
                end
                else begin
                    eShopOrderHeader."Has Error" := true;
                    eShopOrderHeader."Error Message" := CopyStr(GetLastErrorText(), 1, 250);
                    eShopOrderHeader.Modify();
                end;
            until eShopOrderHeader.Next(1) = 0;
        end;
    end;
}
