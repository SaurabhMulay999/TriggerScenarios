public class without sharing handler{

    public static void method(list<opplineitem>OLIList){
        set<id>oppid=new set<id>();
        for(opplineitem oli:OLIList){
            oppid.add(oli.opportunityid);

        }

        list<opportunity> opplist=[select id, accountid, account.name from opportunity where id in:oppid];
        
        list<asset>toinsertasset=new list<asset>();
        
        for(opportunity o: opplist){
            if(o.accountid!=NULL){
                //create asset record
                asset ast=new asset();
                ast.name=o.account.name +'Line item';
                ast.accountid=o.accountid;
                toinsertasset.add(ast);
             }
        }

        insert toinsertasset;
    }
}

trigger opplineitemtrg on opplineitem(after insert){
    if(isafter and isinsert)helper.method(trigger.new);
}