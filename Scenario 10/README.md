````
Scenario:

prevent duplication of contact record
based on Email and phone.

Resolution:
preventing the duplication of contact based 
on the Email and phone so the trigger will be
on the contact. 
Before context. because no need to update any 
related record.

steps to solve:
1.first store the emails and phone of the 
records which are newly goin to insertted in 
database. (use map of string, contact instance to store)
and the records which updated with new 
email and phone. 
2.then now query the record from the system that has email
in email.keyset() and phone in phone.keyset().
3. traverse over the records that we have fetched. 
4. now if the records email already exist in the email map
then we are updating the error messge
5.now again after that traverse trigger.new,
6. now if error message is not NULL
then simply addError over that perticular contact.


````