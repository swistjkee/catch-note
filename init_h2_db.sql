DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `data` mediumtext,
  `adding_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);
INSERT INTO NOTES VALUES (DEFAULT ,'Sample note','This is the simple note',NOW());
DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(128) NOT NULL,
  `confirmed_email` BOOL NOT NULL DEFAULT false,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO USERS VALUES (DEFAULT,'admin','root','samplemail@yahoo.com','false',now(),null);

# 03.06.2017

ALTER TABLE PUBLIC.NOTES
  ADD AUTHOR INT NULL;
ALTER TABLE PUBLIC.NOTES
  ADD CONSTRAINT NOTES_USERS_ID_fk
FOREIGN KEY (AUTHOR) REFERENCES PUBLIC.USERS (ID);
UPDATE PUBLIC.NOTES
SET AUTHOR = 1
WHERE ID = 1;