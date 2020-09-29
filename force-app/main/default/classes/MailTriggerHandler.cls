public class MailTriggerHandler {
    public static void CheckApprovalLock(List<Mail__c> appList){
        for(Mail__c i: appList) {
            if(Approval.isLocked(i.Name)){
                i.addError('Record is locked.');
            }
    	}
    }
    
    public static void CheckDateIfMissing(List<Mail__c> mailList){
        for(Mail__c m : mailList){
            if(m.Missing__c == true && m.CreatedDate.addDays(730) >= Date.today()) {
                m.addError('Records must be maintained for missing mail for no less than two years.');
            }
        }
    }
}