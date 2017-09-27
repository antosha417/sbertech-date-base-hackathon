#!/usr/bin/python
# -*- coding: utf-8 -*-

import psycopg2
# note that we have to import the Psycopg2 extras library!
import psycopg2.extras
import sys


def main(number):
    conn_string = "host='138.68.67.181' dbname='postgres' user='postgres' password='postgres'"
    # print the connection string we will use to connect
    print "Connecting to database\n	->%s" % (conn_string)

    conn = psycopg2.connect(conn_string)

    # HERE IS THE IMPORTANT PART, by specifying a name for the cursor
    # psycopg2 creates a server-side cursor, which prevents all of the
    # records from being downloaded at once from the server.
    cursor = conn.cursor('cursor_unique_name', cursor_factory=psycopg2.extras.DictCursor)
    if number == '1':
        cursor.execute('SELECT "name", sum("curr_balanсe") FROM "Contract" JOIN "User" USING (user_id) JOIN "Bill" USING (bill_id) GROUP BY user_id, "name" ORDER BY sum("curr_balanсe") LIMIT 10')
    elif number == '2':
        cursor.execute('SELECT * FROM "User_history" LIMIT 1000')
    else:
        print 'wrong number'
    # Because cursor objects are iterable we can just call 'for - in' on
    # the cursor object and the cursor will automatically advance itself
    # each iteration.
    # This loop should run 1000 times, assuming there are at least 1000
    # records in 'my_table'
    rows = cursor.fetchall()
    return rows


def add_to_res1():
    conn_string = "host='138.68.67.181' dbname='postgres' user='postgres' password='postgres'"
    # print the connection string we will use to connect
    print "Connecting to database\n	->%s" % (conn_string)

    conn = psycopg2.connect(conn_string)

    cursor = conn.cursor('cursor_unique_name', cursor_factory=psycopg2.extras.DictCursor)
    cursor.execute('INSERT INTO report1 (SELECT "name", sum("curr_balanсe"), FALSE FROM "Contract" JOIN "User" USING (user_id) JOIN "Bill" USING (bill_id) GROUP BY user_id, "name" ORDER BY sum("curr_balanсe") LIMIT 10)')


if __name__ == "__main__":
    print main('1')
