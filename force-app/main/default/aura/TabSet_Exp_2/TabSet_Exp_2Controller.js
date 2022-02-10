({
	show : function(component, event, helper) {
		var val1=component.get("v.steps");
        var count=parseInt(val1);
        count=count+1;
        component.set("v.steps",''+count);
	},
    call : function(component, event, helper) {
		var val2=component.get("v.steps");
        var count=parseInt(val2);
        count=count-1;
        component.set("v.steps",''+count);
	},
    invoke:function(component, event, helper){
        alert('submitted succesfully');
    }
    
})