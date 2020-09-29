trigger ContactTrigger on Contact (before insert) {
    ContactTriggerHandler.matchAccount(Trigger.New);
}