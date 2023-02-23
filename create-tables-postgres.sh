#!/bin/bash

DB_NAME="ma_base_de_donnees"
DB_USER="utilisateur"
DB_PASSWORD="mot_de_passe"

# Vérifier si la base de données existe déjà
if psql -lqt | cut -d \| -f 1 | grep -qw $DB_NAME; then
    echo "La base de données $DB_NAME existe déjà."
else
    # Créer la base de données si elle n'existe pas
    psql -c "DO \$$
             BEGIN
             IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = '$DB_NAME') THEN
             CREATE DATABASE $DB_NAME;
             END IF;
             END\$$;"

    # Créer les tables de la base de données si nécessaire
    psql -d $DB_NAME -f chemin/vers/fichier.sql -U $DB_USER -W $DB_PASSWORD

    echo "La base de données $DB_NAME a été créée."
fi
