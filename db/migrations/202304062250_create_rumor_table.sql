-- migrate:up
CREATE TABLE rumors (
  "created_at"  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "rumor" varchar NOT NULL
);

-- migrate:down

DROP TABLE rumors;


