({
	call : function(component, event, helper) {
		  var name=component.get("v.objName");
        var fld=component.get("v.fldName");
        var action=component.get("c.getData");
        action.setParams({"objName":name,"fldName":fld});
        action.setCallback(this,function(response){
            var state =response.getState();
            if(state==='SUCCESS'){
                var res = response.getReturnValue();
                component.set("v.result",res);
                console.log(res);
            }
            
        });
        $A.enqueueAction(action); 
	}
})