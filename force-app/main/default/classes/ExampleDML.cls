public class ExampleDML {
    public static void ExampleDMLInsert(){
        Vehicle__c memphisVan = new Vehicle__C();
        Distribution_Center__c memphisCenter = new Distribution_Center__c(Name='Memphis Distribution Center', City__c='Memphis',Max_Number_of_Vehicles__c = 25, State__c = 'TN',States_Covered__c='AR;MS;TN', Street__c='3460 Poplar Ave', Zip_Code__c = '38111');
        Distribution_Center__c dallasCenter = new Distribution_Center__c(Name='Dallas Distribution Center', City__c='Dallas',Max_Number_of_Vehicles__c = 20, State__c = 'TX',States_Covered__c='OK;TX', Street__c='39579 LBJ Freeway', Zip_Code__c = '75237');
        insert memphisVan;
        insert memphisCenter;
        insert dallasCenter;
        List<Vehicle_Schedule__c> vSchedule = new List<Vehicle_Schedule__c>();
        vSchedule.add(new Vehicle_Schedule__c(Distribution_Center__c=memphisCenter.Id, Name = 'Memphis Schedule One',Vehicle__c=memphisVan.Id));
        vSchedule.add(new Vehicle_Schedule__c(Distribution_Center__c=dallasCenter.Id, Name = 'Dallas Schedule One'));
        List<Database.SaveResult> lsr = new List<Database.SaveResult>();
        lsr = Database.insert(vSchedule, false);
        for(Database.SaveResult sr : lsr){
            //system.debug("result: err.getMessage());
            if(!sr.isSuccess()){
                for(Database.Error err : sr.getErrors()){
                    system.debug(err.getMessage());
                }
            }
        }
    }
}