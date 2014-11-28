CREATE TABLE campaigns(
	title VARCHAR(100),
	id SERIAL,
	PRIMARY KEY(id)
	
) ENGINE=innoDB; 

CREATE TABLE docs (
	href VARCHAR(500),
	text VARCHAR(500),
	creator VARCHAR(100),
	id SERIAL,
	campaignId BIGINT UNSIGNED,
	ext VARCHAR(10),
	PRIMARY KEY (id),
	FOREIGN KEY (campaignId) REFERENCES campaigns(id) ON DELETE CASCADE
	
) ENGINE=innoDB;


CREATE TABLE users(
	UID                 BIGINT unsigned,
	username			VARCHAR(35),
	lastName 			VARCHAR(35) NOT NULL default '',
	firstName 			VARCHAR(35) NOT NULL default '',
	password            VARCHAR(200),
	role                enum('admin','user') NOT NULL DEFAULT 'admin',
	PRIMARY KEY (UID)
) ENGINE=innoDB;