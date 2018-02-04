public class ContactUtil {  
    public static void setDefaultValues(List<Contact> Contacts) {
    
        Set<Id> accountIds = new Set<Id>();

        for (Contact contact: contacts) {
            if (contact.AccountId != null) accountIds.add(contact.AccountId);
            
        }

     Map<Id, Account> accounts = new Map<Id, Account>([SELECT Id,Name FROM Account WHERE Id IN :accountIds]);

            for (Contact contact : contacts) {
            if (contact.AccountId != null && accounts.containsKey(contact.AccountId)) {
                Account account = accounts.get(contact.AccountId);
                contact.MailingStreet = account.BillingStreet;              
           }
           }}     }