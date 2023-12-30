public helper{
    public static void method(list<account>aclist){
        list<contact> conlist=new list<contact<>();
        set<account> accid=new set<id>();
        
        for(account a: aclist){
            //we still do not have contacts id;s so they must get inserted so create a list
            contact c=new contact();
            c.accid=a.id;
            c.lastName='Accounts'+a.Name;
            conlist.add(c);
            //after insertion of contact we need to set customer contact field so storing accids in set
            accid.add(a.id);
        }

        insert conlist;

        //this is first task to create all the contacts which are needed and then update there id's
        //inside the lookup field on an account

        map<id,account> acMap=new map<id,account>();
        list<account> accountList=[select id, customerContact from account where id in : accid];

        for(account a:accountList){
            acMap.put(a.id,a);
        }

        list<account> updatelist=new list<account>();

        for(contact c: conlist){
            //check mappings
            if(acMap.get(c.accountid)!=NULL){
                Account a=acMap.get(c.accountid);
                a.customerContact=c.id;
                updatelist.add(a);
            }
        }

        update updatelist;
        

        

    }
}

trigger accTrg on account(after insert){
    helper.method(trigger.new);
}