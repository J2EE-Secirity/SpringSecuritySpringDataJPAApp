
-- Table: users

DROP TABLE users;
CREATE TABLE users (
  userid bigint NOT NULL,
  email character varying(255),
  enabled integer,
  password character varying(255),
  username character varying(255),
  CONSTRAINT users_pkey PRIMARY KEY (userid)
)
WITH (
  OIDS=FALSE
);

-- Table: user_roles

DROP TABLE user_roles;
CREATE TABLE user_roles (
  user_role_id bigint NOT NULL,
  role character varying(255),
  userid bigint,
  CONSTRAINT user_roles_pkey PRIMARY KEY (user_role_id)
)
WITH (
  OIDS=FALSE
);


INSERT INTO users (userid, username, email, password, enabled) VALUES
  (0, 'priya', 'abc@abc.com', '$2a$04$CO93CT2ObgMiSnMAWwoBkeFObJlMYi/wzzOnPlsTP44r7qVq0Jln2', 1),
  (1, 'naveen', 'def@def.com', '$2a$04$j3JpPUp6CTAe.kMWmdRNC.Wie58xDNPfcYz0DBJxWkucJ6ekJuiJm', 1);

INSERT INTO user_roles (user_role_id, userid, role) VALUES
  (0, 0, 'ROLE_USER'),
  (1, 1, 'ROLE_ADMIN'),
  (2, 1, 'ROLE_USER');
