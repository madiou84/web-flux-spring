#!/bin/sh

# Définir les variables pour se connecter à la base de données
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="postgres"
DB_USER="root"
DB_PASSWORD="root"

# Définir le nom de la table et les colonnes
TABLE_NAME="accounts"
id="id"
ID_TYPE="SERIAL PRIMARY KEY"
NAME="name"
NAME_TYPE="TEXT"
CREATED_AT="createdAt"
CREATED_AT_TYPE="TIMESTAMP"a

# CREATE TABLE example_table (
#     id SERIAL PRIMARY KEY,
#     column1 TEXT,
#     column2 INTEGER,
#     column3 TIMESTAMP
# );

# Se connecter à la base de données et exécuter la requête pour créer la table
# psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "CREATE TABLE $TABLE_NAME ($id $ID_TYPE, $NAME $NAME_TYPE, $CREATED_AT $CREATED_AT_TYPE);"

# Vérifier que la table a été créée en listant les tables de la base de données
# psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "\dt"

psql -h localhost -p 5432 -U root -d postgres -c "CREATE TABLE accounts (id SERIAL PRIMARY KEY, name TEXT, created_at TIMESTAMP);"
psql -h localhost -p 5432 -U root -d postgres -c "\dt"
