trigger trg on Employee(after insert, after update , after undelete , after delete){
    if(isAfter and (isInsert Or isUndelete)){
        help.trgmethod(trigger.new,NULL);
    }
    else if(isAfter and isUpdate){
        
        help.trgmethod(trigger.new, trigger.oldmap);
    }
    else if(isAfter and isDelete){
        //in after delete the new version of records are not available
        help.trgmethod(trigger.old,NULL);
    }
   
}


public class help{
  
    public static void trgmethod(List<Employee>emplist, map<Id,employee>oldmap){
        //now changes will be on employee obj 
        //fech id's of tech firm object and store it into the set
            
        set<id> techFirmId=new set<id>();
        
        //scenario to be consider if User is updating parentid of employee
        //Then we have to update the both parent records (TechFirm).
        //scenario when the employee is updated
        for(Employee e:emplist){
            if(oldmap!=NULL){
                if(oldmap.get(e.id).techfirm!=e.techfirm){

                    techFirmId.add(e.techfirm);
                    techFirmId.add(oldmap.get(e.id).techfirm);
                }
                else{
                    techFirmId.add(e.techfirm);
                }
            }
            else{
                techFirmId.add(e.techfirm);
            }    
    }

    List<aggregatedResult> aggrlist=[select techfirm tfid, max(salary) maxsalary, min(salary) minSalary from Employee where techfirm IN: techFirmId group by techfirm];
    list<techfirm> tobeUpdate=new list<techfirm>();
    for(aggregatedResult agr:aggrlist){
        techfirm tf=new techfirm();
        tf.id=(Id)agr.get(tfid);
        tf.maxsalary=(Decimal)agr.get('maxsalary');
        tf.minSalary=(Decimal)agr.get('minSalary');
        tobeUpdate.add(tf);
    }

    update tobeUpdate;
}

}