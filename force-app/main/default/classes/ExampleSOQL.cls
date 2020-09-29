public class ExampleSOQL {
    public static void ExampleSOQLQueries() {
        List<Distribution_Center__c> distributionCenters = [SELECT Name, Current_Number_of_Vehicles__c,
                                                            States_Covered__c FROM Distribution_Center__c
                                                            WHERE Current_Number_of_Vehicles__c > 5];
    
        for(Distribution_Center__c dc : distributionCenters) {
            System.debug(dc.Name + ' ' + dc.Current_Number_of_Vehicles__c);
        }
        
        List<AggregateResult> centerPackages = [SELECT SUM(Vehicle__r.Number_of_Packages__c)totalPackages 
                                                FROM Vehicle_Schedule__c
                                                GROUP BY Distribution_Center__r.Name];
        for(AggregateResult cp : centerPackages) {
            System.debug(cp.get('totalPackages'));
        }
    }
}