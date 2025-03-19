BEGIN;
CREATE TABLE "public"."employee"( 
	"id" int NOT NULL,
	"firstname" varchar(50) NOT NULL,
	"surname" varchar(50) NOT NULL,
	"dob" date NOT NULL,
	"payband" int NOT NULL,
	"nationalinsurancenumber" varchar(10),
	"phone" varchar(25),
	"emergencycontactname" varchar(100),
	"emergencycontactphone" varchar(25),
	"salaryaccountnumber" varchar(50) NOT NULL,
	"salarysortcode" varchar(10) NOT NULL,
	"unionmembershipno" varchar(15),
	"managerid" int,
	"managerfirstname" varchar(50),
	"managersurname" varchar(50));

CREATE TABLE "public"."order"( 
	"id" int NOT NULL,
	"date" date NOT NULL,
	"product" int NOT NULL,
	"supplier" int NOT NULL,
	"amount" numeric(10, 2) NOT NULL);

CREATE TABLE "public"."payband"( 
	"id" int NOT NULL,
	"monthlysalary" numeric(10, 2) NOT NULL,
	"annualbonus" numeric(10, 2) NOT NULL);

CREATE TABLE "public"."product"( 
	"id" int NOT NULL,
	"name" varchar(50) NOT NULL,
	"sellingprice" numeric(10, 2) NOT NULL);

CREATE TABLE "public"."sale"( 
	"id" int NOT NULL,
	"productid" int NOT NULL,
	"username" varchar(50) NOT NULL,
	"amount" numeric(10, 2) NOT NULL);

CREATE TABLE "public"."stock"( 
	"id" int NOT NULL,
	"supplierid" int NOT NULL,
	"price" numeric(10, 2) NOT NULL);

CREATE TABLE "public"."supplier"( 
	"id" int NOT NULL,
	"name" varchar(50) NOT NULL,
	"contactname" varchar(50) NOT NULL,
	"contactnumber" varchar(50),
	"contactemail" varchar(50) NOT NULL);

CREATE TABLE "public"."user"( 
	"username" varchar(50) NOT NULL,
	"password" varchar(50) NOT NULL,
	"cardnumber" varchar(28),
	"cardexpirydate" date,
	"cardcsv" varchar(3),
	"dob" date NOT NULL,
	"gender" varchar(10) NOT NULL);

COMMIT;

BEGIN;
CREATE SEQUENCE "public"."employee_id_seq" INCREMENT BY 1 START WITH 1 OWNED BY "public"."employee"."id";
CREATE SEQUENCE "public"."order_id_seq" INCREMENT BY 1 START WITH 1 OWNED BY "public"."order"."id";
CREATE SEQUENCE "public"."payband_id_seq" INCREMENT BY 1 START WITH 1 OWNED BY "public"."payband"."id";
CREATE SEQUENCE "public"."product_id_seq" INCREMENT BY 1 START WITH 1 OWNED BY "public"."product"."id";
CREATE SEQUENCE "public"."sale_id_seq" INCREMENT BY 1 START WITH 1 OWNED BY "public"."sale"."id";
CREATE SEQUENCE "public"."stock_id_seq" INCREMENT BY 1 START WITH 1 OWNED BY "public"."stock"."id";
CREATE SEQUENCE "public"."supplier_id_seq" INCREMENT BY 1 START WITH 1 OWNED BY "public"."supplier"."id";
ALTER TABLE "public"."employee" ADD CONSTRAINT "pk_employee" PRIMARY KEY ("id");
ALTER TABLE "public"."order" ADD CONSTRAINT "pk_order" PRIMARY KEY ("id");
ALTER TABLE "public"."payband" ADD CONSTRAINT "pk_payband" PRIMARY KEY ("id");
ALTER TABLE "public"."product" ADD CONSTRAINT "pk_product" PRIMARY KEY ("id");
ALTER TABLE "public"."sale" ADD CONSTRAINT "pk_sale" PRIMARY KEY ("id");
ALTER TABLE "public"."stock" ADD CONSTRAINT "pk_stock" PRIMARY KEY ("id");
ALTER TABLE "public"."supplier" ADD CONSTRAINT "pk_supplier" PRIMARY KEY ("id");
ALTER TABLE "public"."user" ADD CONSTRAINT "pk_user" PRIMARY KEY ("username");
ALTER TABLE "public"."employee" ADD CONSTRAINT "fk_employee_payband" FOREIGN KEY ("payband") REFERENCES "public"."payband" ( "id");
ALTER TABLE "public"."order" ADD CONSTRAINT "fk_order_product" FOREIGN KEY ("product") REFERENCES "public"."product" ( "id");
ALTER TABLE "public"."order" ADD CONSTRAINT "fk_order_supplier" FOREIGN KEY ("supplier") REFERENCES "public"."supplier" ( "id");
ALTER TABLE "public"."sale" ADD CONSTRAINT "fk_sale_product" FOREIGN KEY ("productid") REFERENCES "public"."product" ( "id");
ALTER TABLE "public"."sale" ADD CONSTRAINT "fk_sale_user" FOREIGN KEY ("username") REFERENCES "public"."user" ( "username");
ALTER TABLE "public"."stock" ADD CONSTRAINT "fk_stock_supplier" FOREIGN KEY ("supplierid") REFERENCES "public"."supplier" ( "id");
ALTER TABLE "public"."employee" ALTER COLUMN "id" SET DEFAULT nextval('"public"."employee_id_seq"');
ALTER TABLE "public"."order" ALTER COLUMN "id" SET DEFAULT nextval('"public"."order_id_seq"');
ALTER TABLE "public"."payband" ALTER COLUMN "id" SET DEFAULT nextval('"public"."payband_id_seq"');
ALTER TABLE "public"."product" ALTER COLUMN "id" SET DEFAULT nextval('"public"."product_id_seq"');
ALTER TABLE "public"."sale" ALTER COLUMN "id" SET DEFAULT nextval('"public"."sale_id_seq"');
ALTER TABLE "public"."stock" ALTER COLUMN "id" SET DEFAULT nextval('"public"."stock_id_seq"');
ALTER TABLE "public"."supplier" ALTER COLUMN "id" SET DEFAULT nextval('"public"."supplier_id_seq"');
COMMIT;

