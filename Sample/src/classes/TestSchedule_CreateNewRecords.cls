@isTest
public class TestSchedule_CreateNewRecords {

    static testMethod void myTest(){
        UpdateAccountFields CNR = new UpdateAccountFields();
        test.startTest();
        ID idBatch = Database.executeBatch(CNR);
        test.stopTest();
        system.assert(idBatch != null);
    }
}