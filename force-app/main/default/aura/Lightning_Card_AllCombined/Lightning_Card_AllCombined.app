<aura:application extends="force:slds">
    <lightning:card>
        <aura:set attribute="title" >
            <lightning:avatar fallbackIconName="standard:person_account" alternativeText="Search" />
            New  Account
        </aura:set>
        <aura:set attribute="actions" >
            <center>
            <lightning:button label="Save" />
            <lightning:button label="Cancel" />
            <lightning:button label="Reset" />
            </center>
        </aura:set>
        
        <aura:set attribute="footer" >
            <center>Account Record is Created</center>
        </aura:set>
        <div>
            <lightning:input label="Account Name" />
            <lightning:input label="Account Phone" />
        </div>
    </lightning:card>
    
    
</aura:application>