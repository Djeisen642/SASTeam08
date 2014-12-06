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


CREATE TABLE users (
	UID                 SERIAL,
	username			VARCHAR(35),
	lastName 			VARCHAR(35) NOT NULL default '',
	firstName 			VARCHAR(35) NOT NULL default '',
	password            VARCHAR(200),
	avatar 				VARCHAR(500),
	role                enum('admin','user') NOT NULL DEFAULT 'admin',
	PRIMARY KEY (UID)
) ENGINE=innoDB;

CREATE TABLE chat (
	id					SERIAL,
	room				VARCHAR(500),
	message				VARCHAR(500),
	sender				VARCHAR(71),
	senderAvatar		VARCHAR(500),
	received			TIMESTAMP,
	PRIMARY KEY (id)
) ENGINE=innoDB; 

CREATE TABLE imageComments (
	id					SERIAL,
	comment				VARCHAR(500),
	usersName			VARCHAR(75),
	xPos 				DOUBLE,
	yPos				DOUBLE,
	docId               BIGINT UNSIGNED,
	PRIMARY KEY 		(id),
	FOREIGN KEY 		(docId) REFERENCES docs(id) ON DELETE CASCADE
) ENGINE=innoDB;