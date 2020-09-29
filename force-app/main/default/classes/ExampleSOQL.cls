public class ExampleSOQL
{
    
    public static void ExampleSOQLQueries()
    {
        List<Distribution_Center__c> distributionCenters = [SELECT Name, Current_Number_of_Vehicles__c, States_Covered__c FROM Distribution_Center__c
                                                            WHERE Current_Number_of_Vehicles__c > 5];
        for (Distribution_Center__c dc : distributionCenters)
        {
            system.debug('Center Name: ' + dc.Name + '; Current Number of Vehicles: ' + dc.Current_Number_of_Vehicles__c);
        }
        
        /*//SOQL and Exceptions Ex2 Steps 1 and 2
        List<Vehicle_Schedule__c> vehicleSchedules = [SELECT Vehicle__r.Number_of_Packages__c, Distribution_Center__r.Name FROM Vehicle_Schedule__c];
        
        for (Vehicle_Schedule__c vc : vehicleSchedules)
        {
            system.debug('Number of Packages: ' + vc.Vehicle__r.Number_of_Packages__c + '; Center Name: ' + vc.Distribution_Center__r.Name);
        }*/
        
        //SOQL and Exceptions Ex2 Steps 3 and 4
        List<AggregateResult> centerPackages = [SELECT SUM(Vehicle__r.Number_of_Packages__c)totalPackages, Distribution_Center__r.Name FROM Vehicle_Schedule__c
                                                GROUP BY Distribution_Center__r.Name];
        
        for (AggregateResult cp : centerPackages)
        {
            system.debug(cp);
        }
        
        //SOQL and Exceptions Ex3
        Vehicle__c vehicle = [SELECT Number_of_Packages__c, Last_Departure__c FROM Vehicle__c WHERE Last_Departure__c = LAST_MONTH LIMIT 1];
    }

}