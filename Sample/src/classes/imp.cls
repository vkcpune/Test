public class imp{

public pageReference show()
{
List<Account> acc=new List<Account>();
Account a1=new Account(Name='Today');
Account a2=new Account(Name='Banking');
Account a3=new Account(Name='Tom');
acc.add(a1);
acc.add(a2);
acc.add(a3);
Database.SaveResult[] r=Database.insert(acc,true);
return null;
}
}