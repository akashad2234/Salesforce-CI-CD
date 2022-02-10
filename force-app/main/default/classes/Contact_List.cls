public class Contact_List {
    @AuraEnabled
    public static List<Contact> getCall(String accName){
        Account acc = [select id from Account where name=:accName];
        List<Contact> contacts = [select id,LastName,FirstName,Phone from Contact where AccountId=:acc.Id];
        return contacts;
    }
}