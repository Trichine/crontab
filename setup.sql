-- setup.sql
USE badass;

CREATE TABLE example_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO example_table (name) VALUES
    ('Data 1'),
    ('Data 2'),
    ('Data 3');

-- Ajouter les droits pour l'utilisateur Yan
GRANT ALL PRIVILEGES ON *.* TO 'Yan'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;