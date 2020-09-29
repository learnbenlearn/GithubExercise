trigger MailTrigger on Mail__c (before update, before insert, before delete, after insert, after update, after delete, after undelete) {
    switch on Trigger.operationType {
        when AFTER_DELETE{
            
        }
        when AFTER_UNDELETE{
            
        }
        when AFTER_INSERT{
            
        }
        when AFTER_UPDATE{
            
        }
        when BEFORE_INSERT{
            
        }
        when BEFORE_UPDATE{
            MailTriggerHandler.checkApprovalLock(Trigger.new);
        }
        when BEFORE_DELETE{
             MailTriggerHandler.checkDateIfMissing(Trigger.new);
        }
    }	
}