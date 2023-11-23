DROP DATABASE IF EXISTS exo_contacts;
CREATE DATABASE exo_contacts CHARACTER SET = 'utf8' COLLATE = 'utf8_general_ci';

USE exo_contacts;

CREATE TABLE pays (
    iso_3 VARCHAR(3) PRIMARY KEY,
    nom VARCHAR(70),
    iso_2 VARCHAR(2),
    nationalite VARCHAR(50)
);

INSERT INTO pays (iso_3, nom, iso_2, nationalite) VALUES
-- Europe
("FRA", "France", "FR", "Français"),
("ESP", "Espagne", "ES", "Espagnol"),
("DEU", "Allemagne", "DE", "Allemand"),
("BEL", "Belgique", "BE", "Belge"),

-- Amérique
("ARG", "Argentine", "AR", "Argentin"),
("BRA", "Brésil", "BR", "Brésilien"),
("USA", "États-Unis", "US", "Américain"),

-- Asie
("KOR", "Corée du Sud", "KR", "Coréen"),
("AFG", "Afghanistan", "AF", "Afghan"),

-- Afrique
("DZA", "Algérie", "DZ", "Algérien"),
("AGO", "Angola", "AO", "Angolais"),
("EGY", "Égypte", "EG", "Égyptien"),

-- Océanie
("AUS", "Australie", "AU", "Australien"),
("FJI", "Fidji", "FJ", "Fidjien"),
("NCL", "Nouvelle-Calédonie", "NC", "Calédonien");

CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(70),
    prenom VARCHAR(70),
    date_de_naissance DATE,
    sexe VARCHAR(10),
    adresse TEXT,
    cp VARCHAR(10),
    ville VARCHAR(70),
    pays_iso_3 VARCHAR(3),
    FOREIGN KEY (pays_iso_3) REFERENCES pays(iso_3)
);

INSERT INTO contacts (nom, prenom, date_de_naissance, sexe, adresse, cp, ville, pays_iso_3) VALUES
('Nganoure', 'Francis', '2001-01-26', 'Homme', '123 Rue de la Paix', '75001', 'Paris', 'FRA'),
('Blanc', 'Sabrina', '1985-04-26', 'Femme', '456 Avenue du Bonheur', '1000', 'Bruxelles', 'BEL'),
('Snow', 'John', '1983-02-27', 'Homme', '651 Main Street', '10001', 'New York', 'USA'),
('García', 'Lea', '2006-07-30', 'Femme', '752 Calle Principal', '28001', 'Madrid', 'ESP'),
('Salade', 'Mohamed', '1978-11-07', 'Homme', '7 Place de la République Abdeen', '10115', 'Le Caire', 'EGY'),
('Sung', 'Jin-Woo', '1998-05-14', 'Homme', '567 Gangnam-gu', '04523', 'Séoul', 'KOR');

CREATE TABLE telephone (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_contact INT,
    FOREIGN KEY (id_contact) REFERENCES contacts(id),
    numero VARCHAR(50),
    type TINYINT
);

INSERT INTO telephone (id_contact, numero, type) VALUES
(1,'+33615678234', 1),
(2,'+3224921234', 2),   
(3,'+12345678910', 1),  
(4,'+34562754321', 2),  
(5,'+2023907754', 1), 
(6,'+82245349878', 2);
