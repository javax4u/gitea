DROP USER  gitea@localhost;
CREATE USER 'gitea'@'localhost' IDENTIFIED BY 'gitea';
GRANT ALL PRIVILEGES ON * . * TO 'gitea'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'gitea'@'localhost';
CREATE DATABASE gitea;
EXIT
