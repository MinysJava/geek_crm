USE geek_crm_db;

# Address parts for normalisation

DROP TABLE IF EXISTS short_address cascade;

CREATE TABLE short_address
(
    id      INT           NOT NULL,
    address VARCHAR(4096) NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS city cascade;

CREATE TABLE city
(
    id    INT          NOT NULL,
    title VARCHAR(256) NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS region cascade;

CREATE TABLE region
(
    id    INT          NOT NULL,
    title VARCHAR(256) NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS country cascade;

CREATE TABLE country
(
    id    INT          NOT NULL,
    title VARCHAR(256) NULL,
    PRIMARY KEY (id)
);

# Full address table

DROP TABLE IF EXISTS address;

CREATE TABLE address
(
    id               INT NOT NULL,
    country_id       INT NULL,
    region_id        INT NULL,
    city_id          INT NULL,
    short_address_id INT NULL,
    PRIMARY KEY (id),
    INDEX address_country_idx (country_id ASC) VISIBLE,
    INDEX address_region_idx (region_id ASC) VISIBLE,
    INDEX address_city_idx (city_id ASC) VISIBLE,
    INDEX address_short_address_idx (short_address_id ASC) VISIBLE,
    CONSTRAINT address_country
        FOREIGN KEY (country_id)
            REFERENCES geek_crm_db.country (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT address_region
        FOREIGN KEY (region_id)
            REFERENCES geek_crm_db.region (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT address_city
        FOREIGN KEY (city_id)
            REFERENCES geek_crm_db.city (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT address_short_address
        FOREIGN KEY (short_address_id)
            REFERENCES geek_crm_db.short_address (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);







