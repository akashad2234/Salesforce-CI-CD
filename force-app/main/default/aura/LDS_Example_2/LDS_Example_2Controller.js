({
	invoke : function(component, event, helper) {
        component.find("record").saveRecord($A.getCallback(function(saveResult){
            if(saveResult.state==='SUCCESS' || saveResult.state==='DRAFT'){
                console.log('Record Save');
            }else if(saveResult.state==='INCOMPLETE'){
                console.log('Unable to Save changes');
            }else if(saveResult.state==='ERROR'){
                console.log('ERROR:'+saveResult.error);
            }else{
                console.log('unknown error');
            }
        }));
	}
})