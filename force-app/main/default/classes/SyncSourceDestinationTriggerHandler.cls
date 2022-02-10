public class SyncSourceDestinationTriggerHandler {
    public static void SyncSourceDestination(String SourceObject, String DestinationObject){
        Map<String , AccountContactUpdate__c> conUpdate =AccountContactUpdate__c.getAll();
        Map<String, String> srcDestMap = new Map<String, String>();
        set<Id> sObjectIdset = new Set<Id>();
        //  set<Id> sObjIdset = new Set<Id>();
        List<String> destinationFieldList = new List<String>();
        List<String> sourceFieldList = new List<String>();
        String destinationField;
        String sourceField;
        String relationshipName;
        for(String key : conUpdate.keySet()){
            if(conUpdate.get(key).Active__c==true){
                
                srcDestMap.put(conUpdate.get(key).Source_Field__c, conUpdate.get(key).Destination_Field__c);
                
                 // destinationField=conUpdate.get(key).Destination_Field__c;
                
               if(destinationField != null && destinationField != ''){
                    destinationField = destinationField + ',' + conUpdate.get(key).Destination_Field__c ;
                    
                }
                else {
                    destinationField = conUpdate.get(key).Destination_Field__c;
                }
                relationshipName=conUpdate.get(key).RelationShip_Field__c;
               
                
            }
        }
       
        for(sObject acc : (List<sObject>)Trigger.New){
            for(String srcFld : srcDestMap.keySet()){
                if(acc.get(srcFld) !=trigger.oldMap.get(acc.id).get(srcFld)){
                    sObjectIdset.add(acc.id);
                }
            }
        }
        String q=('select id,'+destinationField+','+relationshipName+ ' from '  +DestinationObject+  ' where ' +relationshipName+ ' in:sObjectIdset');
        List<sObject> destList =Database.query(q);
        for(sObject con : destList){
            for(String srcFld : srcDestMap.keySet()){
                con.put(srcDestMap.get(srcFld), trigger.newmap.get((String)con.get(relationshipName)).get(srcFld));
                //System.debug(' Line no. 22 ' + trigger.newmap.get(con.accountId).get(srcFld));
            }
        }
        if(destList !=null && destList.size()>0){
            update destList;
        }
    }
}