global class LeadProcessor implements Database.Batchable<Sobject>
{
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator([Select Status From Lead ]);
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope)
    {
            for (Lead Leads : scope)
            {
                Leads.Status = 'Dreamforce';
            }
        update scope;
    }   
    
    global void finish(Database.BatchableContext bc){   }   
}