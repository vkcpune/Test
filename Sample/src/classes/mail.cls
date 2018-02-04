public class mail
{
public pageReference show()
{
Messaging.singleEmailMessage msg= new Messaging.singleEmailMessage();
String[] toaddress=new String[]{'penubakula4a6@gmail.com'};
msg.setToAddresses(toaddress);

String[] tobccaddress = new String[]{'penubakula4a6@gmail.com'};
msg.setBccAddresses(tobccaddress);

String[] toccaddress = new String[]{'vamshi4a6@gmail.com'};
msg.setccAddresses(toccaddress);
msg.setSubject('Test');
msg.setplainTextBody('Hai Krishna');

msg.setHtmlBody('<h1> This is the link for Registration</h1>');
Messaging.sendEmail(new Messaging.singleEmailMessage[]{msg});
return null;
}
}