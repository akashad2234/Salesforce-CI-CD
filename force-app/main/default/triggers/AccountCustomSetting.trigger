trigger AccountCustomSetting on Account (After insert) {
   Trigger_Settings__c TS = Trigger_Settings__c.getValues('conTrigger');

   String Phone_Custom=TS.Phone_Custom__c;
    if(TS.is_Active__c == TRUE)
    {
        List<Contact> conList =new List<Contact>();
        for(Account a: Trigger.New)
        {
            Contact con =new Contact();
            con.AccountId = a.Id;
            con.LastName=a.Name +'_Contact';
            con.Phone=Phone_Custom;
            conList.add(con);
            
        }
        insert conList; 
        
    }
    
}