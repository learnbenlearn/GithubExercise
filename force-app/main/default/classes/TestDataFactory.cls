@isTest
public class TestDataFactory {
    
    public static List<Opportunity> createOpportunity(Integer n, Date testDate, String name)
    {
        List<Opportunity> newOpps = new List<Opportunity>();
        
        for (Integer i = 0; i < n; i++)
        {
            Opportunity o = new Opportunity();
            o.name = name + i;
            o.stageName = 'New';
            o.closeDate = testDate;
            newOpps.add(o);
        }
        
        return newOpps;
    }

}