public class FunctionalityClass {
    
 public static void execute(List<Lead> lead)   
 {
    Set<String> refNumber = new Set<String>();
  		 for(Lead l : lead)
 		 {
      		refNumber.add(l.SmartLead_Reference_Number__c);     
  		}
           
        List<SmartLead__c> SLeads = [SELECT State__c,City__c FROM SmartLead__c WHERE ReferenceNbr__c IN :refNumber];
		
       Map<String, SmartLead__c> matchedref = new Map<String, SmartLead__c>();
  			for (SmartLead__c slead : SLeads) {
  			  matchedref.put(slead.ReferenceNbr__c, slead);
  			}    
        
 			 for(Lead ls : lead) 
             {
     			 SmartLead__c newlead = matchedref.get(ls.SmartLead_Reference_Number__c);
                
                ls.State__c = 'Hyderabad';
                ls.City__c= newlead.City__c;
       			    			   
              }
       }
}