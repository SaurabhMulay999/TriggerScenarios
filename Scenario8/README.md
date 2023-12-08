```
Scenario:
Show an error if there are already two contacts on account 
and user is trying to add one more

solution:

the contact is getting inserted or updated or
deleted or undeleted. so trigger will be on contact
we are not updatinng account in this case but showing error on
contact only....so it will be before event.
before insert, update(this scenariio also need to consider)

steps:
1.it is on before insert of contact
2.create a set id to hold accountids of contacts
3.store all accids by traversing on trigger.new
4.then use aggregated query to find out all number of contact associated with account
5.store results in map to avoid tc ==o(n2)
6.traverse the trigger.new again and check the count of contacts for c.accountid
7.if it is greater >2 thenn add error.
(checkout code)

```