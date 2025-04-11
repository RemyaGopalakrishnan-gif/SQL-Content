CREATE TABLE users (
    id INT,
    profile JSON
);

INSERT INTO users VALUES (1, '{"name": "Alice", "skills": ["SQL", "Python"]}');

SELECT JSON_EXTRACT(profile, '$.skills[0]') FROM users;
