public class Account_Data {
    @AuraEnabled
    public static List<Account> getAccounts(String accIndustry){
        List<Account> accounts=[select Name,Phone,Industry,Rating from Account where industry=:accIndustry];
        return accounts;
    }
}