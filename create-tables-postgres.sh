#!/bin/bash

DB_NAME="ma_base_de_donnees"
DB_USER="utilisateur"
DB_PASSWORD="mot_de_passe"

CREATE OR REPLACE FUNCTION create_database_if_not_exists() RETURNS void AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'ma_base_de_donnees') THEN
        EXECUTE 'CREATE DATABASE ma_base_de_donnees';
    END IF;
END;
$$ LANGUAGE plpgsql;

# Vérifier si la base de données existe déjà
if psql -lqt | cut -d \| -f 1 | grep -qw $DB_NAME; then
    echo "La base de données $DB_NAME existe déjà."
else
    create_database_if_not_exists();

    echo "La base de données $DB_NAME a été créée."
fi
