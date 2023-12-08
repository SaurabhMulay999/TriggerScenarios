trigger contacttrigger on contact(after update){
    //store the account id in the set
    set<id> accid=new set<id>();

    if(isAfter and isUpdate){
        if(!trigger.new.isempty()){
            for(contact con:trigger.new){
                //if description is updated and accid is not null then only store the ids
                if(con.accountid!=null and trigger.oldmap.get(con.id).description!=con.description){
                    accid.add(con.accountid);
                    //look we need all accounts inorder to update them so store them into the set
                }

            }
        }
    }

    //need account data so fetch it:
    //which ds you;re goun to usE?? use maps

    map<id,account> accmap=new map<id,account>([select id, description from account where id in :accids]);

    //to avoid o(n2) complexity try using maps

    //bulkify
    list<account>lst=new list<account>();

    if(!trigger.new.isempty()){
        for(Contact c: trigger.new){
            //here if we have not used maps then probably we have to loop over the records to find it;
            accmap.get(c.accountid).description=c.description;
            lst.add(accmap.get(c.accountid));

        }
    }

    update lst;
}