public class IsCreatedTriggerHandler {
	
    public static void checkIfAccountExists(List<Contact> Contacts){
        
        //variable code below:
        
        //gets list of Accounts
        List<Account> Accounts = [SELECT Id, Name
                                 FROM Account 
                                 LIMIT 100];
        
        Boolean accountFound = false;	//a boolean used to determine whether or not the account 
        
        
        
        
        //execution code below:
        
        //loop to iterate through contacts
        for(Contact c : Contacts){
            //checks to see whether or not the account name is null
            if(c.AccountId != null){
                //loop to iterate through accounts
            	for(Account a : Accounts){
                    //if statement to compare the account in contact to that of the account id
                    if(c.AccountId == a.Id)
                    {
                        accountFound = true;
                    }
           			
            	}
                
            }
            
        }
        
    }
    
}