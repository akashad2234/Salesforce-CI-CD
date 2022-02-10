trigger AddCSR on Opportunity (before insert) {
// Grab your Custom Setting values
  CSR_Settings__c settings = CSR_Settings__c.getInstance('csr');
  String  CSR_USER_ID      = settings.CSR_User_ID__c;
  Decimal OPP_MIN_VALUE    = settings.Opp_Minimum_Value__c;

  // Create a master list of accounts to bulk update
  List<Account> accounts = new List<Account>();
  
  for (Opportunity opp : Trigger.new) {
    // Make sure we meet the minimum threshold
    if (opp.Amount >= OPP_MIN_VALUE) {
      // This is a trick to get the related account!
      Account acc = new Account();
      acc.Id      = opp.AccountId;
      
      // Update the CSR and add to master list
      acc.CSR__c  = CSR_USER_ID;
      accounts.add(acc);
    }
  }
  // Update the master list of accounts
  update accounts;
}