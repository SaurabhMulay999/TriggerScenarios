```
Scenario:
Whenever a contact's description is updated
then it's parent account description shoud also get updated.

Solution:

Contact is getting updated and in response to that
we are updating the parent account. 
so Trigger must be in after context.

steps:
1.we have a trigger on contact
2.we have to update the accounts with description on contact
3.Traverse trigger.new list and store all accountids in set or list
4.use map to store the id and account. Query all account which id are in that set
5.again traverse the trigger.new and update the account which you have stored in the map


```