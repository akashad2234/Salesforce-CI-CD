<aura:application extends="force:slds">
    <!-- <lightning:recordEditForm objectApiName="Account" recordId="0015g00000UqkrVAAR"> -->
    <aura:attribute name="recId" type="Id" default="0015g00000JdKSJAA3"/>
    <lightning:recordViewForm objectApiName="Account" recordId="{!v.recId}">
        <div class="slds-box" >
            <lightning:outputField fieldName="Name" />
            <lightning:outputField fieldName="Industry" />
            <lightning:outputField fieldName="Phone" />
            <lightning:outputField fieldName="Type" />
        </div>
        
    </lightning:recordViewForm>
    
</aura:application>