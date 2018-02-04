@isTest
public class BatchleadTest
{
    static testMethod void testMethod1()
    {
       // List<Lead> leads= new List<Lead>();
        Test.startTest();
                Lead lead = new Lead();	
			lead.LastName='krishna';
            lead.City__c='Pune';			
			lead.Company='Techm';
			lead.Status='Open - Not Contacted';		
           // leads.add(lead);
            Batchlead obj = new Batchlead();
            DataBase.executeBatch(obj,2);
        Test.stopTest();
    }
}