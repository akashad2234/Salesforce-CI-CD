public class recursiveHandler {
    public static boolean isFirst = true;
    public static void insertHandler(List<Contact> ConList)
    {
        List<Contact> cList = new List<Contact>();
        for(Contact c:ConList)
        {
            Contact cobj = new Contact();
            cobj.FirstName='Recursive';
            cobj.LastName='Trigger';
            cList.add(cobj);
        }
        if(!cList.isEmpty())
           {
               insert cList;
           }
    }

}