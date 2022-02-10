trigger SyncSourceDestinationTrigger on Account (After update) {
    if(Trigger.isAfter && Trigger.isUpdate){
       // Type sourceClass = Account.class;
        //Type destClass = Contact.class;
      //  String sourceObject=sourceClass.getName();
       // String destObject =destClass.getName();
        SyncSourceDestinationTriggerHandler.SyncSourceDestination('Account','Opportunity');
    }

}