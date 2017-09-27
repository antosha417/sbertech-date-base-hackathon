CREATE TABLE "User" (
	"user_id" SERIAL NOT NULL,
	"name" VARCHAR NOT NULL,
	"address" VARCHAR NOT NULL,
  "actual_since" TIMESTAMP NOT NULL,
	PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Contract" (
	"contract_id" SERIAL NOT NULL,
	"type_id" INT NOT NULL,
	"user_id" INT NOT NULL,
	"bill_id" INT NOT NULL,
	"start_date" DATE NOT NULL,
	"end_date" DATE NOT NULL,
  "actual_since" TIMESTAMP NOT NULL,
	PRIMARY KEY ("contract_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Bill" (
	"bill_id" SERIAL NOT NULL,
	"curr_balanсe" DOUBLE PRECISION NOT NULL,
  "actual_since" TIMESTAMP NOT NULL,
	PRIMARY KEY ("bill_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Transaction" (
	"transaction_id" SERIAL NOT NULL,
	"sender" INT NOT NULL,
	"reciever" INT NOT NULL,
	"sum" DOUBLE PRECISION NOT NULL,
	"date_time" TIMESTAMP NOT NULL,
  "actual_since" TIMESTAMP NOT NULL,
  PRIMARY KEY ("transaction_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Type_info" (
	"type_id" SERIAL NOT NULL,
	"info" VARCHAR(255) NOT NULL,
  "actual_since" TIMESTAMP NOT NULL,
	"percent" FLOAT NOT NULL,
	PRIMARY KEY ("type_id")
) WITH (
  OIDS=FALSE
);

--************************************************************************--

CREATE TABLE "User_history" (
	"user_id" INT NOT NULL,
	"name" VARCHAR NOT NULL,
	"address" VARCHAR NOT NULL,
  "actual_since" TIMESTAMP NOT NULL,
  "actual_to" TIMESTAMP NOT NULL,
	PRIMARY KEY ("user_id", "actual_since", "actual_to")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Contract_history" (
	"contract_id" INT NOT NULL,
	"type_id" INT NOT NULL,
	"user_id" INT NOT NULL,
	"bill_id" INT NOT NULL,
	"start_date" DATE NOT NULL,
	"end_date" DATE NOT NULL,
  "actual_since" TIMESTAMP NOT NULL,
  "actual_to" TIMESTAMP NOT NULL,
	PRIMARY KEY ("contract_id", "actual_since", "actual_to")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Bill_history" (
	"bill_id" INT NOT NULL,
	"curr_balanсe" DOUBLE PRECISION NOT NULL,
  "actual_since" TIMESTAMP NOT NULL,
  "actual_to" TIMESTAMP NOT NULL,
	PRIMARY KEY ("bill_id", "actual_since", "actual_to")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Transaction_history" (
	"transaction_id" INT NOT NULL,
	"sender" INT NOT NULL,
	"reciever" INT NOT NULL,
	"sum" DOUBLE PRECISION NOT NULL,
	"date_time" TIMESTAMP NOT NULL,
  "actual_since" TIMESTAMP NOT NULL,
  "actual_to" TIMESTAMP NOT NULL,
  PRIMARY KEY ("transaction_id", "actual_since", "actual_to")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Type_info_history" (
	"type_id" INT NOT NULL,
	"info" VARCHAR(255) NOT NULL,
  "actual_since" TIMESTAMP NOT NULL,
  "actual_to" TIMESTAMP NOT NULL,
	"percent" FLOAT NOT NULL,
	PRIMARY KEY ("type_id", "actual_since", "actual_to")
) WITH (
  OIDS=FALSE
);

