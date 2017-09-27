CREATE OR REPLACE FUNCTION user_trigger() RETURNS trigger AS
  $$
  BEGIN
     INSERT INTO "User_history" VALUES (OLD."user_id",
                                       OLD."name",
                                       OLD."address",
                                       OLD."actual_since",
                                       CURRENT_TIMESTAMP);
    NEW.actual_since = CURRENT_TIMESTAMP;
    RETURN NEW;
  END
  $$
LANGUAGE plpgsql;

CREATE TRIGGER user_update BEFORE UPDATE ON "User"
FOR EACH ROW
EXECUTE PROCEDURE user_trigger();


CREATE OR REPLACE FUNCTION user_trigger_del() RETURNS trigger AS
  $$
  BEGIN
     INSERT INTO "User_history" VALUES (OLD."user_id",
                                       OLD."name",
                                       OLD."address",
                                       OLD."actual_since",
                                       CURRENT_TIMESTAMP);
    RETURN OLD;
  END
  $$
LANGUAGE plpgsql;

CREATE TRIGGER user_del BEFORE DELETE ON "User"
FOR EACH ROW
EXECUTE PROCEDURE user_trigger_del();

--***************************************************************************--

CREATE OR REPLACE FUNCTION bill_trigger_upd() RETURNS trigger AS
  $$
  BEGIN
     INSERT INTO "Bill_history" VALUES (OLD."bill_id",
                                       OLD."curr_balanсe",
                                       OLD."actual_since",
                                       CURRENT_TIMESTAMP);
    NEW.actual_since = CURRENT_TIMESTAMP;
    RETURN NEW;
  END
  $$
LANGUAGE plpgsql;

CREATE TRIGGER bill_update BEFORE UPDATE ON "Bill"
FOR EACH ROW
EXECUTE PROCEDURE bill_trigger_upd();


CREATE OR REPLACE FUNCTION bill_trigger_del() RETURNS trigger AS
  $$
  BEGIN
      INSERT INTO "Bill_history" VALUES (OLD."bill_id",
                                       OLD."curr_balanсe",
                                       OLD."actual_since",
                                       CURRENT_TIMESTAMP);
    RETURN OLD;
  END
  $$
LANGUAGE plpgsql;

CREATE TRIGGER bill_delete BEFORE DELETE ON "Bill"
FOR EACH ROW
EXECUTE PROCEDURE bill_trigger_del();

--***************************************************************************--

CREATE OR REPLACE FUNCTION contract_trigger_upd() RETURNS trigger AS
  $$
  BEGIN
     INSERT INTO "Contract_history" VALUES (OLD."contract_id",
                                       OLD."type_id",
                                       OLD."user_id",
                                       OLD."bill_id",
                                       OLD."start_date",
                                       OLD."end_date",
                                       OLD."actual_since",
                                       CURRENT_TIMESTAMP);
    NEW.actual_since = CURRENT_TIMESTAMP;
    RETURN NEW;
  END
  $$
LANGUAGE plpgsql;

CREATE TRIGGER contract_update BEFORE UPDATE ON "Contract"
FOR EACH ROW
EXECUTE PROCEDURE contract_trigger_upd();


CREATE OR REPLACE FUNCTION contract_trigger_del() RETURNS trigger AS
  $$
  BEGIN
      INSERT INTO "Contract_history" VALUES (OLD."contract_id",
                                       OLD."type_id",
                                       OLD."user_id",
                                       OLD."bill_id",
                                       OLD."start_date",
                                       OLD."end_date",
                                       OLD."actual_since",
                                       CURRENT_TIMESTAMP);
    RETURN OLD;
  END
  $$
LANGUAGE plpgsql;

CREATE TRIGGER contract_delete BEFORE DELETE ON "Contract"
FOR EACH ROW
EXECUTE PROCEDURE contract_trigger_del();

--***************************************************************************--

CREATE OR REPLACE FUNCTION transaction_trigger_upd() RETURNS trigger AS
  $$
  BEGIN
     INSERT INTO "Transaction_history" VALUES (OLD."transaction_id",
                                       OLD."sender",
                                       OLD."reciever",
                                       OLD."sum",
                                       OLD."date_time",
                                       OLD."actual_since",
                                       CURRENT_TIMESTAMP);
    NEW.actual_since = CURRENT_TIMESTAMP;
    RETURN NEW;
  END
  $$
LANGUAGE plpgsql;

CREATE TRIGGER transaction_update BEFORE UPDATE ON "Transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_trigger_upd();


CREATE OR REPLACE FUNCTION transaction_trigger_del() RETURNS trigger AS
  $$
  BEGIN
      INSERT INTO "Transaction_history" VALUES (OLD."transaction_id",
                                       OLD."sender",
                                       OLD."reciever",
                                       OLD."sum",
                                       OLD."date_time",
                                       OLD."actual_since",
                                       CURRENT_TIMESTAMP);
    RETURN OLD;
  END
  $$
LANGUAGE plpgsql;

CREATE TRIGGER transaction_delete BEFORE DELETE ON "Transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_trigger_del();

--***************************************************************************--

CREATE OR REPLACE FUNCTION type_info_trigger_upd() RETURNS trigger AS
  $$
  BEGIN
     INSERT INTO "Type_info_history" VALUES (OLD."type_id",
                                       OLD."info",
                                       OLD."actual_since",
                                       CURRENT_TIMESTAMP,
                                       OLD.percent);
    NEW.actual_since = CURRENT_TIMESTAMP;
    RETURN NEW;
  END
  $$
LANGUAGE plpgsql;

CREATE TRIGGER type_info_update BEFORE UPDATE ON "Type_info"
FOR EACH ROW
EXECUTE PROCEDURE type_info_trigger_upd();


CREATE OR REPLACE FUNCTION type_info_trigger_del() RETURNS trigger AS
  $$
  BEGIN
      INSERT INTO "Type_info_history" VALUES (OLD."type_id",
                                       OLD."info",
                                       OLD."actual_since",
                                       CURRENT_TIMESTAMP,
                                       OLD.percent);
    RETURN OLD;
  END
  $$
LANGUAGE plpgsql;

CREATE TRIGGER type_info_delete BEFORE DELETE ON "Type_info"
FOR EACH ROW
EXECUTE PROCEDURE type_info_trigger_del();

