/// <summary>
/// TableExtension ACY CustomerSpe (ID 50100) extends Record Customer.
/// </summary>
tableextension 50100 "ACY CustomerSpe" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50100; "ACY nde"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            Caption = 'NDE';
        }
    }

    var
        myInt: Integer;
}