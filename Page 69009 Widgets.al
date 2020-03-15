page 69009 Widget
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Widget;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;

                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }

            }
            group(ImputText)
            {
                field("HTML Widget"; HTMLWidgetShow)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    Editable = true;
                }

            }

        }
        area(Factboxes)
        {
            part("Widget FactBox"; "Widget FactBox")
            {
                ApplicationArea = all;
                Caption = 'Widget Showing';
                Visible = true;
                SubPageLink = Code = field(code);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SaveHtml)
            {
                Caption = 'Save HTML code';
                ApplicationArea = All;
                image = Save;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                trigger OnAction();
                begin
                    SetHTMLWidget(HTMLWidgetShow);
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        HTMLWidgetShow := GetHTMLWidgetConvertedToText();
    end;

    var
        HTMLWidgetShow: Text;
}