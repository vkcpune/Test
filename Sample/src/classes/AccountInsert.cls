@isTest
public class AccountInsert
{
public static testMethod void testinsert() {
String addError;
String myname='krishna';
Account a2=new Account(name=myname);

List<Account> x=[select Name from Account where Name=:myname];
    if(x.size()<1) {
    System.assertEquals(0,x.size());
    insert a2;
    } else {
      addError='existing';
       System.assertEquals('existing',addError);
     }
 
 }
}