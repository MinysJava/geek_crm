USE geek_crm_db;

DROP TABLE IF EXISTS order_status cascade;

CREATE TABLE order_status
(
    id    INT          NOT NULL,
    title VARCHAR(256) NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS order cascade;

CREATE TABLE order
(
    id              INT  NOT NULL,
    store_id        INT  NULL,
    customer_id     INT  NULL,
    order_status_id INT  NULL,
    create_date     DATE NULL,
    complete_date   DATE NULL,
    PRIMARY KEY (id),
    INDEX order_store_idx (store_id ASC) VISIBLE,
    INDEX order_customer_idx (customer_id ASC) VISIBLE,
    INDEX order_order_status_idx (order_status_id ASC) VISIBLE,
    CONSTRAINT order_store
        FOREIGN KEY (store_id)
            REFERENCES geek_crm_db.store (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT order_customer
        FOREIGN KEY (customer_id)
            REFERENCES geek_crm_db.customer (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT order_order_status
        FOREIGN KEY (order_status_id)
            REFERENCES geek_crm_db.order_status (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);