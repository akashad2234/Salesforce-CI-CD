({
    doInit : function(component, event, helper) {
        var pageReference = component.get('v.pageReference');
        if(pageReference){
            var state = pageReference.state;
            component.set('v.bookId', state.bookId);
            component.find("recordViewer").reloadRecord();
        }
        component.find("newRecordCreator").getNewRecord(
            "Book_Order__c", 
            null,      
            false,    
            $A.getCallback(function() {
                var rec = component.get("v.newRecordObject");
                var error = component.get("v.newRecordError");
                if(error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                }
                else {
                    console.log("Record template initialized: " + rec.sobjectType);
                }
            })
        );
    },
    handleSubmit : function(component, event, helper) {
        var bookRecord = component.get('v.simpleRecord');
        console.log('bookRecord Price', bookRecord.Price__c);
        var quantity = component.get('v.bookOrder.Ordered_Quantity__c');
        console.log('Ordered price ', quantity);
        var totalPrice = parseInt(bookRecord.Price__c)*parseInt(quantity);
        console.log(' totalPrice ', totalPrice);
        var isValid = helper.validateForm(component, event, helper);
        if(component.get("v.bookOrder.Billing_Same_as_Shipping__c")){
            component.set('v.bookOrder.Billing_Street__c', component.get('v.bookOrder.Shipping_Street__c'));
            component.set('v.bookOrder.Billing_City__c', component.get('v.bookOrder.Shipping_City__c'));
            component.set('v.bookOrder.Billing_Country__c', component.get('v.bookOrder.Shipping_Country__c'));
            component.set('v.bookOrder.Billing_State__c', component.get('v.bookOrder.Shipping_State__c'));
            component.set('v.bookOrder.Billing_Postal_Code__c', component.get('v.bookOrder.Shipping_Postal_Code__c'));
        }
        if(!isValid)
            return;
        var userId = $A.get("$SObjectType.CurrentUser.Id");
        //alert(userId);
        component.set("v.bookOrder.Book__c", component.get("v.bookId"));
        component.set("v.bookOrder.Ordered_By__c", userId); 
        component.set("v.bookOrder.Order_Amount__c", parseInt(totalPrice));
        component.find("newRecordCreator").saveRecord(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Order Placed",
                    "message": "Your Order has been successfully placed.",
                    "type" : "success"
                });
                resultsToast.fire();
            } else if (saveResult.state === "INCOMPLETE") {
                console.log("User is offline, device doesn't support drafts.");
            } else if (saveResult.state === "ERROR") {
                console.log('Problem saving contact, error: ' + 
                            JSON.stringify(saveResult.error));
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Error While Placing Your Order.",
                    "message": JSON.stringify(saveResult.error),
                    "type" : "success"
                });
                resultsToast.fire();
            } else {
                console.log('Unknown problem, state: ' + saveResult.state +
                            ', error: ' + JSON.stringify(saveResult.error));
            }
        });
    },
})