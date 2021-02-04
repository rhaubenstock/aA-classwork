PRAGMA foregn_keys = ON;

DROP TABLE IF EXISTS users; /*lets us run the file multiple times and start fresh
(create table from scratch) each time we run the file*/
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
-- probably have to change order of drop tables


CREATE TABLE users (
    id INTEGER PRIMARY KEY, 
    fname VARCHAR(255),
    lname VARCHAR(255)
     
); 


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255),
    body VARCHAR(255),
    author_id INTEGER,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    parent_id INTEGER,
    author_id INTEGER,
    body VARCHAR(255),

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id)   REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- INSERT INTO 
--     cats(name, color,breed) /*specifies the order we will be supplying values in below*/
-- VALUES 
--     ('Fred','Yellow','Tabby') /*,...; <- if you want to add more make sure you separte by commas and end list with semicolon*/

INSERT INTO
    users(fname, lname)
VALUES
    ('Bob','TheBuilder'), ('Rosie', 'TheRiveter'), ('Fred', 'Flinstone');

INSERT INTO
    questions(title, body, author_id)
VALUES
    ('First Question', 'Howdy?', 1), ('Second Question', 'Where are you from?', 3), ('Third Question', 'How have you been?', 2);

INSERT INTO
    question_follows(user_id, question_id)
VALUES
    (1,3), (2,2), (1,1), (3,3), (2,1);

INSERT INTO
    replies(question_id, parent_id, author_id, body)
VALUES
    (1, NULL, 2, 'Hello'), (2, NULL, 3, 'Mars'), (1, 1, 2, 'Hi'), (1,1,3, 'Hello back'), (1,1,1, 'Get lost');

INSERT INTO
    question_likes(user_id, question_id)
VALUES
    (3,1), (2,3), (1,1); 