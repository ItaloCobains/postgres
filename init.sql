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