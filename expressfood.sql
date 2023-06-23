
CREATE TABLE adresse (
                IDadresse INT AUTO_INCREMENT NOT NULL,
                rue VARCHAR(100) NOT NULL,
                complement_adresse VARCHAR(255),
                code_postal NUMERIC(5) NOT NULL,
                ville VARCHAR(100) NOT NULL,
                PRIMARY KEY (IDadresse)
);


CREATE INDEX ville_idx
 ON adresse
 ( code_postal, ville );

CREATE TABLE produit (
                IDproduit INT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                type BOOLEAN NOT NULL,
                descreptif VARCHAR(1000) NOT NULL,
                date_publication DATE NOT NULL,
                prix DECIMAL(10,4) NOT NULL,
                PRIMARY KEY (IDproduit)
);


CREATE TABLE utilisateur (
                IDuser INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                email VARCHAR(100) NOT NULL,
                telephone VARCHAR(30) NOT NULL,
                adresse_id INT NOT NULL,
                PRIMARY KEY (IDuser)
);


CREATE TABLE panier (
                IDpanier INT AUTO_INCREMENT NOT NULL,
                produit_id INT NOT NULL,
                utilisateur_id INT NOT NULL,
                quantite INT NOT NULL,
                PRIMARY KEY (IDpanier)
);


CREATE TABLE commande (
                IDcommande INT NOT NULL,
                utilisateur_id INT NOT NULL,
                panier_id INT NOT NULL,
                adresse_id INT NOT NULL,
                date DATE NOT NULL,
                total DECIMAL(9,4) NOT NULL,
                PRIMARY KEY (IDcommande)
);


CREATE TABLE livreur (
                IDlivreur VARCHAR AUTO_INCREMENT NOT NULL,
                commande_id INT NOT NULL,
                longitude INT NOT NULL,
                latitude INT NOT NULL,
                statut BOOLEAN NOT NULL,
                PRIMARY KEY (IDlivreur, commande_id)
);


ALTER TABLE commande ADD CONSTRAINT adresse_commande_fk
FOREIGN KEY (adresse_id)
REFERENCES adresse (IDadresse)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE utilisateur ADD CONSTRAINT adresse_utilisateur_fk
FOREIGN KEY (adresse_id)
REFERENCES adresse (IDadresse)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE panier ADD CONSTRAINT produit_panier_fk
FOREIGN KEY (produit_id)
REFERENCES produit (IDproduit)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commande ADD CONSTRAINT utilisateur_commande_fk
FOREIGN KEY (utilisateur_id)
REFERENCES utilisateur (IDuser)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE panier ADD CONSTRAINT utilisateur_panier_fk
FOREIGN KEY (utilisateur_id)
REFERENCES utilisateur (IDuser)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commande ADD CONSTRAINT panier_commande_fk
FOREIGN KEY (panier_id)
REFERENCES panier (IDpanier)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE livreur ADD CONSTRAINT commande_livreur_fk
FOREIGN KEY (commande_id)
REFERENCES commande (IDcommande)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
