```
Scenario:
trigger to create a related contact
of account with same phone as accounts
phone if custom checkbox on acoount is
checkked.

solution:
As mentioned checkbox on account so
trigger will be on account. 
As we are creating related record
go with after event.

scenarios to be consider -> update/insert.

Steps:
1.create a contact list to hold contact which goin to get inserted.
2.traverse trigger.new 
3.check if accounts create contact checkbox is true or not
4.if true then create a contact instance and assign phone field
5.assign c.accountid=a.id
6.bulkify the code and insert dml

```