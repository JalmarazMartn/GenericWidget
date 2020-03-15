table 69001 "Widget"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;

        }

        field(4; "HTML Widget"; Blob)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure SetHTMLWidget(NewHTMLWidget: Text)
    var
        OutStream: OutStream;
    begin
        Clear("HTML Widget");
        "HTML Widget".CreateOutStream(OutStream, TextEncoding::UTF8);
        OutStream.WriteText(NewHTMLWidget);
        Modify;
    end;

    procedure GetHTMLWidgetConvertedToText() HTMLWidget: Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields("HTML Widget");
        "HTML Widget".CreateInStream(InStream, TEXTENCODING::UTF8);
        exit(TypeHelper.ReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator));
    end;

    var
}