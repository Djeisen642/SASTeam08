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
	"../uploads/img1.png",
	"A photo to test the database...",
	"Taylor Deckard",
	1,
	"png"
) , (
	"../uploads/img2.png",
	"Social Media Channel",
	"Franklin Tort",
	1,
	"png"
) , (
	"../uploads/img3.png",
	"Customer Output",
	"Franklin Tort",
	1,
	"png"
) , (
	"../uploads/img4.png",
	"Can Food Sale Increase",
	"Cynthia Peters",
	1,
	"png"
) , (
	"../uploads/img5.png",
	"National Response",
	"Franklin Tort",
	1,
	"png"
) , (
	"../uploads/img6.png",
	"Social Media Channel",
	"Franklin Tort",
	1,
	"png"
) , (
	"../uploads/tg1.jpg",
	"A Delicious Feast",
	"Joan Montrazuma",
	2,
	"jpg"
) , (
	"../uploads/tg2.gif",
	"Happy Turkey",
	"Bradley Cooper",
	2,
	"gif"
) , (
	"../uploads/tg3.jpg",
	"Seasonal Cards",
	"Alice Enchaynes",
	2,
	"jpg"
);

INSERT INTO users (username, lastName, firstName, password, avatar, role) 
VALUES
('tdeckard', 'Deckard', 'Taylor', 'password', '/SASTeam08/images/chatAvatarBlack.png', 'admin'),
('jsuttles', 'Suttles', 'Jason', 'password', '/SASTeam08/images/chatAvatarGreen.png', 'admin'),
('ftort', 'Tort', 'Franklin', 'password', '/SASTeam08/images/chatAvatarYellow.png', 'user'),
('jmontrazuma', 'Montrazuma', 'Joan', 'password', '/SASTeam08/images/chatAvatarOrange.png', 'user'),
('bcooper', 'Cooper', 'Bradley', 'password', '/SASTeam08/images/chatAvatarRed.png', 'user'),
('aenchaynes', 'Enchaynes', 'Alice', 'password', '/SASTeam08/images/chatAvatarPurple.png', 'user'),
('cpeters', 'Peters', 'Cynthia', 'password', '/SASTeam08/images/chatAvatarBlue.png', 'user'),
('bglass', 'Glass', 'Becky', 'password', '/SASTeam08/images/chatAvatarBlue.png', 'user'),
('mcasey', 'Casey', 'Matt', 'password', '/SASTeam08/images/chatAvatarBlue.png', 'user'),
('rpepper', 'Pepper', 'Ralph', 'password', '/SASTeam08/images/chatAvatarBlue.png', 'user');


INSERT INTO imageComments (docId, comment, usersName, xPos, yPos) VALUES
( 1, 'wow this is an awesome tree!', 'Taylor Deckard', 38.46153846153846, 56.024096385542165),
( 1, 'remove these sheep. thanks!', 'Taylor Deckard', 78.8981288981289, 61.295180722891565),
( 1, 'sweet branches!', 'Taylor Deckard', 49.34782608695652, 27.2);