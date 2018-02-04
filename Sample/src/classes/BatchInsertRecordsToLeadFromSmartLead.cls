global class BatchInsertRecordsToLeadFromSmartLead implements Database.Batchable<sObject> 
{
global Database.QueryLocator start(Database.BatchableContext BC)
{
     return Database.getQueryLocator([SELECT CheckBox__c,ReferenceNbr__c,Rank__c,Product__c,SATAmount__c,DLR_Last_Name__c,
            ZipCode__c,RegionName__c,RSM_Account_Number__c,State__c,Account_Number__c,
            Dealer__c,EMail__c,Region__c,Last_Name__c,City__c,Company_Name__c,Status__c FROM SmartLead__c]);
}
global void execute(Database.BatchableContext BC, List<SmartLead__c> scope) {
   List <Lead> leads = new List<Lead>();
   for(SmartLead__c smartlead : scope){     
       System.debug('Course_temp records are: ' +smartlead);
	    
	   if(smartlead.Company_Name__c!= null && smartlead.Status__c!= null)
        {   
       leads.add(
           new Lead(
		   SmartLead_Reference_Number__c=smartlead.ReferenceNbr__c,	   
		   CC_Lead_Rank__c=smartlead.Rank__c,
		   CC_Product_Authorization__c=smartlead.Product__c,
		   CC_SAT_Amount__c=smartlead.SATAmount__c,
		   DLR_Last_Name__c=smartlead.DLR_Last_Name__c,
		   PostalCode__c=smartlead.ZipCode__c,
		   Region_Name__c=smartlead.RegionName__c,
		   RSM_Account_Number__c=smartlead.RSM_Account_Number__c,
		   State__c=smartlead.State__c,
		   Account_Number__c=smartlead.Account_Number__c,
		   Dealer__c=smartlead.Dealer__c,
		   Email=smartlead.EMail__c,
		   Region__c=smartlead.Region__c,
		   LastName=smartlead.Last_Name__c,
            City__c=smartlead.City__c,			
			Company=smartlead.Company_Name__c,
			Status=smartlead.Status__c,
           CopyOfSmartLeadId__c=smartlead.id 
           )
       );
       System.debug('The list is: '+leads);
       smartlead.CheckBox__c=True;            
   }
       else if (smartlead.Company_Name__c== null || smartlead.Status__c== null)
       {
		System.debug('Not Completed'); 
       }         
   }   
    upsert leads SmartLead_Reference_Number__c;
         update scope;
} 
global void finish(Database.BatchableContext BC) {
    System.debug('Finished Succesfully');  
}}