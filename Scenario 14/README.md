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



```