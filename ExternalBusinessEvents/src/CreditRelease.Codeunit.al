codeunit 50100 "Credit Release"
{
    procedure OnManualRelease(var SalesHeader: Record "Sales Header"; ShowMessage: Boolean);
    var
        Customer: Record Customer;
        CreditControllerEmail: Text[100];
    begin
        if not SalesHeaderPassesCreditCheck(0, SalesHeader) then begin
            Customer.Get(SalesHeader."Bill-to Customer No.");
            CreditControllerEmail := GetCreditControllerEmail(Customer);
            OnCreditHoldSalesDocument(SalesHeader.SystemId, CreditControllerEmail);
            Commit();
            Error(CreditHeldMsg, SalesHeader."Document Type", SalesHeader."No.");
        end
        else
            Message(CreditCheckPassedMsg, SalesHeader."Document Type", SalesHeader."No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, 414, 'OnBeforeManualReleaseSalesDoc', '', false, false)]
    local procedure OnBeforeManualReleaseSalesDoc(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    begin
        OnManualRelease(SalesHeader, false);
    end;

    [ExternalBusinessEvent('OnCreditHoldSalesDocument', 'Credit Held Document Event', 'External business event triggered when a document is credit held.', EventCategory::"Credit Held Events TMN")]
    local procedure OnCreditHoldSalesDocument(SystemId: Guid; CreditControllerEmail: Text[100])
    begin
    end;


}
