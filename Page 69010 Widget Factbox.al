Page 69010 "Widget Factbox"
{
    PageType = cardpart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Widget;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                usercontrol(GenWidget; "Generic widget")
                {
                    ApplicationArea = All;
                    Visible = true;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.GenWidget.WriteWidget(GetHTMLWidgetConvertedToText);
        CurrPage.Update(false);
    end;

    var
}