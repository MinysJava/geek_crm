USE geek_crm_db;

DROP TABLE IF EXISTS order_item cascade;

CREATE TABLE order_item
(
    id         INT            NOT NULL,
    product_id INT            NULL,
    quantity   INT            NULL,
    price      DECIMAL(10, 2) NULL,
    PRIMARY KEY (id),
    INDEX order_item_product_idx (product_id ASC) VISIBLE,
    CONSTRAINT order_item_product
        FOREIGN KEY (product_id)
            REFERENCES geek_crm_db.product (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);
