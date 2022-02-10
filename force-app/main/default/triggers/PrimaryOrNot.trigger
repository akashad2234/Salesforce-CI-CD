trigger PrimaryOrNot on Contact (before insert,after update) {
    
    Set<ID> accountIdSet = new Set<ID>(); 
    Set<ID> contactIdSet = new Set<ID>();
    Map<ID,List<Contact>> accIdAndContactListMap = new Map<ID,List<Contact>>(); 
    Map<ID,integer> accIdAndContactCountMap = new Map<ID,Integer>();
    List<Contact> oldContactList = new list<Contact>(); 
    Integer Count =0;
    
    if(trigger.IsInsert && trigger.IsBefore)
    {   
        for (Contact newcontact : trigger.new)
        {
            if(newContact.Primary_Contact__c == true && newcontact.AccountId!=NULL )
            {
                if(!accountIdSet.Contains(newContact.AccountId))
                {           
                    accountIdSet.add(newcontact.AccountId);                   
                }
                else
                {                  
                    newContact.addError('Only one contact can be the primary.Must Not Add all contacts as primary contact');
                }               
            }
        }   
        if((accountIdSet !=NULL) && (accountIdSet.size()>0))
        {       
            OldContactList=    [SELECT Name,Primary_Contact__c,AccountId FROM Contact WHERE AccountId IN :accountIdSet AND Primary_Contact__c=TRUE];                                             
            for(Contact cnt : OldContactList)
            {                                                
                accIdAndContactCountMap.put(cnt.AccountId,1);                                                                                                                                                                     
            }
            system.debug('::::++++++'+accIdAndContactCountMap);                      
            for(Contact newcontact : trigger.new)
            {
                if(newcontact.AccountId!=NULL && accIdAndContactCountMap.containsKey(newcontact.AccountId))
                {
                    Count = accIdAndContactCountMap.get(newcontact.AccountId);
                    if(Count==1)
                    {
                        system.debug('+++++count------'+Count);                       
                        newcontact.addError('One primary contact is already Available,Inserting another primary contact is not Possible.');
                    }
                }
            }
        }       
    }
    
    if(trigger.IsUpdate && trigger.IsAfter)
    {
        for(Contact newupContact : Trigger.new)
        {
            // validation for a particular contact whether it is already primary or not.
            if(newupContact.Primary_Contact__c == true && newupContact.AccountId!=NULL &&  
               (Trigger.oldmap.get(newupContact.Id).Primary_Contact__c == FALSE ||
                Trigger.oldmap.get(newupContact.Id).Primary_Contact__c == TRUE ))
            { 
                //unchecked primary, to check the new value
                
                if(!accountIdSet.Contains(newupContact.AccountId))
                {
                    accountIdSet.add(newupContact.AccountId);//primary checkbox newly checked value Id will be here.                                                                                                             
                    
                    system.debug('++++++++'+accountIdSet);
                    
                    contactIdSet.add(newupContact.Id);
                    
                }else if(accountIdSet.Contains(newupContact.AccountId))
                {
                    //If two contacts of same id is not allowed               
                    
                    newupContact.addError('When updating or inserting, Only 1 contact can be the primary. uncheck all other Primary custom field');
                }
            }                                             
        }  
        
        if((accountIdSet !=NULL) && (accountIdSet.size()>0))
        {   
            OldContactList=    [SELECT Id,Name,Primary_Contact__c,AccountId FROM Contact
                                WHERE AccountId IN :accountIdSet AND Primary_Contact__c=TRUE AND Id NOT IN :contactIdSet];              
            
            //system.debug('********'+OldContactList[0].AccountId);
            
            for(Contact cnt : OldContactList)
            {                               
                accIdAndContactCountMap.put(cnt.AccountId,1); 
                system.debug('********'+accIdAndContactCountMap);
            }
            for(Contact newcontact : trigger.new)
            {
                if(newcontact.AccountId!=NULL && accIdAndContactCountMap.containsKey(newcontact.AccountId))
                {
                    Count = accIdAndContactCountMap.get(newcontact.AccountId);                               
                    if((Count==1)&&(newcontact.Primary_Contact__c==TRUE))
                    {
                        system.debug('+*-+*-+*-+*+-'+Count); 
                        newcontact.addError('update is not Possible. one primary contact is allowed for a Account and it is already Available');
                    }
                }
            }           
        }       
    }
}