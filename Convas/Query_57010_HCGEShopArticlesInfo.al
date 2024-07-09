query 57010 "AVI E-Shop Articles Info"
{
    QueryType = API;

    APIPublisher = 'AVI';
    APIGroup = 'EShop';
    APIVersion = 'v1.0';

    CaptionML = ENU = 'E-Shop Articles Info', NLD = 'E-Shop Artikelinfo';
    EntityName = 'aviEShopArticleInfoQuery';
    EntitySetName = 'aviEShopArticlesInfoQuery';

    elements
    {
        dataitem(Item; Item)
        {
            column(articleNumber; "No.") { }
            column(erpDescription; Description) { }
            column(buyUnits; "Base Unit of Measure") { }
            column(grossPrice1; "Unit Price") { }
            column(reorderingPolicy; "Reordering Policy") { }
            //todo column(workflowStatusCode; "GAC Status Code") { }
            column(blocked; Blocked) { }
            dataitem(Item_Unit_of_Measure; "Item Unit of Measure")
            {
                DataItemLink = Code = Item."Base Unit of Measure", "Item No." = Item."No.";
                column(recommendedQuantity; "Qty. per Unit of Measure") { }
            }
        }
    }
}
