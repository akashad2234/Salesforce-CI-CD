trigger CustomCountrycode on Account (After update) {
     CountryPhoneCode__c phone = CountryPhoneCode__c.getValues('India');
     String PhoneCode =phone.Phone_Code__c;
    if(phone.Active__c==True)
    {
        Set<id> AccountIds = new Set<id>();
        for(Account a: trigger.new)
        {  
            if(a.AnnualRevenue >=10000 && a.AnnualRevenue !=trigger.oldMap.get(a.id).AnnualRevenue)
            {
                AccountIds.add(a.id);
            }
        }
        List<Opportunity> opport=[select id ,Country_Code__c,Accountid from Opportunity where accountid in:AccountIds];
        System.debug('opportList1'+ opport);
        for(Opportunity opp : opport)
        {
          opp.Country_Code__c =PhoneCode;  
        }
        update opport;
    }
    
       
        
}