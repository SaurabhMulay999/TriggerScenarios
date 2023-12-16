trigger contacttrug on contact(before insert){
    set<id> accid=new set<id>();
    if(isbefore and isinsert){
        for(Contact c:trigger.new){
            accid.add(c.accountid);
        }
    }
    
    //now fetch all the accounts ans related contacts
    map<id,integer> contactcount=new map<id,integer>();

    //"id will be storing account id and integer storing the number of contacts
    //use aggregated queery

    list<aggregatedresult> aggrlist=[select accountid ,count(id) contactcount from contact where accountid in:accid group by accountid];

    for(aggregatedresult ag:aggrlist){
        contactcount.put((id)ag.get('accountid'),(integer)ag.get('countcontact'));
    }

    //now chcekc the number 
    //storing it into map makes it eady to check the total contacts afterward
    for(conact c: trigger.new){
        if(contactcount.get(c.accountid) >2){
            c.addError('Account has atmost 2 contacts associated with it');
        }
    }

}