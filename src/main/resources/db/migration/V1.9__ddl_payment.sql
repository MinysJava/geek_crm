USE geek_crm_db;

DROP TABLE IF EXISTS payment cascade;

CREATE TABLE payment
(
    id          INT            NOT NULL,
    customer_id INT            NOT NULL,
    amount      DECIMAL(10, 2) NULL,
    date        DATE           NULL,
    PRIMARY KEY (id),
    INDEX payment_customer_idx (customer_id ASC) VISIBLE,
    CONSTRAINT payment_customer
        FOREIGN KEY (customer_id)
            REFERENCES geek_crm_db.customer (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);