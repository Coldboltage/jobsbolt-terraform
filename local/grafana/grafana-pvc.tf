resource "kubernetes_persistent_volume_claim" "jobsbolt_grafana_pvc" {
  metadata {
    name = "jobsbolt-grafana-pvc"
  }
  spec {
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage = "2Gi"
      }
    }
    selector {
      match_labels = {
        type = "grafana-storage" # Match the label from the PV
      }
    }
  }
}
