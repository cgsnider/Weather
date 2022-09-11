USE Social_Forcasts;

DROP PROCEDURE IF EXISTS add_forcast;
DELIMITER //
CREATE PROCEDURE add_forcast (
	IN i_main VARCHAR(20),
    IN i_feels_like int
) BEGIN 

	INSERT INTO FORCASTS (Main, FeelsLike) VALUES (i_main, i_feels_like);
    SELECT * FROM FORCASTS;
	
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS get_recent;
DELIMITER //
CREATE PROCEDURE get_recent () BEGIN 

	SELECT * FROM FORCASTS WHERE PostDate in (SELECT MAX(PostDate) FROM FORCASTS);
	
END //
DELIMITER ;


