({
	/*onSuccessfulSave : function(component, event, helper) {
        
            this.navigateToDetailsPage(component, event, helper, component.get("v.recordId"),'Account');
        
		
	},*/
    ontoastMessage :function(component, event, helper) {
        this.toastMessage(component, event, helper,"Success!", "success", "Details Saved Successfully!");
    },
    toastMessage : function(component, event, helper, strTitle , strType ,strMessage ) {
        
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            //"mode": 'sticky',
            "title":strTitle,
            "type":strType,
            "message":strMessage
        });
        toastEvent.fire();
        
        
        
    }, 
    navigateToDetailsPage : function(component, event, helper, strUpsertedRecId, strObjectAPIName) {      
        console.log('inside helperr sentt:'+strUpsertedRecId);
        var navService = component.find("navService");
        var pageReference = {
            type: 'standard__recordPage',
            attributes: {
                recordId: strUpsertedRecId,
                objectApiName: strObjectAPIName,
                actionName: 'view'
            }
        };
        navService.navigate(pageReference);
    }
})