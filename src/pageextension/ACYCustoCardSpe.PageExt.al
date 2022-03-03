/// <summary>
/// PageExtension ACY CustoCardSpe (ID 50101) extends Record Customer Card.
/// </summary>
pageextension 50101 "ACY CustoCardSpe" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Name)
        {
            field(nde; Rec."ACY nde")
            {
                ApplicationArea = all;
                ToolTip = 'toto';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
    //       myInt: Integer;
}