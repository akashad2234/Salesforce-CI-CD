public class Aura_Example {
    @AuraEnabled
    public Static String callMe(){
        String name='I am Invoked from Apex Class';
        return name;
    }
}