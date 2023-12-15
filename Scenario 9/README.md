```
Scenario:
when a case is inserted on any account,
add the latest case number on Account in Case 
Field.

Resolution:

look the case is inserted so the trigger will be on thecase
and we are updating the account so trigger will be on after event.
after insert.

steps;
1.we have to update the accounts so store all accountsId;s related to case 
in a set.
2.fetch all the account and caseid related to account where accountid IN set
3.after that again traverse the trigger.new case list and as you have stored the
accounts in a hashmap. Get the account related to that case from map and to the account
instance assign the case.id 
4.bulkify the code and update. 



```