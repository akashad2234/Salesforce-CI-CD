({
    doAction : function(cmp, event) {
        var params = event.getParam('arguments');
        if (params) {
            var message  = params.message;
            alert('In Child Controller ' +message);
        }
    }
})