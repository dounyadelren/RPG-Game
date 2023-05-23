# Projet RPG RoR

## Installation

- Git clone le projet
- cd /api
- bundle install (pour installer les gems ton npm install)
- rails db:migrate (sert à créer les tables dans la base de données)
- rails db:seed (sert à set à la main les données contenue dans le fichier db/seeds.rb)
- rails s (pour lancer le serveur)

<p>Autre possibilité</p>

- rails c permettant d'utiliser du sql dans le terminal rails

<i>Exemple d'utilisation : </i>

- 3.0.0 :002 > SecretMenuItem.all

## Création nouveau model/controller/Migration

rails g resource Nom_Du_Model

<i>Exemple d'utilisation : </i>

<pre>
rails g resource Secret_menu_item

      invoke  active_record
      create    db/migrate/20221212094645_create_secret_menu_items.rb
      create    app/models/secret_menu_item.rb
      invoke    test_unit
      create      test/models/secret_menu_item_test.rb
      create      test/fixtures/secret_menu_items.yml
      invoke  controller
      create    app/controllers/secret_menu_items_controller.rb
      invoke    test_unit
      create      test/controllers/secret_menu_items_controller_test.rb
      invoke  resource_route
       route    resources :secret_menu_items

rails db:migrate

        == 20221212094645 CreateSecretMenuItems: migrating ============================
        -- create_table(:secret_menu_items)
        -> 0.0008s
        == 20221212094645 CreateSecretMenuItems: migrated (0.0008s) ===================

rails db:seed <i>(uniquement si tu rentres des valeurs à la main dans le fichier que j'ai noté plus haut à côté de cette commande)</i>
</pre>

## Routes API

### Players

- création d'un utilisateur : POST /players
- connexion d'un utilisateur : POST /players/login
- récupération de tout les utilisateurs : GET /players
- récupération d'un utilisateur : GET /players/:id
- suppression d'un utilisateur : DELETE /players/:id
- modification d'un utilisateur : PUT /players/update

### Characters

- création d'un personnage : POST /characters/create
- suppression d'un personnage : DELETE /characters/:id
- récupération de tout les personnages : GET /characters
- récupération des personnages du player : GET /characters/player/:id
- augmentation des stats PV : PUT /characters/updatePV
- augmentation des stats STR : PUT /characters/updateSTR
- augmentation de l'expérience : PUT /characters/updateXP
- choisir un personnage en jeu : POST /characters/choose
- acceper une quête : POST /characters/acceptQuest


### Inventories

- récupération de tout les inventaires : GET /inventories
- ajouter un item dans l'inventaire : POST /inventories/addItem
- supprimer un item dans l'inventaire : POST /inventories/deleteItem
- ajouter de l'argent dans l'inventaire : POST /inventories/addGold

### Items

- récupération de tout les items : GET /items
- création d'un item : POST /items/create
- achat d'un item : POST /items/buy
- vente d'un item : POST /items/sell
- destruction d'un item : POST /items/destroy

### Quests

- récupération de toute les quêtes : GET /quests
- récupération d'une quête : GET /quests/:id
- création d'une quête : POST /quests/create
- suppression d'une quête : DELETE /quests/:id
- update d'une quête : PUT /quests/:id