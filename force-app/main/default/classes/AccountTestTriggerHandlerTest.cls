@isTest
public class AccountTestTriggerHandlerTest {
    @isTest
    private static void CopyBillingToShippingInsertTest(){
        List<Account> accList =new List<Account>();
        for(Integer i=0;i<2 ; i++){
            Account acc=new Account();
            acc.Name='Test'+i;
            acc.BillingCity='Test City';
            acc.BillingCountry='Test Country';
            acc.BillingPostalCode='12345';
            acc.BillingState='Test State';
            acc.BillingStreet='TestStreet';
            acc.CopyBillingAddToShipping__c=true;
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        Account updateAcc =[Select Id,ShippingCity from Account where Id =:accList[1].Id];
        System.assertEquals(accList[1].BillingCity, updateAcc.ShippingCity);
    }
     @isTest
    private static void CopyBillingToShippingUpdateTest(){
       List<Account> accList =new List<Account>();
          
        for(Integer i=0;i<2 ; i++){
            Account acc=new Account();
            acc.Name='Test'+i;
            acc.BillingCity='Test City';
            acc.BillingCountry='Test Country';
            acc.BillingPostalCode='12345';
            acc.BillingState='Test State';
            acc.BillingStreet='TestStreet';
            
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        for(Integer i=0;i<2;i++){
            accList[i].CopyBillingAddToShipping__c=true;
        }
        update accList;
        
        Test.stopTest();
        
        Account updateAcc =[Select Id,ShippingCity from Account where Id =:accList[1].Id];
        System.assertEquals(accList[1].BillingCity, updateAcc.ShippingCity);
        
    }


}