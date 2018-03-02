--
-- Base de données pour le site client et le site entreprise
--
-- Pour Mr Vita
-- Avant tout des standard que nous utiliserons  : 11 caractère pour les id (int), et 144 pour les Varchar par defaut, nous ne prendrons pas de Char
--
-- Table livre et Tables liés
--

-- On detruit la table déjà existante si elle est présente dans le gestionnaire de base de données
DROP TABLE IF EXISTS `livre`;
-- On crée la table si elle n'existe pas avec son contenu entre parenthèse
CREATE TABLE IF NOT EXISTS  `livre` (
  `id_livre` int (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ``
);
