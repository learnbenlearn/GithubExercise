public class ExampleDML {
    public static void ExampleDMLInsert(){
        //Vehicle object
        vehicle__c memphisVan = new vehicle__c();
        
        //Frist Distribution Center Object
        distribution_center__c memphisCenter = new distribution_center__c(name = 'Memphis Distribution Center',
                                                                          City__c = 'Memphis',
                                                                          Max_number_of_vehicles__c = 25,
                                                                          State__c = 'TN',
                                                                          States_covered__c = 'AR; MS; TN',
                                                                          Street__c = '3460 Poplar Ave',
                                                                          zip_code__c = '38111');
        //Second Distribution Center Object
        distribution_center__c dallasCenter = new distribution_center__c(name = 'Dallas Distribution Center',
                                                                         city__c = 'Dallas',
                                                                         max_number_of_vehicles__c = 20,
                                                                         state__c = 'TX',
                                                                         states_covered__c = 'OK; TX',
                                                                         street__c = '39579 Lyndon B Johnson Freeway',
                                                                         zip_code__c = '75237');
        //Passes object memphisVan to the database
        insert memphisVan;
        
        //passes objects memphisCenter and dallasCenter
        insert memphisCenter;
        insert dallasCenter;
        
        // adds the first vehicle to vehicle schedule list vSchedules
        List<Vehicle_Schedule__c> vSchedules = new List<Vehicle_Schedule__c>();
        Vehicle_Schedule__c vehicleSchedule1 = new Vehicle_Schedule__c(Distribution_Center__c = memphisCenter.Id,
                                                                     Name = 'Memphis Schedule One',
                                                                     Vehicle__c = memphisVan.Id);
        vSchedules.add(vehicleSchedule1);
        
        //adds the second vehicle schedule to the vevhicle schedule list vSchedules
        Vehicle_Schedule__c vehicleSchedule2 = new Vehicle_Schedule__c(Distribution_Center__c = dallasCenter.Id,
                                                                     Name = 'Dallas Schedule One');
        vSchedules.add(vehicleSchedule2);
        
        
        
        //work in progress
            
            
        List<Database.SaveResult> lsr = Database.insert(vSchedules, false);
        //Boolean isSuccess; //Boolean to store the Success status
        
        for(Database.SaveResult sr : lsr){
            
            //assigns the isSuccess variable's value
            //isSuccess = Database.SaveResult.isSuccess();
            
            if(sr.isSuccess() == true){
                //Error list returned from database
                List<Database.Error> errorList = sr.getErrors();
                
                for(Database.Error err : errorList){
                    
                    System.debug(err.getMessage());
                    
                }
            }
        }
			
        //end work in progress
    }
}