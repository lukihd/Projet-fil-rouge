#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: editeur
#------------------------------------------------------------

CREATE TABLE editeur(
        id_editeur Int NOT NULL ,
        nom        Varchar (144) NOT NULL ,
        PRIMARY KEY (id_editeur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: collection
#------------------------------------------------------------

CREATE TABLE collection(
        id_collection Int NOT NULL ,
        nom           Varchar (144) NOT NULL ,
        id_editeur    Int NOT NULL ,
        PRIMARY KEY (id_collection )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: livre
#------------------------------------------------------------

CREATE TABLE livre(
        id_livre      Int NOT NULL ,
        ISBN          Varchar (17) NOT NULL ,
        parution      Date NOT NULL ,
        titre         Varchar (144) NOT NULL ,
        tome          Int NOT NULL ,
        page          Int NOT NULL ,
        dimension     Varchar (20) NOT NULL ,
        id_collection Int NOT NULL ,
        id_langue     Int NOT NULL ,
        id_support    Int NOT NULL ,
        id_genre      Int NOT NULL ,
        id_origine    Int NOT NULL ,
        id_type       Int NOT NULL ,
        PRIMARY KEY (id_livre ) ,
        UNIQUE (ISBN )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: langue
#------------------------------------------------------------

CREATE TABLE langue(
        id_langue Int NOT NULL ,
        langue1   Varchar (144) NOT NULL ,
        langue2   Varchar (144) NOT NULL ,
        langue3   Varchar (144) NOT NULL ,
        langue4   Varchar (144) NOT NULL ,
        langue5   Varchar (144) NOT NULL ,
        PRIMARY KEY (id_langue )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: support
#------------------------------------------------------------

CREATE TABLE support(
        id_support Int NOT NULL ,
        nom        Varchar (144) NOT NULL ,
        PRIMARY KEY (id_support )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: genre
#------------------------------------------------------------

CREATE TABLE genre(
        id_genre Int NOT NULL ,
        nom      Varchar (144) NOT NULL ,
        PRIMARY KEY (id_genre )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: origine
#------------------------------------------------------------

CREATE TABLE origine(
        id_origine Int NOT NULL ,
        nom        Varchar (144) NOT NULL ,
        PRIMARY KEY (id_origine )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: type
#------------------------------------------------------------

CREATE TABLE type(
        id_type Int NOT NULL ,
        nom     Varchar (144) NOT NULL ,
        PRIMARY KEY (id_type )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: utilisateur
#------------------------------------------------------------

CREATE TABLE utilisateur(
        id_utilisateur Int NOT NULL ,
        identifiant    Varchar (144) NOT NULL ,
        mdp            Varchar (144) NOT NULL ,
        tel            Int NOT NULL ,
        email          Varchar (144) NOT NULL ,
        nom            Varchar (144) NOT NULL ,
        prenom         Varchar (144) NOT NULL ,
        dateNaissance  Date NOT NULL ,
        admin          Int ,
        id_civilite    Int NOT NULL ,
        id_adresse     Int NOT NULL ,
        PRIMARY KEY (id_utilisateur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: emprunt
#------------------------------------------------------------

CREATE TABLE emprunt(
        id_emprunt        Int NOT NULL ,
        dateDebut_emprunt Date NOT NULL ,
        dateFin_emprunt   Date NOT NULL ,
        etat_emprunt      Varchar (144) NOT NULL ,
        id_livre          Int NOT NULL ,
        id_utilisateur    Int NOT NULL ,
        PRIMARY KEY (id_emprunt )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: civilite
#------------------------------------------------------------

CREATE TABLE civilite(
        id_civilite Int NOT NULL ,
        civilite    Varchar (144) NOT NULL ,
        sexe        Varchar (144) NOT NULL ,
        PRIMARY KEY (id_civilite )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: adresse
#------------------------------------------------------------

CREATE TABLE adresse(
        id_adresse Int NOT NULL ,
        adresse1   Varchar (144) NOT NULL ,
        adresse2   Varchar (144) NOT NULL ,
        codePostal Varchar (144) NOT NULL ,
        ville      Varchar (144) NOT NULL ,
        PRIMARY KEY (id_adresse )
)ENGINE=InnoDB;

ALTER TABLE collection ADD CONSTRAINT FK_collection_id_editeur FOREIGN KEY (id_editeur) REFERENCES editeur(id_editeur);
ALTER TABLE livre ADD CONSTRAINT FK_livre_id_collection FOREIGN KEY (id_collection) REFERENCES collection(id_collection);
ALTER TABLE livre ADD CONSTRAINT FK_livre_id_langue FOREIGN KEY (id_langue) REFERENCES langue(id_langue);
ALTER TABLE livre ADD CONSTRAINT FK_livre_id_support FOREIGN KEY (id_support) REFERENCES support(id_support);
ALTER TABLE livre ADD CONSTRAINT FK_livre_id_genre FOREIGN KEY (id_genre) REFERENCES genre(id_genre);
ALTER TABLE livre ADD CONSTRAINT FK_livre_id_origine FOREIGN KEY (id_origine) REFERENCES origine(id_origine);
ALTER TABLE livre ADD CONSTRAINT FK_livre_id_type FOREIGN KEY (id_type) REFERENCES type(id_type);
ALTER TABLE utilisateur ADD CONSTRAINT FK_utilisateur_id_civilite FOREIGN KEY (id_civilite) REFERENCES civilite(id_civilite);
ALTER TABLE utilisateur ADD CONSTRAINT FK_utilisateur_id_adresse FOREIGN KEY (id_adresse) REFERENCES adresse(id_adresse);
ALTER TABLE emprunt ADD CONSTRAINT FK_emprunt_id_livre FOREIGN KEY (id_livre) REFERENCES livre(id_livre);
ALTER TABLE emprunt ADD CONSTRAINT FK_emprunt_id_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur);
