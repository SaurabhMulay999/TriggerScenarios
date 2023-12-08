```
covering up multiple trigger scenarios:

Before triggers:
Just use to update the same record.

After record:
Use to update the relative records.


Good Practices:
1.Use single trigger per object.
2.use trigger handler pattern.
3.Don't call batch classs.
4.avoid dml in loops. (To avoid hiting Governer Limits)

Syntax:

Trigger __Name__ on __ObjectName__ (Event__ Like before/after : insert,update,delete,undelete){
    //Logics
}

trigger.new: return new version of records

trigger.old: returns the old version of record

Context Variables:
used to access runtime context, System.trigger class provides it.

1.isBefore
2.isInsert
3.isUpdate
4.new (available only in insert, update , undelete triggers)

Record is read Only in after Event, while can only be updatable in Before events.(Current Record that triggers the trigger)





Note: This repo contains kind of sudo codes...Though every company for the SF interviews are asking
this logic less questions so creating the repo. I am not making up these questions...I am just cpy pasting. 





```