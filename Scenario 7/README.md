```
Scenario:

When we update the account,
check all opportunities related to it and update 
all opportunities stage to close lost if an opportunity 
created date is greater than 30 days from today and stage 
is not equal to close won.

Solution:
Trigger will be on account and we are updating oppor
so after event, after update

steps:
1.store all accountids which are getting updated.
2.to avoid dml in loop we are storing all accids in set
3.now fetch all opportunities whose account id in set.
4.traverse over the list and update the opportunity if given condition statisfy.


```