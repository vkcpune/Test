public class naControllerExtension {

private final Account acct;
    public naControllerExtension(ApexPages.StandardController stdcontroller) {

    this.acct = (Account)stdController.getRecord();
    }
public String getGreeting() {
return 'Hello ' + acct.name + ' (' + acct.id + ')';
}
}