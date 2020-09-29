@isTest
private class ContactTriggerTester {
    @TestSetup
    static void makeData(){
        Contact addressToMatch = new Contact();
        Account matchedAddress = new Account();
        Contact noAddressToMatch = new Contact();
        insert matchedAddress;
        insert addressToMatch;
        insert noAddressToMatch;
    }
    @isTest
    public static void positiveTest(){
        Contact addressToMatch = [SELECT name, mailingaddress, accountId FROM Contact WHERE name='addressToMatch'];
        Account matchedAddress = [SELECT name, shippingaddress, Id FROM Account WHERE name='matchedAddress'];
        system.assertEquals(matchedAddress.Id, addressToMatch.AccountId);
    }
    @isTest
    public static void negativeTest(){
        Contact noAddressToMatch = [SELECT name, mailingaddress, accountId FROM Contact WHERE name='noAddressToMatch'];
        system.assertEquals(null, noAddressToMatch.AccountId);
    }
}