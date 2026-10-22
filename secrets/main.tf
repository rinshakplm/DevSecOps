# A secret - stored securely, never hardcoded
resource "aws_secretsmanager_secret" "db_password" {
  name        = "devsecops/db/password"
  description = "Database password for the application"

  tags = {
    Name        = "db-password"
    Environment = "production"
  }
}

# The actual secret value
resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id = aws_secretsmanager_secret.db_password.id
  secret_string = jsonencode({
    username = "admin"
    password = "REPLACE_WITH_REAL_PASSWORD"
  })
}
