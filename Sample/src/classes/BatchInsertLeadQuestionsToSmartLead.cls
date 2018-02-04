global class BatchInsertLeadQuestionsToSmartLead implements Database.Batchable<sObject> 
{ 
  global string queryStr{get;set;}
  
  global Database.QueryLocator start(Database.BatchableContext bc){
        String query;
        
        if(queryStr != null && queryStr != ''){
            query = queryStr;
        }
        else {
        // collect the batches of records or objects to be passed to execute
             query = 'SELECT Id,Name, '+
                          ' ChoiceDescription__c, OpenEndedText__c, '+
                            ' QACID__c, QuestionDescription__c, QuestionNumber__c, '+
                            ' ReferenceNbr__c, ResponseNumber__c '+
                            ' FROM SmartLeadQuestion__c ORDER BY ReferenceNbr__c';
          // query = ('SELECT ReferenceNbr__c,Name,ChoiceDescription__c,OpenEndedText__c,QACID__c,QuestionDescription__c,QuestionNumber__c,ResponseNumber__c FROM SmartLeadQuestion__c ORDER BY ReferenceNbr__c'); 
            System.debug('start step starts');
        }
                             
        if(test.isRunningTest()){
          query += ' LIMIT 10';
        }
            System.debug('start step starts and ended');
         return Database.getQueryLocator(query);

    }

    global void execute(Database.BatchableContext bc, List<SmartLeadQuestion__c> smartLeadQuestions){
         Map<String, Lead> refNumVsLeadsMap = new Map<String, Lead>();
         List<Lead> upsertLeadsList = new List<Lead>();
         Map<String,List<SmartLeadQuestion__c>> refNumVsSmartLeadQues = new Map<String,List<SmartLeadQuestion__c>>();
        
        System.debug('Execute step starts');
        
         for(SmartLeadQuestion__c smLeadQ : smartLeadQuestions){
             List<SmartLeadQuestion__c> tempSLeadQs = new List<SmartLeadQuestion__c>();
             if(refNumVsSmartLeadQues.containsKey(smLeadQ.ReferenceNbr__c)){
                 tempSLeadQs = refNumVsSmartLeadQues.get(smLeadQ.ReferenceNbr__c);
             }
             
             tempSLeadQs.add(smLeadQ);
             refNumVsSmartLeadQues.put(smLeadQ.ReferenceNbr__c,tempSLeadQs);
         }
         
        System.debug('Execute step starts 1');
        
        List<Lead> leads = [Select Id,Name,SmartLead_Reference_Number__c,Comments__c
                             FROM Lead WHERE SmartLead_Reference_Number__c IN : refNumVsSmartLeadQues.keySet()];
 System.debug('Execute step starts 2');
        for(Lead ld : leads){
            refNumVsLeadsMap.put(ld.SmartLead_Reference_Number__c,ld);
        }                     
          System.debug('Execute step starts 3');
         for(String refNum : refNumVsSmartLeadQues.keySet()){
             Lead newLead = new Lead();
             System.debug('Execute step starts 4'); 
             if(refNum != Null){
                 if(refNumVsLeadsMap.containsKey(refNum)){
                     newLead = refNumVsLeadsMap.get(refNum); 
                 }
                 newLead.SmartLead_Reference_Number__c = refNum; 
             }
              System.debug('Execute step starts 5');
             String finalConcatenatedValues;
             if(refNumVsSmartLeadQues.get(refNum) != null){
                 for(SmartLeadQuestion__c smLeadQ : refNumVsSmartLeadQues.get(refNum)){
                     String concatenatedValues = Null;
                     if(smLeadQ.QuestionDescription__c != Null){
                        concatenatedValues = smLeadQ.QuestionDescription__c+' = '+ '::';
                     }
                     if(smLeadQ.ChoiceDescription__c != NUll){
                        concatenatedValues += smLeadQ.ChoiceDescription__c + '::';
                     }
                     if(smLeadQ.OpenEndedText__c != NUll){
                       concatenatedValues += smLeadQ.OpenEndedText__c;
                     }
                     finalConcatenatedValues += concatenatedValues+' \r\n ';
                 }
             }
              System.debug('Execute step starts 6');
            newLead.Comments__c += ' \r\n '+finalConcatenatedValues;
              System.debug('Execute step starts 7');
           newLead.LastName = 'LastName'; 
           newLead.Company = 'Company';   
             upsertLeadsList.add(newLead);
         }
 System.debug('Execute step starts 8');         
        Database.UpsertResult[] results = Database.upsert(upsertLeadsList, Lead.SmartLead_Reference_Number__c.getDescribe().getSObjectField() ,false ) ;
       
         System.debug('Execute step starts 9');
        
        for(Integer i=0;i<results.size();i++){
            if (!results.get(i).isSuccess()){
                Database.Error err = results.get(i).getErrors().get(0);
                System.debug('Error - '+err.getMessage() + '\nStatus Code : '+err.getStatusCode()+'\n Fields : '+err.getFields());
            }
        }
    }    

    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    

}