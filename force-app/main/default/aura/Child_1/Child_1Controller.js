({
	call : function(component, event, helper) {
        var evt =$A.get("e.c:secondEvent");
        evt.setParams({"accName":"Akash"});
        evt.fire();
	}
})