INSERT INTO "payband" ("monthlysalary", "annualbonus")
VALUES
    (2010.74, 500.00),
    (2950.00, 1000.00),
    (3822.50, 2500.00),
    (5000.00, 4750.00),
    (6525.00, 9950.00),
    (8333.66, 12500.00),
    (10536.08, 19100.00);

COPY "supplier" FROM '/data/Supplier.csv' WITH (FORMAT CSV, HEADER);

COPY "product" FROM '/data/Product.csv' WITH (FORMAT CSV, HEADER);

COPY "stock" FROM '/data/Stock.csv' WITH (FORMAT CSV, HEADER);

COPY "order" FROM '/data/Order.csv' WITH (FORMAT CSV, HEADER);

COPY "user" FROM '/data/User.csv' WITH (FORMAT CSV, FORCE_NOT_NULL ("gender"), HEADER);

COPY "sale" FROM '/data/Sale.csv' WITH (FORMAT CSV, HEADER);

COPY "employee" FROM '/data/Employee.csv' WITH (FORMAT CSV, HEADER);

