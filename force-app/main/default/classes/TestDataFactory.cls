@isTest
public class TestDataFactory {
    public static List<Opportunity> createOpportunity(Integer n, date testDate, string name){
        List<Opportunity> newOpps = new List<Opportunity>();
        for(Integer i = 0 ; i < n ; i++){
            Opportunity o = new Opportunity();
            o.name = name+i;
            o.stageName = 'New';
            o.closeDate = testDate;
            newOpps.add(o);
        }
        return newOpps;
    }
    public static List<Lead> createLead(Integer n, string state, string name){
        List<Lead> newLeads = new List<Lead>();
        for(integer i = 0 ; i < n ; i++){
            Lead l = new Lead();
            l.LastName = name+i;
            l.Company = name+i;
            l.State = state;
            newLeads.add(l);
        }
        return newLeads;
    }
    public static List<Account> createAccount(Integer n, string name, Integer numEmployees){
        List<Account> newAccounts = new List<Account>();
        for(Integer i = 0 ; i < n ; i++){
            Account a = new Account();
            a.Name = name+i;
            a.NumberOfEmployees = numEmployees;
        }
        return newAccounts;
    }
}