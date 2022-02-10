public class ObjectSpecific_Example {
    @AuraEnabled
    public static String create(String name,String Phone,String industry,String rating){
        Account acc= new Account();
        acc.Name=name;
        acc.Phone=phone;
        acc.Industry=industry;
        acc.Rating=rating;
        insert acc;
        return +acc.id;
    }
      @AuraEnabled
    public static Account saveDetails(Account acc){
        // DML operation to save Account Details   
        INSERT acc;
        return acc; 
    }
    
    
}