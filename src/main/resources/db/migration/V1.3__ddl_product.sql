USE geek_crm_db;

DROP TABLE IF EXISTS product cascade;

CREATE TABLE product
(
    id          INT            NOT NULL,
    title       VARCHAR(512)   NULL,
    description VARCHAR(4096)  NULL,
    price       DECIMAL(10, 2) NULL,
    PRIMARY KEY (id)
);
