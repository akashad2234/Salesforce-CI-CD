trigger contactPrimaryInsert on Contact (before insert,before update) {
    
    if(Trigger.isBefore && Trigger.isInsert){
        PrimaryConInAccTriggerHandler.InsertPrimaryContact(trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
   PrimaryConInAccTriggerHandler.updatePrimaryContact(trigger.new);
    }
}