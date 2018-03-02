--
-- Base de données pour le site client et le site entreprise
--
-- Pour Mr Vita
-- Avant tout des standard que nous utiliserons  : 11 caractère pour les id (int), et 144 pour les Varchar par defaut, nous ne prendrons pas de Char
--
--
-- Structuere de la Table livre
--

-- On detruit la table déjà existante si elle est présente dans le gestionnaire de base de données
DROP TABLE IF EXISTS `livre`;
-- On crée la table si elle n'existe pas avec son contenu entre parenthèse
CREATE TABLE IF NOT EXISTS  `livre` (
  -- attributs principaux de la table
  `id_livre` INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
  `ISBN` VARCHAR(17) NOT NULL UNIQUE,
  `parution` DATE NOT NULL,
  `titre` VARCHAR(144) NOT NULL,
  `tome` INT (4) NOT NULL,
  `page` INT (6) NOT NULL,
  `dimension` VARCHAR(20),
  -- attribut clé étrangères
  `id_collection` INT (11) KEY,
  `id_type` INT (11) KEY,
  `id_langue` INT (11) KEY,
  `id_support` INT (11) KEY,
  `id_genre` INT (11) KEY,
  `id_origine` INT (11) KEY
)
  -- engine est ce qui vas executer la table et permettre les relations
  ENGINE=InnoDB DEFAULT CHARSET utf8
  COMMENT='Table recenscent tout les livres de la base';

-- -------------------------------------------------------------------------

--
-- Structure de la table editeur lié aux collections
--

DROP TABLE IF EXISTS `editeur`;
CREATE TABLE IF NOT EXISTS `editeur` (
  `id_editeur`INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
  `nom` VARCHAR(144) NOT NULL
)
  ENGINE=InnoDB DEFAULT CHARSET utf8
  COMMENT='Table recenscent tout les editeurs de la base';

-- -------------------------------------------------------------------------

--
-- Structure de la table collection liée à l'éditeur
--

DROP TABLE IF EXISTS `collection`;
CREATE TABLE IF NOT EXISTS `collection` (
  `id_collection`INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
  `nom` VARCHAR(144) NOT NULL,
    -- clé étrangère
  `id_editeur` INT (11) KEY
)
  ENGINE=InnoDB DEFAULT CHARSET utf8
  COMMENT='Table recenscent tout les editeurs de la base';

-- -------------------------------------------------------------------------

--
-- Structure de la table type
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id_type`INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
  `nom` VARCHAR(144) NOT NULL
)
  ENGINE=InnoDB DEFAULT CHARSET utf8
  COMMENT='Table recenscent tout les les collections de la base reliée aux editeur du fait de leur rapport';


-- -------------------------------------------------------------------------

--
-- Structure de la table langue
--

DROP TABLE IF EXISTS `langue`;
CREATE TABLE IF NOT EXISTS `langue` (
  `id_langue`INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
  `langue1` VARCHAR(144) NOT NULL,
  `langue2` VARCHAR(144),
  `langue3` VARCHAR(144),
  `langue4` VARCHAR(144),
  `langue5` VARCHAR(144)
)
  ENGINE=InnoDB DEFAULT CHARSET utf8
  COMMENT='Table recenscent toutes les langues dispo pour le livre';

-- -------------------------------------------------------------------------

--
-- Structure de la table support
--

DROP TABLE IF EXISTS `support`;
CREATE TABLE IF NOT EXISTS `support` (
  `id_support`INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
  `nom` VARCHAR(144) NOT NULL
)
  ENGINE=InnoDB DEFAULT CHARSET utf8
  COMMENT='Table recenscent les support pour chaque livre';

-- -------------------------------------------------------------------------

--
-- Structure de la table genre
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre`INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
  `nom` VARCHAR(144) NOT NULL
)
  ENGINE=InnoDB DEFAULT CHARSET utf8
  COMMENT='Table recenscent tout les genres de livre de la base';

-- -------------------------------------------------------------------------

--
-- Structure de la table origine
--

DROP TABLE IF EXISTS `origine`;
CREATE TABLE IF NOT EXISTS `origine` (
  `id_origine`INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
  `nom` VARCHAR(144) NOT NULL
)
  ENGINE=InnoDB DEFAULT CHARSET utf8
  COMMENT='Table inscrivant l"origine du livre dans  la base';

--
-- la table utilisateur et ses tables exterieures
--
-- Structure de la table utilisateur
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
  `identifiant` VARCHAR(144) NOT NULL  UNIQUE,
  `mdp` VARCHAR(144)NOT NULL,
  `tel` INT (10) NOT NULL,
  `email` VARCHAR(144) NOT NULL,
  `nom` VARCHAR(144)NOT NULL,
  `prenom` VARCHAR(144) NOT NULL ,
  `dateNaissance` DATE NOT NULL ,
  `admin` INT(1),
  -- clé étrangère
  `id_civilite` INT(11) NOT NULL KEY,
  `id_adresse` INT(11) NOT NULL KEY
)
  ENGINE=InnoDB DEFAULT CHARSET utf8
  COMMENT='Table contenant chacun des utilsisateur enregistrés';

--
-- Structure de la table civilité
--

DROP TABLE IF EXISTS `civilite`;
CREATE TABLE IF NOT EXISTS `civilite` (
  `id_civilite` INT(1) NOT NULL PRIMARY KEY UNIQUE,
  `civilite` VARCHAR(144) NOT NULL,
  `sexe` VARCHAR(144)NOT NULL
)
  ENGINE=InnoDB DEFAULT CHARSET utf8;

--
-- Structure de la table civilité
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id_adresse` INT(1) NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
  `adresse1` VARCHAR(144) NOT NULL,
  `adresse2` VARCHAR(144)NOT NULL,
  `codePostal` VARCHAR(144)NOT NULL,
  `ville` VARCHAR(144)NOT NULL
)
  ENGINE=InnoDB DEFAULT CHARSET utf8;

