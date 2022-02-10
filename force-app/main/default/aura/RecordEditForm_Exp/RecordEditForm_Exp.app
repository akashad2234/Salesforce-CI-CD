<aura:application extends="force:slds">
   <!-- <lightning:recordEditForm objectApiName="Account" recordId="0015g00000UqkrVAAR"> -->
    <aura:attribute name="recId" type="Id" default="0015g00000UqkrVAAR"/>
        <lightning:recordEditForm objectApiName="Account" recordId="{!v.recId}">
        <lightning:inputField fieldName="Name" />
        <lightning:inputField fieldName="Industry" />
        <lightning:inputField fieldName="Phone" />
        <lightning:inputField fieldName="Type" />
    </lightning:recordEditForm>
    
</aura:application>