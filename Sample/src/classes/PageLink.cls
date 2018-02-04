public with sharing class PageLink {

    public PageReference Save() {
        return null;
    }


public string MyData {get;set;}

public PageLink() {
    MyData = '';    
}

public PageReference printView() {
    PageReference oPageRef = Page.Subjects;
    oPageRef.setRedirect(true);

    return oPageRef;
    
}
}