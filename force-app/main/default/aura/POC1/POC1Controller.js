({
    loadData : function(component, event, helper) {
     helper.abc(component, event, helper);
    },
    
   doNext : function(component, event, helper) {
       var a = component.get('v.offset');
       var b = a+10;
       component.set('v.offset',b);
   
       helper.abc(component, event, helper);
   },
   
     doPrevious : function(component, event, helper) {
           var d = 0;
         var c = component.get('v.offset');
            d = c-10;
         
          component.set('v.offset',d);
         helper.abc(component, event, helper);  
   },
    
    
    doNavigate: function(component, event, helper) {
        
        var eventSource =  event.getSource().get('v.name');
        var m = parseInt(eventSource);
        var p = (m - 1)*10;
        component.set('v.offset',p);
         helper.abc(component, event, helper);
        
        
    }
})