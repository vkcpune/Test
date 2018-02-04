public class testemail
{
private final List<Id> Contactids;
public List<Contact> Con;
public testemail(Apexpages.StandardController controller)
{
con=[select Id from contact limit 5];
for(Integer i=0;i<5;i++)
{
contactids.add(Con[i].Id);
}
}
public void sendEmail()
{
Messaging.MassEmailMessage mail=new Messaging.MassEmailMessage();
mail.setTargetObjectIds(contactids);
Messaging.sendEmail(new Messaging.MassEmailMessage[]{mail});
}
}