public class FutureMethodClass {
@future
    public static void countContactsForAcc()
    {
        Set<id> AccId = new Set<id> ();
        List<Contact> lcon =new List<Contact>();
        List<Account> lacc= [select id,name,No_of_Contacts__c,(select id from  contacts) from account where id in:AccId];
        List<Account> finalAcc = new List<Account>();
        for (Account a:lacc)
        {
            lcon=a.contacts;
            a.No_of_Contacts__c=lcon.size();
            System.debug('Number ::'+a.No_of_Contacts__c);
            finalAcc.add(a);
            System.debug('Finall::'+finalAcc);
        }
        update finalAcc;
        
    }
    public void show()
    {
         System.debug('Show 1');
        System.debug('Show 2');
        countContactsForAcc();
        
    }
}