public class ExampleSOQL {
	
    public static void ExampleSOQLQueries(){
        List<Distribution_Center__c> distributionCenters = [SELECT Name, States_Covered__c, Current_Number_of_Vehicles__c
                                                           		FROM Distribution_Center__c WHERE Current_Number_of_Vehicles__c > 5];
        for(Distribution_Center__c dc : distributionCenters){
            system.debug(dc.Name + ' ' + dc.Current_Number_of_Vehicles__c);
        }
        
        //Part 2
        
        List<Vehicle_Schedule__c> vehicleSchedules = [
            SELECT Vehicle__r.Number_of_Packages__c, Distribution_Center__r.Name
            FROM Vehicle_Schedule__c];
		
		system.debug(vehicleSchedules);
        
        
        List<AggregateResult> centerPackages = [
            SELECT Distribution_Center__r.Name, SUM(Vehicle__r.Number_of_Packages__c) totalPackages
            FROM Vehicle_Schedule__c GROUP BY Distribution_Center__r.Name];
        
        for(AggregateResult cp : centerPackages){
            //system.debug(cp.get('Name') + cp.get('Number_of_Packages__c'));
        }
    }
}