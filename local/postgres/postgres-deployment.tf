resource "kubernetes_deployment" "jobsbolt_postgres_deployment" {
  metadata {
    name = "jobsbolt-postgres-deployment"
    labels = {
      app       = "jobsbolt"
      component = "postgres"
      env       = "local"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app       = "jobsbolt"
        component = "postgres"
      }
    }

    template {
      metadata {
        labels = {
          app       = "jobsbolt"
          component = "postgres"
        }
      }

      spec {
        container {
          name  = "jobsbolt-postgres"
          image = "postgres:13"

          volume_mount {
            name       = "postgres-storage"
            mount_path = "/var/lib/postgresql/data" # Standard Postgres data directory
          }

          # Postgres environment variables (as before)
          env {
            name = "POSTGRES_USER"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_postgres_config.metadata[0].name
                key  = "TYPEORM_USERNAME"
              }
            }
          }

          env {
            name = "POSTGRES_DB"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_postgres_config.metadata[0].name
                key  = "TYPEORM_DATABASE"
              }
            }
          }

          env {
            name = "POSTGRES_PASSWORD"
            value_from {
              secret_key_ref {
                name = "jobsbolt-secrets"
                key  = "TYPEORM_PASSWORD"
              }
            }
          }

          port {
            container_port = 5432 # Adjust this if your app uses a different port
          }

          resources {
            limits = {
              cpu    = "2"
              memory = "1024Mi"
            }
            requests = {
              cpu    = "500m"
              memory = "512Mi"
            }
          }
        }

        volume {
          name = "postgres-storage"

          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.jobsbolt_postgres_pvc.metadata[0].name
          }
        }
      }
    }
  }
}
