trigger AccountTestTrigger on Account (before insert,before update) {
    
    if(Trigger.isInsert)
    {
        if(Trigger.isBefore){
            AccountTestTriggerHandler.CopyBillingToShipping(Trigger.New);
           
        }
    }
     if(Trigger.isUpdate)
    {
        if(Trigger.isBefore){
            AccountTestTriggerHandler.CopyBillingToShipping(Trigger.New);
        }
    }

}