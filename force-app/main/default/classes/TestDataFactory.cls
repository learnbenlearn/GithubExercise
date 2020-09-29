@isTest
public class TestDataFactory {
	
    
    public static List<Opportunity> CreateOpportuity(Integer n, date testDate, String name){
        
        List<Opportunity> newOpps = new List<Opportunity>();
        for(Integer i = 0; i < n; i++){
            
            Opportunity o = new Opportunity();
            o.Name = name+i;
            o.StageName = 'New';
            o.CloseDate = testDate;
            newOpps.add(o);
            
        }
        
        return newOpps;
        
    }
    
    @TestSetup
    static void makeData(){
        
        List<Opportunity> newOpps = TestDataFactory.CreateOpportuity(10, Date.newInstance(2011, 1, 1), 'testOpp');
        insert newOpps;
        
    }
    
}