# Designing Data Storage Architecture

## How to choose

Given the plethora of data storage services available, designing the infrastructure for a software project can be daunting. There many factors to take into account and there are not always obvious right answers.

It is possible that multiple databases could be used for different parts of the application. For example, we can use a standard relational database to store details about artists, genres, tracks and playlists for a streaming music application, and use a graph database to power a recommendations engine based on relationships between artists, genres and songs.

### Application architecture

#### Where will the application run and where will the data be stored? 
* There's a big difference between running on the user's computer, on a smart phone, or as a web application. 
* If the data needs to stay on the user's device then a powerful, heavy weight database probably won't work.

#### Will the application be a single monolith or be composed of many micro-services? 
* If using a monolith: How stateful is the application (e.g. is user state stored per-machine/in-memory; is this resilient to load balancing or updates)?
* If using micro-services: How will services have to communicate with each other (directly or via a message queue)? 

### Structure of the data

#### Is is a few simple entities with basic connections, or a complex web of interconnected data? 
* Lots of connections might suggest a relational database is more appropriate
* However if the connections themselves are more important than the data points, consider a graph database

#### Are there natural patterns to suggest how the data should be structured?
* Consider [partitioning](https://learn.microsoft.com/en-us/previous-versions/msp-n-p/dn589795(v=pandp.10)) your data based on properties such as location to enable horizontal scaling. 
* Maybe take this even further with [sharding](https://learn.microsoft.com/en-us/azure/architecture/patterns/sharding) to enable you data storage service to run across multiple geographic locations


### How is the data accessed

#### How will data be queried? 
* Is there complicated read logic over a variety of entities?
* Are the same queries going to be made repeatedly or will each query be different (might suggest the use of caching)?
* Do you need any fuzzy search capabilities (maybe you need inverted indexes or a dedicated database engine such as ElasticSearch)?

#### What's the traffic profile of the application? 
* Is there a single user or or lots of multiple concurrent users? 
* Are concurrent users accessing the _same_ data or only separate data? 
* Is the _load_ on the database consistent or does it fluctuate, and if so, how predictably?

#### What's the read-write profile of the data? 
* Will the data be updated frequently, if so how quickly do those changes need to be communicated to other users. 
* What will be the expected ratio of read vs. write operations?

### What Guarantees are required?

These aren't important for all applications, but when you need them they can be absolutely critical. 

Relational databases normally offer ACID guarantees:

- **A**tomicity: a transaction will either complete in its entirety or will have no effect at all on failure.
- **C**onsistency: a transaction will never violate any constraint rules of the database.
- **I**solation: multiple transactions running at the same will not affect each other.
- **D**urability: Once _committed_ (complete), the effects of a transaction will persist even after a system failure.

However relational databases can struggle in high availability (HA) scenarios. If you want to horizontally scale a database you usually need to compromise on either consistency or latency (see the [PACELC design principle](https://en.wikipedia.org/wiki/PACELC_design_principle)).
* Many database services allow you to chose the tradeoff that works best for your use case:
    * Cosmos DB offer [Consistency Levels](https://learn.microsoft.com/en-us/azure/cosmos-db/consistency-levels) to allow for lower latency and HA options such as multi-region writes


## Exercise

For each of the following scenarios, design an appropriate data storage solution for the application. You should be prepared to justify your choices in each case, including any assumptions you've made.

**We recommend creating a small architecture diagram for each scenario using a collaborative tool like [Miro](https://miro.com/) or https://app.diagrams.net/**.

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
