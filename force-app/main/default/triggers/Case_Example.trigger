trigger Case_Example on Case (before insert) {

Capital__c cap =Capital__c.getInstance(Userinfo.getUserId());
    if(cap.flag__c==true){
        for(Case cs:Trigger.New)
        {
            cs.subject='Updated From Trigger';
        }
    }

}