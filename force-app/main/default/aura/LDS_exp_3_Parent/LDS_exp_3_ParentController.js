({
    enable : function(component, event, helper) {
        component.set("v.showform", true);
        component.set("v.disableShowAccountButton", true);
    },
    disable : function(component, event, helper) {
        component.set("v.showform", false);
        
        component.set("v.disableShowAccountButton", false);
    },
    handleComponentEvent : function(component, event, helper) {
        var message = event.getParam("editFormPage");
    },
    docheckClick : function(component, event, helper) {
        var btn = event.getSource();
        var name=btn.get("v.name");
        var nextviewForm = component.find('child1'); //account
        var previousForm = component.find('child2'); //contact
        if(component.find('child1')){
            if(name=='hideform'){
                // $A.util.removeClass(previousForm,'prevform');
                $A.util.addClass(nextviewForm,'prevform');
                btn.set('v.name','showform');   
                btn.set('v.label','Show form');    
                
            }else if(name=='showform'){
                // $A.util.removeClass(previousForm,'prevform');
                $A.util.removeClass(nextviewForm,'prevform');
                btn.set('v.name','hideform'); 
                btn.set('v.label','Hide form');       
            }
        }else{
            if(name=='hideform'){
                 $A.util.addClass(previousForm,'prevform');
               // $A.util.addClass(nextviewForm,'prevform');
                btn.set('v.name','showform');   
                btn.set('v.label','Show form');        
            }else if(name=='showform'){
                 $A.util.removeClass(previousForm,'prevform');
               // $A.util.removeClass(nextviewForm,'prevform');
                btn.set('v.name','hideform'); 
                btn.set('v.label','Hide form');   
                
            }
            
        }
        /* var label = event.getSource().get("v.label");
        if(label == 'Hide form') {
            event.getSource().set("v.label","Show form")
            if(component.get("v.showform") == true){
                console.log("Line 26");
                component.set("v.showform", false);
            } else if(component.get("v.steps") == true){
                console.log("Line 29");
                component.set("v.steps", false);
            }
            
        } else {
            event.getSource().set("v.label","Hide form")
            if(component.get("v.showform") == false ){
                console.log("Line 37");
                component.set("v.showform", true);
            } else{
                console.log("Line 40");
                component.set("v.steps", true);
            }
           
        }*/
    },
    nextButton :function(component, event, helper) {
        var btn = event.getSource();
        var name=btn.get("v.name");
        var nextviewForm = component.find('child1');
        var previousForm = component.find('child2');
        if(name=='next'){
            $A.util.removeClass(previousForm,'prevform');
            $A.util.addClass(nextviewForm,'prevform');
            component.set("v.disableShowAccountButton", false);            
        }
        
        
    },
    previousButton :function(component, event, helper) {
        var btn = event.getSource();
        var name=btn.get("v.name");
        var nextviewForm = component.find('child1');
        var previousForm = component.find('child2');
        if(name=='previous'){
            $A.util.addClass(previousForm,'prevform');
            $A.util.removeClass(nextviewForm,'prevform');
            component.set("v.disableShowAccountButton", true);            
        }
        
    }
})