@isTest
public class NewTest 
{
  static testmethod void dataValidation()
    {	  
    List<SmartLead__c> smartleads = new List<SmartLead__c>();
    for(Integer i=0; i<200; i++){
      smartleads.add(new SmartLead__c(Last_Name__c = 'Temp'+i, Company_Name__c = 'Trail Company'+i, Status__c = 'Open - Not Contacted'));
    }
    insert smartleads;		
      List<Lead> leads = new List<Lead>();
      for(SmartLead__c obj : smartleads){ 
       Lead lead = new Lead(LastName = obj.Last_Name__c,Company = obj.Company_Name__c,Status=obj.Status__c);
	   leads.add(lead);
             System.assertEquals(lead.LastName,obj.Last_Name__c);
			 System.assertEquals(lead.Company,obj.Company_Name__c);
			 System.assertEquals(lead.Status,obj.Status__c);
                  Test.startTest();
			BatchInsertRecordsToLeadFromSmartLead c = new BatchInsertRecordsToLeadFromSmartLead();
			Database.executeBatch(c);
		Test.stopTest();
      }
		upsert leads;     
	}	  

}