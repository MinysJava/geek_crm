USE geek_crm_db;

DROP TABLE IF EXISTS staff cascade;

CREATE TABLE staff
(
    id            INT          NOT NULL,
    first_name    VARCHAR(256) NULL,
    last_name     VARCHAR(256) NULL,
    department_id INT          NULL,
    position      VARCHAR(256) NULL,
    phone         VARCHAR(45)  NULL,
    email         VARCHAR(128) NULL,
    birth_date    DATE         NULL,
    PRIMARY KEY (id),
    INDEX staff_department_idx (department_id ASC) VISIBLE,
    CONSTRAINT staff_department
        FOREIGN KEY (department_id)
            REFERENCES geek_crm_db.department (id)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);

ALTER TABLE department
    ADD INDEX department_staff_idx (manager_id ASC) VISIBLE;
;
ALTER TABLE department
    ADD CONSTRAINT department_staff
        FOREIGN KEY (manager_id)
            REFERENCES staff (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;
