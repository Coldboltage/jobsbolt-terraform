resource "kubernetes_deployment" "jobsbolt_api_deployment" {
  metadata {
    name = "jobsbolt-api-deployment"
    labels = {
      app       = "jobsbolt"
      component = "api"
      env       = "local"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app       = "jobsbolt"
        component = "api"
      }
    }

    template {
      metadata {
        labels = {
          app       = "jobsbolt"
          component = "api"
        }
      }

      spec {
        container {
          image = "coldbolt/jobsboltapi:latest"
          name  = "jobsbolt-api"

          image_pull_policy = "Always" # This forces Kubernetes to pull the latest image


          # Inject environment variables from ConfigMap
          env {
            name = "TYPEORM_TYPE"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_api_config.metadata[0].name
                key  = "TYPEORM_TYPE"
              }
            }
          }

          env {
            name = "TYPEORM_HOST"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_api_config.metadata[0].name
                key  = "TYPEORM_HOST"
              }
            }
          }

          env {
            name = "TYPEORM_PORT"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_api_config.metadata[0].name
                key  = "TYPEORM_PORT"
              }
            }
          }

          env {
            name = "TYPEORM_USERNAME"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_api_config.metadata[0].name
                key  = "TYPEORM_USERNAME"
              }
            }
          }

          env {
            name = "TYPEORM_DATABASE"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_api_config.metadata[0].name
                key  = "TYPEORM_DATABASE"
              }
            }
          }

          env {
            name = "RABBITMQ_URL"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_api_config.metadata[0].name
                key  = "RABBITMQ_URL"
              }
            }
          }

          env {
            name = "RABBITMQ_USERNAME"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_api_config.metadata[0].name
                key  = "RABBITMQ_USERNAME"
              }
            }
          }

          env {
            name = "GENERAL_TEST"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_api_config.metadata[0].name
                key  = "GENERAL_TEST"
              }
            }
          }

          env {
            name = "FIND_JOB"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_api_config.metadata[0].name
                key  = "FIND_JOB"
              }
            }
          }

          env {
            name = "TEST_BATCH"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_api_config.metadata[0].name
                key  = "TEST_BATCH"
              }
            }
          }

          env {
            name = "DISCORD_TEST"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_api_config.metadata[0].name
                key  = "DISCORD_TEST"
              }
            }
          }

          env {
            name = "FULL_TEST"
            value_from {
              config_map_key_ref {
                name = kubernetes_config_map.jobsbolt_api_config.metadata[0].name
                key  = "FULL_TEST"
              }
            }
          }

          env {
            name = "TYPEORM_PASSWORD"
            value_from {
              secret_key_ref {
                name = "jobsbolt-secrets" # Reference the Kubernetes secret directly
                key  = "TYPEORM_PASSWORD" # Key inside the Kubernetes secret
              }
            }
          }

          env {
            name = "JWT_SECRET"
            value_from {
              secret_key_ref {
                name = "jobsbolt-secrets"
                key  = "JWT_SECRET"
              }
            }
          }

          env {
            name = "OPENAI_API_KEY"
            value_from {
              secret_key_ref {
                name = "jobsbolt-secrets"
                key  = "OPENAI_API_KEY"
              }
            }
          }

          env {
            name = "DISCORD_KEY"
            value_from {
              secret_key_ref {
                name = "jobsbolt-secrets"
                key  = "DISCORD_KEY"
              }
            }
          }

          env {
            name = "RABBITMQ_PASSWORD"
            value_from {
              secret_key_ref {
                name = "jobsbolt-secrets"
                key  = "RABBITMQ_PASSWORD"
              }
            }
          }

          port {
            container_port = 3000 # Adjust this if your app uses a different port
          }

          resources {
            limits = {
              cpu    = "1"
              memory = "1024Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }

  }
}
