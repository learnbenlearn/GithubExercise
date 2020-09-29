trigger MailTrigger on Mail__c (before update, before delete, after insert, after update, after delete, after undelete) {

    Switch on trigger.operationType {
        when AFTER_DELETE {
            
        }
        when AFTER_INSERT {
            
        }
        when AFTER_UNDELETE {
            
        }
        when AFTER_UPDATE {
            
        }
        when BEFORE_DELETE {
            MailTriggerHandler.CheckDateIfMissing(trigger.new);
        }
        when BEFORE_INSERT{
            
        }
        when BEFORE_UPDATE{
            MailTriggerHandler.CheckApprovalLock(trigger.new);
        }
    }
}