public class handler {

    public static void trgmethod(list<opportunity> opplist,map<id,opportunity>oldmap){
        set<id> accids=new set<id>();


        for(opportunity o: opplist){
            //consider the update scenario
            if(oldmap!=NULL){
                if(oldmap.get(o.id).accountid!=o.accountid){
                    accids.add(oldmap.get(o.id).accountid);
                    accids.add(o.accountid);
                }
                else{
                    accids.add(o.accountid);
                }
            }
            else{
                //handling other scenarios
                accids.add(o.accountid);
            }
        }
        //now if set is not null
        //use subquery to find out the opportunities and order by amount desc so you'll get record with high amount


        list<account> acclist=[select maxopp, id, (select id, Name, amount from opportunities where amount!=null 
        order by amount desc limit 1)  from account where id IN :accids ];
        
        list<account>toupdate =new list<account>();

        for(account a: acclist){
            if(a.opportunity.size()>0){
                a.maxopp=a.opportunity[0].Name;
                toupdate.add(a);
            }
            else{
                a.maxopp='';
                toupdate.add(a);

            }
        }

        update toupdate;

    }
}

trigger optrg on opportunity(after insert, after update , after delete, after undelete){
    //use isupdate saparate and pass old map in second argument
    //use isdelete and pass trigger.old as new version not available after delete
    //use insert and undelete scenario at same time, becuase both are kind of same and 
    //pass trigger.new and old map will be null for all cases except UPDATE.
    
}