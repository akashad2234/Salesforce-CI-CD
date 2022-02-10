<aura:application extends="force:slds">
    <div class="one">
        <lightning:progressIndicator currentStep="3" type="path" hasError="false">
            <lightning:progressStep label="step1" value="1" />
            <lightning:progressStep label="step2" value="2" />
            <lightning:progressStep label="step3" value="3" />
            <lightning:progressStep label="step4" value="4" />
        </lightning:progressIndicator>
    </div>
    
</aura:application>