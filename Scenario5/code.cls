trigger accounttrg on account(after insert, after update){
    List<Contact>lst=new List<Contact>();
    
    if(isafter and (isinsert and isupdate)){
        for(account a:trigger.new){
            if(a.createCheckboc==true){
                Contact c=new contact();
                c.Firstname='test';
                c.LastName=a.Name;
                c.phone=ac.phone;
                c.accountid=a.id;
                lst.add(c);
            }
        }
    }


    insert lst;
}