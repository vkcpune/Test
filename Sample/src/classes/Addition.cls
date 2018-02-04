Public class Addition{

    public PageReference calculation() {
        return null;
    }


    public String operator { get; set; }

public Integer bvalue{get;set;}
public Integer avalue{get;set;}
public Integer result{get;set;}
public String Operation{get;set;}

Public pageReference subb(){

result=avalue-bvalue;
operation='subtraction';
return null;
}

Public pageReference Addition(){

result=avalue+bvalue;
operation='addition';
return null;
}
}