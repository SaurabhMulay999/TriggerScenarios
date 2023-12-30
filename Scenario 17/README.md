```
scenario:
Trigger to count the number of opportunityLineItems associated with the opportunity
and display the count on account's custom field.

hierarchy of those 3 objects are as below.
Account----->Opportunity------>opp line item 1
                        ------>opp line item 2
                        ------>opp line item 3

Assume account has custom field= "NumberofLineitems__c"
so now in above scenario account.NumberofLineItems__c will be 3;

Resolution:
Trigger wll be on opplineitems
we first have to fetch opportunity id related to line items with the oppid we can afterward fetch
acounts. after fetching accounts try to map the accountids with the NumberofLineitems using hashmaps
it'll be easy to do so using hashmaps.


```