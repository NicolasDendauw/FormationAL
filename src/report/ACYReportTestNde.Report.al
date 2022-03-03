/// <summary>
/// Report ACY ReportTestNde (ID 50100).
/// </summary>
report 50100 "ACY ReportTestNde"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)//lecture de toute la table X
        {
            //DataItemTableView = sorting("No.") where("No." = const('10000'));
            trigger OnPreDataItem()//avant l'enreg
            var
                myInt: Integer;
            begin
                //SetRange("No.", '10000'); // ==> DataItemTableView = sorting("No.") where("No." = const('10000'));
                SetFilter("ACY nde", '<>%1', ''); // ==> filtre != de vide
            end;

            trigger OnAfterGetRecord() // sur l'enreg en cours
            var
                myInt: Integer;
            begin
                "ACY nde" := '';
                Modify();
            end;

            trigger OnPostDataItem() // a la fin
            var
                myInt: Integer;
            begin
                Message('C ''est fini');
            end;
            //uniquement pour les editions
            /*column(ColumnName; SourceFieldName)
            {
                
            }*/
        }
    }

    requestpage
    {
        /*layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }
        */
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;
}