({
    invoke : function(component, event, helper) {
        var name=event.getParam("accName");
        var action=component.get("c.getCall");
        action.setParams({"accName":name});
        action.setCallback(this,function(response){
            var state =response.getState();
            var result = response.getReturnValue();
            component.set("v.myList",result);
            
        });
        $A.enqueueAction(action);
        
    }
})