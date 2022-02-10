public class Aura_Example_2 {
    @AuraEnabled
    public Static Decimal calculate(Integer amount,Integer rate,Integer years){
        Decimal intrest =(amount*rate*years)/100;
        return intrest;
    }
}