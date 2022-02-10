({
	invoke : function(component, event, helper) {
        var action=component.get("c.getContact");
        action.setCallback(this,function(response){
            var state =response.getState();
            if(state==='SUCCESS'){
                var result = response.getReturnValue();
                component.set("v.myContacts",result);
                console.log(result);
            }else{
                console.log('Failed');
            }
            
        });
        $A.enqueueAction(action);
        
		
	}
})