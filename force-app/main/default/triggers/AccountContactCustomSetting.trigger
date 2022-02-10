trigger AccountContactCustomSetting on Account (After update) {
    Map<String , AccountContactUpdate__c> conUpdate =AccountContactUpdate__c.getAll();
    Map<String, String> srcDestMap = new Map<String, String>();
    set<Id> accountIds = new Set<Id>();
    for(String key : conUpdate.keySet()){
        if(conUpdate.get(key).Active__c==true){
            //String srcFld = accConUpdate.get(key).Source_Field__c;
            //String destFld = accConUpdate.get(key).Destination_Field__c;
            srcDestMap.put(conUpdate.get(key).Source_Field__c, conUpdate.get(key).Destination_Field__c);
        }
    }
    for(Account acc : Trigger.New){
        for(String srcFld : srcDestMap.keySet()){
            if(acc.get(srcFld) !=trigger.oldMap.get(acc.id).get(srcFld)){
                accountIds.add(acc.id);
            }
        }
    }
    List<Contact> conList =[select id, accountId, LastName,Phone from Contact where accountId in:accountIds];
    for(Contact con : conList){
        for(String srcFld : srcDestMap.keySet()){
            con.put(srcDestMap.get(srcFld), trigger.newmap.get(con.accountId).get(srcFld));
            System.debug(' Line no. 22 ' + trigger.newmap.get(con.accountId).get(srcFld));
        }
    }
    if(conList !=null && conList.size()>0){
        update conList;
    }
}