public class Aura_Contact_Example {
    @AuraEnabled
    public static List<Contact> getContact(){
        List<Contact> contacts =[select Id,Name,Phone,Email from Contact LIMIT 10 ];
        return contacts;
    }
}