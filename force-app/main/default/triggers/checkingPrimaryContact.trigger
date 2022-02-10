trigger checkingPrimaryContact on Contact (before insert,before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate) {
            set<String> accountidSet = new set<String>();
            List<Contact> contactList = new List<Contact>();
            map<String, List<Contact>> newMap = new Map<String, List<Contact>>();
            for(Contact cont: Trigger.new) {
                System.debug(cont);
                if(cont.AccountId!=null && cont.Primary_Contact__c == true) {
                    accountidSet.add(cont.AccountId);
                }
            }
            if(accountIdSet!=null && accountIdSet.size()>0){
                List<Contact> conList = [select id, Primary_Contact__c,accountid from contact where accountid IN: accountidSet];
                System.debug(conList);
                List<Contact> contList = new List<Contact>();
                List<Contact> contListForTrue = new List<Contact>();
                for(Contact c : Trigger.New){
                    if(c.AccountId !=null){
                        contList.add(c);
                        System.debug(contList.size());
                    }
                    
                    if(c.AccountId !=null && c.Primary_Contact__c == true){
                        contListForTrue.add(c);
                        System.debug(contListForTrue.size());
                    }
                }
                for(Contact c : contList){
                    if (contList.size()>1 && c.Primary_Contact__c == true && contListForTrue.size()!=1){
                        c.addError('More than one primary contact its not allowed');
                    }
                    if(contListForTrue.size()==0 && c.Primary_Contact__c == false && contList.size()!=0){
                        
                        c.addError('One primary contact is mandatory to insert non primary contact');
                    }
                    if(contList.size()>1 && c.Primary_Contact__c == false){
                        System.debug(contList.size());
                        for(Contact oldCon : conList){
                            for(Contact newCon : trigger.New){
                                if(oldCon.Primary_Contact__c != true && newCon.Primary_Contact__c!= true && contListForTrue.size()!=1){
                                    newCon.addError('One primary contact is mandatory to insert non primary contact');
                                }
                            }
                        }
                    }
                }
                //List<Contact> conListTrue = [select id, Primary_Contact__c,accountid from contact where accountid IN: accountidSet AND Primary_Contact__c = true];
                for(Contact cont:conList){
                    System.debug(cont);
                    if(cont.Primary_Contact__c == true && cont.AccountId!=null){
                        System.debug(cont.Primary_Contact__c);
                        cont.Primary_Contact__c = false;
                        contactList .add(cont);
                        System.debug(contactList);
                    }
                }
                if(contactList.size() > 0) {
                    update contactList;
                }
            }
        }
    }
}