({
    handleCompEvent : function(component, event, helper) {
        // var componentEvent=cmp.getEvent('BookEvent');
        var searchParam = event.getParam('searchText');
        var action =component.get("c.getBook");
        //alert(searchParam);
          action.setParams({
              searchParam:searchParam
         });
        action.setCallback(this,function(response){
             var state = response.getState();
                if(state === "SUCCESS" || state === "DRAFT") {

                    var result=response.getReturnValue();
                    component.set('v.bookList',result);
                    console.log('result',result);
                }else{
                    console.log(response.getError());
                }

        });
        $A.enqueueAction(action);
        
        
    }
})