page 57000 "AVI E-Shop Order Lines"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "AVI E-Shop Order Line";
    InsertAllowed = false;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater("Lines")
            {
                CaptionML = ENU = 'Lines', NLD = 'Regels';
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
                field(orderLineId; Rec."Order Line Id")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}
