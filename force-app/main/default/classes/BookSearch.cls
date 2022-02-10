public class BookSearch {
     @AuraEnabled
     public static List<Book__c> getBook(String searchParam) {
        // Perform isAccessible() checks here
         String likeParam ='%' +searchParam+ '%';
         String Query='';
         if(searchParam !=null){
          Query='SELECT Id,Name,Author_Name__c,Discount__c FROM Book__c Where Name Like : likeParam LIMIT 10';
         }else{
             Query='SELECT Id,Name,Author_Name__c,Discount__c FROM Book__c LIMIT 10';
         }
         List<SObject> sObjectList =Database.query(Query);
         return sObjectList;
    }

}