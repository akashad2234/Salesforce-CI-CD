({
	show : function(component, event, helper) {
        var lastName=component.find("lname").get("v.value");
        var firstName=component.find("fname").get("v.value");
        var name=firstName+ '-' +lastName;
        console.log('LastName:'+lastName);
        console.log('FirstName:'+firstName);
        component.find("Name").set("v.value",name);
		
	}
})