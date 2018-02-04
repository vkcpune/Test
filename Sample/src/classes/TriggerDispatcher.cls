public virtual class TriggerDispatcher{

  protected final Boolean IS_BEFORE_INSERT =  Trigger.isBefore && Trigger.isInsert;
  protected final Boolean IS_AFTER_INSERT =   Trigger.isAfter && Trigger.isInsert;
  protected final Boolean IS_BEFORE_UPDATE =  Trigger.isBefore && Trigger.isUpdate;
  protected final Boolean IS_AFTER_UPDATE =   Trigger.isAfter && Trigger.isUpdate;
  protected final Boolean IS_BEFORE_DELETE =  Trigger.isBefore && Trigger.isDelete;
  protected final Boolean IS_AFTER_DELETE =   Trigger.isAfter && Trigger.isDelete;

  protected List<SObject> newlist = Trigger.new;
  protected Map<ID, SObject> newmap = Trigger.newMap;
  protected List<SObject> oldlist = Trigger.old;
  protected Map<ID,SObject> oldmap = Trigger.oldMap;
  
  
 

  //public static Boolean isDebugMode = DebugMode__c.getOrgDefaults().DebugMode__c;
  //protected String currentClassName;

  public TriggerDispatcher(){
   // this.currentClassName = String.valueOf(this).substringBefore(':');
    //if(isDebugMode)debug('NEW TRIGGER DISPATCHER INSTANTIATED');
      System.debug('TriggerDispatcher Started');
  }

  public void dispatchEvent(){
  
  System.debug('dispatchEvent started');
  
    if(IS_BEFORE_INSERT){
     // if(isDebugMode)debug('ENTER BEFORE INSERT');
     System.debug('TriggerDispatcher before insert started 1');
      onBeforeInsert();
      System.debug('TriggerDispatcher before insert started 2');
    }

    if(IS_AFTER_INSERT){
     // if(isDebugMode)debug('ENTER AFTER INSERT');
      onAfterInsert();
    }

    if(IS_BEFORE_UPDATE){
      //if(isDebugMode)debug('ENTER BEFORE UPDATE');
      onBeforeUpdate();
    }

    if(IS_AFTER_UPDATE){
      //if(isDebugMode)debug('ENTER AFTER UPDATE');
      onAfterUpdate();
    }

    if(IS_BEFORE_DELETE){
      //if(isDebugMode)debug('ENTER BEFORE DELETE');
      onBeforeDelete();
    }

    if(IS_AFTER_DELETE){
      //if(isDebugMode)debug('ENTER AFTER DELETE');
      onAfterDelete();
    }

  }

  protected void debug(String message){
    //System.debug(currentClassName+' - '+message);
       System.debug('TriggerDispatcher Started and Ended');
  }

  protected void processErrors(Map<SObject, String> recordTOerror){
    for(SObject record : recordTOerror.keySet()){
      record.addError(recordTOerror.get(record));
    }
  }

  protected virtual void onBeforeInsert(){}
  protected virtual void onAfterInsert(){}
  protected virtual void onBeforeUpdate(){}
  protected virtual void onAfterUpdate(){}
  protected virtual void onBeforeDelete(){}
  protected virtual void onAfterDelete(){}
  


}