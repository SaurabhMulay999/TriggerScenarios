trigger contacttrigger on cntact(after insert, after update , after undelete,after delete){
    set<id>accids=new set<id>();
    //set is to store the parent account id of contact

    //for insert and undelete we have trigger.new (old values not present if we are undeleting and inserting)

    if(trigger.isafter and (trigger.isinsert or trgger.isundelete)){
        for(Contact c: trigger.new){
            if(c.accountid!=NULL){
                accids.add(c.accountid);
            }
        }
    }
    
    //fetch the accountids on update operaction as y have access to old values

    if(trigger.isafter and trigger.isupdate){
        for(contact c: trigger.new){
            if(c.accountid!=trigger.oldmap.get(c.id).accountid){
                accids.add(c.accountid);
                accids.add(trigger.oldmap.get(c.id).accountid);
                //store the old account id also as we have to update the -1 count on that one 
                //because we have reparente the contact

            }
        }
    }

    if(isafter and isdelete){
        //in delete the we don't have new version of record so only old values present
        for(contact c: trigger.old){
            accids.add(c.accountids);
        }
    }

    //Now fetch all the accounts which are in accids and his associated contacts
    List<Account> aclist=[select id, numberofcontact,(select id from contacts) from account where id in: accids];
    //parent to child query : parent to child id subquery
    List<account>lst=new List<account>();
    for(Account acc: aclist){
        acc.numberofcontact=acc.contacts.size();
        lst.add(acc);
    }

    update lst;

}