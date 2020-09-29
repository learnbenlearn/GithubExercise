trigger ContactAccountRelation on Contact (before insert) {
    //Store new Contact
    List<Contact> newContact = Trigger.new;
    
	//Gather the Accounts
    List<Account> accList = [SELECT Id, BillingCity, BillingCountry, BillingState, BillingStreet, BillingPostalCode, 
                             ShippingCity, ShippingCountry, ShippingState, ShippingStreet, ShippingPostalCode, Phone 
                             FROM Account];
    
    //Compare the data in the accounts to the data in this new contact
    for(Integer i = 0; i < newContact.size(); i++){
        for(Integer j = 0; j < accList.size(); j++){
            if((newContact[i].MailingCity == accList[j].BillingCity && newContact[i].MailingCountry == accList[j].BillingCountry 
               && newContact[i].MailingState == accList[j].BillingState && newContact[i].MailingStreet == accList[j].BillingStreet 
               && newContact[i].MailingPostalCode == accList[j].BillingPostalCode)
               || (newContact[i].MailingCity == accList[j].ShippingCity && newContact[i].MailingCountry == accList[j].ShippingCountry 
               && newContact[i].MailingState == accList[j].ShippingState && newContact[i].MailingStreet == accList[j].ShippingStreet 
                && newContact[i].MailingPostalCode == accList[j].ShippingPostalCode)
               && newContact[i].Phone == accList[j].Phone){
                newContact[i].AccountId = accList[j].Id;
            }
        }
    }
    
}