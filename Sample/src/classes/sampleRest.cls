public class sampleRest extends Dispatcher
{

protected override void onBeforeInsert(){

    Add_ContactToAccount.setContact(Trigger.New);

  }

  protected override void onBeforeUpdate(){

    Add_ContactToAccount.setContact(Trigger.New);
  }
}