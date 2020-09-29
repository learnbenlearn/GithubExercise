public class ExampleSOQL {

    public static void ExampleSOQLQueries(){
        List<Distribution_Center__c> distributionCenters = [SELECT Name, Current_Number_of_Vehicles__c, States_Covered__c FROM Distribution_Center__c WHERE Current_Number_of_Vehicles__c > 5];
        
        for (Distribution_Center__c dc: distributionCenters){
            system.debug('Name: ' + dc.Name +' '+'Current Number of Vehicles: '+ dc.Current_Number_of_Vehicles__c);
        }
    }
}