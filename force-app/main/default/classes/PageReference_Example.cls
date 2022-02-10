public class PageReference_Example {
    public String name {set;get;}
    public String city {set;get;}
    
    public PageReference_Example(){
        name='Akash';
        City='Kolkata';
    }
    public PageReference call(){
        PageReference p = new PageReference('/apex/IF_ELSE');
        return p;
        
    }
       public PageReference show(){
        String url ='/apex/PageReference1?name='+name;
           url =url+'&city='+city;
        PageReference p = new PageReference(url);
        return p;
        
    } 
    // public PageReference invoke(){
       // PageReference p = Page.For_Loop;
       // return p;
        
//}
    
      
}