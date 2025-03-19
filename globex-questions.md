# Globex Data Task

Globex is an export company that supplies widgets to consumers around the world. Their **DBA** (database administrator) recently left without warning and they need some help. There are a series of questions below that need answering.

If you're unfamiliar with SQL the questions loosely follow the structure of the Module 9 additional reading.

(We have provided the answers to all of the questions below. This will let you check your working as you go.)

Note: You should have already followed the [set-up instructions](./Globex-Database/README.md). If not, do that now.

## Reading Data

1.  What is last name of Employee with `Id` 10?
    <details><summary>Answer</summary>Golthorpp</details>

2.  What is the `Id` of the Employee with NationalInsuranceNumber `9696037031`?
    <details><summary>Answer</summary>760</details>

3.  What is Simonette Wellbeloved's employee Id?
    <details><summary>Answer</summary>649</details>

4.  What is the full name of the only employee at PayBand 3, who is managed by Simonette Wellbeloved?
    <details><summary>Answer</summary>Donnajean Pitfield</details>

5.  Who is the oldest employee?
    <details><summary>Answer</summary>Winny Dmtrovic</details>

6.  Who is the youngest employee?
    <details><summary>Answer</summary>Brigham Brookwell</details>

> You might find the `COUNT` function useful for future questions. Example usage: `SELECT COUNT(*) FROM Employee`.

7. How many employees are at PayBand 1?
<details><summary>Answer</summary>153</details>

8. How many employees at PayBand 3 or below are **not** Union members?
<details><summary>Answer</summary>60</details>

## Joins

For these questions, note that "orders" tracks Globex buying stock in, whilst "sales" track the sale of the same products to clients.

1.  What is the name of the product that was requested in the order with ID 149?
    <details><summary>Answer</summary>Flector</details>

2.  How many units of the product from the previous question were sold on the credit card with number `3535880159004410`?
    <details><summary>Answer</summary>7098.00</details>
    <details><summary>Hint</summary>Doesn't look like the card number is on the sale; can you find it elsewhere? Does this placement make sense?</details>

3.  We've noticed an error in an upstream system. When updating an employee's manager the employees table hasn't been correctly updated. The `ManagerId` has been updated, but the `ManagerFirstName` and `ManagerSurname` have not. How many records does this impact?
    <details><summary>Answer</summary>4</details>

## Aggregation

The value of an order can be calculated by multiplying the `Amount` of product ordered by its `SellingPrice`.

> You may want to make use of aggregate functions like `MAX` and `SUM` in the below.

1.  What was the value of order 115?
    <details><summary>Answer</summary>470866.56</details>

2.  What is the value of the highest value order in the system?
    <details><summary>Answer</summary>960151.08</details>

3.  What was the value of the most expensive order placed in 2019?
    <details><summary>Answer</summary>903860.40</details>
    <details><summary>Hint</summary>Try using the `DATE_PART` function.</details>

4.  What was the value of all orders placed in 2019?
    <details><summary>Answer</summary>91770383.17</details>

5.  What was the value of all orders placed in 2019 excluding the following: 'Voltaren','Loud Child', 'topiramate', 'Omeprazole'?
    <details><summary>Answer</summary>84689146.20</details>

6.  (Optional) The finance director needs a month-by-month report of order values for 2020. Please write a query to produce total order values grouped by month name.
    <details>
    <summary>Answer</summary>

    | Month    | Value       |
    | -------- | ----------- |
    |January   | 10021197.33 |
    |February  | 5451368.04  |
    |March     | 8393388.67  |
    |April     | 6455989.74  |
    |May       | 10138281.22 |
    |June      | 8845170.26  |
    |July      | 7174546.57  |
    |August    | 7310235.65  |
    |September | 8305703.18  |
    |October   | 8597017.86  |
    |November  | 8244004.19  |
    |December  | 6152906.05  |
    </details>
    <details><summary>Hint</summary>You'll need the `GROUP BY` statement.</details>

7.  (Optional) Please adapt the above report so it prints the month names in Spanish.
    <details><summary>Answer</summary>

    | Month      | Value       |
    | ---------- | ----------- |
    | enero      | 10021197.33 |
    | febrero    | 5451368.04  |
    | marzo      | 8393388.67  |
    | abril      | 6455989.74  |
    | mayo       | 10138281.22 |
    | junio      | 8845170.26  |
    | julio      | 7174546.57  |
    | agosto     | 7310235.65  |
    | septiembre | 8305703.18  |
    | octubre    | 8597017.86  |
    | noviembre  | 8244004.19  |
    | diciembre  | 6152906.05  |
    </details>
    <details>
    <summary>Hint</summary>
    Postgres takes the language formatting from the system default. You can change that per-session by setting <a href="https://www.postgresql.org/docs/current/runtime-config-client.html#RUNTIME-CONFIG-CLIENT-FORMAT"> lc_time </a> to 'es_ES'.
    
    You can also use <a href ="https://www.postgresql.org/docs/current/functions-formatting.html">to_char()</a> to extract the month. Make sure you add the right prefix for the locale translation to work - see "Table 9.30. Template Pattern Modifiers for Numeric Formatting" on the same page for more details.
    </details>

8.  (Optional) The report now needs to include every year - grouped and ordered by year _and_ month.
    <details><summary>Answer</summary>

    | Year | Month     | Value         |
    |------|-----------|---------------|
    | 2018 | January   | 5656943.14  |
    | 2018 | February  | 10756477.55 |
    | 2018 | March     | 5156643.61  |
    | 2018 | April     | 8158733.57  |
    | 2018 | May       | 6909454.38  |
    | 2018 | June      | 8618200.66  |
    | 2018 | July      | 4973409.32  |
    | 2018 | August    | 7338968.02  |
    | 2018 | September | 9850131.20  |
    | 2018 | October   | 7754044.63  |
    | 2018 | November  | 7204268.44  |
    | 2018 | December  | 9031586.17  |
    | 2019 | January   | 7140463.17  |
    | 2019 | February  | 6127454.68  |
    | 2019 | March     | 8720289.82  |
    | 2019 | April     | 8776308.77  |
    | 2019 | May       | 8059621.26  |
    | 2019 | June      | 8271865.02  |
    | 2019 | July      | 7485176.76  |
    | 2019 | August    | 8554835.59  |
    | 2019 | September | 5162879.62  |
    | 2019 | October   | 8480658.03  |
    | 2019 | November  | 5960023.00  |
    | 2019 | December  | 9030807.45  |
    | 2020 | January   | 10021197.33 |
    | 2020 | February  | 5451368.04  |
    | 2020 | March     | 8393388.67  |
    | 2020 | April     | 6455989.74  |
    | 2020 | May       | 10138281.22 |
    | 2020 | June      | 8845170.26  |
    | 2020 | July      | 7174546.57  |
    | 2020 | August    | 7310235.65  |
    | 2020 | September | 8305703.18  |
    | 2020 | October   | 8597017.86  |
    | 2020 | November  | 8244004.19  |
    | 2020 | December  | 6152906.05  |
    </details>
    <details><summary>Hint</summary>You can pass multiple values to `ORDER BY` and `GROUP BY` commands.</details>

## Optional Extras

1.  Write a query that produces a report of PayBands, the total monthly salary paid to everyone in each band and what percentage of the total monthly salary bill that is.

    <details><summary>Hint</summary>

    You may find it helpful to use a [temporary table](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-select-into/) or [local variable](https://www.postgresql.org/docs/current/plpgsql-declarations.html).
    
    > Note that in order to use variables, you must use them within a function.

    </details>
