global class MapSmartLeadRecordsWithLeadRecords implements Database.Batchable<sObject>{
       
    global Database.QueryLocator start(Database.BatchableContext BC){
           String query='SELECT id FROM lead';

         return Database.getQueryLocator(query);
        }
    
       global void execute(Database.BatchableContext BC, List<SmartLead__c> Slist)
       {
           // FunctionalityClass.execute((List<Sobject>) Slist);
         // List<SmartLead__c> newlead=new List<SmartLead__c>();
          List<Lead> lead=new List<Lead>();
           
         for(lead ld: lead)
         {
            // for(SmartLead__c sl:newlead)
           //  {
                
              // if(ld.SmartLead_Reference_Number__c == sl.ReferenceNbr__c)
         // {
               ld.City__c='Hyderabad';
           } 
             //}
        // }
      update lead;
          
       }
       global void finish(Database.BatchableContext BC){
            // Logic to be Executed at finish
       }
    }