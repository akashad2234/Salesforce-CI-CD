({
	show : function(component, event, helper) {
		   console.log('__Started__');
          component.set("v.empName","Akash");
          component.set("v.salary",10000);
       /* var name=component.get("v.empName");
        console.log(name);
        var salary=component.get("v.salary");
        console.log(salary);*/
	},
    invoke : function(component, event, helper){
              component.set("v.empName","");
              component.set("v.salary",0);
}
})