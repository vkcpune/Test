@isTest
public class TestUtil
{
 private static String Last_Name ='Temp';
 private static String Company_Name ='Comp';
 private static String Status='Open - Not Contacted';
 private static String ReferenceNbr ='1';
 private static String Rank='9999';
 private static String Product='Sample 1';
 private static Integer SATAmount=9999;
 private static String DLR_Last_Name='Last1';
 private static String ZipCode='777';
 private static String RegionName='Rname';
 private static Integer RSM_Account_Number=68997;
 private static String State='US';
 private static Integer Account_Number=11111;
 private static String Dealer='Water';
 private static String EMail='666@gmail.com';
 private static String Region='CST';
 private static String City='Warrens';

     static testmethod void dataValidation()
    {	 
        List<Lead> leads = new List<Lead>();
         if(Company_Name!= null && Status!= null)
        {   
         Lead lead = new Lead(
             LastName = Last_Name,
             Company = Company_Name,
             Status=Status,
             SmartLead_Reference_Number__c= ReferenceNbr,
       		 CC_Lead_Rank__c=Rank,
		     CC_Product_Authorization__c=Product,
		     CC_SAT_Amount__c=SATAmount,
		     DLR_Last_Name__c=DLR_Last_Name, 
		     PostalCode__c=ZipCode,
		     Region_Name__c=RegionName,
		     RSM_Account_Number__c=RSM_Account_Number,
		     State__c=State,
		     Account_Number__c=Account_Number,
		     Dealer__c=Dealer,
		     Email=EMail,
		     Region__c=Region,
		     City__c=City );
		leads.add(lead); 
             System.assertEquals(lead.LastName,Last_Name);
			 System.assertEquals(lead.Company,Company_Name);
			 System.assertEquals(lead.Status,Status);
             System.assertEquals(lead.CC_Lead_Rank__c,Rank);
			 System.assertEquals(lead.CC_Product_Authorization__c,Product);
			 System.assertEquals(lead.CC_SAT_Amount__c,SATAmount);
			 System.assertEquals(lead.DLR_Last_Name__c,DLR_Last_Name);
			 System.assertEquals(lead.PostalCode__c,ZipCode);
			 System.assertEquals(lead.Region_Name__c,RegionName);
			 System.assertEquals(lead.RSM_Account_Number__c,RSM_Account_Number);
			 System.assertEquals(lead.State__c,State);
			 System.assertEquals(lead.Account_Number__c,Account_Number);
			 System.assertEquals(lead.Dealer__c,Dealer);
			 System.assertEquals(lead.Email,EMail);
			 System.assertEquals(lead.Region__c,Region);
			 System.assertEquals(lead.City__c,City);
        }
        
       else if (Company_Name== null || Status== null)
       {
         System.debug('fail');
       }
        Test.startTest();
			BatchInsertRecordsToLeadFromSmartLead c = new BatchInsertRecordsToLeadFromSmartLead();
			Database.executeBatch(c);
		Test.stopTest();			 
    upsert leads SmartLead_Reference_Number__c;
	}
}