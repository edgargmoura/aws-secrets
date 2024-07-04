#!/bin/sh

# Variáveis de conexão
DB_HOST="db-sem-secrets.cifp3umrxxtb.us-east-1.rds.amazonaws.com"
DB_PORT="5432"
DB_NAME="postgres"
DB_USER='postgres'
DB_PASSWORD='NqEmXETUqhGmdAfDHioN'

# Comando psql para se conectar e executar uma consulta SQL
PGPASSWORD="$DB_PASSWORD" psql -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" -U "$DB_USER" -c "SELECT schema_name FROM information_schema.schemata"

