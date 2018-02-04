public  virtual class ContactTriggerToCampaign{   

  public static void onAfterInsert()
  {
    //AddContactToCampaignMember dis = new AddContactToCampaignMember();
    //dis.setCampaignMember(Trigger.New);
    AddContactToCampaignMember.setCampaignMember(Trigger.New);
}
}