public class ExampleSOQL {
    public static void ExampleSOQLQueries(){
        List<Distribution_Center__c> distributionCenters = [SELECT Name, Current_Number_of_Vehicles__c, States_Covered__c FROM Distribution_Center__c WHERE Current_Number_of_Vehicles__c>5];
        for(Distribution_Center__c dc : distributionCenters){
            System.debug(dc.Name + ' has ' + dc.Current_Number_of_Vehicles__c + ' vehicles.');
        }
        //List<Vehicle_Schedule__c> vehicleSchedules = [SELECT Vehicle__r.Number_of_Packages__c, Distribution_Center__r.Name FROM Vehicle_Schedule__c];
        //system.debug(vehicleSchedules);
        List<AggregateResult> centerPackages = [SELECT sum(Vehicle__r.Number_of_Packages__c)totalPackages, Distribution_Center__r.Name FROM Vehicle_Schedule__c GROUP BY Distribution_Center__r.Name];
        for(AggregateResult cp : centerPackages){
            system.debug(cp.get('Name') + ' has ' + cp.get('totalPackages') + ' packages.');
        }
        try{
        	Vehicle__c vehicle = [SELECT Number_of_Packages__c, Last_Departure__c FROM Vehicle__c WHERE Last_Departure__c = LAST_MONTH LIMIT 1];
        }catch(System.QueryException qe){
            system.debug(qe.getMessage());
        }
    }

}