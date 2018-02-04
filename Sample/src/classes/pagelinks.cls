public with sharing class pagelinks {

public string MyData {get;set;}

public pagelinks() {
    MyData = '';    
}

public PageReference printView() {
    PageReference oPageRef = Page.Subjects;
    oPageRef.setRedirect(false);

    return oPageRef;
}
}