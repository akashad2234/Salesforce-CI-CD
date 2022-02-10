({
	show : function(component, event, helper) {
        var name=component.find("name").get("v.value");
		var evt =$A.get("e.c:Acc_Name");
        evt.setParams({"accName":name});
        evt.fire();
	}
})