public class Apex_Message_Example {
    public String name {set;get;}
    public Integer age {set;get;}
    public void submit(){
        if(name=='')
           {
             Apexpages.Message msg = new  Apexpages.Message(Apexpages.Severity.ERROR,'Name Cannot be blank');
               Apexpages.addMessage(msg);
           }
        if(age<30)
        {
            Apexpages.Message msg = new  Apexpages.Message(Apexpages.Severity.ERROR,'Age Cannot be less than 30');
               Apexpages.addMessage(msg);
        }
    }

}