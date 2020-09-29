public class MailTriggerHandler {
    public static void checkApprovalLock(List<Mail__c> appList){
        for( Mail__c i : appList){
            if(approval.isLocked(i.Id)){
               i.addError('Record is locked');
            }
        }
    }
    public static void checkDateIfMissing(List<Mail__c> mailList){
        for(Mail__c m : mailList){
            if(m.Missing__c == true && m.createdDate.addDays(730) >= Date.today()){
                m.addError('Records must be maintained for missing mail for no less than two years');
            }
        }
    }
}