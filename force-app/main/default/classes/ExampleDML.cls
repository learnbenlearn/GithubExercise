public class ExampleDML {
    public static void ExampleDMLInsert() {
        Vehicle__c memphisVan = new Vehicle__c();
        Distribution_Center__c memphisCenter = new Distribution_Center__c();
        memphisCenter.Name = 'Memphis Distribution Center';
        memphisCenter.City__c = 'Memphis';
        memphisCenter.Max_Number_of_Vehicles__c = 25;
        memphisCenter.State__c = 'TN';
        memphisCenter.States_Covered__c = 'AR;MS;TN';
        memphisCenter.Street__c = '3460 Poplar Ave';
        memphisCenter.Zip_Code__c = '38111';
        Distribution_Center__c dallasCenter = new Distribution_Center__c();
        dallasCenter.Name = 'Dallas Distribution Center';
        dallasCenter.City__c = 'Dallas';
        dallasCenter.Max_Number_of_Vehicles__c = 20;
        dallasCenter.State__c = 'TX';
        dallasCenter.States_Covered__c = 'OK;TX';
        dallasCenter.Street__c = '39579 Lyndon B Johnson Freeway';
        dallasCenter.Zip_Code__c = '75237';
        insert memphisVan;
        insert memphisCenter;
        insert dallasCenter;
        
        List<Vehicle_Schedule__c> vSchedules = new List<Vehicle_Schedule__c>();
        vSchedules.add(new Vehicle_Schedule__c(Distribution_Center__c=memphisCenter.Id, Name='Memphis Schedule One', Vehicle__c=memphisVan.Id));
        vSchedules.add(new Vehicle_Schedule__c(Distribution_Center__c=dallasCenter.Id, Name='Dallas Schedule One'));
        insert vSchedules;
    }
    
    public static void ExampleDMLInsert2() {
        Vehicle__c memphisVan = new Vehicle__c();
        Distribution_Center__c memphisCenter = new Distribution_Center__c();
        memphisCenter.Name = 'Memphis Distribution Center';
        memphisCenter.City__c = 'Memphis';
        memphisCenter.Max_Number_of_Vehicles__c = 25;
        memphisCenter.State__c = 'TN';
        memphisCenter.States_Covered__c = 'AR;MS;TN';
        memphisCenter.Street__c = '3460 Poplar Ave';
        memphisCenter.Zip_Code__c = '38111';
        Distribution_Center__c dallasCenter = new Distribution_Center__c();
        dallasCenter.Name = 'Dallas Distribution Center';
        dallasCenter.City__c = 'Dallas';
        dallasCenter.Max_Number_of_Vehicles__c = 20;
        dallasCenter.State__c = 'TX';
        dallasCenter.States_Covered__c = 'OK;TX';
        dallasCenter.Street__c = '39579 Lyndon B Johnson Freeway';
        dallasCenter.Zip_Code__c = '75237';
        insert memphisVan;
        insert memphisCenter;
        insert dallasCenter;
        
        List<Vehicle_Schedule__c> vSchedules = new List<Vehicle_Schedule__c>();
        vSchedules.add(new Vehicle_Schedule__c(Distribution_Center__c=memphisCenter.Id, Name='Memphis Schedule One', Vehicle__c=memphisVan.Id));
        vSchedules.add(new Vehicle_Schedule__c(Distribution_Center__c=dallasCenter.Id, Name='Dallas Schedule One'));
        
        List<Database.SaveResult> lsr = Database.insert(vSchedules, false);
        for(Database.SaveResult sr : lsr) {
            if(!sr.isSuccess()) {
                for(Database.Error err : sr.getErrors()) {
                    system.debug(err.getMessage());
                }
            }
        }
    }
}