
-- Table: users

DROP TABLE users;
CREATE TABLE users (
  id bigint NOT NULL,
  email character varying(255),
  enabled integer,
  password character varying(255),
  username character varying(255),
  CONSTRAINT users_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);

-- Table: user_roles

DROP TABLE user_roles;
CREATE TABLE user_roles (
  id bigint NOT NULL,
  role character varying(255),
  user_id bigint,
  CONSTRAINT user_roles_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);


INSERT INTO users (id, username, email, password, enabled) VALUES
  (0, 'priya', 'abc@abc.com', '$2a$04$CO93CT2ObgMiSnMAWwoBkeFObJlMYi/wzzOnPlsTP44r7qVq0Jln2', 1),
  (1, 'naveen', 'def@def.com', '$2a$04$j3JpPUp6CTAe.kMWmdRNC.Wie58xDNPfcYz0DBJxWkucJ6ekJuiJm', 1);

INSERT INTO user_roles (id, role, user_id) VALUES
  (0, 'ROLE_USER', 0),
  (1, 'ROLE_ADMIN', 1),
  (2, 'ROLE_USER', 1);
