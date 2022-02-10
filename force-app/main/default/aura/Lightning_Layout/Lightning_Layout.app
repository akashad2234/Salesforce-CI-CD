<aura:application extends="force:slds">
    <div class="box">
        <lightning:layout horizontalAlign="space"> <!--spread ,center -->
            <lightning:layoutItem>
                <p class="slds-p-horizontal_x-small">Block1</p>
                <b>Account</b>
            </lightning:layoutItem>
            <lightning:layoutItem>
                <p class="slds-p-horizontal_x-small">Block1</p>
                <b>Contact</b>
            </lightning:layoutItem>
            <lightning:layoutItem>
                <p class="slds-p-horizontal_x-small">Block1</p>
                <b>Opportunity</b>
            </lightning:layoutItem>
        </lightning:layout>
       
    </div>
    <div class="box">
     <lightning:layout verticalAlign="strech"> <!--spread ,center -->
            <lightning:layoutItem>
                <p class="slds-p-vertical_x-small">Block1</p>
                <b>Account</b>
            </lightning:layoutItem>
            <lightning:layoutItem>
                <p class="slds-p-vertical_x-small">Block1</p>
                <b>Contact</b>
            </lightning:layoutItem>
            <lightning:layoutItem>
                <p class="slds-p-vertical_x-small">Block1</p>
                <b>Opportunity</b>
            </lightning:layoutItem>
        </lightning:layout>
    </div>
    
</aura:application>