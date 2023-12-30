```
Scenario:
Automatically closed opportunities with probablity greater than 75% when 
a checkbox "close opp" on account is checked. 

Resolution:
Action is on account so trigger will be on accout, and related records are
updating so it will be in after context. 


steps:
1.simply create a set to hold account id, so dont have to query inside the loops
2.put the id into the set only if closeopp checkbox isChanged.
3. now query all opportunities where accountid of opp is IN set.
4.traverse all opportunities and mark them close.


```