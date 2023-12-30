public class helper{

    public static void method(list<contact> conlist){
        set<id>accid=new set<id>();
    
        for(contact c: conlist){
            if(oldmap!=NULL){
                if(oldmap.get(c.id).accountid!=c.accountid){
                    accid.add(oldmap.get(c.id).accountid);
                    accid.add(c.accountid);
                }
                else{
                    accid.add(c.accountid);
                }
            }
            else{
                accid.add(c.accountid);
            }
        }

        //now fetch the contacts related to the accounts which we have stored into the set
        map<id,account> acclist=new map<id,account>([select id, (select id, Name, primarycontact from contacts where primarycontact==true) from account where id IN: accid]);

        for(contact c: conlist){
            if(acclist.containkey(c.accountid)){
                if(acclist.get(c.accountid).contacts.size()>0){
                      c.addError('Theere is already one primary contact exist on this account.');  
                }
            }
        }



        //or solution is to fetch the contacts whose account id is in the set..
        //create a map to store ID and Integer to store contactid and count of contac
    
    }

}

trigger contrg on contact (before insert, before update){
    //pass oldmap in case of update scenario and null for insert scenario
}