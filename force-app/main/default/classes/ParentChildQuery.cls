public class ParentChildQuery {
    
    public static void query(){
        
        map<Account,List<Contact>> accountContactMap = new map<Account,List<Contact>>();
        List<Account> lstAccount = [SELECT Id, name, (SELECT  Id,Name FROM Contacts) FROM Account where name  like 'POC%']; 
        for(Account acc : lstAccount) {
            
            accountContactMap.put(acc, acc.Contacts);
            
        }
        System.debug(accountContactMap);
        
  }
}