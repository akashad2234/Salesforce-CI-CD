({
    show : function(component, event, helper) {
        var items=[
                    {"label":"Hyd","name":"1", "expanded":false,
                     "items":[
                         {"label":"BRNagar","name":"11" ,"expanded":false,"items":[]},
                         {"label":"LBNagar","name":"12" ,"expanded":false,"items":[]},
                         ]
                    },
                    {"label":"Kol","name":"2" ,"expanded":true,"items":[]},
                    {"label":"Ban","name":"3" ,"expanded":true,"items":[]}
                    
                 ];
        component.set('v.myData',items);
    }
})