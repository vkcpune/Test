public class AddContactToCampaignMember 
{
 public static void setCampaignMember(List<Contact> cons){
//trigger task on Contact (after insert)
//{
List<Contact> c1 = new List<Contact>();
Set<String> cph = new Set<String>();
for(Contact con:cons)
{
cph.add(con.LeadSource);
c1.add(con);
}

List<Campaign> cam = new List<Campaign>();
cam = [select id,name from campaign where name in :cph];

for(Contact con:c1){
for(campaign ca:cam){
if(con.LeadSource == ca.Name)
{
List<CampaignMember> c3 = new List<CampaignMember>();
campaignMember camp= new campaignMember(); 

CampaignMember cm = new CampaignMember(Campaignid = ca.id, ContactId =con.Id, Status = 'Sent');
 //members.add(cm);
 insert cm;
}}}}}