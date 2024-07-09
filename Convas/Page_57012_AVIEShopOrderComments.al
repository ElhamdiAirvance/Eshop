page 57012 "AVI E-Shop Order Comments"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "AVI E-Shop Order Comment";

    layout
    {
        area(Content)
        {
            repeater("Lines")
            {
                CaptionML = ENU = 'Lines', NLD = 'Regels';
                field(commentLineNo; Rec."Comment Line No.")
                {
                    ApplicationArea = All;
                }
                field(comment; Rec."Comment Line")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
