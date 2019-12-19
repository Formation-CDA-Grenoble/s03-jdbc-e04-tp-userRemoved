# Travaux pratiques - Java JDBC
 
## Première partie: conceptualisation de base de données

Un client t'a contacté pour te demander de réaliser un jeu de questions/réponses en ligne. Il a été assez vague dans sa description du produit, mais fort heureusement, il est au taquet sur la norme UML, et il t'a fourni le **modèle conceptuel de données (MCD)** suivant: https://www.lucidchart.com/invitations/accept/32400412-e64d-4f49-84ae-e5a2e5a3796e, accompagné de quelques annotations:

- **User**: les membres inscrits à l'application.
- **Quiz**: les différents questionnaires.
- **Question**: les questions posées dans les questionnaires.
- **Answer**: les différentes réponses possibles aux questions.
- **Tag**: des catégories décrivant les questionnaires (animaux, sciences, histoire, etc.).
- **QuizResult**: les résultats obtenus par les joueurs à chaque questionnaire.

En observant le diagramme, réponds aux questions suivantes. Tu dois créer un fichier **quiz.md** dans ton dépôt, et écrire les réponses à chaque question en _Markdown_ dedans.

1. Combien de colonnes aura la table **question** en base de données? Donne le nom de chacune de ces colonnes.
2. Quelle fonctionnalité de l'application est décrite par la relation **Quiz** _written by_ **User**? Essaie d'exprimer cette fonctionnalité sous la forme d'une _user story_ ("en tant que ..., j'ai besoin de ... afin de ...").
3. La relation **Quiz** _written by_ **User** a un losange blanc, alors que la relation **Question** _belongs to_ **Quiz** a un losange noir. Peux-tu expliquer la différence entre ces deux relations?
4. Combien de question peut-il y avoir dans un questionnaire (minimum et maximum)?
5. Combien de réponses chaque question peut-elle avoir (minimum et maximum)?
6. Que se passe-t-il si je supprime une question?
7. Que se passe-t-il si je supprime un utilisateur?
8. Comment pourrons-nous coder la relation **Tag** _describes_ **Quiz** dans notre base de données?
9. Combien de clés étrangères la table **Quiz** possède-t-elle? Nomme chacune de ces clés.
10. Pourquoi y a-t-il deux relations entre **Answer** et **Question**?
11. Peux-tu expliquer pourquoi la classe **QuizResult** se trouve entre les classes **User** et **Quiz**?
12. Si un utilisateur souhaite tenter à nouveau un questionnaire, est-il prévu qu'il puisse voir à quelles questions il avait bien répondu précédemment? Si oui, où peut-on le voir sur le diagramme? Si non, que faudrait-il rajouter sur le diagramme pour pouvoir l'exprimer?

## Deuxième partie: création de base de données

Réalise à l'aide de PHPMyAdmin une base de données **exercice_quiz** qui corresponde aux spécifications données par le MCD fourni à la partie précédente. Ta base de données devra contenir:

- Toutes les tables nécessaires (qu'elles soient ou non écrites sur le diagramme).
- Toutes les colonnes nécessaires dans chaque table.
- Les contraintes de clés étrangères nécessaires.

Lorsque tu as terminé, utilise la fonction **Export** de PHPMyAdmin, ajoute le fichier .sql ainsi obtenu dans ton dépôt et fais un _commit_. Si tu souhaites compléter ta base de données plus tard, n'oublie pas que tu peux toujours refaire un export et un _commit_ du nouveau fichier!

## Troisième partie: exploitation d'une base de données en Java

Dans cette partie, nous allons travailler sur la base de données **shop**, à partir du fichier **shop.sql** fourni. Commence par importer ce fichier dans PHPMyAdmin. N'oublie pas de télécharger le driver de MariaDB pour Java à cette adresse: https://downloads.mariadb.com/Connectors/java/connector-java-2.5.2/mariadb-java-client-2.5.2.jar, et de le ranger dans un dossier **lib**.

### 1. Quelques requêtes SQL pour se mettre en jambe

A l'aide de la classe DBManager fournie, écris les requêtes SQL qui permettent de répondre à ces questions:

- Quelles sont les marques enregistrées dans notre base de données?
- Combien y a-t-il de produits de la marque Nokia?
- Geneviève a-t-elle déjà passé une commande?
- Quelle est l'adresse de livraison de Stéphanie?
- Quelles est la commande passée la plus récemment?
- Combien d'articles y a-t-il dans la commande passée par Jean-Pierre?
- Quel article a commandé Michel dans sa dernière commande?

### 2. Un modèle pour nos commandes

Nous avons besoin d'une classe **Order** pour gérer nos commandes en Java. Crée un fichier **Order.java** pour cela.

Pour commencer, définis ses propriétés en t'inspirant des colonnes de la table **_order**.

### 3. Initialisons nos commandes

Maintenant, crée un constructeur qui va permettre d'intialiser ces propriétés.

### 4. Instancions une commande à partir de la base de données

Nous allons maintenant créer une méthode qui va nous permettre d'aller chercher un enregistrement de la table **_order** et d'en faire un objet de classe **Order**.

Dans la classe **Order**, crée une méthode **find** répondant aux spécifications suivantes:

- Elle doit être **statique** et **publique**.
- **ENTREE**: un nombre entier représentant l'_id_ de l'enregistrement désiré.
- **SORTIE**: une instance de **Order**, initialisée avec les propriétés lues en base de données.

### 5. Allons chercher le client qui a passé la commande

Crée une classe **User** avec un constructeur permettant d'initialiser ses propriétés. Puis, dans la classe **Order**, crée une méthode **getUser** répondant aux spécifications suivantes:

- **ENTREE**: aucune.
- **SORTIE**: une instance de **User**, initialisée avec les propriétés de l'utilisateur référencé par la colonne **user_id** de notre commande.

#### Bonus

Faire la même chose avec l'adresse de livraison de la commande.

### 6. Allons chercher les articles de la commande

Créer une classe **Product** avec un constructeur permettant d'initialiser ses propriétés. Puis, dans la classe **Order**, crée une méthode **getProducts** répondant aux spécifications suivantes:

- **ENTREE**: aucune.
- **SORTIE**: un tableau ou une liste d'instances de **Product**, initialisées avec les propriétés des produits associés à la commande via la table intermédiaire **products_in_orders**.

#### Bonus

Essaie de coder les relations d'autres classes sur ce modèle.

#### Super Bonus

Essaie de coder une méthode permettant à chaque classe de se sauvegarder en base de données, et une autre lui permettant de se supprimer.

#### Super Bonus de la mort

Réfléchis à comment on pourrait créer une classe **AbstractModel** dont hériteraient toutes nos classes représentant des entités en base de données. **AbstractModel** contiendrait une fois pour toutes le code nécessaire pour faire les opérations décrites ci-dessus, et il ne serait pas nécessaire de l'écrire individuellement dans chaque classe.
