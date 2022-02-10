({
    invoke : function(component, event, helper) {
        var amount=component.find("amount").get("v.value");
        var rate=component.find("rate").get("v.value");
        var years=component.find("years").get("v.value");
        var aval=parseInt(amount);
        var rval=parseInt(rate);
        var yval=parseInt(years);
        console.log(aval);
        console.log(rval);
        console.log(yval);
        var action=component.get("c.calculate");
        action.setParams({"amount":aval,"rate":rval,"years":yval});
        action.setCallback(this,function(response){
            var state =response.getState();
            if(state==='SUCCESS'){
                var result = response.getReturnValue();
                component.find("intrest").set("v.result",result);
                console.log(result);
            }else{
                console.log('Error');
            }
            
        });
        $A.enqueueAction(action);
        
        
        
    }
})