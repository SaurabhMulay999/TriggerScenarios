trigger accounttrigger on account(before insert, before update){
    
    set<string> accNames=new set<string>();
    //need to check duplicates so account name need to store in sets

    if(isbefore and (isinsert || isupdate)){
        for(Account a: trigger.new){
            accNames.add(a.name);
        }
        //update case is getting handled as we don't have to check the old names
    }

    List<account> aclist=[select id, name from account where name in :accNames];
    map<string,account> exAccMap=new map<string,account>();

    for(Account a:aclist){
        exAccMap.put(a.name,a);
    }

    for(Account a: trigger.new){
        //if u have use the list here to check so need to add a inner loop but maphave handled it
        if(exAccMap.get(a.name)!=NULL or exAccMap.containskey(a.name)){
            a.addError('Account name already exist');
        }
    }

    //No need to perform dmls in before save triggers.
}