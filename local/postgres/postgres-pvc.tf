resource "kubernetes_persistent_volume_claim" "jobsbolt_postgres_pvc" {
  metadata {
    name = "jobsbolt-postgres-pvc"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "2Gi" # Requests the 2Gi of storage from the PV
      }
    }
  }
}
