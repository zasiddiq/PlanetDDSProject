DROP DATABASE IF EXISTS planetdds;
CREATE DATABASE planetdds;
USE planetdds;

CREATE TABLE patient (
	id integer NOT NULL AUTO_INCREMENT,
	firstName varchar( 50 ) NOT NULL DEFAULT '',
	lastName varchar( 50 ) NOT NULL DEFAULT '',
	address varchar( 200 ) NOT NULL DEFAULT '',
	email varchar( 50 ) NOT NULL DEFAULT '',
	PRIMARY KEY( id )
);

CREATE TABLE dentist (
	firstName varchar( 50 ) NOT NULL DEFAULT '',
	lastName varchar( 50 ) NOT NULL DEFAULT '',
	username varchar( 50 ) NOT NULL DEFAULT '',
	password varchar( 100 ) NOT NULL DEFAULT '',
	PRIMARY KEY( username )
);
