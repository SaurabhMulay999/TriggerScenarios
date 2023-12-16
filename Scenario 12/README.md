```
Scenario :: 
...................//.Given two object.\\.........................


        Object 1                                Object 2
        -----------                           -------------
        |  Tech   |       lookup rel          | Employee  |
        |  Firm   |<------------------------->|  (child)  |
        -----------                           ------|------
                                                    |
        (fields)                                    |
        1.Max Salary                                |
        2.min Salary                                |
                                                    |
                                                    |
                                                    |   
                                                   /^\
                                                   \ /
                                                --------
                                                 salary
                                                --------


Sceanrio::
->Show Min and Max salary of employee records on parent company Record.


Resolution::
whenever the new employee is inserted,
updated, deleted, undeleted. Update the
min and max salary on Tech Firm.
So the trigger will be on Employee Object.
After Event.







Steps::


```