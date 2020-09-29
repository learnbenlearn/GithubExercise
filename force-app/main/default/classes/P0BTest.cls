@isTest
private class P0BTest {
    
    @TestSetup
    static void MakeData(){
        Date testCloseDate = Date.newInstance(2011, 1, 1);
        Opportunity o = new Opportunity();
        o.name = 'test';
        o.StageName = 'New';
        o.CloseDate = testCloseDate;
        insert o;
    }
    
    @isTest
    public static void nFibonacciTest() {
        
        system.assertEquals(55, P0B.nFibonacci(10));
        system.assertEquals(1, P0B.nFibonacci(1));
        system.assertEquals(1, P0B.nFibonacci(2));
        system.assertEquals(0, P0B.nFibonacci(0));
    }
    
    @isTest
    public static void testPastDueOpps() {
        P0B.closePastDueOpportunities();
        Opportunity testOpp = [SELECT name, stageName FROM Opportunity WHERE name LIKE 'testOpp%' LIMIT 1];
        System.assertEquals('Closed Lost', testOpp.StageName);
    }
    
    @isTest
    public static void nFibonacciNegativetest(){
        boolean errorCaught = false;
        try{
            P0B.nFibonacci(-3);
        }catch(nFibonacciException e){
            system.debug(e.getMessage());
            errorCaught = true;
        }
        system.assert(errorCaught);
    }

}