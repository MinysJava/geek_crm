USE geek_crm_db;

DROP TABLE IF EXISTS department cascade;

CREATE TABLE department
(
    id         INT          NOT NULL AUTO_INCREMENT,
    title      VARCHAR(256) NULL,
    manager_id INT,
    PRIMARY KEY (id)
);