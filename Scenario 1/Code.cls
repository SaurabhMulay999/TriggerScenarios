trigger Accounttrigger on Account(after update){
    //creating a map to store the accounts
    map<id,account> accmap=new map<id,account>();
    
    if(trigger.isAfter and trigger.isUpdate){
        if(!trigger.new.isempty()){
            for(Account acc: trigger.new){
                if(trigger.oldMap.get(acc.id).phone!=acc.phone){
                    //look if the value in old map is diff than current value tthen we 
                    //can say the field is updated
                    accmap.put(acc.id,acc);
                }
            }
        }
    }

    List<contact> clist=[select Id, accountid,phone from cntact where accountid in: accmap.keyset()];
    //we have stored it into the map because we are first querying all contacts so for that we need id and to update the
    //contact we need account instance.
    List<contact>updateList=new List<contact>();
    if(clist!=NULL){
        for(contact c:clist){
            c.phone=accmap.get(c.accoundid).phone;
            updateList.add(c);
        }
    }

    update updateList;

}