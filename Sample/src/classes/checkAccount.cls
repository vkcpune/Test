@RestResource(urlMapping='/showAccountDetails/*')

global class checkAccount
{
@HttpGet
//global static List<Account>getAccount()
global static Account doGet()
{
/*List<Account> test;
try
{
test=[select name,phone from Account];
return test;
}
catch(Exception ex)
{
System.debug('Error'+ex.getMessage());
}
return test;*/

RestResponse res= RestContext.response;
RestRequest req= RestContext.request;
String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
System.debug('Account ID:'+accountId);
Account result=[SELECT Id,Name,Phone FROM Account WHERE Id=:accountId];
return result;
}

@HttpPost
global static String doPost(String name,String phone,String AccountNumber)
{
Account acc= new Account();
acc.name=name;
acc.phone=phone;
acc.AccountNumber = AccountNumber;
insert acc;
return acc.Id;
}

@HttpDelete
global static void doDelete()
{
RestResponse res= RestContext.response;
RestRequest req= RestContext.request;
String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
System.debug('Account Number:'+AccNumber);
Account result=[SELECT Id,Name,Phone FROM Account WHERE AccountNumber =:AccNumber];
delete result;
}
}