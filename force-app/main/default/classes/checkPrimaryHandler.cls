public class checkPrimaryHandler {
    
    public static void preventPrimaryContactInsert(List<Contact> contactList){
        Set<Id> accountIdSet = new Set<Id>();
        Map<Id,Contact> accountIdContactMap = new Map<Id,Contact>();
        for(Contact contactObj : contactList){
            if(contactObj.Primary_Contact__c==true && contactObj.AccountId!=null ){
                accountIdSet.add(contactObj.AccountId);
            }
        }
        if(accountIdSet!=null && accountIdSet.size()>0){
            for(Contact contObj :[Select id,Primary_Contact__c,AccountId from Contact where AccountId in:accountIdSet 
                                  and Primary_Contact__c = true])
            {
                accountIdContactMap.put(contObj.AccountId,contObj);
            }
            for(Contact contactObj : contactList){
                if(contactObj.Primary_Contact__c==true && contactObj.AccountId!=null && accountIdContactMap.get(contactObj.AccountId)!=null){
                    contactObj.addError('You can\'t create more than one primary contact.');
                }
            }
        }
    }  
}