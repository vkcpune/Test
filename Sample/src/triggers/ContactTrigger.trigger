trigger ContactTrigger on Contact (before insert, before update, before delete,after insert, after update, after delete) 
 {
 System.debug('Trigger Works Started');
  ContactHandlers dispatcher = new ContactHandlers();
  dispatcher.dispatchEvent();
  System.debug('Trigger Works fine');
  
}