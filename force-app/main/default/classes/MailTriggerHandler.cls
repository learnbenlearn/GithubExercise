public class MailTriggerHandler {
	
    public static void checkApprovalLock(List<Mail__c> appList){
        
        for(mail__c m : appList){
            
            if(approval.isLocked(m.id)){
                
                m.addError('Record is Locked');
                
            }
            
        }
        
    }
    
    public static void checkDateIfMissing(List<Mail__c> mailList){
        
        for(Mail__c m : mailList){
            
            if(m.missing__c == true && m.CreatedDate.addDays(730) >= Date.today()){
                
                m.AddError('Records must be maintained for missing mail for no less than two years.');
                
            }
            
        }
        
    }
    
}