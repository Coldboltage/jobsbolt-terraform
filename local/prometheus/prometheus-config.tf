resource "kubernetes_config_map" "jobsbolt_prometheus_config" {
  metadata {
    name = "jobsbolt-prometheus-config"
  }

  data = {
    "prometheus.yml" = <<EOF
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'jobsbolt-api'
    static_configs:
      - targets: ['jobsbolt-api-service:3000']
  - job_name: 'jobsbolt-prometheus'
    static_configs:
      - targets: ['jobsbolt-prometheus-service:9090']
EOF
  }
}
