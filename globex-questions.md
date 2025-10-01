# Globex Data Task

Globex is an export company that supplies widgets to consumers around the world. Their **DBA** (database administrator) recently left without warning and they need some help. There are a series of questions below that need answering.

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
    <details><summary>Answer</summary>46527501.9600</details>

2.  What is the value of the highest value order in the system?
    <details><summary>Answer</summary>96975259.08</details>

3.  What was the value of the most expensive order placed in 2019?
    <details><summary>Answer</summary>90005467.20</details>
    <details><summary>Hint</summary>Try using the `DATE_PART` function.</details>

4.  What was the value of all orders placed in 2019?
    <details><summary>Answer</summary>8377327441.40</details>

5.  What was the value of all orders placed in 2019 excluding the following: 'Voltaren','Loud Child', 'topiramate', 'Omeprazole'?
    <details><summary>Answer</summary>7572529633.86</details>

6.  (Optional) The finance director needs a month-by-month report of order values for 2020. Please write a query to produce total order values grouped by month name.
    <details>
    <summary>Answer</summary>

    | Month    | Value         |
    | -------- | ------------- |
    |January   | 1152297134.73 |
    |February  | 582972524.34  |
    |March     | 740102771.90  |
    |April     | 893570013.36  |
    |May       | 809371282.03  |
    |June      | 859491782.88  |
    |July      | 744856730.74  |
    |August    | 772992925.83  |
    |September | 998998370.23  |
    |October   | 1119207081.57 |
    |November  | 832130852.96  |
    |December  | 695348529.80  |
    </details>
    <details><summary>Hint</summary>You'll need the `GROUP BY` statement.</details>

7.  (Optional) Please adapt the above report so it prints the month names in Spanish.
    <details><summary>Answer</summary>

    | Month      | Value         |
    | ---------- | ------------- |
    | enero      | 1152297134.73 |
    | febrero    | 582972524.34  |
    | marzo      | 740102771.90  |
    | abril      | 893570013.36  | 
    | mayo       | 809371282.03  |
    | junio      | 859491782.88  |
    | julio      | 744856730.74  |
    | agosto     | 772992925.83  |
    | septiembre | 998998370.23  |
    | octubre    | 1119207081.57 |
    | noviembre  | 832130852.96  |
    | diciembre  | 695348529.80  |
    </details>
    <details>
    <summary>Hint</summary>
    Postgres takes the language formatting from the system default. You can change that per-session by setting <a href="https://www.postgresql.org/docs/current/runtime-config-client.html#RUNTIME-CONFIG-CLIENT-FORMAT"> lc_time </a> to 'es_ES'.
    
    You can also use <a href ="https://www.postgresql.org/docs/current/functions-formatting.html">to_char()</a> to extract the month. Make sure you add the right prefix for the locale translation to work - see "Table 9.30. Template Pattern Modifiers for Numeric Formatting" on the same page for more details.
    </details>

8.  (Optional) The report now needs to include every year - grouped and ordered by year _and_ month.
    <details><summary>Answer</summary>

    | Year | Month     | Value         |
    | ---- | --------- | ------------- |
    | 2018 | January   | 584244206.56  |
    | 2018 | February  | 1110033926.92 |
    | 2018 | March     | 465596579.36  |
    | 2018 | April     | 769189197.09  |
    | 2018 | May       | 678002564.93  |
    | 2018 | June      | 973822293.04  |
    | 2018 | July      | 603780358.26  |
    | 2018 | August    | 1265736320.01 |
    | 2018 | September | 1262211581.12 |
    | 2018 | October   | 707242105.00  |
    | 2018 | November  | 674421684.92  |
    | 2018 | December  | 830786648.42  |
    | 2019 | January   | 570807232.36  |
    | 2019 | February  | 516987419.96  |
    | 2019 | March     | 758934136.71  |
    | 2019 | April     | 852358982.35  |
    | 2019 | May       | 638167195.96  |
    | 2019 | June      | 878393983.87  |
    | 2019 | July      | 708166654.15  |
    | 2019 | August    | 728331790.71  |
    | 2019 | September | 371493568.28  |
    | 2019 | October   | 918492600.71  |
    | 2019 | November  | 613890777.94  |
    | 2019 | December  | 821303098.40  |
    | 2020 | January   | 1152297134.73 |
    | 2020 | February  | 582972524.34  |
    | 2020 | March     | 740102771.90  |
    | 2020 | April     | 893570013.36  |
    | 2020 | May       | 809371282.03  |
    | 2020 | June      | 859491782.88  |
    | 2020 | July      | 744856730.74  |
    | 2020 | August    | 812372070.42  |
    | 2020 | September | 824989408.69  |
    | 2020 | October   | 891142486.67  |
    | 2020 | November  | 867317295.20  |
    | 2020 | December  | 676457857.58  |
    <details><summary>Hint</summary>You can pass multiple values to `ORDER BY` and `GROUP BY` commands.</details>

## Optional Extras

1.  Write a query that produces a report of PayBands, the total monthly salary paid to everyone in each band and what percentage of the total monthly salary bill that is.

    <details><summary>Hint</summary>

    You may find it helpful to use a [temporary table](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-select-into/) or [local variable](https://www.postgresql.org/docs/current/plpgsql-declarations.html).
    
    > Note that in order to use variables, you must use them within a function.

    </details>
