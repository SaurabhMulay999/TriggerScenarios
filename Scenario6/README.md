```
IMP Question:

Trigger to find the sum of all related 
opportunities amount of an account.

Solution:
Updating account when action on opportunity.
so trigger will be on opportunity.

Account: field: sumofopp:
Opportunity:(delete,Undelete,Insert,Update)===> TRIGGER ==> Account(:sumof opportunities amount)

Use<aggregateResults>::
using aggregated result ypu can able to find out the total sum of opooritunity with that field

steps:
1.store the account id in all given contexts
2.use aggregated query on opportunnity where opp.account id in set
3.loop over aggregated results and for each update the account amount field
4.(on aggregated result more explanation is there in code)


```