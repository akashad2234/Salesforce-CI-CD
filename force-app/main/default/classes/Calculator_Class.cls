public class Calculator_Class {
    public Integer aval {set;get;}
    public Integer bval {set;get;}
    public Integer cval {set;get;}
    
    public void add(){
        cval=aval+bval;
    }
    public void Mul(){
        cval=aval*bval;
    }
    public void Cancel(){
        aval=0;
        bval=0;
        cval=0;
    }

}