global class SummarizeAccountTotal implements Database.Batchable<sObject>, Database.Stateful{
   // global final String Query;
    global integer Summary;
   /* global SummarizeAccountTotal(String q){
        Query=q;
        Summary = 0;
    } */
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT Name, NumberOfEmployees From Account';
        return Database.getQueryLocator(query);
    }
    global void execute (
        Database.BatchableContext BC,
        List<Account> scope){
            for(Account s : scope){
                Summary = Integer.valueOf(s.get('NumberOfEmployees'))+Summary;
            }
        }
    global void finish(Database.BatchableContext BC){
        System.debug('Summary '+Summary);
    }
}