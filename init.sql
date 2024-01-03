Open source license info

Target width is 142.
Expanded display is used automatically.
postgres=# ls
postgres-# clear
postgres-# ;
;
ERROR:  syntax error at or near "ls"
LINE 1: ls
        ^
postgres=# ;
postgres=# CREATE TABLE users(
postgres(# 
postgres(# id SERIAL PRIMARY KEY,
postgres(# username VARCHAR(50) UNIQUE NOT NULL,
postgres(# email VARCHAR(100) UNIQUE NOT NULL,
postgres(# password VARCHAR(255) NOT NULL,
postgres(# created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE
postgres=# SELECT * FROM users;
 id | username | email | password | created_at 
----+----------+-------+----------+------------
(0 rows)

postgres=# INSERT INTO users (username, email, password) VALUES
postgres-# ('user1', 'user1@gmail.com', 'password'),
postgres-# ('user2', 'user2@gmail.com', 'password1'),
postgres-# ('user3', 'user3@gmail.com', 'password2');
INSERT 0 3
postgres=# SELECT * FROM users;
 id | username |      email      | password  |         created_at         
----+----------+-----------------+-----------+----------------------------
  1 | user1    | user1@gmail.com | password  | 2024-01-03 13:12:11.678299
  2 | user2    | user2@gmail.com | password1 | 2024-01-03 13:12:11.678299
  3 | user3    | user3@gmail.com | password2 | 2024-01-03 13:12:11.678299
(3 rows)

postgres=# SELECT username FROM users ORDER BY username ASC;
 username 
----------
 user1
 user2
 user3
(3 rows)

postgres=# SELECT username FROM users ORDER BY username DESC;
 username 
----------
 user3
 user2
 user1
(3 rows)

postgres=# SELECT username, email FROM users ORDER BY username DESC;
 username |      email      
----------+-----------------
 user3    | user3@gmail.com
 user2    | user2@gmail.com
 user1    | user1@gmail.com
(3 rows)

postgres=# SELECT username, email FROM users WHERE username = 'user3'  ORDER BY username DESC;
 username |      email      
----------+-----------------
 user3    | user3@gmail.com
(1 row)

postgres=# SELECT username, email FROM users WHERE username = 'user3' AND email = ''  ORDER BY username DESC;
 username | email 
----------+-------
(0 rows)

postgres=# SELECT username, email FROM users WHERE username = 'user3' AND email != ''  ORDER BY username DESC;
 username |      email      
----------+-----------------
 user3    | user3@gmail.com
(1 row)

postgres=# SELECT username, email FROM users WHERE username IN ('use', 'user')  AND email != ''  ORDER BY username DESC;
 username | email 
----------+-------
(0 rows)

postgres=# SELECT username, email FROM users WHERE username IN ('user')  AND email != ''  ORDER BY username DESC;
 username | email 
----------+-------
(0 rows)

postgres=# SELECT username, email FROM users WHERE username IN ('user1')  AND email != ''  ORDER BY username DESC;
 username |      email      
----------+-----------------
 user1    | user1@gmail.com
(1 row)

postgres=# SELECT username, email FROM users WHERE username IN ('user1', 'user2')  AND email != ''  ORDER BY username DESC;
 username |      email      
----------+-----------------
 user2    | user2@gmail.com
 user1    | user1@gmail.com
(2 rows)

postgres=# SELECT username, email FROM users WHERE username LIKE 'user%'  AND email != ''  ORDER BY username DESC;
 username |      email      
----------+-----------------
 user3    | user3@gmail.com
 user2    | user2@gmail.com
 user1    | user1@gmail.com
(3 rows)

postgres=# SELECT username, email FROM users WHERE username LIKE 'u%' AND LENGTH(username) BETWEEN 4 AND 5  AND email != ''  ORDER BY username DESC;
 username |      email      
----------+-----------------
 user3    | user3@gmail.com
 user2    | user2@gmail.com
 user1    | user1@gmail.com
(3 rows)

postgres=# ^C
postgres=# 
postgres=# SELECT username, email FROM users WHERE username LIKE 'u%' AND LENGTH(username) BETWEEN 4 AND 5  AND email != ''  ORDER BY username DESC LIMIT 2;
 username |      email      
----------+-----------------
 user3    | user3@gmail.com
 user2    | user2@gmail.com
(2 rows)

postgres=# SELECT username, email FROM users WHERE username LIKE 'u%' AND LENGTH(username) BETWEEN 4 AND 5  AND email != ''  ORDER BY username DESC LIMIT 2 OFFSET 0;
 username |      email      
----------+-----------------
 user3    | user3@gmail.com
 user2    | user2@gmail.com
(2 rows)

postgres=# SELECT username, email FROM users WHERE username LIKE 'u%' AND LENGTH(username) BETWEEN 4 AND 5  AND email != ''  ORDER BY username DESC LIMIT 2 OFFSET 1;
 username |      email      
----------+-----------------
 user2    | user2@gmail.com
 user1    | user1@gmail.com
(2 rows)

postgres=# SELECT username, email FROM users WHERE username LIKE 'u%' AND LENGTH(username) BETWEEN 4 AND 5  AND email != ''  ORDER BY username DESC LIMIT 2 OFFSET 2;
 username |      email      
----------+-----------------
 user1    | user1@gmail.com
(1 row)

postgres=# SELECT username, email FROM users WHERE username LIKE 'u%' AND LENGTH(username) BETWEEN 4 AND 5  AND email != ''  ORDER BY username DESC LIMIT 2 OFFSET 3
postgres-# ;
 username | email 
----------+-------
(0 rows)

postgres=# SELECT username, email FROM users WHERE username LIKE 'u%' AND LENGTH(username) BETWEEN 4 AND 5  AND email != ''  ORDER BY username DESC FETCH FIRST ROW ONLY
;
 username |      email      
----------+-----------------
 user3    | user3@gmail.com
(1 row)

postgres=# SELECT username, email FROM users WHERE username LIKE 'u%' AND LENGTH(username) BETWEEN 4 AND 5  AND email != ''  ORDER BY username DESC FETCH FIRST 5 ROW ONLY
;
 username |      email      
----------+-----------------
 user3    | user3@gmail.com
 user2    | user2@gmail.com
 user1    | user1@gmail.com
(3 rows)

postgres=# SELECT username, email FROM users WHERE username LIKE 'u%' AND LENGTH(username) BETWEEN 4 AND 5  AND email != ''  ORDER BY username DESC OFFSET 5 rows  FETCH FIRST 5 ROW ONLY;
 username | email 
----------+-------
(0 rows)

postgres=# SELECT username, email FROM users WHERE username LIKE 'u%' AND LENGTH(username) BETWEEN 4 AND 5  AND email != ''  ORDER BY username DESC OFFSET 5 ROWS FETCH FIRST 5 ROW ONLY;
 username | email 
----------+-------
(0 rows)

postgres=# SELECT username, email FROM users WHERE username LIKE 'u%' AND LENGTH(username) BETWEEN 4 AND 5  AND email != ''  ORDER BY username DESC OFFSET 1 ROWS FETCH FIRST 5 ROW ONLY;
 username |      email      
----------+-----------------
 user2    | user2@gmail.com
 user1    | user1@gmail.com
(2 rows)

postgres=# CREATE TABLE basket_a (
postgres(#     a INT PRIMARY KEY,
postgres(#     fruit_a VARCHAR (100) NOT NULL
postgres(# );
CREATE TABLE
postgres=# 
postgres=# CREATE TABLE basket_b (
postgres(#     b INT PRIMARY KEY,
postgres(#     fruit_b VARCHAR (100) NOT NULL
postgres(# );
CREATE TABLE
postgres=# 
postgres=# INSERT INTO basket_a (a, fruit_a)
postgres-# VALUES
postgres-#     (1, 'Apple'),
postgres-#     (2, 'Orange'),
postgres-#     (3, 'Banana'),
postgres-#     (4, 'Cucumber');
INSERT 0 4
postgres=# 
postgres=# INSERT INTO basket_b (b, fruit_b)
postgres-# VALUES
postgres-#     (1, 'Orange'),
postgres-#     (2, 'Apple'),
postgres-#     (3, 'Watermelon'),
postgres-#     (4, 'Pear');
INSERT 0 4
postgres=# SELECT * FROM basket_a ;
 a | fruit_a  
---+----------
 1 | Apple
 2 | Orange
 3 | Banana
 4 | Cucumber
(4 rows)

postgres=# SELECT * FROM basket_b ;
 b |  fruit_b   
---+------------
 1 | Orange
 2 | Apple
 3 | Watermelon
 4 | Pear
(4 rows)

postgres=# SELECT a, fruit_a, b, fruit_b FROM basket_a INNER JOIN basket_b ON fruit_a = fruit_b;
 a | fruit_a | b | fruit_b 
---+---------+---+---------
 1 | Apple   | 2 | Apple
 2 | Orange  | 1 | Orange
(2 rows)

postgres=# SELECT a, fruit_a, b, fruit_b FROM basket_a LEFT JOIN basket_b ON fruit_a = fruit_b;
 a | fruit_a  | b | fruit_b 
---+----------+---+---------
 1 | Apple    | 2 | Apple
 2 | Orange   | 1 | Orange
 3 | Banana   |   | 
 4 | Cucumber |   | 
(4 rows)

postgres=# SELECT a, fruit_a, b, fruit_b FROM basket_a LEFT JOIN basket_b ON fruit_a = fruit_b WHERE b IS NULL;
 a | fruit_a  | b | fruit_b 
---+----------+---+---------
 3 | Banana   |   | 
 4 | Cucumber |   | 
(2 rows)

postgres=# SELECT a, fruit_a, b, fruit_b FROM basket_a RIGTH JOIN basket_b ON fruit_a = fruit_b;
 a | fruit_a | b | fruit_b 
---+---------+---+---------
 1 | Apple   | 2 | Apple
 2 | Orange  | 1 | Orange
(2 rows)

postgres=# SELECT a, fruit_a, b, fruit_b FROM basket_a RIGTH JOIN basket_b ON fruit_a = fruit_b WHERE b IS NULL;
 a | fruit_a | b | fruit_b 
---+---------+---+---------
(0 rows)

postgres=# SELECT a, fruit_a, b, fruit_b FROM basket_a RIGht JOIN basket_b ON fruit_a = fruit_b;
 a | fruit_a | b |  fruit_b   
---+---------+---+------------
 2 | Orange  | 1 | Orange
 1 | Apple   | 2 | Apple
   |         | 3 | Watermelon
   |         | 4 | Pear
(4 rows)

postgres=# SELECT a, fruit_a, b, fruit_b FROM basket_a RIGHT JOIN basket_b ON fruit_a = fruit_b;
 a | fruit_a | b |  fruit_b   
---+---------+---+------------
 2 | Orange  | 1 | Orange
 1 | Apple   | 2 | Apple
   |         | 3 | Watermelon
   |         | 4 | Pear
(4 rows)

postgres=# SELECT a, fruit_a, b, fruit_b FROM basket_a RIGHT JOIN basket_b ON fruit_a = fruit_b WHERE b IS NULL;
 a | fruit_a | b | fruit_b 
---+---------+---+---------
(0 rows)

postgres=# SELECT a, fruit_a, b, fruit_b FROM basket_a FULL OUTER JOIN basket_b ON fruit_a = fruit_b;
 a | fruit_a  | b |  fruit_b   
---+----------+---+------------
 1 | Apple    | 2 | Apple
 2 | Orange   | 1 | Orange
 3 | Banana   |   | 
 4 | Cucumber |   | 
   |          | 3 | Watermelon
   |          | 4 | Pear
(6 rows)

postgres=# SELECT a, fruit_a, b, fruit_b FROM basket_a FULL OUTER JOIN basket_b ON fruit_a = fruit_b WHERE a IS NULL OR b IS NULL;
 a | fruit_a  | b |  fruit_b   
---+----------+---+------------
 3 | Banana   |   | 
 4 | Cucumber |   | 
   |          | 3 | Watermelon
   |          | 4 | Pear
(4 rows)

postgres=# 