({
    doInit: function(component, event, helper) {
        
        // Prepare a new record from template
        component.find("accountRecordCreator").getNewRecord(
            "Account", // sObject type (objectApiName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                var rec = component.get("v.newAccount");
                var error = component.get("v.newAccountError");
                if(error || (rec === null)) {
                    console.log('Account is null');
                    return;
                }
                
            })
        );
    },
    
    handleSaveAccount: function(component, event, helper) {
        
        component.set("v.simpleNewAccount.AccountId", component.get("v.recordId"));
        component.find("accountRecordCreator").saveRecord(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                // record is saved successfully
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Saved",
                    "message": "The record was saved."
                });
                resultsToast.fire();
                
                
            }  else {
                console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
            } 
            
        }); 
        
       
        //navigation
        var record = event.getParams().response;  
        console.log(record.id);
        
        var navService = component.find("navService");        
        var pageReference = {
            "type": 'standard__recordPage',         
            "attributes": {              
                "recordId": record.id,
                "actionName": "view",               
                "objectApiName":"Account"              
            }        
        };
        
        
        event.preventDefault();
        navService.navigate(pageReference); 
        
        
        
    }
})