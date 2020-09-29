@isTest
public class P0BTest {
    
    @TestSetup
    static void MakeData()
    {
        List<Opportunity> newOpps = TestDataFactory.createOpportunity(10, Date.NewInstance(2011, 1, 1), 'testOpp');
        insert newOpps;
    }
    
    @isTest
    public static void nFibonacciTest() 
    {
        system.assertEquals(55, P0B.nFibonacci(10));
        system.assertEquals(1, P0B.nFibonacci(2));
        system.assertEquals(1, P0B.nFibonacci(1));
        system.assertEquals(0, P0B.nFibonacci(0));
    }
    
    @isTest
    public static void nFibonacciNegativeTest() 
    {
        system.assertEquals(55, P0B.nFibonacci(10));
        system.assertEquals(1, P0B.nFibonacci(2));
        system.assertEquals(1, P0B.nFibonacci(1));
        system.assertEquals(0, P0B.nFibonacci(0));
    }
    
    @isTest
    public static void testPastDueOpps()
    {
        P0B.closePAstDueOpportunities();
        Opportunity testOpp = [SELECT Name, stageName FROM Opportunity WHERE Name LIKE 'testOpp%' LIMIT 1];
        
        system.assertEquals('Closed Lost', testOpp.stageName);
    }

}