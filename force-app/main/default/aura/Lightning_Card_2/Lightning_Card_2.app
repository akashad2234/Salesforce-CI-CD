<aura:application extends="force:slds">
    <lightning:card title="Lightning Card" variant="Base" iconName="standard:account">
        <aura:set attribute="actions" >
            <lightning:buttonGroup>
                <lightning:button label="Submit" />
                <lightning:button label="Cancel" />
                <lightning:button label="Reset" />
                
            </lightning:buttonGroup>
            
        </aura:set>
    </lightning:card>
    <lightning:card title="Header" footer="Copy@salesforce.com" variant="Base">
        This is line one<br/>
        This is line Two<br/>
    </lightning:card>
    
    
</aura:application>