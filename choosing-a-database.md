# Choosing the correct database task

## How to choose

Given the plethora of choices of databases available, picking a database for a new software project can be daunting. There many factors to take into account and there are not always obvious right answers.

It is possible that multiple databases are used for different parts of the application. For example, we can use a standard relational database to store details about artists, genres, tracks and playlists for a streaming music application, and use a graph database to power a recommendations engine based on relationships between artists, genres and songs.

### Application architecture

Where will the application run and where will the data be stored? There's a big difference between running on the user's computer, on a smart phone, or as a web application. If the data needs to stay on the user's device then a powerful, heavy weight database probably won't work.

Will the application be a single monolith or be composed of many micro-services? Will micro-services have to share data?

### Structure of the data

Is is a few simple entities with basic connections, or a complex web of interconnected data? Are there natural patterns to suggest how the data should be structured?

### How is the data accessed

How will data be queried? Is there complicated read logic over a variety of entities? Are we going to join together and aggregate data from multiple tables or documents?

What's the traffic profile of the application? Is there a single user or or lots of multiple concurrent users? Are concurrent users accessing the _same_ data or only separate data? Is the _load_ on the database consistent or does it fluctuate, and if so, how predictably?

What's the read-write profile of the data? Will the data be updated frequently, if so how quickly do those changes need to be communicated to other users. What will be the expected ratio of read vs. write operations?

### What ACID guarantees are required?

These aren't important for all applications, but when you need them they can be absolutely critical. A reminder of what the ACID properties are:

- **A**tomicity: a transaction will either complete in its entirety or will have no effect at all on failure.
- **C**onsistency: a transaction will never violate any constraint rules of the database.
- **I**solation: multiple transactions running at the same will not affect each other.
- **D**urability: Once _committed_ (complete), the effects of a transaction will persist even after a system failure.

## Exercise

For each of the following scenarios, choose an appropriate database type for the application. You should be prepared to justify your choice in each case, including any assumptions you've made.

1. A system for processing payments that requires strong guarantees around data integrity, and that only the most up-to-date balance will be reported for a user.
2. An inventory management application for a large warehouse. Workers use handheld scanners to check inventory into and out of the warehouse.
3. A professional networking site which recommends introductions to users based on information about how they have worked with mutual acquaintances in the past. Details tracked include the organisations users worked together at, how long they collaborated and what field they were working in.
4. A micro-service to store and retrieve the content's of the current user's shopping cart for an e-commerce website, which expects to see large spikes of traffic at certain times of year
5. A high-traffic software-as-a-service content management system, with many users extending the functionality of the system by defining custom content types.
6. A search and match system for an international stem cell registry. The registry holds genetic information for millions of potential donors across the world.
7. A voter registration system that sees extremely high spikes in demand in the run up to elections but is otherwise quiet. The system is not responsible for storing the electoral roll.
8. A new end-to-end encrypted messaging app preparing to disrupt the industry.
9. A new banking app being created by the "Digital Innovation" department at a long established bank. The Innovation department is tasked with delivering exciting new features as quickly as possible.
10. An inventory management application for museums across the world to share information about their collections.
11. A contact tracing app, allows users to report a positive test for an infection and anonymously inform people they've interacted with while infectious.
12. A program to coordinate emergency services and NGOs responding to a natural disaster in a remote location.

## (Optional) Extension Task

Revisit the scenarios above and address the following questions:

1. Is it likely to be impacted by GDPR? If so, why?
2. Is there any other sensitive data where special precautions might need to be taken?
3. Are there any potential data ethics issues arising from the application? What are they?
