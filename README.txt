Name: Ben Axnick
Yallara: baxnick
Number: s3158632
Sections Attempted: PA, CR, DI, HD
Group Members: None. Assignment attempted individually

Major 3rd Party Code Acknowledgements:
DataGenerator: http://williablog.net/williablog/post/2010/07/30/Random-Sample-Data-Generator.aspx
CreditCardValidator: http://www.codeproject.com/Articles/2782/Credit-Card-Validator-control-for-ASP-NET
Any other references acknowledged where possible with a link inside code/markup

StartUp Notes:
Execute RebuildDatabase.sql followed by EssentialData.sql on your local database.
If you want to preload some previous clinic activity, execute the PreviousDataSim project
If you do not have an [aspnetdb] database in your MSSQL database you will have to register one
Begin executing the Assignment2 project, it will create the following default names/roles: 

 SuperAdmin | superadmin : superadmin
 Admin      | admin : admin
 Clerk      | clerk : clerk

Acknowledged Faults:
 * No SuperAdmin functionality (modify user accounts, beds, doctors) included as not specified directly in task list
 * GetPatients, GetInPatients, and GetOutPatients are all horridly inefficient (impossible to perform filtering operations on DB side when using EF + SP so ALL records are pulled from the database for every request). This would not scale properly for a real clinic's needs. In order to address the situation either a switch to views or a switch of ORM would be required.
 * No effort was made to address concurrency issues that would undoubtedly exist in a real world system.
 * No attempt made at implementing a second theme properly, but the infrastructure to do so is all there - I've run out of time / energy and would rather not spend my remaining hours playing with skins and CSS

Miscellaneous Comments:
 * PreviousDataSim project is included but is not part of the website. I used it to generate a large volume of semi-realistic data to store in the database rather than doing so by hand.
