public class ExampleSOQL {

    public static void ExampleSOQLQueries() {
        List<Distribution_Center__c> distributionCenters = [
            SELECT 
            Name, 
            Current_Number_of_Vehicles__c,
            States_Covered__c 
            FROM
            Distribution_Center__c
            WHERE Current_Number_Of_Vehicles__c > 5
        ];
        
        for (Distribution_Center__c dc : distributionCenters){
            System.debug('Name: ' + 
                         dc.Name + ' | ' +
                         ' Number of vehicles: ' +
                        dc.Current_Number_of_Vehicles__c);
        }
    
    	List<Vehicle_Schedule__c> vehicleSchedules = [SELECT 
                                                  	  Distribution_Center__r.Name, 
                                                  	  Vehicle__r.Number_of_Packages__c 
                                                  	  FROM Vehicle_Schedule__c];
    	
        System.debug(vehicleSchedules.size());
        
    	for (Vehicle_Schedule__c vs : vehicleSchedules){
			System.debug('Distribution Center ' + 
                    vs.Distribution_Center__r.Name + ' | ' +
                    ' Number of Packages ' +
                    vs.Vehicle__r.Number_of_Packages__c);
        }
        
        List<AggregateResult> centerPackages = [SELECT 
                                                Distribution_Center__r.Name dc, 
                                                SUM(Vehicle__r.Number_of_Packages__c)totalPackages  
                                                FROM Vehicle_Schedule__c
                                                GROUP BY Distribution_Center__r.Name
                                               ];
         
        for (AggregateResult cp : centerPackages) {
            System.debug('Center Name : ' + 
                         cp.get('dc') + 
                         ' | Number of Packages : ' +
                         cp.get('totalPackages'));
        }
        
        try{
        Vehicle__c vehicle = [SELECT 
                              Number_of_Packages__c,
                              Last_Departure__c 
                              FROM Vehicle__c
                              WHERE Last_Departure__c < LAST_MONTH
                              LIMIT 1
                             ];
        }
        catch(System.QueryException qe){
            System.debug(qe.getMessage());
        }

    }
    
}