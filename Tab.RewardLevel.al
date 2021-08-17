table 50100 "Reward Level"
{
	Caption = 'Reward Level';
	TableType = Normal;
	DataClassification = CustomerContent;

	fields {
		field(1; Level; Text[20])
		{
			Caption = 'Level';
			DataClassification = CustomerContent;
		}
		field(2; "Minimum Reward Points"; Integer)
		{
			Caption = 'Minium Reward Points';
			DataClassification = CustomerContent;
			MinValue = 0;
			NotBlank = true;
			trigger OnValidate();
			var
				tempPoints: Integer;
				RewardLevel: Record "Reward Level";
			begin
				tempPoints := "Minimum reward points";
				RewardLevel.SetRange("Minimum Reward Points", tempPoints);
				if RewardLevel.FindFirst() then
					Error('Minimum Reward Points must be unique');
			end;

		}
	}

	keys
	{
		key(PK; Level)
		{
			Clustered = true;
		}
		key("Minimum Reward Points"; "Minimum Reward Points") {}
	}
	trigger OnInsert();
    begin

        Validate("Minimum reward points");
    end;

    trigger OnModify();
    begin
        Validate("Minimum reward points");
    end;
}