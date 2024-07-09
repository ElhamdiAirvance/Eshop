pageextension 57010 AVIEShopOrdProcRoleCenter extends "Order Processor Role Center"
{
    actions
    {
        addlast(Sections)
        {
            group("E-Shop")
            {
                action(Orders)
                {
                    CaptionML = ENU = 'Orders', NLD = 'Orders';
                    RunObject = page "AVI E-Shop Orders";
                    ApplicationArea = All;
                }
                action("Users")
                {
                    CaptionML = ENU = 'Users', NLD = 'Gebruikers';
                    RunObject = page "AVI E-Shop Users";
                    ApplicationArea = All;
                }
                action("User types")
                {
                    CaptionML = ENU = 'User Types', NLD = 'Gebruikerstypes';
                    RunObject = page "AVI E-Shop User Types";
                    ApplicationArea = All;
                }
                action("Sessions")
                {
                    CaptionML = ENU = 'Sessions', NLD = 'Sessies';
                    RunObject = page "AVI E-Shop Sessions";
                    ApplicationArea = All;
                }
            }
        }
    }
}
