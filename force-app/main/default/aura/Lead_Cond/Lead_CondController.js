({
	invoke : function(component, event, helper) {
        
        // Prepare a new record from template
        component.find("myId").getNewRecord(
            "Lead", // sObject type (objectApiName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                var rec = component.get("v.newLead");
                var error = component.get("v.newContactError");
                if(error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                    return;
                }
                
            })
        );
    },
    
    save: function(component, event, helper) {
        
            component.set("v.newLead.AccountId", component.get("v.recordId"));
            component.find("myId").saveRecord(function(saveResult) {
                if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                    // record is saved successfully
                   console.log('Record Created');

                } 
                 else {
                    console.log('Unknown problem, state: ' + saveResult.state + ', error: ' + JSON.stringify(saveResult.error));
                }
            });
        
    }
		
	
})