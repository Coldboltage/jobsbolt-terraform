# Initialize Kubernetes provider
provider "kubernetes" {
  config_path = "~/.kube/config" # Adjust for your local setup
}

# Call the API deployment and service
module "api" {
  source = "./api"
}

# Call the Postgres deployment and service
module "postgres" {
  source = "./postgres"
}

# Call the RabbitMQ deployment and service
module "rabbitmq" {
  source = "./rabbitmq"
}


# provider "kubernetes" {
#   config_path = "~/.kube/config" # Adjust as necessary
# }

# # Simple Nginx Deployment
# resource "kubernetes_deployment" "nginx" {
#   metadata {
#     name      = "nginx"
#     namespace = "default"
#   }

#   spec {
#     replicas = 1

#     selector {
#       match_labels = {
#         app = "nginx"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "nginx"
#         }
#       }

#       spec {
#         container {
#           name  = "nginx"
#           image = "nginx:latest"

#           port {
#             container_port = 80
#           }
#         }
#       }
#     }
#   }
# }

# # Simple Nginx Service
# resource "kubernetes_service" "nginx" {
#   metadata {
#     name      = "nginx"
#     namespace = "default"
#   }

#   spec {
#     selector = {
#       app = "nginx"
#     }

#     port {
#       port        = 80
#       target_port = 80
#     }

#     type = "ClusterIP"
#   }
# }

