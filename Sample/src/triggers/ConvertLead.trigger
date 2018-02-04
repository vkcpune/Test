trigger ConvertLead on Lead (after insert, after update) {
    for (Lead lead : Trigger.new) {
      if (lead.isConverted == false) //to prevent recursion
      {
       
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(lead.Id);
       
        String oppName =  lead.Name;
        lc.setOpportunityName(oppName);
       
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
       
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
       
             
    }
  }
}