@isTest
public class AccountTestUtilityTriggerHandlerTest {
    
    
    @isTest
    private static void CopyBillingToShippingInsertTest(){
        List<Account> accList =TestUtility.createAccountRecords('Test',4,false);
        for(Integer i=0;i<4; i++){
            
            accList[i].BillingCity='TestCity';
            accList[i].BillingCountry='TestCountry';
            accList[i].BillingPostalCode='12345';
            accList[i].BillingState='TestState';
            accList[i].BillingStreet='TestStreet';
            accList[i].CopyBillingAddToShipping__c=true;
            
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        Account updateAcc =[Select Id,ShippingCity from Account where Id =:accList[1].Id];
        System.assertEquals(accList[1].BillingCity, updateAcc.ShippingCity);
    }
    @isTest
    private static void CopyBillingToShippingUpdateTest(){
        List<Account> accList =TestUtility.createAccountRecords('Test',4,false);
        
        for(Integer i=0;i<4 ; i++){
            
            accList[i].BillingCity='TestCity';
            accList[i].BillingCountry='TestCountry';
            accList[i].BillingPostalCode='12345';
            accList[i].BillingState='TestState';
            accList[i].BillingStreet='TestStreet';
            
            
        }
        Test.startTest();
        insert accList;
        for(Integer i=0;i<4;i++){
            accList[i].CopyBillingAddToShipping__c=true;
        }
        update accList;
        
        Test.stopTest();
        
        Account updateAcc =[Select Id,ShippingCity from Account where Id =:accList[1].Id];
        System.assertEquals(accList[1].BillingCity, updateAcc.ShippingCity);
    }
    
    
    
}