trigger PrimaryContactUpdateTriggerHandler on Contact (before insert,before update) {
    
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate) {
            PrimaryContactUpdateHandler.PrimaryContactUpdate();
        }            
        
    }
}