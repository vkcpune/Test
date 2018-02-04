global class InboundEmailServiceAccountExample implements Messaging.InboundEmailHandler{
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope){
        //Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        String name = email.fromName;
        String description = email.subject;
        String industry = email.plainTextBody;
        
        Account acc = new Account(Name = name, Description = description, Industry = industry);
        insert acc;
        return null;
    }
    

}