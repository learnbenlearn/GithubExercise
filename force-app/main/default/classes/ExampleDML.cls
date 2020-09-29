public class ExampleDML {
    
    public static void ExampleDMLInsert(){
        
        Vehicle__c memphisVan = new Vehicle__c();
        
        List<Database.SaveResult> Isr = new List<Database.SaveResult>();
        
        Distribution_Center__c memphisCenter = new Distribution_Center__c(
        	Name = 'Memphis Distribution Center',
        	City__c = 'Memphis',
        	Max_Number_of_Vehicles__c = 25,
        	State__c = 'TN',
        	States_Covered__c = 'AR;MS;TN',
        	Street__c = '3460 Poplar Ave',
        	Zip_Code__c ='38111');
        
        Distribution_Center__c dallasCenter = new Distribution_Center__c(
        	Name = 'Dallas Distribution Center',
        	City__c = 'Dallas',
        	Max_Number_of_Vehicles__c = 20,
        	State__c = 'TX',
        	States_Covered__c = 'OK;TX',
        	Street__c = '39579 Lyndon B Johnson Freeway',
        	Zip_Code__c ='75237');
        
        //insert objects  NOTE: commented out to avoid duplicates
        Insert memphisVan;
        Insert memphisCenter;
        Insert dallasCenter;
        
        //create lists
        List<Vehicle_Schedule__c> vSchedules = new List<Vehicle_Schedule__c>();
        vSchedules.add(new Vehicle_Schedule__c(
        	Distribution_Center__c = memphisCenter.Id,
        	Name = 'Memphis Schedule One',
        	Vehicle__c = memphisVan.Id));
        
        vSchedules.add(new Vehicle_Schedule__c(
        	Distribution_Center__c = dallasCenter.Id,
        	Name = 'Dallas Schedule One'));
        
        //insert lists
        //Insert vSchedules;
        Isr = Database.insert(vSchedules, false);
        
        //iterate through list
        for(Database.SaveResult sr : Isr){
            if(!sr.isSuccess()){
                for(Database.Error err : sr.getErrors()){
                    //log error
                    system.debug(err.getMessage());
                }
            }
        }
    }
}