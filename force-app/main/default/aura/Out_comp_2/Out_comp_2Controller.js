({
    show : function(component, event, helper) {
        var val1=component.get("v.myVal");
        var colval=[
            {label:"Name",fieldName:"Name",type:"text" },
            {label:"Phone",fieldName:"Phone",type:"text" },
            {label:"Industry",fieldName:"Industry",type:"text" },
            
                 ];
        component.set("v.columns",colval);
             var action=component.get("c.callMe");
        action.setParams({"Value":val1});
        action.setCallback(this,function(response){
            var state =response.getState();
            if(state==='SUCCESS'){
                var result = response.getReturnValue();
                component.set("v.records",result);
                console.log(result);
            }else{
                console.log('Error');
            }
            
        });
        $A.enqueueAction(action);
            
    }
})