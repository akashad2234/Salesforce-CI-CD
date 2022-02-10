({
    handleSaveAccount : function(component, event, helper) {
        var saveAction = component.get("c.saveDetails");
        saveAction.setParams({
            acc: component.get("v.simpleNewAccount"),
            
        });
        
        // Configure the response handler for the action
        saveAction.setCallback(this, function(response) {
            var state = response.getState();
            if(state === "SUCCESS") {
                
                // Prepare a toast UI message
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Account Saved",
                    "message": "The new account was created."
                });
                
                // Update the UI: close panel, show toast, refresh account page
                $A.get("e.force:closeQuickAction").fire();
                resultsToast.fire();
                $A.get("e.force:refreshView").fire();
               // var payload = event.getParams().response;
                var recordId = component.get("v.recordId");
                var navService = component.find("navService");
                
                var pageReference = {
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: recordId,
                        "objectApiName": component.get("v.sObjectName"),
                        "actionName": "view"
                    }
                }
                event.preventDefault();
                navService.navigate(pageReference);
                
                
            }
            else if (state === "ERROR") {
                console.log('Problem saving contact, response state: ' + state);
            }
                else {
                    console.log('Unknown problem, response state: ' + state);
                }
        });
        
        // Send the request to create the new contact
        $A.enqueueAction(saveAction);
        //NAV
        /*  var navService = component.find('navService');
        var recordId = component.get('v.recordId');
        var objectName = component.get('v.sObjectName');
        
        var pageReference = {
            type: 'standard__recordPage',
            attributes: {
                recordId: recordId,
                objectApiName: objectName,
                actionName: 'view'
            }
        }
        navService.navigate(pageReference);   */
        
        
    }
})