# iTrack
A simple system for tracking incoming enquiries from customers with an easy to use interface for support staff to
communicate with clients.
## Introduction
Please ensure your application uses Rails4 with HAML as your markup language. Alternatively, you can Sinatra or any
other ruby framework you like. The system should be as ORM agnostic as possible. You're free to use NoSql when and
where it may be needed.
Build the application in the manner you feel most appropriate to accomplish all the tasks outlined in the specification.
We'd appreciate your BDDness, DRYness and KISSness.
When the project is complete, send it to us (in an OS agnostic archive, github link gives you an additional point).
## Background
At the moment, host-tasticʼs support system is entirely email based. When a customer has a support enquiry, they simply
email the appropriate department at the addresses provided on the company’s website. Recently, the company’s support
enquiries have increased hugely and new staff is being brought in to handle the issues. Unfortunately, the e-mail system
they are using at the moment leaves a lot to be desired and does not work well in a multi-user environment.
Imagine, we would like customers to be able to enter support tickets directly into our website which staff can then manage
and reply to through a management interface. The customer facing side should fit nicely in the company’s existing
website where as the management/staff interface should be clean, separate and easy to use.
Notes about the customer interface
- Customers do not need to login to submit a query – they simply will need to provide their name and email address along
with the department the issue relates to, the subject of their enquiry and the full body of the request.
- Each new ticket is assigned a unique reference in the format similar to ABC-4F-ABC-8D-ABC (where: ABC is random 3-
char string, 4F, 8D are random hex numbers). - When a new ticket is added, the customer should receive an email
confirming their request has been received along with their unique reference.
– It should also include a URL which can be used to view the ticket’s history and update tickets.
Notes about the management interface
- Each member of staff should have a username & password used to login to the system - Staff can view a list of all
unassigned, open tickets and take ownership. - Staff should be able to reply to the ticket by simply entering their
response into a text field. As part of the same action, they should also be able to change the owner or status. - All
changes to the status and owner should be tracked with each staff reply. - All replies should be e-mailed to the client.
- Each ticket should be assigned a status - ʻWaiting for Staff Responseʼ, ʻWaiting for Customerʼ, ʻOn Holdʼ, ʻCancelledʼ or
ʻCompletedʼ - the system admin may wish to add status(-es) in the future.
- When a ticket is first created or updated by the customer, it should be assigned the ʻWaiting for Staff Responseʼ status.
- The interface should have four main views:
- New unassigned tickets
- Open Tickets
- On hold tickets
- Closed Tickets
- Staff should be able to quickly open up a new ticket by entering itʼs reference number into a search field. They may also
wish to search based on the ticket subject. Also please allow users to look for words or combinations of words found in
the ticket.
