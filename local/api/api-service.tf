resource "kubernetes_service" "jobsbolt_api_service" {
  metadata {
    name = "jobsbolt-api-service"
  }
  spec {
    selector = {
      app       = "jobsbolt"
      component = "api"
    }
    port {
      port        = 3000  # The external-facing port of the service
      target_port = 3000  # The port the container listens on (NestJS in this case)
      node_port   = 32001 # Change this to your desired NodePort
    }

    type = "NodePort"
  }
}
