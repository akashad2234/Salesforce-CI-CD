public class Out_App_Example {
    @AuraEnabled
    public static List<Account> callMe(String Value){
        List<Account> accounts =[select Id,Name,Phone,Industry from Account where Industry=:Value];
        return accounts;
    }

}