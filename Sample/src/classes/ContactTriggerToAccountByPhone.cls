public class ContactTriggerToAccountByPhone{   

  public static void onBeforeInsert()
  {
    AddContactToAccountByPhoneNumber.setContact(Trigger.New);
}
}