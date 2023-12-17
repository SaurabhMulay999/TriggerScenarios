```
Scenario:
update the parent account field with the oppotunity name 
that has the highest amount.

Resolution:

the trigger will be on opportunity.
and we are updating the account so trg must be 
in after event.

Steps to solve:
create a set to store accountids related to opportunities
that are inserted, updated, deleted, undeleted. 
after that
2. query all the account and as the opp is child. use subquery 
to find out the opportunity with max amount. (just order by amount desc
and limit record to 1). 
3.Traverse all the account list now and update the field on account
to the opportunity u have fetched it with.
Done!!!

```