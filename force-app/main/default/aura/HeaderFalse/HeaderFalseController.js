({
    doInit: function(component, event, helper) {
        var pageReference = {
            type: 'standard__component',
            attributes: {
                componentName: 'c__TargetCmp',
                pageName: 'Test'
            }
        };
        component.set("v.pageReference", pageReference);
    },

    handleClick: function(component, event, helper) {
        const navService = component.find('navService');
        const pageReference = component.get('v.pageReference');
        const handleUrl = (url) => {
            window.open("https://www.w3schools.com");
        };
        const handleError = (error) => {
            console.log(error);
        };
        navService.generateUrl(pageReference).then(handleUrl, handleError);
    }
})