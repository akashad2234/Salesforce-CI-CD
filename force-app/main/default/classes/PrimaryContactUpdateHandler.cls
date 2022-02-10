public class PrimaryContactUpdateHandler {
    public static void PrimaryContactUpdate(){
        set<id> getidSet = new set<id>();
        string contactId;
        List<Contact> contactList = new List<Contact>();
    
        for(Contact cont: (List<Contact>)Trigger.New) {
            
            if(cont.Primary_Contact__c == true) {
                
                getidSet.add(cont.AccountId);
                contactId = cont.id;
            }
        }
        
        
        List<contact> conList = [select id, Primary_Contact__c from contact where accountid IN: getidSet AND Primary_Contact__c = true];
     
            
            for(Contact con: conList) {
                
                if(con.id != contactId) {
                    
                    con.Primary_Contact__c = false;
                    contactList .add(con);
                }
                
            }
        if(contactList.size() > 0) {
        update contactList;
        }
    }
    
}