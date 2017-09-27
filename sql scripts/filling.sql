CREATE OR REPLACE FUNCTION fill() RETURNS VOID AS
  $$
      DECLARE
        i INT;
      BEGIN
        INSERT INTO "Type_info" VALUES (1,
                                        'info1',
                                        '01 mar 1999 00:00:00',
                                        10);
        INSERT INTO "Type_info" VALUES (2,
                                        'info2',
                                        '01 mar 1999 00:00:00',
                                        15);
        i = 0;
        LOOP
          INSERT INTO "User" VALUES (i,
                                     'USER_'::VARCHAR || i::VARCHAR,
                                     'address_'::VARCHAR || i::VARCHAR,
                                     '01 mar 1999 00:00:00');
          INSERT INTO "Contract" VALUES (2*(i - 1),
                                         1,
                                         i,
                                         i,
                                         '01 mar 1999',
                                         '30 may 2020',
                                         '01 mar 1999 00:00:00');
          INSERT INTO "Contract" VALUES (2*(i - 1) + 1,
                                         2,
                                         i,
                                         i,
                                         '01 mar 1999',
                                         '30 may 2020',
                                         '01 mar 1999 00:00:00');
          INSERT INTO "Bill" VALUES (i,
                                     i*1000,
                                     '01 mar 1999 00:00:00');
          IF i > 100000 THEN
            EXIT;
          END IF;
          i = i + 1;
        END LOOP;
      END;
  $$
LANGUAGE plpgsql;

SELECT * FROM fill();

