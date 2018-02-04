public class Calendar {

    public String calendar { get; set; }

    public String FullName { get; set; }
public Task DateInput {get;set;}

public Calendar() {
    DateInput = new Task();
}

public void save() {
    Date dInputDate = DateInput.ActivityDate;

    //Format Date
    DateTime dtValue = DateTime.newInstance(dInputDate.year(), dInputDate.month(), dInputDate.day());
    string sFormattedDate = dtValue.format('yyyy-MM-dd');
}
}