@isTest
public class AddRecordsToLeadsFromSmartLeadsTest
{
    static testMethod void testMethod1()
    {
        List<Lead> leads= new List<Lead>();
        for(Integer i=0 ;i <200;i++)
        {
            Lead lead = new Lead();
           // Name ='Name'+i		
			lead.LastName='krishna';
            lead.City__c='Pune';			
			lead.Company='Techm';
			lead.Status='Open - Not Contacted';		
            leads.add(lead);
        }

        insert leads;
        Test.startTest();
            AddRecordsToLeadsFromSmartLeads obj = new AddRecordsToLeadsFromSmartLeads();
            DataBase.executeBatch(obj);
        Test.stopTest();
    }
}