<aura:application extends="force:slds">
    <lightning:recordEditForm
                              objectApiName="Account"
                              onload="{!c.handleCreateLoad}">
        <lightning:messages />
        <lightning:inputField aura:id="nameField" fieldName="Name"/>
        <lightning:inputField aura:id="type" fieldName="Type" />
        <lightning:inputField aura:id="phone" fieldName="Phone" />
        <lightning:button class="slds-m-top_small" type="submit" label="Create new" />
    </lightning:recordEditForm>
</aura:application>