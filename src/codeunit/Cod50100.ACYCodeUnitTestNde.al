/// <summary>
/// Codeunit ACY CodeUnitTestNde (ID 50100).
/// </summary>
codeunit 50100 "ACY CodeUnitTestNde"
{
    trigger OnRun()
    begin

    end;

    /// <summary>
    /// DeleteOne.
    /// </summary>
    /// <param name="IDCusto">code[20].</param>
    procedure DeleteOne(IDCusto: code[20])
    var
        // myInt: Integer;
        recordToDel: Record Customer;
    begin
        recordToDel.Get(IDCusto);
        recordToDel.Delete();
    end;


    var
    // myInt: Integer;
}