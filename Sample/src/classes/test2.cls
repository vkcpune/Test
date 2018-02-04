Public class test2{

public String name;

public String getName(){
return name;
}
public void setName(){
this.name=name;
}

public pageReference show(){
name='This is my name'+name;
return null;
}
}