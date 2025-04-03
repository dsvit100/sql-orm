-- vsCode의 sqlite 확장 설치
-- Use Database => Run Query
CREATE TABLE TEST (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    age INTEGER
);

ALTER TABLE TEST RENAME TO user;

ALTER TABLE user ADD COLUMN eamil TEXT;

ALTER TABLE user RENAME COLUMN name TO username;

DROP TABLE user;









