trigger accountinsert on Account(before insert)
{
for(Account a:Trigger.New)
{
List<Account>mynew=[select id,Name from Account where name=:a.name];
if(mynew.size()>0)
{
a.Name.addError('Account with name is existing');
}
}
}