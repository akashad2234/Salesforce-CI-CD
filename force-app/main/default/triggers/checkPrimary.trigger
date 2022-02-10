trigger checkPrimary on Contact (before insert, before update) {

    if(Trigger.isBefore && Trigger.isInsert){
        checkPrimaryHandler.preventPrimaryContactInsert(trigger.new);
    }
}