({
    handleLoad : function(component, event, helper) {
        console.log('handle handleLoad');
        component.set("v.showSpinner", false);
    },
    handleSubmit : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "The record has been updated successfully."
        });
        toastEvent.fire();
    },
    handleSuccess: function(component, event, helper) {
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