/*This is a schema programming to fetch the list of picklist options from the given field from the given object */
public class Schema_Lead_Example {
    @AuraEnabled
    public static List<String> getData(String objName ,String fldName){
        List<String> options = new List<String>();
        Map<String,Schema.SObjectType> objMap = Schema.getGlobalDescribe();
        Schema.SObjectType obj=objMap.get(objName);
        Schema.DescribeSObjectResult objResult = obj.getDescribe();
        Map<String,Schema.SObjectField> fldMap=objResult.fields.getMap();
        schema.SObjectField fld=fldMap.get(fldName);
        schema.DescribeFieldResult result=fld.getDescribe();
        if(result.getType()==Schema.DisplayType.PICKLIST){
            List<schema.PicklistEntry> entries=result.getPickListValues();
            for(schema.PicklistEntry p:entries){
                options.add(p.getValue());
            }
        }
        return options;
    }
    
}