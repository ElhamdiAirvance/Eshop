tableextension 57002 AVIEShopActivitiesCue extends "Activities Cue"
{
    fields
    {
        field(57000; "AVI Pending E-Shop Orders"; Integer)
        {
            CaptionML = ENU = 'Pending E-Shop Orders', NLD = 'Wachtende E-Shop Orders';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("AVI E-Shop Order Header" where("No." = Filter('PENDING')));
        }
        field(57001; "AVI E-Shop Orders With Error"; Integer)
        {
            CaptionML = ENU = 'E-Shop Orders With Error', NLD = 'E-Shop Orders Met Fout';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("AVI E-Shop Order Header" where("No." = Filter('PENDING'), "Has Error" = const(true)));
        }
        field(57002; "AVI E-Shop Orders On Hold"; Integer)
        {
            CaptionML = ENU = 'E-Shop Orders On Hold', NLD = 'E-Shop Orders On Hold';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("AVI E-Shop Order Header" where("No." = Filter('PENDING'), "On Hold" = const(true)));
        }
    }
}
