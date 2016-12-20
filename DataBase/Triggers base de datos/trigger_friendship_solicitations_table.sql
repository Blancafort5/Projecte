CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`Friendship_Solicitations_AFTER_UPDATE` AFTER UPDATE ON `Friendship_Solicitations` FOR EACH ROW
BEGIN

DECLARE accepted int;
DECLARE user1 int;
DECLARE user2 int;

SELECT friendship_solicitations_received_accepted FROM Friendship_Solicitations INTO accepted;
SELECT Users_users_id_send FROM Friendship_Solicitations INTO user1;
SELECT Users_users_id_receive FROM Friendship_Solicitations INTO user2;

IF accepted = 1 THEN 
INSERT INTO Friends (Users_users_id_user,Users_users_id_user1) VALUES(user1,user2),(user2,user1);
END IF;
END