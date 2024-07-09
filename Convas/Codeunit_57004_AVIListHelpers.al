codeunit 57004 "AVI List Helpers"
{
    procedure sortAscending(var values: List of [Decimal])
    var
        i: Integer;
        k: Integer;
        len: Integer;
        iv: Decimal;
        kv: Decimal;
    begin
        len := values.Count();

        for i := 1 to len - 1 do begin
            iv := values.Get(i);

            for k := i + 1 to len do begin
                kv := values.Get(k);

                if iv > kv then begin
                    values.Set(i, kv);
                    values.Set(k, iv);

                    iv := kv;
                end;
            end;
        end;
    end;

    procedure sortDescending(var values: List of [Decimal])
    var
        i: Integer;
        k: Integer;
        len: Integer;
        iv: Decimal;
        kv: Decimal;
    begin
        len := values.Count();

        for i := 1 to len - 1 do begin
            iv := values.Get(i);

            for k := i + 1 to len do begin
                kv := values.Get(k);

                if iv < kv then begin
                    values.Set(i, kv);
                    values.Set(k, iv);

                    iv := kv;
                end;
            end;
        end;
    end;
}
