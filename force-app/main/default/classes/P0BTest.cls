@isTest
public class P0BTest {
	
    @isTest
    public static void nFibonacciTest(){
        
        System.assertEquals(55, p0b.nFibonacci(10));
        System.assertEquals(1, p0b.nFibonacci(1));
        System.assertEquals(1, p0b.nFibonacci(2));
        System.assertEquals(0, p0b.nFibonacci(0));
        
    }
    
    @isTest
    public static void nFactorialTest(){
        
        System.assertEquals(1, p0b.nFactorial(0));
        System.assertEquals(1, p0b.nFactorial(1));
        System.assertEquals(6, p0b.nFactorial(3));
        
    }
    
    @isTest
    public static void nFibonacciNegativeTest(){
        
        boolean errorCaught = false;
        try{
            P0B.nFibonacci(-3);
        }
        catch(nFibonacciException e){
            system.debug(e.getMessage());
            errorCaught = true;
        }
        System.assert(errorCaught);
        
    }
    
    @isTest
    public static void sortListTest(){
        
        System.assertEquals(new List<Integer> {1, 1, 2, 3, 4, 5},
                            p0b.sortList(new List<Integer>{2, 4, 5, 1, 3, 1}));
        
        System.assertEquals(new List<Integer> {1, 2, 3, 4, 5},
                            p0b.sortList(new List<Integer>{5, 4, 3, 2, 1}));
        
    }
    
    @isTest
    public static void rotateLeftNTimesTest(){
        
        System.assertEquals(new List<Integer>{2, 3, 4, 5, 1},
                            p0b.rotateLeftNTimes(new List<Integer>{1, 2, 3, 4, 5}, 1));
        System.assertEquals(new List<Integer>{2, 3, 4, 5, 1},
                            p0b.rotateLeftNTimes(new List<Integer>{1, 2, 3, 4, 5}, 6));
        System.assertEquals(new List<Integer>{4, 5, 1, 2, 3},
                            p0b.rotateLeftNTimes(new List<Integer>{1, 2, 3, 4, 5}, 3));
    }
    
    @isTest
    public static void bracketsAreBalancedTest(){
        
        //true cases
        System.assertEquals(true, P0B.bracketsAreBalanced('()'));
        System.assertEquals(true, P0B.bracketsAreBalanced('()()'));
        System.assertEquals(true, P0B.bracketsAreBalanced('(())'));
        System.assertEquals(true, P0B.bracketsAreBalanced('({[]})'));
        
        //false cases
        System.assertEquals(false, P0B.bracketsAreBalanced('('));
        System.assertEquals(false, P0B.bracketsAreBalanced(')'));
        System.assertEquals(false, P0B.bracketsAreBalanced('(()'));
        System.assertEquals(false, P0B.bracketsAreBalanced('([)]'));
        
    }
    
    /*
    @TestSetup
    static void makeData(){
        
        Date testCloseDate = Date.newInstance(2011, 1, 1);
        Opportunity o = new Opportunity();
        o.name = 'test';
        o.stageName = 'new';
        o.CloseDate = testCloseDate;
        insert o;
        
    }
	*/
    
    @TestSetup
    static void makeData(){
        
        //used to test pastDueOpps
        List<Opportunity> newOpps = TestDataFactory.CreateOpportuity(10, Date.newInstance(2011, 1, 1), 'testOpp');
        insert newOpps;
        
    }
    
    /*
    @isTest
    public static void testPastDueOpps(){
        
        P0B.closePastDueOpportunities();
        Opportunity testOpps = [SELECT name, stageName
                               FROM Opportunity
                               WHERE name LIKE 'test'
                               LIMIT 1];
        System.assertEquals('Closed Lost', testOpps.StageName);
        
    }
	*/
    
    @isTest
    public static void testUpdateCALeads(){
        
        P0B.updateCALeads();
        List<Lead> testLeads = [SELECT status, description, address
                                FROM LEAD
                                LIMIT 100];
        
        //I had an issue just retrieving the address state
        //this segment of code accounts for that
        Address LeadAddress;	//object to hold the Address
        Object AddressState;	//object to hold the Address State
        String addrState;	//String to hold the String value of AddressState
        
        
        for(Lead lead : testLeads){
            
            LeadAddress = lead.Address;			//sets LeadAddress Value
            AddressState = LeadAddress.getState();	//sets the value of AddressState
            addrState = String.valueOf(AddressState);	//sets the String Value of the Addresses State
            
            if(addrState.equals('CA')){
                
                System.assertEquals('We are no longer doing business in California.', lead.description);
                System.assertEquals('Closed - Not Converted', lead.Status);
            }
            
        }
        
    }
    
    @isTest
    public static void testUpdateAccountSize(){
        
        P0b.updateAccountSize();
        List<Account> Accounts = [SELECT NumberOfEmployees, size__c FROM Account LIMIT 100];
        
        for(Account acc : Accounts){
            if(acc.NumberofEmployees >= 1 &&
                acc.NumberofEmployees <= 1000){
                    
                System.assertEquals('small', acc.size__c);
                    
            }
            else if(acc.NumberofEmployees >= 1001 && 
                    acc.NumberofEmployees <= 10000){
            	
            	System.assertEquals('medium', acc.size__c);       
            
            }
            else{
                
                System.assertEquals('large', acc.size__c);
                
            }
        }
        
    }
    
    @isTest
    public static void testPastDueOpps(){
        
        P0B.closePastDueOpportunities();
        Opportunity testOpps = [SELECT name, stageName
                               FROM Opportunity
                               WHERE name LIKE 'testOpp%'
                               LIMIT 1];
        System.assertEquals('Closed Lost', testOpps.StageName);
        
    }
    
}