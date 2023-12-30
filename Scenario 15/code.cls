public helper{

    public static void method(list<account>aclist){
        set<id>accids=new set<id>();
        for(account a:aclist){
            if(a.closeopp==true and oldmap.containskey(a.id) and !oldmap.get(a).closeopp){
                accids.add(a.id);
            }
        }

        list<opportunity> lstopp=[select id, name,accid, probablity, stagename from opportunity where accid IN : accids 
        and stagename!='close' and probablity>=75];
        
        list<opportunity> tobeupdate=new list<opportunity>();

        for(opportunity op: lstopp){
            op.stagename='close';
            op.closeDate=date.today();
            tobeupdate.add(op);

        }

        update tobeupdate;

    }

}

trigger accTrg on account(after update){
    if(isafter and isUpdate){
        helper.method(trigger.new, trigger.oldmap);
        
    }
}