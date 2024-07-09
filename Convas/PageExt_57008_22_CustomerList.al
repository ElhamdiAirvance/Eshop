pageextension 57008 "AVI E-Shop Customers" extends "Customer List"
{
    actions
    {
        addlast(Promoted)
        {
            actionref(aviEShopUsers; "AVI E-Shop Users") { }
        }

        addlast(General)
        {
            action("AVI E-Shop Users")
            {
                ApplicationArea = All;

                CaptionML = ENU = 'E-SHop Users', NLD = 'E-Shop Gebruikers';
                RunObject = page "AVI E-Shop Users";
                RunPageMode = View;
                RunPageView = sorting("User Name") order(Ascending);
                RunPageLink = "Customer No." = field("No.");
                Image = "Users";
            }
        }
    }
}
