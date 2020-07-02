sudo mysql
CREATE USER 'gitea'@'localhost' IDENTIFIED BY 'gitea';                                                                                                                                                                                                
GRANT ALL PRIVILEGES ON * . * TO 'gitea'@'localhost';                                                                                                                                                                                                
FLUSH PRIVILEGES;                                                                                                                                                                                               
SHOW GRANTS FOR 'gitea'@'localhost';                                                                                                                                                                                                                                                                                                                                                                                             
EXIT
mysql -u gitea -pgitea
CREATE DATABASE gitea;
EXIT
