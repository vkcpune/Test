public class ContactHandlers extends TriggerDispatcher{



  protected override void onBeforeInsert(){
     System.debug('ContactHandlers onbeforeinsert Works fine 1');

    ContactServices.setContactsToAccountsByContactsPhoneNumbers(Trigger.New);
    
      System.debug('ContactHandlers onbeforeinsert Works fine 2');
 
  }

  protected override void onAfterInsert(){
     System.debug('ContactHandlers onafterinsert Works fine');
    ContactServices.setContactsToCampaignMembersByContactsLeadSources(Trigger.New);

  }

}