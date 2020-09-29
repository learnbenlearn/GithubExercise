trigger ContactAcctTrigger on Contact (before insert, before update)
{   /*   
    //Grab a list of accounts
    List<Account> accs = [SELECT Id, BillingAddress, ShippingAddress, Phone FROM Account];
    
    //loop through the trigger.new contacts
    for (Contact c : trigger.new)
    {
        //if Account id field is blank, check if an account exists with any of the address (Shipping or billing) or phone info
        if (String.isblank(c.AccountId))
        {
            for (Account a : accs)
            {
                if ((c.MailingAddress == a.ShippingAddress) || (c.MailingAddress == a.BillingAddress) || (c.Phone == a.Phone))
                {
                    c.AccountId = a.Id;
                    break;
                }
            }
        }
        
    }
    */
}