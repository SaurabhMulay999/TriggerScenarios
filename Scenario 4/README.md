```
Scenario 4:
Prevent duplicates

Prevent duplicate account record based on 
accout name.
check account insert and update scenario. 

Solution:
Trigger will be on account
and in before event with insert and update.

steps:

1.create a set of strings to store the account names
2.traverse the trigger.new and store the account names in set
3.query all the account which, the names presetn in set.
4.create a map to store map<string<name>,account>;
5.now store all accounts and there names in map
6.traverse the trigger.new again and if name present in the map
then throw the error. 


```