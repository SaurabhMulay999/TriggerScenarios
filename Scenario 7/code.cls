trigger accounttrigger on account(after update){
    set<id> accid=new set<id>();

    if(trigger.isafter and isupdate){
        for(account ac: trigger.new){
            accid.add(ac.id);
        }
    }
    //fetch the opportunities who's account id is in the set
    //look to avoid dml inside the loop always store the id's then do dml
    date day30=data.today()-30; //30 days less than today
    list<opportunitie>lst=new list<opportunitie>();
    List<opportunities> lstopp=[select id, accountid, createddate,stagename from opportunities where accountid in :accid];
    for(opportunitie o:lstopp){
        if(o.createddate<day30 and o.stagename!='closed won'){
            o.stagename='close lost';
            o.closedate=date.today();
            lst.add(o);
        }
    }

    update lst;
}