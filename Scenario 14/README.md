```
Senario:

On contact we have checkbox field "Primary contact"
...If checked then contact is primary
...
So if user try to add another primary contact then throw the
error to the user, There must be atmost single primary contact.

Enforce the single Primary contact.

Resolution:

the trigger will be on contact only.
we are not updating any related record so event 
must be before. 

steps:
1. We are goin to check primary w.r.t the account.
2. so save the account ids of all contacts.
3. before updating or inserting if there are already primary contact with the perticular 
account simply then throw the error:


```