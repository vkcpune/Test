public class childparent{

public List<Contact> cont{get;set;}
public pageReference show()
{
cont=[select id,Name,email,Account.Name,Account.Industry from Contact Limit 5];
return null;
}
}