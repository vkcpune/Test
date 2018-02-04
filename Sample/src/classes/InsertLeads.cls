public class InsertLeads
{
    static  void testMethod1()
    {	          
		List<SmartLead__c> accList = new List<SmartLead__c>();
		for (Integer i=0;i<500;i++) {
            SmartLead__c lead = new SmartLead__c(	   		
			ReferenceNbr__c='1501'+ i,	   
			Rank__c='1501'+i,
			Product__c='Test 1501'+ i,
			SATAmount__c=1501+i,
			DLR_Last_Name__c='LastN 1501'+ i,
			ZipCode__c='64093',
			RegionName__c='CST 1501'+ i,
			RSM_Account_Number__c=584753+ i,
			State__c='MO',
			Account_Number__c=584753+ i,
			Dealer__c='Enterprize 1501'+ i,
			EMail__c='123@gmail.com',
			Region__c='Central 1501'+ i,
			Last_Name__c='Last 1501'+ i,
			City__c='Warrens',			
			Company_Name__c='Comapany 1501'+i);	
		accList.add(lead);
}
		insert accList;                    
    }
}