global class Schedule_CreateNewRecords implements Schedulable{
    global static void execute(SchedulableContext SC){
        //this simply runs the batch from step 2
        UpdateAccountFields CNR = new UpdateAccountFields();
        ID idBatch = Database.executeBatch(CNR); 
    }
}