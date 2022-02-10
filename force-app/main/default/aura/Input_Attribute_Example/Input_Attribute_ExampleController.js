({
	calculate : function(component, event, helper) {
		 var amount=component.get("v.amount");
         var years=component.get("v.years");
         var rate=component.get("v.rate");
         var intrest=(amount*years*rate)/100;
         component.set("v.intrest",intrest);
	}
})