Public class ArrayExample{

public Account[] myval{set;get;}
public String name{get;set;}

public ArrayExample()
{
Account A1=new Account(name='sashi',Industry='Banking');
Account A2=new Account(name='ravi',Industry='Banking');
Account A3=new Account(name='praveen',Industry='Banking');

myval=new Account[]{a1,a2,a3};
}
}