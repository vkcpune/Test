public class Add_ContactToAccount
{
public static void setContact(List<Contact> cons){

   for(Contact con : cons)
    {
      Account acc = [Select name, phone From Account where phone =:con.phone];

if(con.phone == acc.phone)
{
contact c = new contact(LastName=con.LastName,AccountId=acc.id,phone=con.phone);
insert c;

}
    }
  }}