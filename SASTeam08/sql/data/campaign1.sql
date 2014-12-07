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
	"The Cover",
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
('ftort', 'Tort', 'Franklin', 'password', '/SASTeam08/images/chatAvatarYellow.png', 'admin'),
('jmontrazuma', 'Montrazuma', 'Joan', 'password', '/SASTeam08/images/chatAvatarOrange.png', 'admin'),
('bcooper', 'Cooper', 'Bradley', 'password', '/SASTeam08/images/chatAvatarRed.png', 'admin'),
('aenchaynes', 'Enchaynes', 'Alice', 'password', '/SASTeam08/images/chatAvatarPurple.png', 'admin'),
('cpeters', 'Peters', 'Cynthia', 'password', '/SASTeam08/images/chatAvatarBlue.png', 'admin'),
('bglass', 'Glass', 'Becky', 'password', '/SASTeam08/images/chatAvatarBlue.png', 'admin'),
('mcasey', 'Casey', 'Matt', 'password', '/SASTeam08/images/chatAvatarBlue.png', 'admin'),
('rpepper', 'Pepper', 'Ralph', 'password', '/SASTeam08/images/chatAvatarBlue.png', 'admin');


INSERT INTO imageComments (docId, comment, usersName, xPos, yPos) VALUES
( 1, 'wow this is an awesome tree!', 'Taylor Deckard', 38.46153846153846, 56.024096385542165),
( 1, 'Good job with these branches', 'Taylor Deckard', 49.34782608695652, 27.2);