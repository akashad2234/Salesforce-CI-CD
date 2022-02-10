({
	mySave : function(component, event, helper) {
        var name=component.find("name").get("v.value");
        var phone=component.find("phone").get("v.value");
        var rating=component.find("rating").get("v.value");
        var action=component.get("c.create");
        action.setParams({
            "name":name,
            "phone":phone,
            "industry":industry
        });
        action.setCallback(this,function(response){
            var state =response.getState();
            if(state==='SUCCESS'){
               var myId=response.getReturnValue();
                var evt=$A.get("e.force:showToast");
                evt.setParams({"recordId":myId});
                evt.fire();
            }
            
        });
        $A.enqueueAction(action);
        
		
	},
    myCancel :function(component, event, helper) {
        component.find("name").set("v.value",'');
        component.find("phone").set("v.value",'');
        component.find("rating").set("v.value",'');
        var evt=$A.get("e.force:showToast");
        evt.setParams({"title":"ResetValue",
                       "message":"Record values are reset successfully"});
        evt.fire();
    }
})