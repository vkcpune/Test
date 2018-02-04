trigger AccountAddressTrigger on Account (before insert,  before update) {

       for(Account a:Trigger.New){
            If (a.Match_Billing_Address__c==true && a.BillingPostalCode!= Null) {
                a.BillingPostalCode= a.ShippingPostalCode ;  
        } 
    }
}