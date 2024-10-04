# Initialize Kubernetes provider
provider "kubernetes" {
  config_path = "~/.kube/config" # Adjust for your local setup
}

# Call the API deployment and service
module "api" {
  source = "./api"

  depends_on = [
    module.grafana.jobsbolt_grafana_deployment,
    module.prometheus.jobsbolt_prometheus_deployment
  ]
}

# Call the Postgres deployment and service
module "postgres" {
  source = "./postgres"
}

# Call the RabbitMQ deployment and service
module "rabbitmq" {
  source = "./rabbitmq"
}

module "grafana" {
  source = "./grafana"
}

module "prometheus" {
  source = "./prometheus"
}

