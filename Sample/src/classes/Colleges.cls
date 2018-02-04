public class Colleges{

public College__c college{get;set;}
 
public Colleges(){
    college = new College__c();
}

public PageReference save() {
try {
insert college;
} catch(System.DMLException e) {
ApexPages.addMessages(e);
return null;
}
// After successful Save, navigate to the default view page
PageReference redirectSuccess = new ApexPages.StandardController(college).view();
return (redirectSuccess);
}
}