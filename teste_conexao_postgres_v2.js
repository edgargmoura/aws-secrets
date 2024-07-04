const { SecretsManagerClient, GetSecretValueCommand } = require("@aws-sdk/client-secrets-manager");
const { Client } = require('pg');

// Configurações do AWS Secrets Manager
const region = 'us-east-1';
const secretName = 'SECRET';

// Configurações de conexão padrão para evitar erros antes de recuperar as credenciais
const dbConfig = {
  user: 'default',
  host: 'HOST',
  database: 'postgres',
  password: 'default',
  port: '5432',
  ssl: {
    require: true,
    rejectUnauthorized: false
  }
};
