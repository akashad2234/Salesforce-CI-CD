public class AccConDelTriggerHandler {
    
    public static void deleteRec(List<Account> oldDelList){
        
        Set<id> accIdSet = new Set<id>();
        Map<id,Account> mAcc = new Map<id,Account>();
        for(Account acc: oldDelList){
            accIdSet.add(acc.id);
        }
        
        for(Account acc:[select id,name,(select id,firstname,lastname from contacts) from account where id in:accIdSet])
        {
            mAcc.put(acc.id,acc);
        }for(Account acct:oldDelList){
            if(mAcc.get(acct.id).contacts.size()>0)
            {
                acct.addError('Account Delete Not Possible if Account has Child Contacts ');
            }
        }
        
    }
    
}