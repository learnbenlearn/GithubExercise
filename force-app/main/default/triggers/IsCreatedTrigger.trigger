trigger IsCreatedTrigger on Contact (after insert) {
	
    IsCreatedTriggerHandler.checkIfAccountExists(trigger.new);
    
}