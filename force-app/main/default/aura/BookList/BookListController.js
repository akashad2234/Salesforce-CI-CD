({
    showInfo : function(component, event, helper) {
        var eventSource = event.getSource();
        var bookObj = eventSource.get('v.name');
        component.set('v.bookId',bookObj);
        $A.createComponent(
            "c:BookDetails",
            {
                "bookId":bookObj
            },
            function(bookDetails, status, errorMessage){
                if(status=="SUCCESS"){
                    component.find('overlayLib').showCustomModal({
                        header: "Book Details",
                        body: bookDetails,
                        footer:'Footer',
                        showCloseButton: true,
                        closeCallback: function() {
                            
                        }
                    });
                    
                }else if(status=="INCOMPLETE"){
                    console.log("No response from server or client");
                }else if(status=="ERROR"){
                    console.log("Error: "+errorMessage);
                }
                
            }
        );
        
    }
})