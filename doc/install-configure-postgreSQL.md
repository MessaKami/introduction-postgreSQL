# Guide d'Installation et de Configuration de PostgreSQL sur Linux Mint

Ce guide explique comment installer PostgreSQL, créer un utilisateur et une base de données, et configurer quelques options importantes pour bien démarrer avec PostgreSQL.

## 1. Installation de PostgreSQL

1. **Mettre à jour les dépôts** :
   ```bash
   sudo apt update
   ``` 

# Démarrer le serveur  postgres

``` sudo systemctl start postgresql.service ```

# Se connecter au PostgreSQL account

``` sudo -i -u postgres ```

# Se connecter au prompt PostgreSQL

``` postgres@messa-Sabre-15KV8:~$ psql ```

# Se connecter au prompt PostgreSQL avec pgcli 

``` postgres@messa-Sabre-15KV8:~$ pgcli -p 5433 ```

# Créer un role avec les permissions 

``` CREATE ROLE formateur;```

# Créer un rôle avec les droits de connexion

``` CREATE ROLE formateur LOGIN PASSWORD 'root';```

# Modifier un rôle 

``` ALTER ROLE formateur```

# Supprimer un rôle 

``` DROP ROLE formateur ```

# Créer un utilisateur sans mot de passe

``` CREATE USER messa;```

# Créer un utilisateur avec un mot de passe 

``` CREATE USER messa WITH PASSWORD 'ton_mot_de_passe';```

# Modifier le mot de passe d'un utilisateur 

``` ALTER USER messa WITH PASSWORD 'ton_new_mdp';```

# Modifier le nom d'un user 

``` ALTER USER messa RENAME TO messakami; ```;

# Supprimer un utilisateur 

``` DROP USER messa; ```

# Créer une bdd

``` CREATE DATABASE cefil; ```

# Supprimer une BDD 

``` DROP DATABASE cefil; ```

# Attribuer le role à l'utilisateur 

``` GRANT superuser TO messa; ```


# Pour se connecter avec l’utilisateur daminoux et que l’on vous demande le mot de passe:


```psql -U messa -W```

Résultat:

messa=> (signifie la connexion de l'utilisateur dans la BDD)


# Pour se connecter sur une base directement:

```psql messa```

Résultat: 

messa=# (signigie que je suis connecté dans la bdd sans User)

# Pour se connecter avec l'utilisateur et la base de données concerné avec le mot de pass

```psql -U messa -d CEFIL -W ```

Résultat: 

cefil=> (signifie que l'utilisateur messa et dans la BDD cefil)


# Pour se connecter avec postgres sur la bdd cefil, le port 5433 et le mot de passe avec pgcli 

``` pgcli -U postgres -d cefil -p 5433 -W ```

# Si je ne suis pas owner de la DB, je n'ai pas les permissions pour créer des tables


##  Droits sur les bases de données

# Droit sur la connexion de bb   
``` CREATE ROLE formateur WITH LOGIN ```

# Droit sur la création de Table, séquences, Colonnes

```GRANT CREATE ON DATABASE nom_base TO utilisateur;```

# Propriétaire de la BDD pour avoir tout les droits; 

``` ALTER DATABASE cefil OWNER TO messa; ```


# CREATION DE TABLE 

``` CREATE TABLE users(); ```

# RENOMMAGE DE TABLE 

``` ALTER TABLE users RENAME TO yafoi;```




\l = liste des bases
\d = liste des tables
\du = liste des utilisateurs
\dn+ = lister les schemas et les droits
\q = quitter
\h = aide
USE labase = pour se connecter sur la base
\c labase = pour se connecter sur la base
SELECT version(); = version PostgreSQL
SELECT current_date; = date actuelle




DCL 
DDL
DML
DQL


# Enlever un rôle pour un utilisateur 
``` REVOKE superuser FROM messa; ```


Une clé primaire c'est un évenement unique, deux même valeur ne peuvent pas avoir le même nom de clé primaire

Le fait de mettre un index et d'optimiser les recherches sur des requetes de recherche qu'on va utiliser souvent (permettre d'améliorer les perfs)
Attention plus on met d'index plus de l'espace disque est pris donc pas mettre des index n'importe où
Par défaut lorsque qu'on crée une clé primaire ca va indexer la valeur 

Clé Secondaire

id.role REFERENCES nomTable (champs)
ou 
FOREIGN KAY id.role REFERENCES nomTable (champs);