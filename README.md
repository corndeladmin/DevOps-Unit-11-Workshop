# Unit 11 Workshop

This repository is for learners on Corndel's DevOps apprenticeship.

## Pre-requisites

You will need to get the sample Globex database running on your machine.
Clone this repository and follow the [set-up instructions](./Globex-Database/README.md).

## Part 1 - Messing Around With SQL

We're going to start off with exploring the database and using some SQL. Take a look at the [questions](./globex-questions.md).

## Part 2 - Avoiding Prosecution

Now you are familiar with the database structure you might have noticed that it's not exactly following best practices. In particular there are some potential **GDPR violations**, which could get Globex into a lot of trouble.

### 2.1: Identify the problems

Conduct a review of the database and identify as many potential problems as possible.

Things to look out for:

- Personal data that may be covered by GDPR
- Other sensitive data that might be being stored incorrectly
- Any other structural problems

Grade your issues by severity and prioritise them as _high_, _medium_ or _low_ priorities.

### 2.2: Find the solutions

Once you've identified the problems it's time to decide how to fix them. You can't fix these all with _technical_ changes to the database (although you will need some of these). You'll also have to think about whether you'll need to change business processes; communicate with your customers; or some combination of these and other things.

Work through your issues in priority order and come up with a plan to fix them.

### 2.3: (Optional) Normalise the database

[Database normalisation](https://en.wikipedia.org/wiki/Database_normalization) is an important topic in relational databases. While this is beyond the core scope of a _DevOps_ course it is a useful topic to be aware of.

Question 1: Why does the database satisfy the first normal form?

Question 2: Does the database satisfy the second normal form?
* For simplicity here assume the database tables have many more entries than they currently do, i.e. millions (to avoid there being any "accidental" candidate keys)

Question 3: Why doesn't the Employee table satisfy the third normal form?

### 2.4: (Optional) Discuss creating a test database

The database we've been using so far has contained a lot of live, sensitive data. For local development and testing we want a database that is close to live but without any sensitive data.

How would you go about masking/redacting the data? Would randomly generating test data based off of production statistics be any better?

### 2.5: (Optional) Improve the database

One limitation of the current system is that each order can only contain a single product.

Write an SQL script to change the database so that an individual order can contain multiple products. Your script should migrate the existing data so that previous orders aren't lost.


## Part 3 - Choosing Databases

This part of the workshop should take the form of a discussion. See [Choosing a database](./choosing-a-database.md) for more details.

## (Optional) Part 4 - Non-Relational Databases

The current globex database is the backend of a legacy desktop application. Orders have to be manually added by employees. Customers can order online, but this just generates emails that back-office staff enter into the system.

Globex would like to build a system that lets users order online and directly processes orders into the backend system. However, they want a buffer between the website and their database.

They want to use [Kafka](https://kafka.apache.org/) to accept orders from the website and hold them until a backend process has loaded them into the database.

Add a Docker container running **Kafka** to the database project. You might find adding **docker-compose** helpful. Workout how to submit orders to the Kafka instance and write a script in a language of your choice to process these orders from Kafka into the existing data.
