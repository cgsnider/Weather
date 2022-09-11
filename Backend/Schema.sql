
DROP DATABASE IF EXISTS Social_Forcasts;
CREATE DATABASE Social_Forcasts;
USE Social_Forcasts;

CREATE TABLE FORCASTS(
	PostDate DATETIME DEFAULT now(),
    Main VARCHAR(30),
    FeelsLike INT,
    PRIMARY KEY(PostDate)
);
