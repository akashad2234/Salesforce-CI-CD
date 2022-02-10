({
	invoke : function(component, event, helper) {
		var action=component.get("c.getAccounts");
        action.setParams({"accIndustry":component.get("v.acc.fields.Industry.value")});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                console.log('operation is success');
                component.set("v.myAccounts",response.getReturnValue());
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})