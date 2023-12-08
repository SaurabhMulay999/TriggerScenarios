```
Scenario: 
Trigger to count number of contact associated with
Account and display the count on account's custom field.

Solution:
Create a trigger on Contact as ypu're goin to perform 
update insert delete on contact records.
Run in after context as we have to update the account af.
after insert, after update/delete/undelete scenarios need to be covered.

steps:
1.assume the scenarios where the contact is getting inserted,
or contact's account get updated or contact is getting undeleted,
or getting deleted.
2.create the set to store the account ids as we have to update the account
associated with contacts
3.in update case store both old account id and new account id on contacts
4.in delete scenario store the old values as in delete scenario the old 
values are accessable only.
5.fetch all accounts (select id, (select name, id from contacts) from account where id in accSet)
6.you'll get to know the size by doing contacts.size();
7. update the same on accounts

```