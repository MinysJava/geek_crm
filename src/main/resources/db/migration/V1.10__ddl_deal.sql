USE geek_crm_db;

DROP TABLE IF EXISTS deal_status cascade;

CREATE TABLE deal_status
(
    id    INT          NOT NULL,
    title VARCHAR(256) NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS deal cascade;

CREATE TABLE deal
(
    id             INT NOT NULL,
    order_id       INT NULL,
    staff_id       INT NULL,
    deal_status_id INT NULL,
    PRIMARY KEY (id),
    INDEX deal_order_idx (order_id ASC) VISIBLE,
    INDEX deal_staff_idx (staff_id ASC) VISIBLE,
    INDEX deal_deal_status_idx (deal_status_id ASC) VISIBLE,
    CONSTRAINT deal_order
        FOREIGN KEY (order_id)
            REFERENCES geek_crm_db.order (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT deal_staff
        FOREIGN KEY (staff_id)
            REFERENCES geek_crm_db.staff (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT deal_deal_status
        FOREIGN KEY (deal_status_id)
            REFERENCES geek_crm_db.deal_status (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);