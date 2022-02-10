trigger UpdateSFId on Lead (before update) {
    Set<String> sfIdSet = new Set<String>();
    Map<String,String> sfoldNew= new  Map<String,String>();
    for(Lead ld : Trigger.New){
        if(ld.SFId__c != Trigger.oldMap.get(ld.Id).SFId__c){
            sfIdSet.add(Trigger.oldMap.get(ld.Id).SFId__c);
            sfoldNew.put(Trigger.oldMap.get(ld.Id).SFId__c, ld.SFId__c);
        }
    }
    if(sfIdSet.size()>0){
        List<Account> acList =[select SFId__c from Account where SFId__c IN:sfIdSet];
        for(Account ac : acList){
            if(sfoldNew.containsKey(ac.SFId__c))
                ac.SFId__c=sfoldNew.get(ac.SFId__c);
        }
        if(acList.size()>0){
            update acList;
        }
    }
    
    List<Candidate__c> canList =[select SFId__c from Candidate__c where SFId__c IN:sfIdSet];
    for(Candidate__c can : canList){
        if(sfoldNew.containsKey(can.SFId__c))
            can.SFId__c=sfoldNew.get(can.SFId__c);
    }
    if(canList.size()>0){
        
        update canList;
    }
    
}