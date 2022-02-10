trigger AccConDelete on Account (before insert,before update,before delete ,after insert) {
    
    if(Trigger.isBefore){
         if(Trigger.isdelete){
                 AccConDelTriggerHandler.deleteRec(Trigger.old);
            }
      }

}