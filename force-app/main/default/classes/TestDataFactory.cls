@isTest
public class TestDataFactory {
    
    @TestSetup
    static void MakeData(){
        List<opportunity> newOpps = TestDataFactory.createOpportunity(10, Date.newInstance(2011, 1, 1), 'testOpp');
        insert newOpps;
    }
    
    public static List<Opportunity> createOpportunity(Integer n, date testDate, String name) {
        List<Opportunity> newOpps = new List<Opportunity>();
        for(Integer i = 0; i < n; i++){
            Opportunity o = new Opportunity();
            o.name = name+i;
            o.StageName = 'New';
            o.CloseDate = testDate;
            newOpps.add(o);
        }
        return newOpps;
    }
    
    

}