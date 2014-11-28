INSERT INTO campaigns(
	title
) VALUES (
	"2014 Christmas - Canned Food Drive"
);

INSERT INTO campaigns(
	title
) VALUES (
	"Creative Thanksgiving"
);

INSERT INTO campaigns(
	title
) VALUES (
	"End of Summer BBQ"
);

INSERT INTO campaigns(
	title
) VALUES (
	"Fall, All Things Pumpkin"
);

INSERT INTO docs (
	href,
	text,
	creator,
	campaignId,
	ext
) VALUES (
	"uploads/img1.png",
	"A photo to test the database...",
	"Taylor Deckard",
	1,
	"png"
) , (
	"uploads/img2.png",
	"Social Media Channel",
	"Franklin Tort",
	1,
	"png"
) , (
	"uploads/img3.png",
	"Customer Output",
	"Franklin Tort",
	1,
	"png"
) , (
	"uploads/img4.png",
	"Can Food Sale Increase",
	"Cynthia Peters",
	1,
	"png"
) , (
	"uploads/img5.png",
	"National Response",
	"Franklin Tort",
	1,
	"png"
) , (
	"uploads/img6.png",
	"Social Media Channel",
	"Franklin Tort",
	1,
	"png"
) , (
	"uploads/tg1.jpg",
	"A Delicious Feast",
	"Joan Montrazuma",
	2,
	"jpg"
) , (
	"uploads/tg2.gif",
	"Happy Turkey",
	"Bradley Cooper",
	2,
	"gif"
) , (
	"uploads/tg3.jpg",
	"Seasonal Cards",
	"Alice Enchaynes",
	2,
	"jpg"
);

INSERT INTO users (UID, username, lastName, firstName, password, role) 
VALUES
(1, 'tdeckard', 'Deckard', 'Taylor', 'password', 'admin'),
(2, 'jsuttles', 'Suttles', 'Jason', 'password', 'admin'),
(3, 'ftort', 'Tort', 'Franklin', 'password', 'user'),
(4, 'jmontrazuma', 'Montrazuma', 'Joan', 'password', 'user'),
(5, 'bcooper', 'Cooper', 'Bradley', 'password', 'user'),
(6, 'aenchaynes', 'Enchaynes', 'Alice', 'password', 'user'),
(7, 'cpeters', 'Peters', 'Cynthia', 'password', 'user'),
(8, 'bglass', 'Glass', 'Becky', 'password', 'user'),
(9, 'mcasey', 'Casey', 'Matt', 'password', 'user'),
(10, 'rpepper', 'Pepper', 'Ralph', 'password', 'user');