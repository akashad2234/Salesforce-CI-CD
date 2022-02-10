@isTest
public class EventUtilityTest {
    @isTest
    public Static void method1(){
        String res = EventUtility.eventPriority('IND');
        System.assertEquals(null, res);
    }
    @isTest
    public Static void testHighPri(){
        String res = EventUtility.eventPriority('CA');
        System.assertEquals('High', res);
    }
    @isTest
    public Static void testMediumPri(){
        String res = EventUtility.eventPriority('NA');
        System.assertEquals('Medium', res);
    }
}