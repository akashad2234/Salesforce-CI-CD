({
    doorder : function(component, event, helper) {
        var pageReference = component.find("navService");
        var pageReferenceNav ={
            "type": "standard__component",
            "attributes": {
                "componentName": "c__Bookorder"    
            },    
                
              "state": {
                    "bookId":component.get('v.bookId'),
                  "bookName":component.get('v.bookName')
                }
        
    };
        pageReference.navigate(pageReferenceNav);
    
    
}
 })