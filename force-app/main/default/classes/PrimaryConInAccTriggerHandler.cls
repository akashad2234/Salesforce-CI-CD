public class PrimaryConInAccTriggerHandler {
    public static void InsertPrimaryContact(List <Contact> contactList){
        List<Contact> conList = new List<Contact>();
        set<Id> accIdSet = new set<Id>();
        Set<Id> ContactIds = new Set<Id>();
        Contact oldcon;
        Contact uncheckContact = new Contact();
        integer count=0;
        for ( Contact s : contactList ){
            if(s.AccountId != null){
                accIdSet.add(s.AccountId);
                ContactIds.add(s.Id);
            }
        }
        System.debug('This is ID Of new Contact '+ContactIds);
        conList=[select id, name,AccountId,Primary_Contact__c from Contact where AccountId IN : accIdSet AND Id NOT
                 IN : ContactIds AND Primary_Contact__c=:true];
        System.debug('Existsing Contact '+conList);
        Map<String,Set<String>> accIdconListIdMapPrimary= new Map<String,Set<String>> ();
        Map<String,Set<String>> accIdconListIdMapAll= new Map<String,Set<String>> ();
        for(Contact c : contactList){
            if(c.AccountId!=null){
                if(!accIdconListIdMapAll.containsKey(c.AccountId)){
                    Set<String> conId= new Set<String>();
                    conId.add(c.Id);
                    accIdconListIdMapAll.put(c.AccountId,conId);
                    System.debug('In IF Loop Of accIdconListIdMapAll '+accIdconListIdMapAll);
                }else{
                    Set<String> conId = accIdconListIdMapAll.get(c.AccountId);
                    System.debug('conId------>'+conId);
                    conId.add(c.Id);
                    accIdconListIdMapAll.put(c.AccountId,conId);
                    System.debug('In ELse Loop Of accIdconListIdMapAll '+accIdconListIdMapAll);
                }
                if(!accIdconListIdMapPrimary.containsKey(c.AccountId)){
                    if(c.Primary_Contact__c){
                        Set<String> conId= new Set<String>();
                        conId.add(c.Id);
                        accIdconListIdMapPrimary.put(c.AccountId,conId);
                        System.debug('In IF Loop Of accIdconListIdMapPrimary '+accIdconListIdMapPrimary);
                    }
                }else{
                    if(c.Primary_Contact__c){
                        Set<String> conId = accIdconListIdMapPrimary.get(c.AccountId);
                        conId.add(c.Id);
                        accIdconListIdMapPrimary.put(c.AccountId,conId);
                        System.debug('In IF else Of accIdconListIdMapPrimary '+accIdconListIdMapPrimary);
                    }
                }
            }
        }
        if(conList==null|| conList.isEmpty()){
            for(Contact c : contactList){
                if(!accIdconListIdMapPrimary.containsKey(c.AccountId)){
                    c.addError('Primary Contact must be selected');
                }else{
                    Set<String> primaryContactSet = accIdconListIdMapPrimary.get(c.AccountId);
                    if(primaryContactSet.size()>1){
                        c.addError(' More than one Primary checkbox cantt be selected in a single transaction');
                    }
                }
            }
        }
        else
        {
            List<Contact> conLisUpdate= new List<Contact>();
            Set<Id> contactId= new Set<Id>();
            for(Contact c : contactList){
                System.debug('c.Id'+c.Id);
                if(c.Primary_Contact__c){
                    if(accIdconListIdMapPrimary.containsKey(c.AccountId)){
                        Set<String> primaryContactSet = accIdconListIdMapPrimary.get(c.AccountId);
                        if(primaryContactSet.size() > 1){
                            c.addError('Only one contact can be made primary at a time');
                        }else{
                            
                            for(Contact existingContact : conList){
                                contactId.add(existingContact.Id);
                            }
                        }
                    }
                }
            }
            if(contactId.size() > 0){
                List<Contact> cnList= [Select Id, Name from Contact where Id In : contactId];
                for(Contact con : cnList){
                    con.Primary_Contact__c=false;
                    conLisUpdate.add(con);
                }
            }
            if(conLisUpdate.size()>0){
                System.debug('this is ConList Before Update '+conLisUpdate);
                update conLisUpdate;
            }
        }
    }
    public static void updatePrimaryContact(List <Contact> contactList){
        List<Contact> conList = new List<Contact>();
        set<Id> accIdSet = new set<Id>();
        Set<Id> ContactIds = new Set<Id>();
        Contact oldcon;
        Contact uncheckContact = new Contact();
        integer count=0;
        for ( Contact s : contactList ){
            if(s.AccountId != null){
                accIdSet.add(s.AccountId);
                ContactIds.add(s.Id);
            }
        }
        SYstem.debug('This is ID Of new Contact '+ContactIds);
        conList=[select id, name,AccountId,Primary_Contact__c from Contact where AccountId IN : accIdSet AND Id NOT
                 IN : ContactIds AND Primary_Contact__c=:true];
        System.debug('Existsing Contact '+conList);
        Map<String,Set<String>> accIdconListIdMapPrimary= new Map<String,Set<String>> ();
        Map<String,Set<String>> accIdconListIdMapAll= new Map<String,Set<String>> ();
        for(Contact c : contactList){
            if(c.AccountId!=null){
                if(!accIdconListIdMapAll.containsKey(c.AccountId)){
                    Set<String> conId= new Set<String>();
                    conId.add(c.Id);
                    accIdconListIdMapAll.put(c.AccountId,conId);
                    System.debug('In IF Loop Of accIdconListIdMapAll '+accIdconListIdMapAll);
                }else{
                    Set<String> conId = accIdconListIdMapAll.get(c.AccountId);
                    System.debug('conId------>'+conId);
                    conId.add(c.Id);
                    accIdconListIdMapAll.put(c.AccountId,conId);
                    System.debug('In ELse Loop Of accIdconListIdMapAll '+accIdconListIdMapAll);
                }
                if(!accIdconListIdMapPrimary.containsKey(c.AccountId)){
                    if(c.Primary_Contact__c){
                        Set<String> conId= new Set<String>();
                        conId.add(c.Id);
                        accIdconListIdMapPrimary.put(c.AccountId,conId);
                        System.debug('In IF Loop Of accIdconListIdMapPrimary '+accIdconListIdMapPrimary);
                    }
                }else{
                    if(c.Primary_Contact__c){
                        Set<String> conId = accIdconListIdMapPrimary.get(c.AccountId);
                        conId.add(c.Id);
                        accIdconListIdMapPrimary.put(c.AccountId,conId);
                        System.debug('In IF else Of accIdconListIdMapPrimary '+accIdconListIdMapPrimary);
                    }
                }
            }
        }
        if(conList==null|| conList.isEmpty()){
            for(Contact c : contactList){
                if(!accIdconListIdMapPrimary.containsKey(c.AccountId)){
                    c.addError('Primary Contact must be selected');
                }else{
                    Set<String> primaryContactSet = accIdconListIdMapPrimary.get(c.AccountId);
                    if(primaryContactSet.size()>1){
                        c.addError(' More than one Primary checkbox cantt be selected in a single transaction');
                    }
                }
            }
        }
        else
        {
            List<Contact> conLisUpdate= new List<Contact>();
            Set<Id> contactId= new Set<Id>();
            for(Contact c : contactList){
                System.debug('c.Id'+c.Id);
                if(c.Primary_Contact__c){
                    if(accIdconListIdMapPrimary.containsKey(c.AccountId)){
                        Set<String> primaryContactSet = accIdconListIdMapPrimary.get(c.AccountId);
                        if(primaryContactSet.size() > 1){
                            c.addError('Only one contact can be made primary at a time');
                        }else
                        {
                            for(Contact existingContact : conList){
                                contactId.add(existingContact.Id);
                            }
                        }
                    }
                }
            }
            if(contactId.size() > 0){
                List<Contact> cnList= [Select Id, Name from Contact where Id In : contactId];
                for(Contact con : cnList){
                    con.Primary_Contact__c=false;
                    conLisUpdate.add(con);
                }
            }
            if(conLisUpdate.size()>0){
                System.debug('this is ConList Before Update '+conLisUpdate);
                update conLisUpdate;
            }
        }
    }
}