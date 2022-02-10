trigger recursiveTrigger on Contact (before insert) {
    if(Trigger.isInsert && Trigger.isBefore && recursiveHandler.isFirst)
    {
        recursiveHandler.isFirst=false;
        recursiveHandler.insertHandler(Trigger.New);
    }

}