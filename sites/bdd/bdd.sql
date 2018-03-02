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
  `id_editeur` INT (11) KEY,
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
-- Structure de la table editeur
--

DROP TABLE IF EXISTS `editeur`;
CREATE TABLE IF NOT EXISTS `editeur` (
  `id_editeur`INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,
  `nom` VARCHAR(144) NOT NULL,
  -- clé étrangère
  `id_collection` INT (11) KEY
)
  ENGINE=InnoDB DEFAULT CHARSET utf8
  COMMENT='Table recenscent tout les editeurs de la base';
