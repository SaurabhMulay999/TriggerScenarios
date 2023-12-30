```
Scenario:
We have a customerContact field on Account which is lookup to contact.
On insertion of account record automatically create related contact and update
customerContact field lookup with it.

resolution:
so basically action is on account so triiger will be on account,
and we are creating the contact (new contact) but updating the same
on account's field. so triiger will be in before event???
No we need accountid to update that related contact.
so it will run in after event.

if aint understand, remember u need to update the contact id , and in before context it aint possible.


steps:

1. You can traverse whole trigger.new or accountlist first.
2.new a new instances of contacts associated with the accounts in trigger.new
3.sake of bulkification put all contact instances in conlist;
4.insert the contacts (so thats why after event)
5.keep a set to store the accountids to avoid loops
6.again query all the accounts, put them into a map<id,account>
7. now traverse the inserted contact list again
8. if(map contains c.accountid) now take that account and assign the that contact
to field customercontact.
9. create a list to bulkify the code put down all  updated account instances into the list
10.Update the list of accounts.



```