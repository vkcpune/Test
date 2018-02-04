public class ContactServices 
{
 public static void setContactsToAccountsByContactsPhoneNumbers(List<Contact> contacts){
 
    System.debug('Business logic started');

  Set<String> newContactPhoneNumber = new Set<String>();
   for(Contact contact :contacts)
  {
      newContactPhoneNumber.add(contact.Phone); 
      System.debug('Business logic started 1');   
  }
                               
List<Account> accountDetailsOfMatchedContactsPhoneNumbers = [SELECT Id, Phone FROM Account WHERE Phone IN :newContactPhoneNumber];
  
  System.debug('Business logic started 2');   
  
  Map<String, Account> matchedAccountsPhoneNumber = new Map<String, Account>();
    System.debug('Business logic started 3');  
  for (Account account : accountDetailsOfMatchedContactsPhoneNumbers) {
    System.debug('Business logic started 4');  
    matchedAccountsPhoneNumber.put(account.Phone, account);
    System.debug('Business logic started 5'); 
  }
  System.debug('Business logic started 6'); 
  
  for (Contact newContact : contacts) {
  
  System.debug('Business logic started 7'); 
  
  if (newContact.Phone != null) {
  
  System.debug('Business logic started 8'); 
  
      Account account = matchedAccountsPhoneNumber.get(newContact.Phone); 
      
      System.debug('Business logic started 9'); 
      if (account != null) {
      System.debug('Business logic started 10'); 
        newContact.AccountId = account.Id;
        System.debug('Business logic started 11'); 
      }
    }
  }
  System.debug('Business logic started and ended');
  }
  
public static void setContactsToCampaignMembersByContactsLeadSources(List<Contact> contacts){
  Set<String> newContactLeadSource  = new Set<String>();
   for(Contact contact :contacts)
  {
      newContactLeadSource.add(contact.LeadSource);    
  }
                               
List<Campaign> campaignDetailsOfMatchedContactsLeadSources = [SELECT Id, Name FROM Campaign  WHERE Name IN :newContactLeadSource];
  
  Map<String,Campaign> matchedCampignNamesWithContactsLeadSources = new Map<String,Campaign>();
  for (Campaign campaign : campaignDetailsOfMatchedContactsLeadSources) {
    matchedCampignNamesWithContactsLeadSources.put(campaign.Name, campaign);
  }
  
  List<CampaignMember> creationOfCampaignMembersWithMachedContactsLeadSourcesWithCampignNames = new List<CampaignMember>();

  for (Contact newcontact : contacts) {
if (newContact.LeadSource != null) {
      Campaign campaign = matchedCampignNamesWithContactsLeadSources.get(newcontact.LeadSource); 
    if (campaign != null) { 
    CampaignMember newCampaignMembersCreations = new CampaignMember(Campaignid=campaign.Id,ContactId =newcontact.Id,Status ='Sent');
    
    creationOfCampaignMembersWithMachedContactsLeadSourcesWithCampignNames.add(newCampaignMembersCreations);
    
      }
}}
 insert creationOfCampaignMembersWithMachedContactsLeadSourcesWithCampignNames;     
               
    }
}