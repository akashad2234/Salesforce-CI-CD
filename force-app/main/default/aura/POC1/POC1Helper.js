({
    abc : function(component, event, helper) {
        var action = component.get('c.getConList');
        action.setParams({
            offset : component.get('v.offset')
        });
        
        action.setCallback(this,function(response){
            var responseValue = response.getReturnValue();
           
            component.set('v.Acclist',responseValue.acc);
            
            var k = responseValue.total;
            var i=0
            var listOfpage = [];
            for(i=1;i<=k;i++)
            {
                listOfpage.push(i);
            }
            component.set('v.Count',listOfpage);
            var m = (k-1)*10;
            component.set('v.lastPage',m);
            
            
        });
        $A.enqueueAction(action,false);
    }
})