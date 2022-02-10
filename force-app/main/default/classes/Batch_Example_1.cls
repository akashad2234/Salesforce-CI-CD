global class Batch_Example_1 implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'select id,name, type from Opportunity';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,List<Opportunity> scope){
        for(Opportunity op : scope)
        {
            op.type='New Customer';
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc){
    AsyncApexJob job = [select id ,status,Jobtype,ExtendedStatus,NumberOfErrors,JobItemsProcessed,TotalJobItems,
                            CreatedBy.Email from AsyncApexJob  where id=:bc.getJobId()];
        System.debug('Status' +job.status);
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {'akashad223@gmail.com'};
            mail.setToAddresses(toAddresses);
            mail.setSubject('Match Merge Batch ' + job.Status);
            mail.setPlainTextBody('records processed ' + job.TotalJobItems +
           'with '+ job.NumberOfErrors + ' failures.');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{ mail });
    } 
    
}