public class ContactTriggerHandler {
    public static void matchAccount(List<Contact> c){
        List<String> listOfStreets = new List<String>();
        List<String> listOfCities = new List<String>();
        List<String> listOfStates = new List<String>();
        List<String> listOfZips = new List<String>();
        system.debug('Trigger Activated');
        for(Contact co : c){
            if(co.AccountId == null){
                String newStreet = co.MailingStreet;
                String newCity = co.MailingCity;
                String newState = co.MailingState;
                String newZip = co.MailingPostalCode;
                listOfStreets.add(newStreet);
                listOfCities.add(newCity);
                listOfStates.add(newState);
                listOfZips.add(newZip);
                system.debug('Contact Noted');
            }
        }
        List<Account> accountsToMatch= [SELECT Name, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode FROM Account WHERE ShippingStreet IN :listOfStreets AND ShippingCity IN :listOfCities AND ShippingState IN :listOfStates AND ShippingPostalCode IN :listOfZips];
        //List<Account> accountsToMatch= [SELECT Name, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingAddress FROM Account 
        //                                WHERE ShippingStreet IN :listOfStreets AND ShippingCity IN :listOfCities];
        system.debug('Accounts to match: '+accountsToMatch.size());
        for(Contact co : c){
        	for(Account a : accountsToMatch){
                system.debug('Account Loaded');
                if(a.ShippingStreet == co.MailingStreet && a.ShippingCity == co.MailingCity && a.ShippingState == co.MailingState && co.AccountId == null){
                    co.AccountId = a.Id;
                    system.debug('Account Matched');
                }
            } 
        }
        system.debug('Trigger Concluded.');
    }
}