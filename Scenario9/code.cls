trigger casetrg on Case (after insert){

    //do check that trigger is running in isAfter and isInsert as a good practice
    
    set<id> accids=new set<id>(); 
    for(Case caseObj: trigger.new){
        accids.add(caseObj.accountid);
    }

    //fetch the accounts which stored in the set
    map<Id,accout>accMap=new map<id,acccount>([select id , caseid from account where id in:accids]);
    list<account> lst=new list<account>();
    //if we have not used maps then maybe we have to traverse through all accounts to check if case.accid==accid 
    //so using map we reduced operation to logn. ()
    for(case c: trigger.new){
        if(accMap.containskey(c.accountid)){
            account a= accMap.get(c.accountid);
            if(a.caseid!=c.id){
                a.caseid=c.id;
                lst.add(a);
            }
        }
    }

    update lst;

}