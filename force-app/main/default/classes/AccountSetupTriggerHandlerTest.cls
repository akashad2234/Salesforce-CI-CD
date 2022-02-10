@isTest
public class AccountSetupTriggerHandlerTest {
    @testSetup
    private static void Setup(){
        List<Account> accList =new List<Account>();
        for(Integer i=0;i<2 ; i++){
            Account acc=new Account();
            acc.Name='Test'+i;
            acc.BillingCity='Test City';
            acc.BillingCountry='Test Country';
            acc.BillingPostalCode='12345';
            acc.BillingState='Test State';
            acc.BillingStreet='TestStreet';
            if(i==0){
                acc.CopyBillingAddToShipping__c=true;  
            }
            
            accList.add(acc);
        }
        insert accList;
    }
    @isTest
    private static void CopyBillingToShippingUpdateTest(){
        Account acc=[select Id,CopyBillingAddToShipping__c,BillingCity from Account where Name='Test1' Limit 1];
        Test.startTest();
        
        acc.CopyBillingAddToShipping__c=true;
        
        update acc;
        
        Test.stopTest();
         Account updateAcc =[Select Id,ShippingCity from Account where Id =:acc.Id];
        System.assertEquals(acc.BillingCity, updateAcc.ShippingCity);
    }
    
}