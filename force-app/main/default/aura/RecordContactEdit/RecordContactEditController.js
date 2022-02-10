({
	handleLoad : function(component, event, helper) {
	component.set("v.showSpinner", false);
	//use this to pre populate fields wth some data
       // component.find('LastName').set('v.value', 'Tushar Sharma');
	},
    handleSubmit : function(component, event, helper) {
       //We don't need to put basic validation here as that are handle by lightning:inputfield and recordEditForm
       //event.preventDefault(); use this to stop default flow
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "The record has been updated successfully."
        });
        toastEvent.fire();
    },
    handleSuccess : function(component, event, helper) {
	    
	//Redirect to detail page on success
	var payload = event.getParams().response;
        var navService = component.find("navService");
    
        var pageReference = {
            type: 'standard__recordPage',
            attributes: {
                "recordId": payload.id,
                "objectApiName": component.get("v.sObjectName"),
                "actionName": "view"
            }
        }
        event.preventDefault();
        navService.navigate(pageReference);
    }
})