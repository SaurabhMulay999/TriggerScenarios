```
Scenario:

Whenever Account phone field is updated then
all related contact phone field should get updated with
parent account's phone. 


Solution:
If we are updating the related record then use After 
Event Triggers.
Old context only available in update and delete triggers.
Account field is getting updated so the account is the one
that goin to trigger the trigger.
We are saying after update of phone field. so run with after
update of phone field.

steps:
1.first check isAfter and isUpdate
2.crete a map to store id and account
3.Traverse over the trigger.new record list
4.check the phone field. If want to do it in o(logn) use trigger.oldmap
5.or you can traverse the trigger.old list to find the record
6.store the account and his id in that created map
7.Now we have to update the contacts 
8.get all the contacts in the list where contact id in Map.keyset()
9.traverse over all the contacts and update them with the phone number on account
10.to get phone number directly we have used the map. map.get(accountid).phone. So here in this question
map is very helpful to reduce the overall TC. 


```