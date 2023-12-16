````
Scenario:
Send Emails to all related contacts of account 
when account type field is updated.

resolution:
Account is getting updated so the trigger will be on
account and new need to send emails to releted records so
context will be on after,


steps:

1.create a set to hold all values of account ids
who's field is updated
2.traverse trigger.new and store all accountids
3. fetch all contacts whichs account id in set
4.travser over fetched contact records and write ur
logic to send an email.

````