output "display_name" {
  value       = google_monitoring_alert_policy.alert_policy.display_name
  description = "Display Name of the created Alert "
}
output "alert_id" {
  value       = google_monitoring_alert_policy.alert_policy.alert_id
  description = "ID of the created Alert policy"
}

