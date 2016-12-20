CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`Games_AFTER_INSERT` AFTER INSERT ON `Games` FOR EACH ROW
BEGIN
DECLARE idgame int;
DECLARE gameName varchar(200);

SELECT games_id_game FROM Games INTO idgame;
SELECT games_name FROM Games INTO gameName;


INSERT INTO Forums (forums_title,forums_created_date,Games_games_id_game) VALUES (gameName,now(),idgame);
END