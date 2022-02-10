({
	show : function(component, event, helper) {
		var evt =component.getEvent("firstCall");
        evt.setParams({"empName":"Akash"});
        evt.fire();
	}
})