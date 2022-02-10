({
	call : function(component, event, helper) {
		var opt=component.get("v.opt");
        console.log('selected :'+opt);
        component.set("v.steps",opt);
	}
})