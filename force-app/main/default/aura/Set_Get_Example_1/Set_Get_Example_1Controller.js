({
	invoke : function(component, event, helper) {
        var salary=component.get("v.salary");
        console.log('Salary:'+salary);
        var Exp=component.get("v.Exp");
         console.log('Exp:'+Exp);
        var bonus=0;
        if(Exp>5){
            bonus=salary*0.30;
        }else{
            bonus=salary*0.20;
        }
        component.set("v.bonus",bonus);
        console.log("Bonus:"+bonus);
		
	}
})