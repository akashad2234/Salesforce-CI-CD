public class TestUtility {
    public static List<Account> createAccountRecords(String Name,Integer Count,Boolean isInsert){
        List<Account> accList = new List<Account>();
        for(Integer i ;i<count;i++){
            Account acc =new Account();
            acc.Name=Name+i;
            accList.add(acc);
        }
        if(isInsert){
            insert accList;
        }
        return accList;
    }
}