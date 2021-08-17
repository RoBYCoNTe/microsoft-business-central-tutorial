codeunit 50102 "Cust. Rewards Assisted Setup"
{

    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assisted Setup", 'OnRegister', '', false, false)]
    local procedure AddExtensionAssistedSetup_OnRegisterAssistedSetup();
    var
        AssistedSetup: Codeunit "Assisted Setup";
        CurrentGlobalLanguage: Integer;
        myAppInfo: ModuleInfo;
        WizardTxt: Label 'Customer Rewards assisted setup guide';
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo);
        CurrentGlobalLanguage := GlobalLanguage();
        AssistedSetup.Add(myAppInfo.Id, Page::"Customer Rewards Wizard", WizardTxt, "Assisted Setup Group"::Extensions);
        GLOBALLANGUAGE(1033);
        AssistedSetup.AddTranslation(myAppInfo.Id, Page::"Customer Rewards Wizard", 1033, WizardTxt);
    end;

}