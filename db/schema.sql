CREATE TABLE IF NOT EXISTS split_method (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS config (
  id SERIAL PRIMARY KEY,
  chunk_size INT,
  num_docs INT,
  split_method_id INT,
  FOREIGN KEY (split_method_id) REFERENCES split_method(id)
);

CREATE TABLE IF NOT EXISTS run (
  id SERIAL PRIMARY KEY,
  date TIMESTAMP,
  user_name VARCHAR(255),
  config_id INT,
  FOREIGN KEY (config_id) REFERENCES config(id)
);

CREATE TABLE IF NOT EXISTS question (
  id SERIAL PRIMARY KEY,
  question TEXT
);

CREATE TABLE IF NOT EXISTS result (
  run_id INT,
  question_id INT,
  prompt TEXT,
  response TEXT,
  quality_score TEXT,
  FOREIGN KEY(run_id) REFERENCES run(id),
  FOREIGN KEY(question_id) REFERENCES question(id)
);
