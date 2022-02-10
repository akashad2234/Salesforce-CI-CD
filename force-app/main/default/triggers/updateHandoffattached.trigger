trigger updateHandoffattached on Top_X_Designation__c (after insert, after update,after delete) {
map<String,String> maptop = new map<String,String>();

set<Id> oppid = new set<Id>();

map<String,String> maptopfalse = new map<String,String>();//faslecase map

set<Id> oppIdInFalseCase = new set<Id>();//falsecase set

map<String,String> deletecase = new map<String,String>();

set<Id> delcaseid = new set<Id>();//deletecase set

List<Opportunity> opplist = new List<Opportunity>(); // query list

List<Opportunity> listtoupdate = new List<Opportunity>(); //for update

for(Top_X_Designation__c top : trigger.isdelete? trigger.old :trigger.new)

{

if(trigger.isInsert || trigger.isUpdate)

{

if(top.Document_Attached__c == true &&
   ((top.Type__c=='Contract Flow Down') || (top.Type__c=='Handoff')))

{

maptop.put(top.Opp_top_x_designation__c, top.Id);

oppid.add(top.Opp_top_x_designation__c);

system.debug('here '+ top.Opp_top_x_designation__c);

}

else

maptopfalse.put(top.Opp_top_x_designation__c,top.id);

oppid.add(top.Opp_top_x_designation__c);

system.debug('here in else part' + top.Opp_top_x_designation__c);

}

if(trigger.isDelete){

deletecase.put(top.Opp_top_x_designation__c,top.Id);

delcaseid.add(top.Opp_top_x_designation__c);

oppid.add(top.Opp_top_x_designation__c);

}

}
    opplist = [select Id,Handoff_Attached__c from opportunity where id in:oppid];

for( opportunity opp : opplist){

if(maptop.containsKey(opp.id))

{

opp.Handoff_Attached__c ='yes';

//listtoupdate.add(opp);

}

if(maptopfalse.containsKey(opp.id)){

opp.Handoff_Attached__c ='no';

// listtoupdate.add(opp);

}

if(delcaseid.contains(opp.Id)){

opp.Handoff_Attached__c ='';

}

listtoupdate.add(opp) ;

}

if( listtoupdate.size()>0){
    update listtoupdate;

system.debug('testL'+listtoupdate);
}
}