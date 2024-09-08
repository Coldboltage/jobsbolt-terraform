resource "kubernetes_deployment" "jobsbolt_rabbit_deployment" {
  metadata {
    name = "jobsbolt-rabbit-deployment"
    labels = {
      app       = "jobsbolt"
      component = "rabbit"
      env       = "local"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app       = "jobsbolt"
        component = "rabbit"
      }
    }

    template {
      metadata {
        labels = {
          app       = "jobsbolt"
          component = "rabbit"
        }
      }

      spec {
        container {
          image = "rabbitmq:3-management"
          name  = "jobsbolt-rabbit"

          # Inject environment variables for RabbitMQ
          env {
            name  = "RABBITMQ_DEFAULT_USER"
            value = "guest" # You can change this if needed
          }

          env {
            name  = "RABBITMQ_DEFAULT_PASS"
            value = "guest" # You can change this if needed
          }

          port {
            container_port = 5672 # Adjust this if your app uses a different port
          }

          port {
            container_port = 15672 # Adjust this if your app uses a different port
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
