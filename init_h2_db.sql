DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id`          INT(11)   NOT NULL AUTO_INCREMENT,
  `name`        TEXT,
  `data`        MEDIUMTEXT,
  `adding_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);
INSERT INTO NOTES VALUES (DEFAULT, 'Sample note', 'This is the simple note', NOW());
DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS (
  `id`              INT(11)      NOT NULL           AUTO_INCREMENT,
  `name`            VARCHAR(32)                     DEFAULT NULL,
  `password`        VARCHAR(256) NOT NULL,
  `email`           VARCHAR(128) NOT NULL,
  `confirmed_email` BOOL         NOT NULL           DEFAULT FALSE,
  `join_date`       TIMESTAMP                       DEFAULT CURRENT_TIMESTAMP,
  `role`            INT(11),
  PRIMARY KEY (`id`),
  UNIQUE (`name`)
);
INSERT INTO USERS VALUES (DEFAULT, 'admin', '$2a$10$RQxTbpMdFJAKU.p4AuG4xOaLPIeI94xUKgpQp9S2FRmI7JpDiULcS', 'samplemail@yahoo.com', 'false', now(), NULL);

# 03.06.2017

ALTER TABLE PUBLIC.NOTES
  ADD AUTHOR INT NULL;
ALTER TABLE PUBLIC.NOTES
  ADD CONSTRAINT NOTES_USERS_ID_fk
FOREIGN KEY (AUTHOR) REFERENCES PUBLIC.USERS (ID);
UPDATE PUBLIC.NOTES
SET AUTHOR = 1
WHERE ID = 1;

# 09.07.2017

CREATE TABLE ROLES (
  `id`   INT(11)     NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(32) NOT NULL
);

INSERT INTO ROLES (name) VALUES ('ADMIN');
INSERT INTO ROLES (name) VALUES ('USER');

ALTER TABLE PUBLIC.USERS
  ADD CONSTRAINT USERS_ROLES_ID_fk
FOREIGN KEY (ROLE) REFERENCES PUBLIC.ROLES (ID)
  ON DELETE SET NULL
  ON UPDATE SET NULL;

UPDATE PUBLIC.USERS
SET ROLE = 1
WHERE ID = 1;