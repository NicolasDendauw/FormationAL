// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!


/**
"[PrefixProjet]_[Prefix_Domain] CustomerListExt"==>nom fichier
**/
/// <summary>
/// PageExtension ACY CustoListSpe (ID 50100) extends Record Customer List.
/// </summary>
pageextension 50100 "ACY CustoListSpe" extends "Customer List"
{
    layout
    {

        addafter(Name)
        {
            field(nde; Rec."ACY nde")
            {
                ApplicationArea = all;
            }

        }
    }
    actions
    {
        addafter(NewSalesInvoice)
        {
            action("NDE Action")
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    newRecord: Record Customer;
                    myInt: Integer;
                begin
                    //affiche un message
                    Message('Bonjour');
                    //recup tous les enreg + boucle dessus.
                    newRecord.FindSet(); //select * from customer, top 1
                    repeat
                        newRecord."ACY nde" := 'titi';
                        newRecord.Modify();
                    until newRecord.Next() = 0;
                    /*
                                        for myInt := 0 to 100 do begin

                                        end;

                                        while (myInt > 0) do begin

                                        end;
                    */


                    // get 1 enreg et modifie
                    newRecord.Get('30000');
                    newRecord."ACY nde" := 'toto';
                    newRecord.Modify();

                    //selection une range et modifie enreg par enreg
                    newRecord.SetRange("No.", '10000', '30000'); // filtre mais ne recup rien
                    newRecord.FindSet(); //select * from customer, top 1
                    repeat
                        newRecord."ACY nde" := 'tete';
                        newRecord.Modify();
                    until newRecord.Next() = 0;

                    // modifie toutes les valeurs d'un range (pas de traitement)
                    newRecord.SetRange("No.", '40000', '50000');
                    newRecord.SetRange(Contact, 'Ian Deberry');
                    newRecord.ModifyAll("ACY nde", 'toto');
                end;
            }
            action("Insert Cust")
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    myInt: Integer;
                    insertRecord: Record Customer;
                begin
                    insertRecord.Init();
                    insertRecord.Validate("No.", 'nicolas');
                    insertRecord.Insert(true);
                end;
            }
            //Purge one.
            action("Purge one")
            {
                ApplicationArea = all;
                trigger OnAction()

                var
                    cu: Codeunit "ACY CodeUnitTestNde";
                begin
                    cu.DeleteOne('nicolas');

                end;
                /* var
                     myInt: Integer;
                     recordToDel: Record Customer;
                 begin
                     recordToDel.Get('nicolas');
                     recordToDel.Delete();
                 end;*/
            }
        }
    }

    /*trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;*/
}