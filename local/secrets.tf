resource "kubernetes_secret" "jobsbolt_secrets" {
  metadata {
    name = "jobsbolt-secrets"
  }

  data = {
    TYPEORM_PASSWORD  = var.TYPEORM_PASSWORD  # Raw value
    JWT_SECRET        = var.JWT_SECRET        # Raw value
    OPENAI_API_KEY    = var.OPENAI_API_KEY    # Raw value
    DISCORD_KEY       = var.DISCORD_KEY       # Raw value
    RABBITMQ_PASSWORD = var.RABBITMQ_PASSWORD # Raw value
    SEEDER_PASSWORD   = var.SEEDER_PASSWORD   # Raw value
  }

  type = "Opaque"
}
