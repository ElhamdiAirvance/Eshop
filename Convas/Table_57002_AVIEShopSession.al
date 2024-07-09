table 57002 "AVI E-Shop Session"
{
    DataClassification = CustomerContent;
    LookupPageId = "AVI E-Shop Sessions";

    fields
    {
        field(1; "Session Id"; Guid)
        {
            CaptionML = ENU = 'Session Id', NLD = 'Sessie Id';
            DataClassification = CustomerContent;
            // Editable = false;
        }
        field(2; "User Name"; Text[40])
        {
            CaptionML = ENU = 'User Name', NLD = 'Gebruikersnaam';
            DataClassification = CustomerContent;
            TableRelation = "AVI E-Shop User"."User Name";
            // if true, gives problems with invalid login
            ValidateTableRelation = false;
            // Editable = false;
        }
        field(3; "Language Code"; Code[10])
        {
            CaptionML = ENU = 'Language Code', NLD = 'Taalcode';
            DataClassification = CustomerContent;
            TableRelation = Language.Code;
            ValidateTableRelation = true;
            // Editable = false;
        }
        field(4; "Created At"; DateTime)
        {
            CaptionML = ENU = 'Created At', NLD = 'Aangemaakt Op';
            DataClassification = CustomerContent;
            // Editable = false;
        }
    }

    keys
    {
        key(sessionId; "Session Id")
        {
            Clustered = true;
        }
        key(createdAt; "Created At")
        {
        }
    }

    trigger OnInsert();
    begin
        "Session Id" := System.CreateGUID();
    end;
}
