global class AddRecordsToLeadsFromSmartLeads implements Database.Batchable<SmartLead__c> {

 global List<SmartLead__c> start(Database.BatchableContext BC) {
    return [SELECT ReferenceNbr__c,Rank__c,Product__c,SATAmount__c,DLR_Last_Name__c,
            ZipCode__c,RegionName__c,RSM_Account_Number__c,State__c,Account_Number__c,
            Dealer__c,EMail__c,Region__c,Last_Name__c,City__c,Company_Name__c FROM SmartLead__c];
}
global void execute(Database.BatchableContext BC, List<SmartLead__c> scope) {
   List<Lead> leads = new List<Lead>();
   for(SmartLead__c obj : scope){
       System.debug('Course_temp records are: ' +obj);
       leads.add(
           new Lead(
		   SmartLead_Reference_Number__c=obj.ReferenceNbr__c,	   
		   CC_Lead_Rank__c=obj.Rank__c,
		   CC_Product_Authorization__c=obj.Product__c,
		   CC_SAT_Amount__c=obj.SATAmount__c,
		   DLR_Last_Name__c=obj.DLR_Last_Name__c,
		   PostalCode__c=obj.ZipCode__c,
		   Region_Name__c=obj.RegionName__c,
		   RSM_Account_Number__c=obj.RSM_Account_Number__c,
		   State__c=obj.State__c,
		   Account_Number__c=obj.Account_Number__c,
		   Dealer__c=obj.Dealer__c,
		   Email=obj.EMail__c,
		   Region__c=obj.Region__c,
		   LastName=obj.Last_Name__c,
            City__c=obj.City__c,			
			Company=obj.Company_Name__c,
			Status='Open - Not Contacted'
           )
       );
       System.debug('The list is: '+leads);
   }
   insert leads;
}

global void finish(Database.BatchableContext BC) {
    System.debug('Finished Succesfully');
}}