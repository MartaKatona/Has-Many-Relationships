
\i has_many_blogs.sql;
--good
SELECT *
FROM users;

SELECT *
FROM posts
WHERE user_id = 100;

SELECT first_name, last_name, username, title, url, content, user_id
FROM users
INNER JOIN posts ON posts.user_id = users.id
WHERE user_id = 200;

SELECT user_id, --first_name, last_name, username, title, url, content,
COUNT(*)
FROM users
INNER JOIN posts ON posts.user_id = users.id
WHERE user_id = 200 OR user_id = 100
GROUP BY
  user_id;

SELECT
  first_name,
  last_name,
  username,
  title, url,
  content,
  user_id,
  posts.created_at
FROM users
INNER JOIN posts ON posts.user_id = users.id
WHERE first_name = 'Norene' AND last_name = 'Schmitt';

SELECT
  username,
  posts.created_at
FROM users
INNER JOIN posts ON posts.user_id = users.id
WHERE
  posts.created_at > '2015-01-01';

SELECT
  username,
  title,
  content,
  users.created_at
FROM users
INNER JOIN posts ON posts.user_id = users.id
WHERE
  users.created_at < '2015-01-01';

SELECT
  title,
  url,
  body,
  posts.created_at
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at < '2015-01-01';

SELECT
  title,
  url,
  body,
  posts.created_at
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at > '2015-01-01';

SELECT
  title,
  url,
  body
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE body LIKE '%USB%';

--EXPLAIN (ANALYZE, BUFFERS)
SELECT
  title,
  first_name,
  last_name,
  body
FROM users
INNER JOIN posts ON users.id = posts.user_id
INNER JOIN comments ON posts.id = comments.post_id
WHERE body LIKE '%matrix%';

--EXPLAIN (ANALYZE, BUFFERS)
SELECT
  first_name,
  last_name,
  body
FROM users
INNER JOIN posts ON users.id = posts.user_id
INNER JOIN comments ON posts.id = comments.post_id
WHERE
  body LIKE '%SSL%' AND
  content LIKE '%dolorum%';

--EXPLAIN (ANALYZE, BUFFERS)
SELECT
  first_name,
  last_name,
  username,
  title,
  body,
  content
FROM users
INNER JOIN posts ON users.id = posts.user_id
--SELECT posts.id, posts.content, posts.user_id, body
--FROM posts
INNER JOIN comments ON posts.id = comments.post_id
--WHERE content LIKE '%nemo%'
--SELECT comments.id, post_id, body
--  FROM comments
  WHERE (
    body LIKE '%SSL%' OR
    body LIKE '%firewall%') AND
    content LIKE '%nemo%';

-- good but no result
-- SELECT
--   users.id,
--   posts.id,
--   posts.title
-- FROM users
-- INNER JOIN posts ON users.id = posts.user_id
-- INNER JOIN comments ON posts.id = comments.post_id
-- WHERE
--   users.id = posts.user_id  AND
--   users.id = comments.user_id;

SELECT
  posts.created_at,
  COUNT(posts.created_at) AS Creadted
FROM posts
INNER JOIN comments ON comments.post_id = posts.id
WHERE posts.created_at > '2015-07-14'
  GROUP BY
    posts.created_at;

SELECT
  users.id,
  comments.user_id,
  comments.body
FROM users
INNER JOIN posts ON users.id = posts.user_id
INNER JOIN comments ON posts.id = comments.post_id
  WHERE
    body LIKE '%programming%';




