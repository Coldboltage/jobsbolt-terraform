resource "kubernetes_service" "jobsbolt_rabbit_service" {
  metadata {
    name = "jobsbolt-rabbit-service"
  }
  spec {
    selector = {
      app       = "jobsbolt"
      component = "rabbit"
    }

    port {
      name        = "rabbitmq"
      port        = 5672
      target_port = 5672
    }

    port {
      name        = "rabbitmq-admin"
      port        = 15672 # RabbitMQ management UI port
      target_port = 15672
    }

    type = "ClusterIP"
  }
}
