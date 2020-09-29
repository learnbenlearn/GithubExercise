@isTest
private class P0BTest {
    /* Part 2
    @TestSetup
    static void MakeData(){
        Date testCloseDate = Date.newInstance(2011,1,1);
        Opportunity o = new Opportunity();
        o.name = 'test';
        o.StageName = 'New';
        o.CloseDate = testCloseDate;
        insert o;
    }
*/
    @TestSetup//Part 3
    static void MakeData(){
        List<Opportunity> newOpps = TestDataFactory.createOpportunity(10, Date.NewInstance(2011,1,1), 'testOpp');
        List<Opportunity> newerOpps = TestDataFactory.createOpportunity(10, Date.NewInstance(2021,1,1), 'testNewOpp');
        insert newOpps;
        insert newerOpps;
        List<Lead> newCALeads = TestDataFactory.createLead(10, 'CA', 'testLead');
        List<Lead> newOtherLeads = TestDataFactory.createLead(10, 'SC', 'testNotLead');
        insert newCALeads;
        insert newOtherLeads;
        List<Account> newSmallAccounts = TestDataFactory.createAccount(10, 'testSmallAccounts', 500);
        List<Account> newMedAccounts = TestDataFactory.createAccount(10, 'testMedAccounts', 5000);
        List<Account> newLargeAccounts = TestDataFactory.createAccount(10, 'testLargeAccounts', 50000);
        insert newSmallAccounts;
        insert newMedAccounts;
        insert newLargeAccounts;
    }
    @isTest
    public static void nFibonacciTest(){
        system.assertEquals(55, P0B.nFibonacci(10));
        system.assertEquals(1, P0B.nFibonacci(1));
        system.assertEquals(1, P0B.nFibonacci(2));
        system.assertEquals(0, P0B.nFibonacci(0));
    }
    @isTest
    public static void testPastDueOpps(){
        P0B.closePastDueOpportunities();
        Opportunity testOpp = [SELECT name, stageName FROM Opportunity WHERE name LIKE 'testOpp%' LIMIT 1];
        Opportunity testOppNew = [SELECT name, stageName FROM Opportunity WHERE name LIKE 'testNewOpp%' LIMIT 1];
        System.assertEquals('Closed Lost', testOpp.StageName);
        System.assertNotEquals('Closed Lost', testOppNew.StageName);
    }
    @isTest
    public static void testCALeads(){
        P0B.updateCALeads();
        Lead testLead = [SELECT name, state, status FROM Lead WHERE name LIKE 'testLead%' LIMIT 1];
        Lead testLeadNot = [SELECT name, state, status FROM Lead WHERE name LIKE 'testNotLead%' LIMIT 1];
        System.assertEquals('Closed - Not Converted', testLead.Status);
        System.assertNotEquals('Closed - Not Converted', testLeadNot.Status);
    }
    @isTest
    public static void testAccsSize(){
        //Non-Functional, throws exception saying no rows for the testAccsSmall SObject, even when searching for names like the names they are given in the makeData. 
        P0B.updateAccountSize();
        Account testAccsSmall = [SELECT Name, Size__c, NumberOfEmployees FROM Account WHERE NumberOfEmployees=500 LIMIT 1];
        Account testAccsMed = [SELECT Name, Size__c, NumberOfEmployees FROM Account WHERE NumberOfEmployees=5000 LIMIT 1];
        Account testAccsLarge = [SELECT Name, Size__c, NumberOfEmployees FROM Account WHERE NumberOfEmployees=50000 LIMIT 1];
        System.assertEquals('Small', testAccsSmall.Size__c);
        System.assertEquals('Medium', testAccsMed.Size__c);
        System.assertEquals('Large', testAccsLarge.Size__c);
    }
    @isTest
    public static void nFibonacciNegativeTest(){
        system.assertNotEquals(10, P0B.nFibonacci(10));
        system.assertNotEquals(0,P0B.nFibonacci(1));
        Boolean errorCaught = false;
    	try{
        	P0B.nFibonacci(-3);
    	}catch(nFibonacciException e){
        	system.debug(e.getMessage());
        	errorCaught = true;
    	}
    	system.assert(errorCaught);
    }
    /*
    @isTest
    public static void sortListTest(){
        List<Integer> answer = new List<Integer>{1,2,3,4,5,6,7,8,9,10};
        List<Integer> toSort = new List<Integer>{10,9,};
        system.assertEquals(answer, P0B.sortList({10,9,8,7,6,5,4,3,2,1}));
    }
*/
}