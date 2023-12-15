trigger accounttrg on account(after update){
    set<id>accids=new set<id>();
    //store the account ids in set whenever the account type field is updated

    if(isafter and isupdate){
        for(Account a:trigger.new){
            if(oldmap.get(a.id).type!=a.type){
                accids.add(a.id);
            }
        }
    }

    //now fetch all ; fetch the related contacts first 
    //we need to make an update on contacts so fetch all contacts whose account id in accids
    list<contact>lst=[select id, accountid from contact where accountid in :accids];

    for(contact c:lst){
        if(c.email!=NULL){
            //logic to send an email message.
        }
    }
}