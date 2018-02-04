public with Sharing class DeferenceDemoController
{
public List<Account> accList{get;set;}
public List<Contact>conList{get;set;}
public List<Opportunity> optyList{get;set;}
public List<Lead> leadList{get;set;}



public DeferenceDemoController()
{
}
public void soslDemo_method()
{
accList=New List<account>();
conList=New List<Contact>();
optyList= New List<Opportunity>();
leadList=New List<Lead>();

List<List<Sobject>> SearchList=[FIND 'Barr' IN ALL FIELDS RETURNING Account(Name,Type),Contact(name,email),Opportunity(name),Lead(name,Company)];
accList=((List<Account>)searchList[0]);
conList=((List<Contact>)searchList[1]);
optyList=((List<Opportunity>)searchList[2]);
leadList=((List<Lead>)searchList[3]);
}
}