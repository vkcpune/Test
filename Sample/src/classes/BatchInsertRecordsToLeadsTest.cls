@isTest
public class BatchInsertRecordsToLeadsTest
{
     static testmethod void dataValidationForSmartLeads()
    {	  
		List<SmartLead__c> smartleadList = new List<SmartLead__c>();
		SmartLead__c smartlead = new SmartLead__c(
         ReferenceNbr__c='1',
         Last_Name__c ='Temp',
            Company_Name__c = 'Trail Company',
            Rank__c='9999',
            Product__c='Sample 1',
            SATAmount__c=9999,
            DLR_Last_Name__c='Last1',
            ZipCode__c='777',
            RegionName__c='Rname',
            RSM_Account_Number__c=68997,
            State__c='US',
            Account_Number__c=11111,
            Dealer__c='Water',
            EMail__c='666@gmail.com',
            Region__c='CST',
            City__c='Warrens',
            Status__c='Open - Not Contacted');
		smartleadList.add(smartlead);
		insert smartleadList;
        
		List<Lead> leads = new List<Lead>();
		for(SmartLead__c smartLeads : smartleadList){      
         if(smartLeads.Company_Name__c!= null && smartLeads.Status__c!= null)
        {          
		Lead lead = new Lead(
        SmartLead_Reference_Number__c= smartLeads.ReferenceNbr__c,
        LastName = smartLeads.Last_Name__c,
        Company = smartLeads.Company_Name__c,		
		CC_Lead_Rank__c=smartLeads.Rank__c,
        CC_Product_Authorization__c=smartLeads.Product__c,
		CC_SAT_Amount__c=smartLeads.SATAmount__c,
        DLR_Last_Name__c=smartLeads.DLR_Last_Name__c,
        PostalCode__c=smartLeads.ZipCode__c,
		Region_Name__c=smartLeads.RegionName__c,
        RSM_Account_Number__c=smartLeads.RSM_Account_Number__c,
		State__c=smartLeads.State__c,
        Account_Number__c=smartLeads.Account_Number__c,
        Dealer__c=smartLeads.Dealer__c,
		Email=smartLeads.EMail__c,
        Region__c=smartLeads.Region__c,
        City__c=smartLeads.City__c,
        Status=smartLeads.Status__c
		);
		leads.add(lead);
             System.assertEquals(lead.SmartLead_Reference_Number__c,smartLeads.ReferenceNbr__c);
             System.assertEquals(lead.LastName,smartLeads.Last_Name__c);
			 System.assertEquals(lead.Company,smartLeads.Company_Name__c);
			 System.assertEquals(lead.CC_Lead_Rank__c,smartLeads.Rank__c);
			 System.assertEquals(lead.CC_Product_Authorization__c,smartLeads.Product__c);
			 System.assertEquals(lead.CC_SAT_Amount__c,smartLeads.SATAmount__c);
			 System.assertEquals(lead.DLR_Last_Name__c,smartLeads.DLR_Last_Name__c);
			 System.assertEquals(lead.PostalCode__c,smartLeads.ZipCode__c);
			 System.assertEquals(lead.Region_Name__c,smartLeads.RegionName__c);
			 System.assertEquals(lead.RSM_Account_Number__c,smartLeads.RSM_Account_Number__c);
			 System.assertEquals(lead.State__c,smartLeads.State__c);
			 System.assertEquals(lead.Account_Number__c,smartLeads.Account_Number__c);
			 System.assertEquals(lead.Dealer__c,smartLeads.Dealer__c);
			 System.assertEquals(lead.Email,smartLeads.EMail__c);
			 System.assertEquals(lead.Region__c,smartLeads.Region__c);
			 System.assertEquals(lead.City__c,smartLeads.City__c);
			 System.assertEquals(lead.Status,smartLeads.Status__c);
        }
            
       else if (smartLeads.Company_Name__c== null || smartLeads.Status__c== null)
       {
			System.debug('fail');
       }
           
        Test.startTest();
			BatchInsertRecordsToLeadFromSmartLead c = new BatchInsertRecordsToLeadFromSmartLead();
			Database.executeBatch(c);
		Test.stopTest();			 
        }
    upsert leads SmartLead_Reference_Number__c;
        update smartleadList;
	}	  	
  	}