\c martakatona

CREATE USER has_many_user WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS has_many_blogs;

CREATE DATABASE has_many_blogs WITH OWNER has_many_user;
\c has_many_blogs

CREATE TABLE IF NOT EXISTS users
(
  id serial PRIMARY KEY,
  username character varying(90) NOT NULL,
  first_name character varying(90) NULL,
  last_name character varying(90) NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS posts
(
  id serial PRIMARY KEY,
  title character varying(180) NULL,
  url character varying(510) NULL,
  content text NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  user_id integer REFERENCES users(id)  -- FK
  --PRIMARY KEY (id, user_id),
);

CREATE TABLE IF NOT EXISTS comments
(
  id serial PRIMARY KEY,
  body character varying(510) NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  user_id integer REFERENCES users(id),  -- FK
  post_id integer REFERENCES posts(id)  -- FK
  --PRIMARY KEY (id, user_id, post_id)
);
\i scripts/blog_data.sql;
