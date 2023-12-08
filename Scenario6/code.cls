trrigger opportunitytrg on opportunity(after update, after insert, after delete, after undelete){

    //we have to update account so fetching all account id and storing it in a set
    set<id> accid=new set<id>();

    if(isafter and (isinsert or isundelete)){
        //insert and undelete is same op as both have trigger.new 
        for(opportunity o: trigger.new){
            if(o.accountid!=NULL)accid.add(o.accountid);
        }
    }

    //for update operattion

    if(isafter and isupdate){
        for(opportunity o: trigger.new){
            if(trigger.oldmap.get(o.id).accountid !=o.accountid){
                accid.add(trigger.oldmap.get(o.id).accountid);
            }
            accid.add(o.accountid);

            //storing both the oldid and new id as on old account opportunity sum must have update
        }
    }

    if(isafter and isundelete){
        //undelete have only trigger.old
        for(opportunity o: trigger.old){
            accid.add(o.accountid);
        }
    }

    //now Use aggregatedResults to find out sum rather than traversing the list ans sum ups

    List<aggregatedResult> aggrlist=[select id, accountid ids, sum(Amount) totalamt from opportunity where accountid in: accid group by accountid];

    List<account>lst=new List<account>();

    if(aggrlist.isempty()){
        //if there is no aggresult then account amount must be zero
        for(account acci: accid){
            account a=new account();
            a.id=acci;
            a.totalamount=0;
            lst.add(a);
        }

        update a;
        return;
    }

    for(aggregatedResult agr: aggrlist){
        account acc= new account();
        acc.id=(Id)agr.get('ids');
        acc.totalamount=(decimal)agr.get('totalamt');
        lst.add(acc);
    }

    update lst;

}