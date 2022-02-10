public class LDS_Class {
    @AuraEnabled 
    Public static void createAccount(Account accobj){
        try{
            
            insert accobj; 
            
        }catch(Exception e){
            System.debug(e.getMessage());
            System.debug(e.getLineNumber());
        }
        
    }
    
    @AuraEnabled 
    public static Map<String, String> getIndustryFieldValue(){
        Map<String, String> options = new Map<String, String>();
        
        Schema.DescribeFieldResult fieldResult = Account.Industry.getDescribe();
        
        
        List<Schema.PicklistEntry> pValues = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pValues) {
            
            options.put(p.getValue(), p.getLabel());
        }
        return options;
    }
    
}