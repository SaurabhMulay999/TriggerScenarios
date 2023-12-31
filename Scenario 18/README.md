```
Scenario::
                         lookup relationship
Parent: Account       -------------------------> Assets

Child: Opportunity

grandChild: OpportunityLineItem


Trigger to automate the asset creation and linking with account on insertion of opportunityLineitem

Resolution:
Trigger will be on OpplineItems and it will be in after event.
on insersion of Lineitem you need to fetch the id of opportunity as well after that
fetch the accountid associated with the opportunity and afterward create a asset record 
associated with an account. (on asset asssume a lookup field of account)


Steps:
1.first store the opp id related to every lineitem in set
2.query all account and opportunities related to opp. as account is parent of opp so u have ref available
query child to parent. 
3. afterward traverse over the records of opp you have queried and create a instance of asset for every account relate
to that opportunity. 
4. after traversing over the records insert the asset records.(code is bulkified)

```

