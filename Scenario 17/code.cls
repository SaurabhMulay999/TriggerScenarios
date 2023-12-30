public class without handler{

    public static void method(list<opplistitem> opllist) {
        set<id> oppid=new set<id>();

        for(opplistitem oli:opllist){
            oppid.add(oli.opportunityid);
        }

        //fetch accountids now

        list<opportunity> opplist=[select id ,accountid from opportunity where Id IN: oppid];
        
        map<id,decimal>lineitemmap=new map<id,decimal>();
        //to store accountid->NumofLineitems

        for(opportunity op:opplist){
                //initially set numberofLineItem to 0
                lineitemmap.put(accountid,0);
        }

        //nowuse aggregate query to get count

        for(AggregatedResult agr: [select count(id) lineitem, opportunity.accountid accountid from opplineitem where opportunity.accountid IN :lineitemmap.keyset() group by opportunity.accountid]){
            lineitemmap.put((Id) agr.get('Accountid'),(decimal)agr.get('lineitem'));
        }

        //now we have stored the account->Number of line item in the map now update the accounts field
        list<account> lsttoupdate=new list<account>();

        for(id accid: lineitemmap.keyset()){

            //greate fukological use of hashmaps everywhere.

            account acc=new account();
            acc.id=accid;
            acc.numberofLineItem=lineitemmap.get(accid); //this will simply resturn the count;
            lsttoupdate.add(acc);
         }

         update lsttoupdate;
    
    }
}

trigger LineitemTrg on opportunitylineitem(after insert, after delete){

    if(isafter and isdelete)helper.method(trigger.old);

    if(isafter and isinsert)helper.method(trigger.new);
}