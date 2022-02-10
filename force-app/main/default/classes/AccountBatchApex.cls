global class AccountBatchApex implements Database.Batchable<sObject>, Database.Stateful {
    global integer count=0;
    List<Integer> w =new List<Integer> ();
    List<Integer> x =new List<Integer> ();
    List<Integer> y =new List<Integer> ();
    List<Integer> z =new List<Integer> ();
    List<Account> account = new List<Account>();
    global Database.QueryLocator start(Database.BatchableContext bc){
        String soqlQuery = 'SELECT Name, AnnualRevenue From Account order by AnnualRevenue asc';
        return Database.getQueryLocator(soqlQuery);
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        for (Account a : scope){
            
            if(a.AnnualRevenue <10000){
                
                count++;
                w.add(Integer.valueOf(a.AnnualRevenue));
                account.add(a);
            }
            else if(a.AnnualRevenue >=10000 &&  a.AnnualRevenue <=20000){
              count++;
              x.add(Integer.valueOf(a.AnnualRevenue));
               account.add(a);

            }
            else if(a.AnnualRevenue >=20000 && a.AnnualRevenue <=30000){
                count++;
                y.add(Integer.valueOf(a.AnnualRevenue));
                account.add(a);

            }
            else if(a.AnnualRevenue >=30000 && a.AnnualRevenue <=40000){
                count++;
                z.add(Integer.valueOf(a.AnnualRevenue));
                account.add(a);

            }
        }
        
       // update Scope;
        
    }
    
    global void finish(Database.BatchableContext bc){
        AsyncApexJob job = [select id ,status,Jobtype,ExtendedStatus,NumberOfErrors,JobItemsProcessed,TotalJobItems,
                            CreatedBy.Email from AsyncApexJob  where id=:bc.getJobId()];
        System.debug('Job '+bc.getJobId());
        System.debug('Status' +job.status);
        System.debug('Count :'+count);
        System.debug('Account :' +account);
        System.debug('Account Revenue 10000 ' + w );
        System.debug('Account Revenue 10000 - 20000 ' +  x);
        System.debug('Account Revenue 20000 - 30000 ' +  y);
        System.debug('Account Revenue 30000 - 40000 ' +  z); 
          
         List < Messaging.SingleEmailMessage > emails = new List < Messaging.SingleEmailMessage > ();
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
           // String[] toAddresses = new String[] {'akashad223@gmail.com'};
              String[] toAddresses = new String[] {job.CreatedBy.Email};
            mail.setToAddresses(toAddresses);
            mail.setSubject('Match Merge Batch ' + job.Status);
            mail.setPlainTextBody('records processed ' + job.TotalJobItems +'with '+ job.NumberOfErrors + ' failures.');
            emails.add(mail);
        if(!emails.isEmpty())
        {
            Messaging.sendEmail(emails);
        }
            
    }
}