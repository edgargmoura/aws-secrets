#!/bin/sh

secret_string=$(aws secretsmanager get-secret-value --secret-id rds!db-eb7473f7-d8a6-499a-ab43-0a6763f1344b --version-stage AWSCURRENT --query SecretString --output text)
username=$(echo $secret_string | jq -r '.username')
password=$(echo $secret_string | jq -r '.password')

# Variáveis de conexão
DB_HOST="db-com-secrets.cifp3umrxxtb.us-east-1.rds.amazonaws.com"
DB_PORT="5432"
DB_NAME="postgres"
DB_USER=$username
DB_PASSWORD=$password

# Comando psql para se conectar e executar uma consulta SQL
PGPASSWORD="$DB_PASSWORD" psql -h "$DB_HOST" -p "$DB_PORT" -d "$DB_NAME" -U "$DB_USER" -c "SELECT schema_name FROM information_schema.schemata"
