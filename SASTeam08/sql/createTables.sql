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